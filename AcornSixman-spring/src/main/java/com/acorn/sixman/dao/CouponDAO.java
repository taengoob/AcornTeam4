package com.acorn.sixman.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.acorn.sixman.dto.CouponDTO;

@Mapper
public interface CouponDAO {
	
	List<CouponDTO> couponList(String userid);
	
}
