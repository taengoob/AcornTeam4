package com.service;

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
	
}
