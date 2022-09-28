package com.acorn.sixman.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acorn.sixman.dto.CartDTO;

@Mapper
public interface CartDAO {

	List<CartDTO> cartList(String userid);

	int cartDelete(String cartId);

	int cartUpdate2(HashMap<String, String> map);

	int cartUpdate(HashMap<String, String> map);

	int cartSearch(HashMap<String, String> map);

	int cartAdd(HashMap<String, String> map);
	
	
}
