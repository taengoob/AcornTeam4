package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.OrderDAO;
import com.dao.ProductDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.OrderDTO;
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
	
	public int insertOrder(OrderDTO order)
	{
		int result = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.insertOrder(session, order);
			session.commit();
		}
		finally
		{
			session.close();
		}
		return result;
	}
}
