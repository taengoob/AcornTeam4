package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CouponDTO;

public class CouponDAO {

	public void couponAdd(SqlSession session, CouponDTO cdto) {
		session.insert("com.mapper.coupon.couponAdd", cdto);
	}

	public List<CouponDTO> couponList(SqlSession session, String userid2) {
		List<CouponDTO> list = session.selectList("com.mapper.coupon.couponList", userid2);
		return list;
	}




}
