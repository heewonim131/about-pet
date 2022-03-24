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
JSONObject jsonData=new JSONObject();
JSONArray jsonEmpArray=new JSONArray();

String data=request.getParameter("itag");
int mem_code=Integer.parseInt(request.getParameter("mem_code"));
  // 1      0
jsonData.put("tag",data);
jsonData.put("mem_code",mem_code);



String sql="update member   "
		+"  set mtag= ? "
		+" where mem_code= ? ";
//  Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
   con = ConnectionProvider.getConnection();
   pstmt = con.prepareStatement(sql);
    pstmt.setString(1, data);
    pstmt.setInt(2, mem_code);
    
    int rowCount=pstmt.executeUpdate();
 
}catch(Exception e){
   e.printStackTrace();
}finally{
   JdbcUtil.close(pstmt);
   JdbcUtil.close(rs);
   JdbcUtil.close(con);
} 
          
    		
  
%>

<%= jsonData%>