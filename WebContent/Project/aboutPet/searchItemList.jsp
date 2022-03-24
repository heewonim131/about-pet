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
int Lcate_code=Integer.parseInt(request.getParameter("cateCdL"));    
System.out.println(s_word+"/"+Lcate_code);
//int Lcate_code=1;    
//String s_word="이나바";
   String sql = "SELECT i.item_code, item_name, item_price, sale_rate, item_img, l.lcate_code, m.mcate_code, s.scate_code, b.br_name " 
		 +	" FROM item i LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code "
         +   "  LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code "
         +   "  LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code "
         +   " LEFT OUTER JOIN item_sale t ON i.item_code = t.item_code "
         + "  Left outer join brand b on i.br_code=b.br_code "
         +" where (regexp_like(item_name, '"+s_word+"' ,'i') or regexp_like(itag, '"+s_word+"' ,'i')) and l.lcate_code = "+Lcate_code;
   
   String data="<ul id='shopGoodsArea'>";
   String item_name=null;
     
   try{      
       con = ConnectionProvider.getConnection();

      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while( rs.next() ){
	
   item_name=rs.getString("item_name");	  
    String brandName=rs.getString("br_name");
	int item_price=rs.getInt("item_price");
	int item_code = rs.getInt("item_code");
	int sale_rate = rs.getInt("sale_rate");
    String item_img = rs.getString("item_img");
    
    data+="<li class='scrhItem needAdbrix sgPI000002125' data-goodscnt='52' data-productid='PI000002125' data-productname='"+item_name+"' data-price='"+item_price+"' data-discount='"+sale_rate+"'>";
    data+="<div class='gdset packg  schrt'>" ;
    data+="<div class='thum'><a href='itemDetail.do?item_code="+item_code+"' class='pic'>"; 
    data+="<img class='img' src='"+item_img+"' alt='이미지'>";
    data+="</a><button type='button' class='bt zzim ' data-content='PI000002125' data-url='/goods/insertWish?goodsId=PI000002125' data-action='interest' data-yn='N' data-goods-id='PI000002125' data-target='goods'>찜하기</button></div>";
    data+="<div class='boxs'><p class='sname'>"+brandName+"</p>";
    data+="<div class='tit'><a href='javascript:searchResult.goGoods('PI000002125');' class='lk'>"+item_name+"</a></div>";
    data+="<a href='javascript:searchResult.goGoods('PI000002125');' class='inf'>";
    data+="<span class='prc'><em class='p'>★1,100</em><i class='w'>원</i></span><span class='pct'><em class='n'>★38</em><i class='w'>%</i></span>";
    data+="</a></div></div></li>";
      }
      
    
      if(item_name!=null){
    	   data+="</ul>";
    	  
      }else{
    	  
           data="";
      } 
      
      
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
      JdbcUtil.close(con);
   } 



System.out.println("아이템리스트  에이잭스는 찍고감");
  

 
%>
 <%= data %>


 
 
