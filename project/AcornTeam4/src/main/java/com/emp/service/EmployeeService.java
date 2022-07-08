package com.emp.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

import com.emp.dao.EmployeeDao;
import com.emp.dto.Employee;

public class EmployeeService
{
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "scott";
	private String pass = "tiger";
    private EmployeeDao dao;
    
	public EmployeeService()
	{
		dao = new EmployeeDao();
		try
		{
			Class.forName(driver);
			System.out.println("EmployeeService() - 드라이버 로딩======================");
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public ArrayList<Employee> getAllEmployee()
	{
		ArrayList<Employee> result = new ArrayList<Employee>();
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(url, user, pass);
			result = dao.getAllEmployee(con);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if (con != null) con.close();	
			}
			catch (Exception e2)
			{
				e2.printStackTrace();
			}
		}
		return result;
	}
}
