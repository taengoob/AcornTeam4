package com.acorn.sixman.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.acorn.sixman.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	MemberDTO Login(HashMap<String, String> map);

	int memberAdd(MemberDTO dto);

	int idCheck(String id);

	int update(MemberDTO dto2);

	MemberDTO findid(HashMap<String, String> map);

	MemberDTO findidforphone(HashMap<String, String> map);

	int changePW(HashMap<String, String> map);

	MemberDTO findid2(HashMap<String, String> map);

	MemberDTO findpwforphone(HashMap<String, String> map);

	MemberDTO Loginforkakao(HashMap<String, String> kakao);

}
