package com.acorn.sixman.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acorn.sixman.dto.BoardDTO;
import com.acorn.sixman.dto.BoardPageDTO;

@Mapper
public interface BoardDAO {

	List<BoardDTO> boardList(BoardPageDTO bpdto);

	List<BoardDTO> boardPageList(BoardPageDTO bpdto);

	int boardCount(BoardPageDTO bpdto);

	int boardStart(BoardPageDTO bpdto);
	
	int boardEnd(BoardPageDTO bpdto);

	BoardDTO boardMove(BoardPageDTO bpdto);

	BoardDTO boardInfo(String contentId);

	List<BoardDTO> replyList(String ContentId);

	int replyCount(String ContentId);

    int boardWrite(BoardDTO dto);

    int boardDelete(String ContentId);
	
	
	
}
