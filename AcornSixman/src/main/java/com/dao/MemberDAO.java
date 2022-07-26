package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;

public class MemberDAO {

	public int insert(SqlSession session, MemberDTO dto) {
		return session.insert("memberAdd", dto);
	}

	public int idCheck(SqlSession session, String id) {
		return session.selectOne("idCheck",id);
	}

	public MemberDTO Login(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("Login",map);
	}

}
