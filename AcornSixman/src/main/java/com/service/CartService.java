package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.CartDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.CartDTO;

public class CartService {
	
	CartDAO dao = new CartDAO();
	

	public CartDTO searchCart(String product_Id) {
		SqlSession session = MySqlSessionFactory.getSession();
		CartDTO cdto = null;
		try {
			cdto = dao.searchCart(session, product_Id);
		}finally {
			session.close();
		}
		return cdto;
	}

	public void cartCreate(String userid2, String product_Id, int count) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cart_userId", userid2);
		map.put("cart_productId", product_Id);
		map.put("cart_Count", count);
		try {
			dao.CartCreate(session, map);
			session.commit();
		}finally {
			session.close();
		}
	}

	public void cartAdd(String userid2, String product_Id, int count) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cart_userId", userid2);
		map.put("cart_productId", product_Id);
		map.put("cart_Count", count);
		try {
			dao.CartAdd(session, map);
			session.commit();
		}finally {
			session.close();
		}
	}

	public List<CartDTO> cartList(String userid2) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<CartDTO> list = null;
		try {
			System.out.println("service 리스트 받는중");
			list = dao.cartList(session, userid2);
		}finally {
			session.close();
		}
		return list;
	}
	
	
}
