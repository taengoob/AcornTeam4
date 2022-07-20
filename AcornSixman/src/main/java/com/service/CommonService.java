package com.service;

import org.apache.ibatis.session.SqlSession;

import com.dao.CommonDAO;
import com.dbconfig.MySqlSessionFactory;

public class CommonService
{
	CommonDAO dao = new CommonDAO();

	public String getNewProductId()
	{
		String result = "";
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.getNewProductId(session);
		}
		finally
		{
			session.close();
		}
		return result;
	}
	
	public String getNewOrderId()
	{
		String result = "";
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.getNewOrderId(session);
		}
		finally
		{
			session.close();
		}
		return result;
	}
	
	public String getNewCouponId()
	{
		String result = "";
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.getNewCouponId(session);
		}
		finally
		{
			session.close();
		}
		return result;
	}
	
	public String getNewImageId()
	{
		String result = "";
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.getNewImageId(session);
		}
		finally
		{
			session.close();
		}
		return result;
	}
}
