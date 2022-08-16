package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CategoryDTO;
import com.dto.MemberDTO;

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

	public String getNewCartId(SqlSession session)
	{
		return session.selectOne("com.mapper.common.getNewCartId");
	}

	public String getNewImageId(SqlSession session)
	{
		return session.selectOne("com.mapper.common.getNewImageId");
	}

	public List<CategoryDTO> getGuitarCategories(SqlSession session)
	{
		return session.selectList("com.mapper.common.selectCategories");
	}

	public List<CategoryDTO> getGuitarCategoriesExceptAll(SqlSession session)
	{
		return session.selectList("com.mapper.common.selectCategoriesExceptAll");
	}

	public int insertImage(SqlSession session, HashMap<String, Object> map)
	{
		return session.insert("com.mapper.common.uploadImageFile", map);
	}

	public String getNewBoardContentId(SqlSession session)
	{
		return session.selectOne("com.mapper.common.getNewBoardContentId");
	}

	public MemberDTO testLogin(SqlSession session)
	{
		return session.selectOne("com.mapper.common.testLogin");
	}

	public String getNewBoardFileId(SqlSession session)
	{
		return session.selectOne("com.mapper.common.getNewBoardFileId");
	}

	public String getNewBoardReplyId(SqlSession session) 
	{
		return session.selectOne("com.mapper.common.getNewBoardReplyId");
	}
}
