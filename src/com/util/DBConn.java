package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// 싱글톤
public class DBConn {
	
	private DBConn() {}
	
	// 클래스변수=static변수=공유변수=shared 변수=정적변수
	private static Connection connection = null; 
	
	public static Connection getConnection() {
		// Cannot make a static reference to the non-static field connection
		if (connection == null) {
			String className = "oracle.jdbc.driver.OracleDriver";
			String url="jdbc:oracle:thin:@localhost:1521:xe", user="scott", password="tiger"; // Type4
			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) { 
				e.printStackTrace();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		return connection;
	}
	
	public static Connection getConnection(String className, String url, String user, String password) {
		// Cannot make a static reference to the non-static field connection
		if (connection == null) { 		 
			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) { 
				e.printStackTrace();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		return connection;
	}
	
	public static void close() {
		try {
			if ( connection != null && !connection.isClosed()) {
				try {
					connection.close();
				} catch (SQLException e) { 
					e.printStackTrace();
				}
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally {
			connection = null; // 
		}
	}
}
