<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String  plcate_code =(String) request.getAttribute("lnbDispClsfNo");
String pdispClsfNo = (String) request.getAttribute("pdispClsfNo");
int lcate_code = Integer.parseInt(plcate_code);
int dispClsfNo = Integer.parseInt(pdispClsfNo);

String sql = "SELECT distinct t.name, COUNT(t.code)OVER(partition by t.name) as panmai ,item_img , t.code, item_price, sale_rate " + 
		   "FROM( " + 
		   "SELECT it.item_code as code ,item_name as name ,mem.mem_code as mcode , item_img,item_price,sale_rate " + 
		   "FROM item it JOIN item_option ito ON it.item_code = ito.item_code " + 
		   "     JOIN STOCK st ON ito.opt_code = st.opt_code " + 
		   "     JOIN ORDER_DETAIL ord ON st.st_code = ord.st_code " + 
		   "     JOIN ORDER_LIST orl ON orl.ord_code = ord.ord_code " + 
		   "     JOIN MEMBER mem ON orl.mem_code = mem.mem_code " + 
		   "     LEFT OUTER JOIN item_sale its on it.item_code = its.item_code " + 
		   "     LEFT OUTER JOIN scate s ON it.scate_code = s.scate_code " + 
		   "     LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code " + 
		   "     LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code " + 
		   "     WHERE l.lcate_code = ? ";
		   if(dispClsfNo != 0){
			sql +=   " AND  m.mcate_code = ?  " ;		   
		   }
		   sql+= "     ) t ";
		   sql+= "ORDER BY panmai desc ";
	
	Connection con = ConnectionProvider.getConnection();
 PreparedStatement pstmt = null; 
 ResultSet rs= null;
 JSONObject jsonData = new JSONObject();
 JSONArray  jsonArray = new JSONArray();

try {
  pstmt=con.prepareStatement(sql);
  pstmt.setInt(1,lcate_code);
  if(dispClsfNo != 0){
	  pstmt.setInt(2,dispClsfNo);
  }
  rs=pstmt.executeQuery();
 
  if(rs.next()) {
     do {
        int item_code = rs.getInt(4);
        String item_name = rs.getString(1);
        String item_img = rs.getString(3);
        int item_price = rs.getInt(5);
        int sale_rate = rs.getInt(6);
 	   JSONObject jsonSaveData = new JSONObject();
        
        jsonSaveData.put("item_code", item_code);
        jsonSaveData.put("item_name", item_name);
        jsonSaveData.put("item_img", item_img);
        jsonSaveData.put("item_price", item_price);
        jsonSaveData.put("sale_rate", sale_rate);
        jsonArray.add(jsonSaveData);
        
     } while ( rs.next() );
     jsonData.put("jsonArray", jsonArray);
  } // 
}catch (SQLException e) {
	// TODO: handle exception
}  finally {
	JdbcUtil.close(pstmt);
	JdbcUtil.close(rs);  
} // finally
%>
<%= jsonData%>