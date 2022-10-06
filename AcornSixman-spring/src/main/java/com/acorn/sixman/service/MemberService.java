package com.acorn.sixman.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.MemberDAO;
import com.acorn.sixman.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;


	public int memberAdd(MemberDTO dto) {

		int list = 0;
		
		list = dao.memberAdd(dto);
			
		
		return list;

	}

	public int idCheck(String id) {

		int list = 0;
		
			list = dao.idCheck(id);

		
		return list;
	}

	public MemberDTO Login(HashMap<String, String> map) {

		MemberDTO dto = null;
		
			dto = dao.Login(map);
			System.out.println("서비스 디티오 " + dto);
		
		return dto;
	}

	public MemberDTO findid(HashMap<String, String> map) {

		MemberDTO list = null;
		
			list = dao.findid(map);
		
		return list;
	}

	public MemberDTO findidforphone(HashMap<String, String> map) {

		MemberDTO list = null;
		
			list = dao.findidforphone(map);
		
		return list;
	}



	public MemberDTO findid2(HashMap<String, String> map) {

		MemberDTO list = null;
		
			list = dao.findid2(map);
		
		return list;
	}

	public MemberDTO findpwforphone(HashMap<String, String> map) {

		MemberDTO list = null;
		
			list = dao.findpwforphone(map);
		
		return list;
	}

	public MemberDTO Loginforkakao(HashMap<String, String> kakao) {

		MemberDTO dto = null;
		
			dto = dao.Loginforkakao(kakao);
			System.out.println("서비스 디티오 " + dto);
		
		return dto;
	}

}
