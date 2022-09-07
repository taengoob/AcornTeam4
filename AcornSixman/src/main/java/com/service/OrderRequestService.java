package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.OrderRequestDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.OrderRequestDTO;

public class OrderRequestService
{
	OrderRequestDAO dao = new OrderRequestDAO();
	
	public int insertOrderRequest(OrderRequestDTO orderRequest)
	{
		int result = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.insertOrderRequest(session, orderRequest);
			session.commit();
		}
		catch (Exception e)
		{
			session.rollback();
			result = 0;
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		return result;
	}
	
	public List<OrderRequestDTO> selectOrderRequestList(String orderStatus)
	{
		List<OrderRequestDTO> orderRequestList = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			orderRequestList = dao.selectOrderRequestList(session, orderStatus);
		}
		finally
		{
			session.close();
		}
		
		return orderRequestList;
	}

	public int UpdateOrderRequestStatus(String requestId, String status)
	{
		int result = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("requestId", requestId);
			map.put("status", status);
			
			result = dao.UpdateOrderRequestStatus(session, map);
			if (result > 0)
				result = dao.UpdateOrderStatus(session, map);
			session.commit();
		}
		catch (Exception e)
		{
			session.rollback();
			result = 0;
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		return result;
	}

	public int UpdateOrderStatus(String requestId, String status)
	{
		int result = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("requestId", requestId);
			map.put("status", status);
			
			result = dao.UpdateOrderStatus(session, map);
			session.commit();
		}
		catch (Exception e)
		{
			session.rollback();
			result = 0;
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		return result;
	}
	
	public int InsertDeliveryRequest(String requestId)
	{
		int result = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.InsertDeliveryRequest(session, requestId);
			session.commit();
		}
		catch (Exception e)
		{
			session.rollback();
			result = 0;
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		return result;
	}
}
