<%@page import="java.util.List"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.aboutPet.shop.model.ShopDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ArrayList<ShopDTO> zzim = (ArrayList<ShopDTO>)request.getAttribute("zzim");

	int scate_code = request.getParameter("dispClsfNo") == null || request.getParameter("dispClsfNo").equals("") ? 0 : Integer.parseInt(request.getParameter("dispClsfNo"));
	int mcate_code = request.getParameter("dispClsfNo2") == null || request.getParameter("dispClsfNo2").equals("") ? 1 : Integer.parseInt(request.getParameter("dispClsfNo2"));

	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ShopDTO dto = null;
	
	Connection con = ConnectionProvider.getConnection();
	
	
	String html = "";
	
	// 상품 개수 구하기
	String sql = "SELECT count(*) " + 
				 "FROM item i LEFT OUTER JOIN item_sale s ON i.item_code = s.item_code   " + 
				 "			  LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code  " + 
				 "            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code  " + 
				 "            LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code   " + 
				 "WHERE m.mcate_code = ?";
	if(scate_code != 0)
		sql += "AND s.scate_code = ? ";
	
	
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, mcate_code);
		
		if(scate_code != 0)
			pstmt.setInt(2, scate_code);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			
		int count = rs.getInt("count(*)");
					
	
		// 상품 목록 쿼리
		sql = "SELECT i.item_code, item_name, item_price, sale_rate, item_img, l.lcate_code, m.mcate_code, s.scate_code "
				+ "FROM item i LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code "
				+ "            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code "
				+ "            LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code "
				+ "            LEFT OUTER JOIN item_sale t ON i.item_code = t.item_code " + 
				"WHERE m.mcate_code = ? ";
		if(scate_code != 0)
			sql += "AND s.scate_code = ? ";
	
		
		ArrayList<ShopDTO> list=null;
		
		
	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mcate_code);
			
			if(scate_code != 0)
				pstmt.setInt(2, scate_code);
			rs = pstmt.executeQuery();
			
			
			html =  "<section class='sect ct cates'> " + 
					"			<div class='sticky_filter'> " + 
					"				<div class='inr'> " + 
					"					<div class='uioptsorts cates'> " + 
					"						<div class='dx lt'> " + 
					"							<div class='tot'> " + 
					"								총 <em class='n'>" + count +"</em>개 상품 " + 
					"							</div> " + 
					"						</div> " + 
					"						<div class='dx rt'> " + 
					"						</div> " + 
					"					</div> " + 
					"				</div> " + 
					"			</div> " + 
					"			<ul class='list' id='pagingGoods'>";
					
			if (rs.next()) {
				
				list = new ArrayList<ShopDTO>();
				
				do {
					dto = new ShopDTO();
					
					int item_code = rs.getInt("item_code");
					String item_name = rs.getString("item_name");
					int item_price = rs.getInt("item_price");
					int sale_rate = rs.getInt("sale_rate");
					String item_img = rs.getString("item_img");
					int lcate_code = rs.getInt("lcate_code");
					int m_code = rs.getInt("mcate_code");
					int s_code = rs.getInt("scate_code");		
	
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
				
				
				html +=	"</ul> " +
						"</section>";
						
						
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally
		}

	} finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);
	} // finally

%>

<%= html %>