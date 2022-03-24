<%@page import="java.util.ArrayList"%>
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
     


PreparedStatement pstmt = null;
ResultSet rs = null;

String s_word=request.getParameter("srchWord");
//String s_word="개놈";
   String sql = " SELECT  s_code ,c_img,s_name,s_season  " + 
			" FROM series  " + 
	        " where regexp_like(s_name, '"+s_word+"' ,'i') or regexp_like(s_desc,'"+s_word+"','i') ";
   
   String data=null;
     
   try{      
       con = ConnectionProvider.getConnection();

      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while( rs.next() ){
    int s_code=rs.getInt("s_code");
	String c_img=rs.getString("c_img");
	String s_name=rs.getString("s_name");
	String s_season=rs.getString("s_season");
	
	//brandList.add(brandName);
      data+="<li class='scrhItem ts1711' data-srisno='171' data-srisnm='1' onclick='searchResult.goSeries('171','1');'>";
     data+="<p class='img'><img src='"+c_img+"' alt='/series/171/srisProfile/f976d3b4-fbf1-464e-a201-e5b3b51910cc.png' onerror=''></p>";
      
     data+="<div class='txt'>	<p class='t1'>"+s_name.replaceAll("("+s_word+")", "<span>"+s_word+"</span>")+"</p>";
    data+="<p class='t2'>"+"시즌"+ s_season+"</p></div>  	</li>";
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
   } // try

/*String data = "<ol>";
     
  // jarr 
  while(rs.next()){
	  int empno = rs.getInt(1);
	  String ename = rs.getString(2);
	  int sal = rs.getInt(3);
	  int rank = rs.getInt(4);
	   
	  data +="<li>"+empno+" / "+ ename+"</li>";
  }
  
  data +="</ol>";  */

  
   
    	
 
%>
 <%= data %>

 
 
