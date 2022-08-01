package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ImageDTO;
import com.dto.OrderDTO;
import com.dto.ProductDTO_Temp;

public class OrderDAO
{
	public List<OrderDTO> selectOrderByUserId(SqlSession session, String uesrId)
	{
		return session.selectList("com.mapper.order.selectOrderByUserId", uesrId);
	}

	public int insertOrder(SqlSession session, OrderDTO order)
	{
		return session.insert("com.mapper.order.insertOrder", order);
	}
}
