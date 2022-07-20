package com.dao;

import org.apache.ibatis.session.SqlSession;

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
}
