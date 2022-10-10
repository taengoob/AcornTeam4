package com.acorn.sixman.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.acorn.sixman.dto.ProductDTO_Temp;
import com.acorn.sixman.service.ProductService;

@Controller
public class JoonhaProductController {
    
    @Autowired
    ProductService service;

   

	@RequestMapping("/ProductList1_teamp")
	public String search(Model model, HttpServletRequest request) {
		
		return "ProductList1_teamp";
	}
}//end calss
