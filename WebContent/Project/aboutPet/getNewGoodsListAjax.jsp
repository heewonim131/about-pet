<%@page import="com.util.JdbcUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.aboutPet.shop.model.ShopDTO"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int mcate_code = Integer.parseInt(request.getParameter("mcate"));

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select i.item_code, i.item_name, i.item_price, t.sale_rate, i.item_img, l.lcate_code, m.mcate_code, s.scate_code "
			+ "from item i, scate s, mcate m, lcate l, item_sale t "
			+ "where i.scate_code=s.scate_code and s.mcate_code=m.mcate_code and l.lcate_code=m.lcate_code and i.item_code=t.item_code"
			+ " and (sysdate-i.item_date)<200";
			//+ " and l.lcate_code=?";


	if(mcate_code>=1 && mcate_code<=45) {
		sql+= " and m.mcate_code=?";
	}
	
	
	ArrayList<ShopDTO> list=new ArrayList<ShopDTO>();
	
	try{
	   conn =  ConnectionProvider.getConnection();
	   pstmt = conn.prepareStatement(sql);
	   /*pstmt.setInt(1, lcate_code);
	   pstmt.setInt(1, mcate_code);*/
	   if(mcate_code>=1 && mcate_code<=45)
	   	pstmt.setInt(1, mcate_code);
	   rs =  pstmt.executeQuery();
	   
	   ShopDTO dto = null;
		
	   
	   
	   rs = pstmt.executeQuery();
		if (rs.next()) {
			
			
			do {
				dto = new ShopDTO();
				dto.setItem_code(rs.getInt("item_code"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_img(rs.getString("item_img"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setSale_rate(rs.getInt("sale_rate"));
				dto.setLcate_code(rs.getInt("lcate_code"));
				dto.setMcate_code(rs.getInt("mcate_code"));
//				dto.setScate_code(rs.getInt("scate_code"));
				
				list.add(dto);		
				
			} while (rs.next());

		}
	} finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);
		JdbcUtil.close(conn);
	}
	int newCategoryLength=list.size();
	
	
	/*String htmlSource="";
	htmlSource+="<section class=\"sect dm newgd\"><div class=\"uioptsorts newgd\">	<div class=\"dx lt\">		<div class=\"tot\"> 총 <em class=\"n\">";
	htmlSource+=newCategoryLength;
	htmlSource+="";*/
	
	System.out.println(mcate_code);
%>

<section class="sect dm newgd">
	<div class="uioptsorts newgd">
		<div class="dx lt">
			<div class="tot">
				총 <em class="n"><%=newCategoryLength %></em>개 상품
			</div>
		</div>
		<div class="dx rt">
			<nav class="uisort">
				<button type="button" class="bt st" value="SALE">판매인기순</button>
				<div class="list">
					<ul class="menu">
						<li class="active" id="order_SALE"><button type="button"
								class="bt" value="SALE">판매인기순</button></li>
						<li id="order_LOW"><button type="button" class="bt"
								value="LOW">낮은가격순</button></li>
						<li id="order_HIGH"><button type="button" class="bt"
								value="HIGH">높은가격순</button></li>
						<li id="order_SCORE"><button type="button" class="bt"
								value="SCORE">상품평순</button></li>
						<li id="order_DATE"><button type="button" class="bt"
								value="DATE">등록일순</button></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="gdlist">
		<ul class="list" id="cate">
			<c:forEach items="<%=list %>" var="dto">
				<li>
					<div class="gdset defgd">
						<div class="thum">
							<a
								href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto.item_code}"
								class="pic" data-content='GI251022896'
								data-url="/goods/indexGoodsDetail?goodsId=GI251022896"> <img
								class="img" src="${dto.item_img }" alt="${dto.item_name }"
								onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
							</a>
							
												<c:set var="doneLoop" value="false"></c:set>									
												<c:if test="${ zzim ne null }">
														<c:forEach items="${ zzim }" var="zzim" varStatus="status">
														<c:if test="${ not doneLoop }">
															<c:if test="${ zzim.item_code eq dto.item_code }">
																<button type="button" class="bt zzim on"
																id="btnZzim_${ dto.item_code }"
																data-itemcode="${ dto.item_code }"
																value="Y">찜하기</button>
																<c:set var="doneLoop" value="true"></c:set>
															</c:if>
															<c:if test="${ status.last }">
																<c:if test="${ status.current.item_code ne dto.item_code }">
																	<button type="button" class="bt zzim "
																	id="btnZzim_${ dto.item_code }"
																	data-itemcode="${ dto.item_code }"
																	value="N" >찜하기</button>
																<c:set var="doneLoop" value="true"></c:set>
																</c:if>
															</c:if>
														</c:if>
														</c:forEach>	
												</c:if>
												<c:if test="${ zzim eq null }">
													<button type="button" class="bt zzim "
													id="btnZzim_${ dto.item_code }"
													data-itemcode="${ dto.item_code }"
													value="N">찜하기</button>
												</c:if>
							
								
						</div>
						<div class="boxs">
							<div class="tit">
								<a
									href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
									class="lk" data-content='GI251022896'
									data-url="/goods/indexGoodsDetail?goodsId=GI251022896">${dto.item_name }</a>
							</div>
							<a
								href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
								class="inf" data-content='GI251022896'
								data-url="/goods/indexGoodsDetail?goodsId=GI251022896"> <span
								class="prc"><em class="p">${dto.item_price }</em><i
									class="w">원</i></span> <span class="pct"><em class="n">${dto.sale_rate }</em><i
									class="w">%</i></span>
							</a>
						</div>
					</div>
				</li>
			</c:forEach>

		</ul>
	</div>
</section>