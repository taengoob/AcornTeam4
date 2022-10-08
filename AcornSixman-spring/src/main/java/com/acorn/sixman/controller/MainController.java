package com.acorn.sixman.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.acorn.sixman.dto.CategoryDTO;
import com.acorn.sixman.service.CommonService;

@Controller
public class MainController {
	@Autowired
	CommonService service;
	
	
	@RequestMapping("/")
	public String main(Model model) {
		List<CategoryDTO> dto=service.selectCategories();
		model.addAttribute("Guitar", dto);
		return "Main";
	}
}
