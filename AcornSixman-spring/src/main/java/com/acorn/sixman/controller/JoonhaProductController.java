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

    @RequestMapping("/search")
	public String search(Model model, HttpServletRequest request) {
		String category1 = request.getParameter("category");
		String searchStr = request.getParameter("searchStr");
        HashMap<String, String> searchOption = new HashMap<String, String>();
		if (category1.contains("*")==false) {
		searchOption.put("category1", category1);
		searchOption.put("searchStr", searchStr);
		List<ProductDTO_Temp> list = service.selectProductByOption(searchOption);
		request.setAttribute("list", list);
		}else {
			    String[] words=category1.split("\\*");
			    //또는 String[] words1=input.split(Pattern.quote("|")); 로 |문자를 구분자로 문자열을 추출할 수 있다.
			    for(String s:words){
			      System.out.println(s);
			    }
			   category1 = words[0];
			    String category2 = words[1];
			    searchOption.put("category1", category1);
			    searchOption.put("category2", category2);
			    List<ProductDTO_Temp> list = service.selectProductByOption(searchOption);
			    model.addAttribute("list", list);
		}
		return "joonhaproductlist";
	}
}//end calss
