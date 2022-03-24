<%@page import="java.util.Arrays"%>
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

System.out.println("로그에이잭스");
//int Lcate_code=1;    
//String s_word="린다";
   String sql=" select mem_code,mem_img,nickName, "+
		    "  (select count(*) from pet_log where  mem_code=t.mem_code) post, "+
		    "  (select count(*) from mem_follow where  mf_code=t.mem_code) follow " +
		" from member t "+
		" where regexp_like(nickname,'"+s_word+"','i') ";
   
   
   String data=null;
   String nickName=null;
     
   try{      
       con = ConnectionProvider.getConnection();

      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while( rs.next() ){
    	  int mem_code=rs.getInt("mem_code");
    	  String mem_img=rs.getString("mem_img");
        int post=   rs.getInt("post");
        int follower=   rs.getInt("follow");
  	  nickName=rs.getString("nickName");

    data+="<li class='scrhItem lm938916' onclick=''>";
    data+="<p class='img'><img src='"+mem_img+"' alt='/log/938916/profile/0130e2a9-e72e-479a-9d90-c59d9dbeb890.jpg' onerror=''></p>";
    data+="<div class='txt'><p class='t1'>";
    data+=nickName.replaceAll("("+s_word+")", "<span>"+s_word+"</span>")+"</p>";
    data+="<p class='t2'>	<span>게시물"+post+"</span><span>팔로워"+follower+"</span>";
    data+="</p></div> 	</li>";
 
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



System.out.println("친구목록  에이잭스는 찍고감");
  

 
%>
 <%= data %>


 
 
