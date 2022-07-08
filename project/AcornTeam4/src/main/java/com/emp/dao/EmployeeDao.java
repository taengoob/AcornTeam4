package com.emp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import com.emp.dto.Employee;

public class EmployeeDao
{

	public EmployeeDao()
	{
		
	}

	public ArrayList<Employee> getAllEmployee(Connection con)
	{
		ArrayList<Employee> result = new ArrayList<Employee>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			String sql = "select * from emp order by empno desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				int mgr = rs.getInt("mgr");
				Date hiredate = rs.getDate("hiredate");
				double sal = rs.getDouble("sal");
				double comm = rs.getDouble("comm");
				int deptno = rs.getInt("deptno");
				Employee emp = new Employee(empno, ename, job, mgr, hiredate, sal, comm, deptno);
				result.add(emp);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			}
			catch(SQLException x)
			{
				x.printStackTrace();
			}
		}
		return result;
	}
}
