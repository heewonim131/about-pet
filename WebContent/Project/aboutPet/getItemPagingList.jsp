<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="project.aboutPet.shop.model.ShopDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.JdbcUtil"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<ShopDTO> zzim = (ArrayList<ShopDTO>)request.getAttribute("zzim");
	
	int lcate_code = Integer.parseInt(request.getParameter("lcate_code"));
	int mcate_code = request.getParameter("mcate_code") == "" ? 13 : Integer.parseInt(request.getParameter("mcate_code"));
	int paging = Integer.parseInt(request.getParameter("page"));
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ShopDTO dto = null;
	
	Connection con = ConnectionProvider.getConnection();
	
	
	String html = "";
	
	String sql = "SELECT *\r\n" + 
				 "FROM (\r\n" + 
				 "    SELECT rownum as rnum, i.item_code, item_name, item_price, sale_rate, item_img \r\n" + 
				 "    FROM item i LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code\r\n" + 
				 "                LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code\r\n" + 
				 "                LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code\r\n" + 
				 "                LEFT OUTER JOIN item_sale t ON i.item_code = t.item_code\r\n" + 
				 "    WHERE m.mcate_code = ? AND l.lcate_code = ?\r\n" + 
				 ")\r\n" + 
				 "WHERE rnum BETWEEN ? AND ?";
	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mcate_code);
			pstmt.setInt(2, lcate_code);
			
			pstmt.setInt(3, paging);
			pstmt.setInt(4, ((paging/16) + 1) * 16 - 1);

			rs = pstmt.executeQuery();
					
			if (rs.next()) {
				
				do {
					
					int item_code = rs.getInt("item_code");
					String item_name = rs.getString("item_name");
					int item_price = rs.getInt("item_price");
					int sale_rate = rs.getInt("sale_rate");
					String item_img = rs.getString("item_img");		
	
					html += "							<li> " + 
							"								<div class='gdset cates'> " + 
							"									<div class='thum'> " + 
							"										<a " + 
							"											href='/AboutPet/Project/aboutPet/itemDetail.do?item_code=" + item_code + "' class='pic' data-content='PI000002700' " + 
							"											data-url='/goods/indexGoodsDetail?goodsId=PI000002700'> <img " + 
							"											class='img' src='" + item_img + "' alt='오픈팜 독 칠면조&닭고기 샘플 57g' " + 
							"											onerror='this.src='../../_images/common/img_default_thumbnail_2@2x.png''> " + 
							"										</a> ";
					if(zzim != null){						
						for(int i=0; i<zzim.size(); i++){	
							if(zzim.get(i).getItem_code() == item_code){
							    html += "<button type='button' class='bt zzim on ' " + 
										"id='btnZzim_"+item_code+"' " + 
										"data-itemcode='"+item_code+"' " + 
										"value='Y'>찜하기</button>";
								break;
							} 
							if( i == zzim.size() - 1 && zzim.get(i).getItem_code() != item_code) {								
								html += "<button type='button' class='bt zzim ' " + 
										"id='btnZzim_"+item_code+"' " + 
										"data-itemcode='"+item_code+"' " + 
										"value='N'>찜하기</button>";
							}
						}
					} else {
						html += "<button type='button' class='bt zzim ' " + 
								"id='btnZzim_"+item_code+"' " + 
								"data-itemcode='"+item_code+"' " + 
								"value='N'>찜하기</button>";
					}
					
					html += "									</div> " + 
							"									<div class='boxs'> " + 
							"										<div class='tit'> " + 
							"											<a href='/goods/indexGoodsDetail?goodsId=PI000002700' class='lk' " + 
							"												data-content='PI000002700' " + 
							"												data-url='/goods/indexGoodsDetail?goodsId=PI000002700'>"+item_name+"</a> " + 
							"										</div> " + 
							"										<a href='/goods/indexGoodsDetail?goodsId=PI000002700' class='inf' " + 
							"											data-content='PI000002700' " + 
							"											data-url='/goods/indexGoodsDetail?goodsId=PI000002700'> <span " + 
							"											class='prc'><em class='p'>"+item_price+"</em><i class='w'>원</i></span>";
																		if(sale_rate != 0){
																			html += "<span class='pct'><em class='n'>"+sale_rate+"</em><i " + 
																					"class='w'>%</i></span> "; 																		
																		}
	
					html +=	"										</a> " + 
							"									</div> " + 
							"								</div> " + 
							"							</li> ";
	
				} while (rs.next());
						
						
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally
		
		
		
%>

<%= html %>
