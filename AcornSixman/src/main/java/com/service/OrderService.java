package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.OrderDAO;
import com.dao.ProductDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.OrderDTO;
import com.dto.PayMethodDTO;
import com.dto.ProductDTO_Temp;

public class OrderService
{
	OrderDAO dao = new OrderDAO();

	public List<OrderDTO> selectOrderByUserId(String userId)
	{
		List<OrderDTO> orderList = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			orderList = dao.selectOrderByUserId(session, userId);
		}
		finally
		{
			session.close();
		}
		
		ProductService service = new ProductService();
		for (OrderDTO order : orderList)
		{
			ProductDTO_Temp product = service.getProductByProductId(order.getOrderProductId());
			order.setProduct(product);
		}
		
		return orderList;
	}
	
	public OrderDTO selectOrderByOrderId(String orderId)
	{
		OrderDTO order = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			order = dao.selectOrderByOrderId(session, orderId);
		}
		finally
		{
			session.close();
		}
		
		ProductService service = new ProductService();
		ProductDTO_Temp product = service.getProductByProductId(order.getOrderProductId());
		order.setProduct(product);
		
		return order;
	}
	
	public int insertOrder(OrderDTO order, String cartId)
	{
		int result = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.insertOrder(session, order);
			dao.deleteCart(session, cartId);
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

	public List<PayMethodDTO> selectPayMethodList()
	{
		List<PayMethodDTO> payMethodList = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			payMethodList = dao.selectPayMethodList(session);
		}
		finally
		{
			session.close();
		}
		return payMethodList;
	}
	
	public String selectPayMethodIdByDesc(String payMethodDesc)
	{
		String payMethodList = "";
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			payMethodList = dao.selectPayMethodIdByDesc(session, payMethodDesc);
		}
		finally
		{
			session.close();
		}
		return payMethodList;
	}
}
