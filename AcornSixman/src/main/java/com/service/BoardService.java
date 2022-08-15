package com.service;

import java.util.HashMap;
import java.util.List;

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
	
	public void showImg(String img, String ContentId) {
		System.out.println(img);
		System.out.println(ContentId);
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
}
