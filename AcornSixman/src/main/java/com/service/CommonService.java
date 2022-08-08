package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.CommonDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.CategoryDTO;
import com.dto.MemberDTO;

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
	
	public List<CategoryDTO> getGuitarCategories()
	{
		List<CategoryDTO> result = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.getGuitarCategories(session);
		}
		finally
		{
			session.close();
		}
		return result;
	}
	
	public List<CategoryDTO> getGuitarCategoriesExceptAll()
	{
		List<CategoryDTO> result = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.getGuitarCategoriesExceptAll(session);
		}
		finally
		{
			session.close();
		}
		return result;
	}

	public String getNewCartId()
	{
		String result = "";
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.getNewCartId(session);
		}
		finally
		{
			session.close();
		}
		return result;
	}

	public int insertImage(HashMap<String, Object> map)
	{
		int result = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.insertImage(session, map);
			session.commit();
		}
		finally
		{
			session.close();
		}
		return result;
	}

	public String getNewBoardContentId()
	{
		String result = "";
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.getNewBoardContentId(session);
		}
		finally
		{
			session.close();
		}
		return result;
	}
	
	public MemberDTO testLogin()
	{
		MemberDTO result = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.testLogin(session);
		}
		finally
		{
			session.close();
		}
		return result;
	}
}
