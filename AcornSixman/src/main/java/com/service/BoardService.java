package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.BoardDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.BoardDTO;
import com.dto.BoardPageDTO;

public class BoardService {

	BoardDAO dao = new BoardDAO();

	public List<BoardDTO> boardList(String category) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<BoardDTO> list = null;
		try {
			list = dao.boardList(session, category);
		}finally {
			session.close();
		}
		return list;
	}

	public BoardDTO boardInfo(String ContentId) {
		SqlSession session = MySqlSessionFactory.getSession();
		BoardDTO dto = null;
		try {
			dto = dao.boardInfo(session, ContentId);
		}finally {
			session.close();
		}
		return dto;
	}

	public void increaseHitCount(String ContentId) {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dao.increaseHitCount(session, ContentId);
			session.commit();
		}finally {
			session.close();
		}
	}

	public int boardWrite(BoardDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.boardWrite(session, dto);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public int boardCount(String category, String searchGroup, String searchValue) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("searchGroup", searchGroup);
		map.put("searchValue", searchValue);
		int n = 0;
		try {
			n = dao.boardCount(session, map);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public int boardReWrite(BoardDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.boardReWrite(session, dto);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public int boardDelete(String contentId) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.boardDelete(session, contentId);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public BoardDTO boardMove(String Move, String ContentId, String category, String searchGroup, String searchValue) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("Move", Move);
		map.put("ContentId", ContentId);
		map.put("category", category);
		map.put("searchGroup", searchGroup);
		map.put("searchValue", searchValue);
		BoardDTO bdto = null;
		try {
			bdto = dao.boardMove(session, map);
		}finally {
			session.close();
		}
		return bdto;
	}

	public int boardStart(String category, String searchGroup, String searchValue) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("searchGroup", searchGroup);
		map.put("searchValue", searchValue);
		int n = 0;
		try {
			n = dao.boardStart(session, map);
		}finally {
			session.close();
		}
		return n;
	}
	
	public int boardEnd(String category, String searchGroup, String searchValue) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("searchGroup", searchGroup);
		map.put("searchValue", searchValue);
		int n = 0;
		try {
			n = dao.boardEnd(session, map);
		}finally {
			session.close();
		}
		return n;
	}
	
	public BoardPageDTO boardPageList(String category, String view, int curPage, String searchGroup, String searchValue) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("searchGroup", searchGroup);
		map.put("searchValue", searchValue);
		BoardPageDTO bpDTO = null;
		try {
			bpDTO = dao.boardPageList(session, map, curPage, view);
		}finally {
			session.close();
		}
		return bpDTO;
	}

	public int replyAdd(String refcontentId, String replyId, String userId, String replyContent) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = new HashMap<>();
		map.put("refcontentId", refcontentId);
		map.put("replyId", replyId);
		map.put("userId", userId);
		map.put("replyContent", replyContent);
		int n = 0;
		try {
			n = dao.replyAdd(session, map);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public BoardDTO replySelect(String replyId) {
		SqlSession session = MySqlSessionFactory.getSession();
		BoardDTO dto = null;
		try {
			dto = dao.replySelect(session, replyId);
		}finally {
			session.close();
		}
		return dto;
	}

	public Map<String, Object> replyList(String contentId) {
		SqlSession session = MySqlSessionFactory.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<BoardDTO> list = dao.replyList(session, contentId);//해당 게시물에 달린 댓글목록
			int replyCount = dao.replyCount(session, contentId);//해당 게시물의 총 댓글갯수
			map.put("list", list);
			map.put("replyCount", replyCount);
			for (int i = 0; i < list.size(); i++) {//1차적으로 구한 댓글들을 참조하고 있는 댓글목록
				BoardDTO xxx = list.get(i);
				List<BoardDTO> list2 = dao.replyList(session, xxx.getBoardContentId());
				if(list2!=null) {map.put("list"+i, list2);}
				for (int j = 0; j < list2.size(); j++) {//2차적으로 구한 댓글들을 참고하고 있는 댓글목록
					BoardDTO yyy = list2.get(j);
					List<BoardDTO> list3 = dao.replyList(session, yyy.getBoardContentId());
					if(list3!=null) {map.put("list"+i+j, list3);}
				}
			}
		}finally {
			session.close();
		}
		return map;
	}

	public int replyDelete(String replyId) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.replyDelete(session, replyId);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public int replyUpdate(String replyId, String replyContent) {
		SqlSession session = MySqlSessionFactory.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyId", replyId);
		map.put("replyContent", replyContent);
		int n = 0;
		try {
			n = dao.replyUpdate(session, map);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}

	public String replyNextId(String refContentId) {
		SqlSession session = MySqlSessionFactory.getSession();
		String s = null;
		try {
			s = dao.replyNextId(session, refContentId);
			session.commit();
		}finally {
			session.close();
		}
		return s;
	}

}
