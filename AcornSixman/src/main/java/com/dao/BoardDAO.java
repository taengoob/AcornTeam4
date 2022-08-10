package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.BoardDTO;

public class BoardDAO {

	public List<BoardDTO> boardList(SqlSession session, String category) {
		List<BoardDTO> list = session.selectList("com.mapper.board.boardList", category);
		return list;
	}

	public BoardDTO boardInfo(SqlSession session, String ContentId) {
		BoardDTO dto = session.selectOne("com.mapper.board.boardInfo", ContentId);
		return dto;
	}

	public void increaseHitCount(SqlSession session, String ContentId) {
		session.update("com.mapper.board.increaseHitCount", ContentId);
	}

	public int boardWrite(SqlSession session, BoardDTO dto) {
		int n = session.insert("com.mapper.board.boardWrite", dto);
		return n;
	}

	public int boardCount(SqlSession session) {
		int n = session.selectOne("com.mapper.board.boardCount");
		return n;
	}

}
