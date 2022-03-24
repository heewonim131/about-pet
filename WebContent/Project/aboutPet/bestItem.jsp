<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  String sql = "SELECT distinct t.name, COUNT(t.code)OVER(partition by t.name) as panmai ,item_img , t.code, item_price, sale_rate " + 
			   "FROM( " + 
			   "SELECT it.item_code as code ,item_name as name ,mem.mem_code as mcode , item_img,item_price,sale_rate " + 
			   "FROM item it JOIN item_option ito ON it.item_code = ito.item_code " + 
			   "     JOIN STOCK st ON ito.opt_code = st.opt_code " + 
			   "     JOIN ORDER_DETAIL ord ON st.st_code = ord.st_code " + 
			   "     JOIN ORDER_LIST orl ON orl.ord_code = ord.ord_code " + 
			   "     JOIN MEMBER mem ON orl.mem_code = mem.mem_code " + 
			   "     JOIN item_sale its on it.item_code = its.item_code " + 
			   "     LEFT OUTER JOIN scate s ON it.scate_code = s.scate_code " + 
			   "     LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code " + 
			   "     LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code " + 
			   "     WHERE l.lcate_code = 1 " + 
			   "     ) t ";
  
  
  String responseText = "";
  
  try{
     conn =  ConnectionProvider.getConnection();
     pstmt = conn.prepareStatement(sql);
     rs =  pstmt.executeQuery();
     
     int i = 1;
     String defaultImg = "bestItem";
     
     while(rs.next()){
		String item_name = rs.getString("name");
		String item_img = rs.getString("item_img");
		int item_code = rs.getInt("code");
		int item_price = rs.getInt("item_price");
		int sale_rate = rs.getInt("sale_rate");

       // String zzimCalss = null;
        int amt;

			/* //zzimCalss = (item[i].interestYn == 'Y' ? "on" : ""); */

			responseText += "<li>";
			responseText += "<div class='gdset bests'>";
			responseText += "<div class='num'>";
			responseText += "<em class='b'>"+(i++)+"</em> ";
			
			// if(dispType == "AUTO") {
			//	rasingClass = (item[i].rasing == 0) ? "nn" : (item[i].rasing > 0 ? "up" : "dn");
			//	rasing = Math.abs(item[i].rasing);
			//	responseText += "<em class="udn "+rasingClass+"" "+rasingStyle+">"+rasing+"</em> ";
			//}
			
			responseText += "</div>";
			responseText += "<div class='thum'>";
			responseText += "<a href='/AboutPet/Project/aboutPet/itemDetail.do?item_code='"+item_code+"' class='pic' data-content='"+item_code+"' data-url='/goods/indexGoodsDetail?goodsId='"+item_code+"'>";
			responseText += "<img class='img' src='"+item_img+"' alt='"+item_name+"' onerror='"+defaultImg+"'>";
			responseText += "</a>";
			responseText += "<button type='button' class='bt zzim '+zzimCalss' data-content="+item_code+" data-url='/goods/insertWish?goodsId='"+item_code+" data-action='interest' data-yn='N' data-goods-id="+item_code+" data-target='goods'>찜하기</button>";
			responseText += "</div>";
			responseText += "<div class='boxs'>";
			responseText += "<div class='tit'>";
			responseText += "<a href='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item_code+"' class='lk' data-content="+item_code+" data-url='/goods/indexGoodsDetail?goodsId="+item_code+"'>"+item_name+"</a>";
			responseText += "</div>";
			responseText += "<a href='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item_code+"' class='inf' data-content='"+item_code+"' data-url='/goods/indexGoodsDetail?goodsId="+item_code+"'>";
			responseText += "<span class='prc'><em class='p'>"+item_price+"</em><i class='w'>원</i></span>";
			if( sale_rate == 0 ) {
				responseText += "&nbsp<span class='pct'><em class='n'>"+sale_rate+"</em><i class='w'>%</i></span>";
			}
			responseText += "</a></div></div></li>";
		
     } 
  }catch(Exception e){
     e.printStackTrace();
  }finally{
     try{
        pstmt.close();rs.close();conn.close();
     }catch(Exception e){}
  }
%>

<%= responseText %>