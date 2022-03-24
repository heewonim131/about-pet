<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String pMem_code = (String)request.getAttribute("pMem_code");

int mem_code = Integer.parseInt(pMem_code);

String sql = "SELECT MEM_POINT "
		+ "FROM member "
		+ "where mem_code = ?";

Connection con = ConnectionProvider.getConnection();
PreparedStatement pstmt = null; 
ResultSet rs= null;
int mem_point =0;

try {
	  pstmt=con.prepareStatement(sql);
	  pstmt.setInt(1,mem_code);
	  rs=pstmt.executeQuery();
	 
	  if(rs.next()) {
	        mem_point = rs.getInt(1);      
	  } // 
	}catch (SQLException e) {
		// TODO: handle exception
	}  finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);  
	} // finally

%>
<%=mem_point%>