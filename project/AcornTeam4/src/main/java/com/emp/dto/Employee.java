package com.emp.dto;

import java.util.Date;

public class Employee
{
	int EMPNO;
	String ENAME;
	String JOB;
	int MGR;
	Date HIREDATE;
	double SAL;
	double COMM;
	int DEPTNO;
	
	public int getEMPNO()
	{
		return EMPNO;
	}

	public void setEMPNO(int eMPNO)
	{
		EMPNO = eMPNO;
	}

	public String getENAME()
	{
		return ENAME;
	}

	public void setENAME(String eNAME)
	{
		ENAME = eNAME;
	}

	public String getJOB()
	{
		return JOB;
	}

	public void setJOB(String jOB)
	{
		JOB = jOB;
	}

	public int getMGR()
	{
		return MGR;
	}

	public void setMGR(int mGR)
	{
		MGR = mGR;
	}

	public Date getHIREDATE()
	{
		return HIREDATE;
	}

	public void setHIREDATE(Date hIREDATE)
	{
		HIREDATE = hIREDATE;
	}

	public double getSAL()
	{
		return SAL;
	}

	public void setSAL(double sAL)
	{
		SAL = sAL;
	}

	public double getCOMM()
	{
		return COMM;
	}

	public void setCOMM(double cOMM)
	{
		COMM = cOMM;
	}

	public int getDEPTNO()
	{
		return DEPTNO;
	}

	public void setDEPTNO(int dEPTNO)
	{
		DEPTNO = dEPTNO;
	}

	public Employee()
	{
		
	}

	public Employee(int eMPNO, String eNAME, String jOB, int mGR, Date hIREDATE, double sAL, double cOMM, int dEPTNO)
	{
		super();
		EMPNO = eMPNO;
		ENAME = eNAME;
		JOB = jOB;
		MGR = mGR;
		HIREDATE = hIREDATE;
		SAL = sAL;
		COMM = cOMM;
		DEPTNO = dEPTNO;
	}

	@Override
	public String toString()
	{
		return "Employee [EMPNO=" + EMPNO + ", ENAME=" + ENAME + ", JOB=" + JOB + ", MGR=" + MGR + ", HIREDATE="
				+ HIREDATE + ", SAL=" + SAL + ", COMM=" + COMM + ", DEPTNO=" + DEPTNO + "]";
	}
}
