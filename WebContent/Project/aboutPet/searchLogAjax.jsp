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
     int mem_code=0;
        if(session.getAttribute("num")!=null){
           mem_code=(int)session.getAttribute("num");
        }
         
          String s_word=request.getParameter("searchWord");
        
	PreparedStatement pstmt = null;

    String sql = " insert into search " + 
            " (s_code,mem_code,s_word,s_time   ) "
        + " values ( seq_search.nextval, ? , ? , sysdate)";
try {
    con = ConnectionProvider.getConnection();

pstmt = con.prepareStatement(sql);
	/*
	 * pstmt.setString(1, dto.getGuest_name() ); 
	 * pstmt.setString(2, dto.getPassword() );
	 *  pstmt.setString(3, dto.getMessage() );
	 */
pstmt.setInt(1,mem_code ); 
pstmt.setString(2,s_word  ); 


 pstmt.executeUpdate();
} finally { 
JdbcUtil.close(pstmt);
}
%>


 
 
