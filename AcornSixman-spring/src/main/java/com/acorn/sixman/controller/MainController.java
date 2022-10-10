package com.acorn.sixman.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.acorn.sixman.dto.CategoryDTO;
import com.acorn.sixman.service.CommonService;

@Controller
public class MainController {
	@Autowired
	CommonService service;
	
	
	@RequestMapping("/")
	public String main(HttpSession session) {
		List<CategoryDTO> dto=service.selectCategories();
		session.setAttribute("Guitar", dto);
		return "Main";
	}
}
