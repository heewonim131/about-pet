<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String pItem_code = String.valueOf(request.getAttribute("pItem_code"));
String iqrContent =  String.valueOf(request.getAttribute("iqrContent"));
String hiddenYn =  String.valueOf(request.getAttribute("hiddenYn"));
String rplAlmRcvYn =  String.valueOf(request.getAttribute("rplAlmRcvYn"));

int item_code = pItem_code==null?0:Integer.parseInt(pItem_code);
int IQ_PRIVATE = hiddenYn.equals("Y")?1:0;
int IA_NOTICE = rplAlmRcvYn.equals("Y")?1:0;

int count= 0;

String sql = " INSERT INTO ITEM_Q (IQ_CODE,ITEM_CODE,IQ_CONTENT,IQ_DATE,IQ_PRIVATE,IA_NOTICE,IA_STATUS) "+ 
		 " values (item_q_seq.nextval,?,?,sysdate,?,?,'답변대기') ";
Connection con = ConnectionProvider.getConnection();
PreparedStatement pstmt = null; 
try {
 pstmt=con.prepareStatement(sql);
 pstmt.setInt(1,item_code);
 pstmt.setString(2,iqrContent);
 pstmt.setInt(3,IQ_PRIVATE);
 pstmt.setInt(4,IA_NOTICE);

 
 count = pstmt.executeUpdate();
 
}catch (SQLException e) {
  e.printStackTrace();
} finally {
JdbcUtil.close(pstmt);
}
%>
<%=count%>