package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CartDTO;
import com.dto.ProductDTO;

public class ProductDAO {

	public int registration(SqlSession session, ProductDTO pdto) {
		int n = session.insert("com.mapper.product.registration", pdto);
		System.out.println("ProductDAO 실행중");
		return n;
	}

	public List<ProductDTO> selectlist(SqlSession session) {
		List<ProductDTO> list = session.selectList("com.mapper.product.selectlist");
		return list;
	}

	public CartDTO searchCart(SqlSession session, String product_Id) {
		CartDTO cdto = session.selectOne("com.mapper.cart.searchCart", product_Id);
		return cdto;
	}

	public void CartCreate(SqlSession session, HashMap<String, Object> map) {
		session.insert("com.mapper.cart.cartCreate",map);
	}

	public void CartAdd(SqlSession session, HashMap<String, Object> map) {
		session.update("com.mapper.cart.cartAdd",map);
	}

	public List<CartDTO> cartList(SqlSession session, String userid2) {
		List<CartDTO> list = session.selectList("com.mapper.cart.cartList", userid2);
		System.out.println("dao 리스트 받음");
		return list;
	}

}
