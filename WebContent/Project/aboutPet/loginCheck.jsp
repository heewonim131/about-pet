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
     
           String id=request.getParameter("id");
         
          String passwd=request.getParameter("passwd");
   
      
      String sql = " select count(*) cnt " + 
                      " from member  " + 
                      " where mem_id= ? and mem_pw = ? ";
    //  Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      JSONObject data = null;
      try{
         con = ConnectionProvider.getConnection();
         pstmt = con.prepareStatement(sql);
          pstmt.setString(1, id);
          pstmt.setString(2, passwd);
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

 
 
