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
     
ArrayList<String>brandList=new ArrayList<String>();
String brandName=null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String s_word=request.getParameter("srchWord");
//String s_word="네이처";
   String sql = " SELECT br_name, br_code  " + 
			" FROM brand  " + 
			" where regexp_like(br_name, '"+s_word+"' ,'i') ";
   
   String data="<div class='mybrand-list t3'>";
   data+=" <div class='brand' id='shopBrandArea'> ";
     
   try{      
       con = ConnectionProvider.getConnection();

      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while( rs.next() ){
	brandName=rs.getString("br_name");
	//brandList.add(brandName);
      data+="<a class='btn scrhItem sb90' href='#'>";
      data+=brandName.replaceAll("("+s_word+")", "<span>"+s_word+"</span>")+"</a>";
      //data+="<span>"+s_word+"</span>"+brandName.substring(s_word.length())+"</a>";
      //b.replaceAll("("+a+")","")             네이처 굿즈 리퍼블림 >네이처 <span>굿즈<span>리퍼블림  >brandName.replaceAll()
      }
      if(brandName!=null){
    	  data+="<input type='hidden' id='ajaxBrandListSize' value='8'>";
          data+="</div></div>";
      }else{
    	  
    	  data="<section class='no_data txt' id='no_data_brand'><div class='inr'><div class='msg'>브랜드 검색 결과가 없습니다.</div></div></section>";

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

System.out.println(brandName+"브랜드리스트에서 찍은거");
System.out.println("최종적으로 브랜드 에이잭스는 찍고감");
  
   
    	
 
%>
 <%= data %>

 
 
