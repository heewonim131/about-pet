package com.util;

import java.io.Reader;
import java.io.StringReader;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class DBCPInitListener implements ServletContextListener{

	// 웹 컨테이너(톰캣)가 종료할 때
	@Override
	public void contextDestroyed(ServletContextEvent sce) { 
		System.out.println("> DBCPInitListener.contextDestroyed()...");
	}

	// 웹 컨테이너(톰캣)가 시작할때 
	@Override
	public void contextInitialized(ServletContextEvent sce) { 
		System.out.println("> DBCPInitListener.contextInitialized()...");
		// DBCP 초기화...
		// sce.getServletContext() == application 객체
		String poolConfig = sce.getServletContext().getInitParameter("poolConfig");
		Properties prop = new Properties();
		Reader reader = new StringReader(poolConfig);
		try {
			prop.load(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//
		System.out.println( prop.getProperty("className") );
		System.out.println( prop.getProperty("url") );
		System.out.println( prop.getProperty("user") );
		System.out.println( prop.getProperty("password") );
		
	}

}
