package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dbconfig.MySqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.MemberDTO;


public class MemberService {
	private MemberDAO dao;

	public MemberService() {
		dao = new MemberDAO();
	}

	public int memberAdd(MemberDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int list = 0;
		try {
			list = dao.insert(session, dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;

	}

	public int idCheck(String id) {
		SqlSession session = MySqlSessionFactory.getSession();
		int list = 0;
		try {
			list = dao.idCheck(session, id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public MemberDTO Login(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		MemberDTO dto = null;
		try {
			dto = dao.Login(session, map);
			System.out.println("서비스 디티오 " + dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

}
