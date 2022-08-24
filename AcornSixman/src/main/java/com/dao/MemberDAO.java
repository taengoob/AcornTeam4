package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;


public class MemberDAO {

	public MemberDTO Login(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("Login", map);

	}

	public int insert(SqlSession session, MemberDTO dto) {
		return session.insert("memberAdd", dto);
	}

	public int idCheck(SqlSession session, String id) {
		return session.selectOne("idCheck", id);
	}
	public int update(SqlSession session, MemberDTO dto2) {
		return session.update("MemberMapper.update", dto2);
	}

	public MemberDTO findid(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("MemberMapper.findid", map);
	}

	public MemberDTO findidforphone(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("MemberMapper.findidforphone", map);
	}

	public int changePW(SqlSession session, HashMap<String, String> map) {
		return session.update("MemberMapper.changePW", map);
	}

	public MemberDTO findid2(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("MemberMapper.findid2", map);
	}

	public MemberDTO findpwforphone(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("MemberMapper.findpwforphone", map);
	}

	public MemberDTO Loginforkakao(SqlSession session, HashMap<String, String> kakao) {
		return session.selectOne("Loginforkakao", kakao);
	}


}
