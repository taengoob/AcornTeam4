package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dto.OrderRequestDTO;

public class OrderRequestDAO
{

	public int insertOrderRequest(SqlSession session, OrderRequestDTO orderRequest)
	{
		return session.insert("com.mapper.orderRequest.insertOrderRequest", orderRequest);
	}

	public List<OrderRequestDTO> selectOrderRequestList(SqlSession session, String orderStatus)
	{
		return session.selectList("com.mapper.orderRequest.selectOrderRequestList", orderStatus);
	}

	public int UpdateOrderRequestStatus(SqlSession session, Map<String, String> map)
	{
		return session.update("com.mapper.orderRequest.UpdateOrderRequestStatus", map);
	}

	public int UpdateOrderStatus(SqlSession session, Map<String, String> map)
	{
		return session.update("com.mapper.orderRequest.UpdateOrderStatus", map);
	}

}
