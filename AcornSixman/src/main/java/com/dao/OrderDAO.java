package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ImageDTO;
import com.dto.OrderDTO;
import com.dto.PayMethodDTO;
import com.dto.ProcessListDTO;
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

	public List<PayMethodDTO> selectPayMethodList(SqlSession session)
	{
		return session.selectList("com.mapper.order.selectPayMethodList");
	}

	public int deleteCart(SqlSession session, String cartId)
	{
		return session.delete("com.mapper.cart.cartDelete", cartId);
	}
	public String selectPayMethodIdByDesc(SqlSession session, String payMethodDesc)
	{
		return session.selectOne("com.mapper.order.selectPayMethodIdByDesc", payMethodDesc);
	}

	public OrderDTO selectOrderByOrderId(SqlSession session, String orderId)
	{
		return session.selectOne("com.mapper.order.selectOrderByOrderId", orderId);
	}

	public List<ProcessListDTO> select(SqlSession session, String sellerId) {
		List<ProcessListDTO> list =  session.selectList("com.mapper.order.processList", sellerId);
		return list;
	}
}
