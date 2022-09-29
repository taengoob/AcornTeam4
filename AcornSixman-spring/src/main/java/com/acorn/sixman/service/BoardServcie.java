package com.acorn.sixman.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.BoardDAO;
import com.acorn.sixman.dto.BoardDTO;
import com.acorn.sixman.dto.BoardPageDTO;

@Service
public class BoardServcie {
	
	@Autowired
	BoardDAO dao;

	public List<BoardDTO> boardPageList(BoardPageDTO bpdto) {
		return dao.boardPageList(bpdto);
	}

	public List<BoardDTO> boardList(BoardPageDTO bpdto) {
		return dao.boardList(bpdto);
	}


}
