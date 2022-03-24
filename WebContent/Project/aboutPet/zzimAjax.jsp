<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

	int item_code = Integer.parseInt(request.getParameter("item_code"));
	String zzimcheck = request.getParameter("zzimcheck");
	int mem_code = Integer.parseInt(request.getParameter("mem_code"));
	
	int check = 0;

	if(zzimcheck.equals("N")){
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO item_mark (im_code, item_code, mem_code) VALUES ( item_mark_seq.nextval, ?, ?) ";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item_code);
			pstmt.setInt(2, mem_code);
			
			pstmt.executeUpdate();
			
			con.commit();
			check = 1;				
			
			
		} finally {
			JdbcUtil.close(pstmt);
		}
		
	} else if(zzimcheck.equals("Y")){
		
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM item_mark WHERE item_code = ? AND mem_code = ?";
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item_code);
			pstmt.setInt(2, mem_code);
			
			pstmt.executeUpdate();
			
			con.commit();
			check = 2;				
		
		} finally {
			JdbcUtil.close(pstmt);
		}
		
	} else {
		check = 3;
	}
	
%>

<%= check %>

