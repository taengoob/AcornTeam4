package com.service;

import org.apache.ibatis.session.SqlSession;

import com.dao.CouponDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.CouponDTO;

public class CouponService {

	CouponDAO dao = new CouponDAO();

	public void couponAdd(CouponDTO cdto) {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dao.couponAdd(session, cdto);
			session.commit();
		}finally {
			session.close();
		}
	}
	
}
