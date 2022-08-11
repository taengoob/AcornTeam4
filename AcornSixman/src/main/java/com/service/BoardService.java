package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.BoardDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.BoardDTO;

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
	
}
