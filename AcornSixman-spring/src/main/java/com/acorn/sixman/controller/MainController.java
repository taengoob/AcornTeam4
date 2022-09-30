package com.acorn.sixman.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.acorn.sixman.service.CommonService;

@Controller
public class MainController {
	@Autowired
	CommonService service;
	
	
	@RequestMapping("/")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "Main";
	}
}
