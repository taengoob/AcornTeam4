package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.BoardDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.BoardDTO;
import com.dto.BoardPageDTO;
import com.dto.BoardReplyDTO;

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

	public int boardCount() {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.boardCount(session);
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

	public BoardDTO boardMove(String Move, String ContentId) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("Move", Move);
		map.put("ContentId", ContentId);
		BoardDTO bdto = null;
		try {
			bdto = dao.boardMove(session, map);
		}finally {
			session.close();
		}
		return bdto;
	}

	public int boardStart() {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.boardStart(session);
		}finally {
			session.close();
		}
		return n;
	}
	
	public int boardEnd() {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.boardEnd(session);
		}finally {
			session.close();
		}
		return n;
	}
	
	public BoardPageDTO boardPageList(String category, String view, int curPage, String searchName, String searchValue) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("searchName", searchName);
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

	public List<BoardReplyDTO> replySelect(String replyId) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<BoardReplyDTO> list = null;
		try {
			list = dao.replySelect(session, replyId);
		}finally {
			session.close();
		}
		return list;
	}

	public Map<String, Object> replyList(String contentId) {
		SqlSession session = MySqlSessionFactory.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<BoardDTO> list = dao.replyList(session, contentId);
			map.put("list", list);
			for (int i = 0; i < list.size(); i++) {
				BoardDTO xxx = list.get(i);
				List<BoardDTO> list2 = dao.replyList(session, xxx.getBoardContentId());
				if(list2!=null) {map.put("list"+i, list2);}
				for (int j = 0; j < list2.size(); j++) {
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

}
