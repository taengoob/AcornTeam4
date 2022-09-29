package com.acorn.sixman.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.CartDAO;
import com.acorn.sixman.dto.CartDTO;

@Service
public class CartService {
	
	@Autowired
	CartDAO dao;

	public List<CartDTO> cartList(String userid) {
		return dao.cartList(userid);
	}

	public int cartDelete(String cartId) {
		return dao.cartDelete(cartId);
	}

	public int cartUpdate2(HashMap<String, String> map) {
		return dao.cartUpdate2(map);
	}

	public int cartUpdate(HashMap<String, String> map) {
		return dao.cartUpdate(map);
	}

	public int cartSearch(HashMap<String, String> map) {
		return dao.cartSearch(map);
	}

	public int cartAdd(HashMap<String, String> map) {
		return dao.cartAdd(map);
	}

	
}
