package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.CouponDTO;

public class CouponDAO {

	public void couponAdd(SqlSession session, CouponDTO cdto) {
		session.insert("couponAdd", cdto);
	}

}
