package com.acorn.sixman.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.CouponDAO;
import com.acorn.sixman.dto.CouponDTO;

@Service
public class CouponService {
	
	@Autowired
	CouponDAO dao;

	public List<CouponDTO> couponList(String userid) {
		return dao.couponList(userid);
	}
	
}