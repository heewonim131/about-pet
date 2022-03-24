<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

 String pItem_code = String.valueOf(request.getAttribute("item_code"));
 String pMem_code =  String.valueOf(request.getAttribute("mem_code"));
 String pTotalCnt =  String.valueOf(request.getAttribute("totalCnt"));
 
 int item_code = Integer.parseInt(pItem_code);
 int mem_code  = Integer.parseInt(pMem_code);
 int totalCnt  = Integer.parseInt(pTotalCnt);
 int count= 0;
 
 Connection con = ConnectionProvider.getConnection();
 PreparedStatement pstmt = null; 
 ResultSet rs = null;
 
 if(mem_code != 0){
	 	String sql = "SELECT i.item_code, item_name, opt_name, st_code, st_avail, o.opt_code\r\n" + 
		 			"FROM item i LEFT OUTER JOIN item_option o ON i.item_code = o.item_code\r\n" + 
		 			"            LEFT OUTER JOIN stock s ON o.opt_code = s.opt_code\r\n" + 
		 			"WHERE i.item_code = ? AND rownum = 1";
	 			
	 	try {
	 		         pstmt=con.prepareStatement(sql);
	 		         pstmt.setInt(1,item_code);
	 		         
	 		         rs = pstmt.executeQuery();
	 		         
	 		         int opt_code = 0;
	 		         
	 		         if(rs.next()){
	 		        	 opt_code = rs.getInt("opt_code");
	 		         }
	 
	 
	
	 		         sql = " INSERT INTO CART (cart_code,mem_code,opt_code,cart_cnt) values (SEQ_CART_LIST.nextval,?,?,?) ";
		
      
      try {
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1,mem_code);
         pstmt.setInt(2,opt_code);
         pstmt.setInt(3,totalCnt);
         
         count = pstmt.executeUpdate();
      }catch (SQLException e) {
    	  e.printStackTrace();
	} finally {
		JdbcUtil.close(pstmt);
      }
      
	 		      }catch (SQLException e) {
	 		    	  e.printStackTrace();
	 			} finally {
	 				JdbcUtil.close(pstmt);
	 		      }		
	 
 }
 %>
<%=count%>