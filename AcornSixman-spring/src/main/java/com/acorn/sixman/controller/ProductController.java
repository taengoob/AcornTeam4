package com.acorn.sixman.controller;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.sixman.dto.ImageDTO;
import com.acorn.sixman.dto.ProductDTO_Temp;
import com.acorn.sixman.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@RequestMapping("/productDetail")
	public String productDetail(@RequestParam(name = "productId", required = false, defaultValue = "") String productId, Model model) {
		
		
		
		ProductDTO_Temp product = service.selectProductByProductId(productId);
		List<ImageDTO> images = service.selectImagesByProductId(productId);
		
		model.addAttribute("product", product);
		model.addAttribute("images", images);

		//메인용 경로
		//return "productDetail";
		
		//테스트용 경로
		return "product/productDetail";
	}
	
	@RequestMapping("/productList")
	public String productList(@RequestParam HashMap<String, String> map, Model model) {
	
		String category1 = map.get("category");
		String searchStr = map.get("searchStr");
		category1 = category1 == null ? "" : category1;
		searchStr = searchStr == null ? "" : searchStr;
		
		HashMap<String, String> searchOption = new HashMap<String, String>();
		if (category1.contains("*")==false) {
		searchOption.put("category1", category1);
		searchOption.put("searchStr", searchStr);
		List<ProductDTO_Temp> list = service.selectProductByOption(searchOption);
		model.addAttribute("list", list);
		}else {
			    String[] words=category1.split("\\*");

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
		//메인용 경로
		//return "productDetail";
		
		//테스트용 경로
		return "product/productList";
	}
}
