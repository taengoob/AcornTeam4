package com.session;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBSessionFactory
{
	public static SqlSessionFactory sessionFactory = null;
	static 
	{
		String configPath = "./resources/Configuration.xml";
		InputStream stream = null;
		try
		{
			stream = Resources.getResourceAsStream(configPath);
			System.out.println("Configuration.xml Loaded =================");
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		sessionFactory = new SqlSessionFactoryBuilder().build(stream);
	}
	
	public static SqlSession getSession()
	{
		return sessionFactory.openSession();
	}
}
