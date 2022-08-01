package com.service;

import java.util.List;

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

	public List<CouponDTO> couponList(String userid2) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<CouponDTO> list = null;
		try {
			list = dao.couponList(session, userid2);
		}finally {
			session.close();
		}
		return list;
	}
	
}
