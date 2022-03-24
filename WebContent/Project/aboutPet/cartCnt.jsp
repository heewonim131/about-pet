<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String pMem_code = String.valueOf(request.getAttribute("pMem_code")) ;
pMem_code = pMem_code ==null ? "0": pMem_code;
int mem_code = Integer.parseInt(pMem_code);
JSONObject json1 = new JSONObject();
JSONObject jsonSaveData = new JSONObject();
JSONArray  jsonArray = new JSONArray();

if(mem_code != 0){
String sql = "SELECT COUNT(*) count " +
			" FROM CART "+
			"WHERE mem_code = ? ";

Connection con = ConnectionProvider.getConnection();
PreparedStatement pstmt = null; 
ResultSet rs= null;

try {
pstmt=con.prepareStatement(sql);
pstmt.setInt(1,mem_code);
rs=pstmt.executeQuery();

if(rs.next()) {
 int cartCnt = rs.getInt(1);
    
 jsonSaveData.put("carCnt", cartCnt);
 jsonArray.add(jsonSaveData);
    
 json1.put("jsonArray", jsonArray);
} // 
}catch (SQLException e) {
// TODO: handle exception
}  finally {
JdbcUtil.close(pstmt);
JdbcUtil.close(rs);  
} // finally
}else{
	json1.put("error","error");
}
%>
<%= json1%>