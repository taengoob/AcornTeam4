package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CartDTO;

public class CartDAO {

	public int cartSearch(SqlSession session, HashMap<String, String> map) {
		int n = session.selectOne("com.mapper.cart.cartSearch", map);
		return n;
	}

	public void cartAdd(SqlSession session, HashMap<String, Object> map) {
		int n = session.insert("com.mapper.cart.cartAdd", map);
		System.out.println("새로 추가된 카트 갯수 : "+n);
	}

	public void cartUpdate(SqlSession session, HashMap<String, Object> map) {
		int n = session.update("com.mapper.cart.cartUpdate", map);
		System.out.println("수정된 카트 갯수 : "+n);
	}

	public List<CartDTO> cartList(SqlSession session, String userid2) {
		List<CartDTO> list = session.selectList("com.mapper.cart.cartList", userid2);
		return list;
	}

	public void cartUpdate2(SqlSession session, HashMap<String, Object> map) {
		int n = session.update("com.mapper.cart.cartUpdate2", map);
		System.out.println("수정된 카트 갯수 : "+n);
	}

	public int cartDelete(SqlSession session, String cartId) {
		int n = session.update("com.mapper.cart.cartDelete", cartId);
		return n;
	}
	
}
