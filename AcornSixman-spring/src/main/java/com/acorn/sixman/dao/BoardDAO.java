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
	
	
	
}
