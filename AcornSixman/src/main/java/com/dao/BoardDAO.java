package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.BoardDTO;
import com.dto.BoardPageDTO;

public class BoardDAO {

	public List<BoardDTO> boardList(SqlSession session, String category) {
		List<BoardDTO> list = session.selectList("com.mapper.board.boardList", category,new RowBounds(0, 3));
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

	public int boardCount(SqlSession session, HashMap<String, Object> map) {
		int n = session.selectOne("com.mapper.board.boardCount", map);
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

	public int boardStart(SqlSession session, HashMap<String, String> map) {
		int n = session.selectOne("com.mapper.board.boardStart", map);
		return n;
	}
	
	public int boardEnd(SqlSession session, HashMap<String, String> map) {
		int n = session.selectOne("com.mapper.board.boardEnd", map);
		return n;
	}

	public BoardPageDTO boardPageList(SqlSession session, HashMap<String, Object> map, int curPage, String view) {
		BoardPageDTO bpDTO = new BoardPageDTO();
		if(view.equals("img")) {bpDTO.setPerPage(12);}//이미지로 볼 경우 12개씩 출력되게
		int perPage = bpDTO.getPerPage();   //한페이지 20개씩 
		int offset = (curPage - 1) * perPage;
		
		List<BoardDTO> list = session.selectList("com.mapper.board.boardPageList",map,new RowBounds(offset, perPage));
		
		bpDTO.setList(list);
		bpDTO.setCurPage(curPage);
		bpDTO.setTotalCount(boardCount(session, map));
		
		return bpDTO;
	}

	public int replyAdd(SqlSession session, HashMap<String, Object> map) {
		int n = session.insert("com.mapper.board.replyAdd", map);
		return n;
	}

	public BoardDTO replySelect(SqlSession session, String replyId) {
		BoardDTO dto = session.selectOne("com.mapper.board.replySelect", replyId);
		return dto;
	}

	public List<BoardDTO> replyList(SqlSession session, String ContentId) {
		List<BoardDTO> list = session.selectList("com.mapper.board.replyList", ContentId);
		return list;
	}

	public int replyCount(SqlSession session, String ContentId) {
		int n = session.selectOne("com.mapper.board.replyCount", ContentId);
		return n;
	}

	public String replyNextId(SqlSession session, String replyId, String refContentId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyId", replyId);
		map.put("refContentId", refContentId);
		BoardDTO dto = session.selectOne("com.mapper.board.replyNextId", map);
		String s = " ";
		if(dto!=null) {
			s = dto.getBoardRelpyNextId();
		}
		return s;
	}

	public int replyDelete(SqlSession session, String replyId) {
		int n = session.update("com.mapper.board.replyDelete", replyId);
		return n;
	}

	public int replyUpdate(SqlSession session, Map<String, Object> map) {
		int n = session.update("com.mapper.board.replyUpdate", map);
		return n;
	}

}
