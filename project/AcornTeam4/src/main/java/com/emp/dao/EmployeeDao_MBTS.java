package com.emp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.emp.dto.Employee;

public class EmployeeDao_MBTS
{

	public EmployeeDao_MBTS()
	{
		// TODO Auto-generated constructor stub
	}

	public List<Employee> getAllEmployee(SqlSession session)
	{
//		List<Employee> list = session.selectList("com.emp.EmployeeMapper.selectAll");
		List<Employee> list = session.selectList("com.emp.EmployeeMapper.selectAll");
		return list;
	}

}
