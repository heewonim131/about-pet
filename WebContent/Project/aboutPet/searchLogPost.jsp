<%@page import="java.util.ArrayList"%>
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


PreparedStatement pstmt = null;
ResultSet rs = null;

String s_word=request.getParameter("srchWord");


//int Lcate_code=1;    
//String s_word="린다";
   String sql=" select log_img "+ 
		  " from pet_log "+
		" where regexp_like(log_content,'"+s_word+"','i') ";
   
   
   String data=null;
   String log_img=null;
     
   try{      
       con = ConnectionProvider.getConnection();

      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while( rs.next() ){
    	  
    	  log_img=rs.getString("log_img");
    	  
    	  data+="<li class='scrhItem lc9541'><a href='#' class='logPicBox'><span class='logIcon_pic '></span>	<img src='"+log_img+"' alt='/log/945433/19a1e127-ddd7-4080-9583-85068ef854ba.jpg' onerror='''></a></li>";
    
 
 
      }
      if(data==null){
    	  data="";
      }
    
      
      
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
      JdbcUtil.close(con);
   } 



System.out.println("로그 포스트 들러감");
  

 
%>
 <%= data %>


 
 
