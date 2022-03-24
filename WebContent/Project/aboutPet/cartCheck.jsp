<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String pItem_code = String.valueOf(request.getAttribute("item_code"));
String pMem_code =  String.valueOf(request.getAttribute("mem_code"));

int item_code = Integer.parseInt(pItem_code);
int mem_code  = Integer.parseInt(pMem_code);
int count= 0;

if(mem_code != 0){
	 
	String sql = " SELECT COUNT(*) count "
			+ "             FROM CART "
			+ "             WHERE mem_code = ? and opt_code =? ";
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement pstmt = null; 
	  ResultSet rs= null;
    try {
       pstmt=con.prepareStatement(sql);
       pstmt.setInt(1,mem_code );
       pstmt.setInt(2,item_code );
       rs=pstmt.executeQuery();
       
       if(rs.next()) {
         count = rs.getInt("count");
       } // 
    }catch (SQLException e) {
  	  e.printStackTrace();
	} finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);  
    }
}
%>
<%= count%>