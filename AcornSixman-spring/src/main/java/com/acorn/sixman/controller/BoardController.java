package com.acorn.sixman.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.acorn.sixman.dto.BoardDTO;
import com.acorn.sixman.dto.BoardPageDTO;
import com.acorn.sixman.service.BoardServcie;

@Controller
public class BoardController {
	
	@Autowired
	BoardServcie service;
	
	@RequestMapping("/boardList")
	public String cartList(BoardPageDTO bpdto, Model model) {
		System.out.println("bpdto 구경 : "+bpdto);
		List<BoardDTO> flist = service.boardList(bpdto); //게시판 공지목록
		List<BoardDTO> slist = service.boardPageList(bpdto); //게시글 목록
		model.addAttribute("flist", flist);
		model.addAttribute("slist", slist);
		model.addAttribute("bpDTO", bpdto);
        return "boardMain";
    }
}
