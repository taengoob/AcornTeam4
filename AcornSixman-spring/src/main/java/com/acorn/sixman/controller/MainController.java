package com.acorn.sixman.controller;



import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.acorn.sixman.dto.CategoryDTO;
import com.acorn.sixman.dto.ProductDTO_Temp;
import com.acorn.sixman.service.CommonService;
import com.acorn.sixman.service.ProductService;

@Controller
public class MainController {
	@Autowired
	CommonService service;
	@Autowired
	ProductService service2;
	
	
	@RequestMapping("/")
	public String main(HttpSession session, HttpServletRequest request, Model model,HashMap<String, String> searchOption) {
		List<CategoryDTO> dto=service.selectCategories();
		session.setAttribute("Guitar", dto);
		List<ProductDTO_Temp> list = service2.selectProductByOption(searchOption);
		model.addAttribute("list", list);
		return "Main";
	}
}
