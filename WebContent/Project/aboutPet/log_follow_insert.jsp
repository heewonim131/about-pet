<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 

	
  Connection conn = DBConn.getConnection();
  PreparedStatement pstmt = null;
 // ResultSet rs = null;
  

	int mem_code = Integer.parseInt( request.getParameter("mem_code")); 
	int mf_code = Integer.parseInt( request.getParameter("mf_code")); 
	

	System.out.printf("%d, %d", mem_code, mf_code);
  
  String sql =
          " INSERT INTO mem_follow (fol_code, mem_code, mf_code, mf_date) VALUES (seq_memFollowUP.NEXTVAL, ?, ?, sysdate) " ;


    int result = 0 ;

    try{
    	 conn = ConnectionProvider.getConnection();
    	  pstmt = conn.prepareStatement(sql);
	 
    	  pstmt.setInt(1, mem_code);
    	  pstmt.setInt(2, mf_code);
    	  
    	  result =  pstmt.executeUpdate();
    }catch(Exception e){
        e.printStackTrace();
  }finally{
        pstmt.close(); 
        conn.close(); 
  }
  
  DBConn.close();
  
  out.write(String.valueOf(result)+"/");
  out.write(String.valueOf(mem_code)+"/");
  out.write(String.valueOf(mf_code));
  
%>

