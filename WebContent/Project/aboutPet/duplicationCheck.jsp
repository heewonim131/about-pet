<%@page import="java.net.URLDecoder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page trimDirectiveWhitespaces="true" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
Connection con = null;
     
           String check=request.getParameter("check");
         
          String checkValue=null;
           switch(check){
        case "mem_id" : 
        	 checkValue = request.getParameter("loginId");
            break;
        case "nickname" : 
        	 checkValue =URLDecoder.decode(request.getParameter("nickNm"), "UTF-8");
        	 
        	 //request.getParameter("nickNm");
            break;  
        case "mem_invite" : 
        	checkValue = request.getParameter("rcomLoginId");
        	break;
    }; 
  
   
    	System.out.println(check);	
    	System.out.println(checkValue);	
      
      String sql = " select count(*) cnt " + 
                      " from member  " + 
                      " where "+ check +" = ? ";
    //  Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      JSONObject data = null;
      try{
         con = ConnectionProvider.getConnection();
         pstmt = con.prepareStatement(sql);
          //pstmt.setString(1, check);
          pstmt.setString(1, checkValue);
          rs = pstmt.executeQuery();
          rs.next();
          int cnt = rs.getInt("cnt");  // 1      0
          data = new JSONObject();
          data.put("count", cnt);   // { "count":1 }
      }catch(Exception e){
         e.printStackTrace();
      }finally{
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
         JdbcUtil.close(con);
      } 
%>
 <%= data %>

 
 
