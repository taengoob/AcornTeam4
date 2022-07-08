package com.emp.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.emp.dao.EmployeeDao_MBTS;
import com.emp.dto.Employee;
import com.session.DBSessionFactory;

public class EmployeeService_MBTS
{
	EmployeeDao_MBTS dao = new EmployeeDao_MBTS();
	
	public EmployeeService_MBTS()
	{
		
	}

	public List<Employee> getAllEmployee()
	{
		SqlSession session = DBSessionFactory.getSession();
		List<Employee> result = dao.getAllEmployee(session);
		return result;
	}
}
