package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CategoryDTO;

public class CommonDAO
{
	public String getNewProductId(SqlSession session)
	{
		return session.selectOne("com.mapper.common.getNewProductId");
	}
	
	public String getNewOrderId(SqlSession session)
	{
		return session.selectOne("com.mapper.common.getNewOrderId");
	}
	
	public String getNewCouponId(SqlSession session)
	{
		return session.selectOne("com.mapper.common.getNewCouponId");
	}
	
	public String getNewImageId(SqlSession session)
	{
		return session.selectOne("com.mapper.common.getNewImageId");
	}

	public List<CategoryDTO> getGuitarCategories(SqlSession session)
	{
		return session.selectList("com.mapper.common.selectCategories");
	}

	public String getNewCartId(SqlSession session)
	{
		return session.selectOne("com.mapper.common.getNewCartId");
	}
}
