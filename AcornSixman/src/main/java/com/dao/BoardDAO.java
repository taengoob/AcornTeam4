package com.dao;

import java.util.HashMap;
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

	public int boardReWrite(SqlSession session, BoardDTO dto) {
		int n = session.update("com.mapper.board.boardReWrite", dto);
		return n;
	}

	public int boardDelete(SqlSession session, String contentId) {
		int n = session.update("com.mapper.board.boardDelete", contentId);
		return n;
	}

	public BoardDTO boardMove(SqlSession session, HashMap<String, String> map) {
		BoardDTO bdto = session.selectOne("com.mapper.board.boardMove", map);
		return bdto;
	}

	public int boardStart(SqlSession session) {
		int n = session.selectOne("com.mapper.board.boardStart");
		return n;
	}
	
	public int boardEnd(SqlSession session) {
		int n = session.selectOne("com.mapper.board.boardEnd");
		return n;
	}

}
