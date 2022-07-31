package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.common.IDGenerator;
import com.dao.CartDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.CartDTO;

public class CartService {
	
	CartDAO dao = new CartDAO();

	public int cartSearch(String userid2, String productId) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid2", userid2);
		map.put("productId", productId);
		try {
			n = dao.cartSearch(session, map);
		}finally {
			session.close();
		}
		return n;
	}

	public void cartAdd(String userid2, String productId, int cartCount) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cartId", IDGenerator.getNewCartId());
		map.put("userid2", userid2);
		map.put("productId", productId);
		map.put("cartCount", cartCount);
		System.out.println(map);
		try {
			dao.cartAdd(session, map);
			session.commit();
		}finally {
			session.close();
		}
	}

	public void cartUpdate(String userid2, String productId, int cartCount) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid2", userid2);
		map.put("productId", productId);
		map.put("cartCount", cartCount);
		System.out.println(map);
		try {
			dao.cartUpdate(session, map);
			session.commit();
		}finally {
			session.close();
		}
	}

	public List<CartDTO> cartList(String userid2) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<CartDTO> list = null;
		try {
			list = dao.cartList(session, userid2);
		}finally {
			session.close();
		}
		return list;
	}

	public void cartUpdate2(String userid2, String productId, int cartCount) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid2", userid2);
		map.put("productId", productId);
		map.put("cartCount", cartCount);
		System.out.println(map);
		try {
			dao.cartUpdate2(session, map);
			session.commit();
		}finally {
			session.close();
		}
		
	}

	public int cartDelete(String cartId) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.cartDelete(session, cartId);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}
	
	
}
