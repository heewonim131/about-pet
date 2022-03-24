package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

/*import net.sf.json.JSONArray;
import net.sf.json.JSONObject;*/
import project.aboutPet.shop.model.ShopDTO;


public class indexNewCategoryDAO {

	private static indexNewCategoryDAO dao = null;
	private indexNewCategoryDAO() {}
	public static indexNewCategoryDAO getInstance() {
		if (dao==null) {
			dao = new indexNewCategoryDAO();
		}
		return dao;
	}
	/*
	public List<String> selectNewCategoryItem(Connection con, int lcate_code, int mcate_code) throws SQLException {
		String sql = "SELECT i.item_code, item_name, item_img, item_price, t.sale_rate " + 
					 "FROM item i LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code " + 
					 "            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code " + 
				 	 "            LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code " + 
					 "            LEFT OUTER JOIN item_sale t ON i.item_code = t.item_code " + 
					 "WHERE  TRUNC(item_date) >= TRUNC(sysdate) - 60 AND l.lcate_code = ?";
			if (mcate_code != 0) {
				sql += "AND m.mcate_code = ?";
			}

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
    String html;
	
	ArrayList<String> htmlData=null;
	
	int count = 0;

	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, lcate_code);
		if (mcate_code != 0) {			
				pstmt.setInt(2, mcate_code);
		}
		rs = pstmt.executeQuery();
		
		if (rs.next()) {

			htmlData = new ArrayList<String>();
			
			String listHeader = "<section class=\"sect dm newgd\"> " + 
					"							<div class=\"uioptsorts newgd\"> " + 
					"								<div class=\"dx lt\"> " + 
					"									<div class=\"tot\">총 <em class=\"n\">"+count+"</em>개 상품</div> " + 
					"								</div> " + 
					"								<div class=\"dx rt\"> " + 
					"									<nav class=\"uisort\"> " + 
					"										<button type=\"button\" class=\"bt st\" value=\"SALE\">판매인기순</button> " + 
					"										<div class=\"list\"> " + 
					"											<ul class=\"menu\"> " + 
					"												<li class=\"active\" id=\"order_SALE\"><button type=\"button\" class=\"bt\" value=\"SALE\">판매인기순</button></li> " + 
					"												<li id=\"order_LOW\"><button type=\"button\" class=\"bt\" value=\"LOW\">낮은가격순</button></li> " + 
					"												<li id=\"order_HIGH\"><button type=\"button\" class=\"bt\" value=\"HIGH\">높은가격순</button></li> " + 
					"												<li id=\"order_SCORE\"><button type=\"button\" class=\"bt\" value=\"SCORE\">상품평순</button></li> " + 
					"												<li id=\"order_DATE\"><button type=\"button\" class=\"bt\" value=\"DATE\">등록일순</button></li> " + 
					"											</ul> " + 
					"										</div> " + 
					"									</nav> " + 
					"								</div> " + 
					"							</div> " + 
					"							<div class=\"gdlist\"> " + 
					"								<ul class=\"list\" id=\"cate\">";
			
			htmlData.add(listHeader);
			
			do {				
				html = "";
				int item_code = rs.getInt(1);
		        String item_name = rs.getString(2);
		        String item_img = rs.getString(3);
		        int item_price = rs.getInt(4);
		        int sale_rate = rs.getInt(5);
		        
		        html += "<li>"; 
		        html += "<div class=\"gdset defgd\">" ; 
		        html += "<div class=\"thum\">" ; 
		        html += "<a href=\"/jspPro/Project/aboutPet/itemDetail.do?item_code="+item_code+"\" class=\"pic\" data-content='GI251022896' data-url=\"/goods/indexGoodsDetail?goodsId=GI251022896\">" ; 
		        html += "<img class=\"img\" src=\""+ item_img +"\" alt=\""+item_name+"\" onerror=\"this.src='../../_images/common/img_default_thumbnail_2@2x.png'\">" ; 
		        html += "</a>" ; 
		        html += "<button type=\"button\" class=\"bt zzim \" data-content='GI251022896' data-url=\"/goods/insertWish?goodsId=GI251022896\" data-action=\"interest\" data-yn=\"N\" data-goods-id=\"GI251022896\" data-target=\"goods\">찜하기</button>" ; 
		        html += "</div>" ; 
		        html += "<div class=\"boxs\">" ; 
		        html += "<div class=\"tit\">" ; 
		        html += "<a href=\"/jspPro/Project/itemDetail.do?item_code="+item_code+"\" class=\"lk\" data-content='GI251022896' data-url=\"/goods/indexGoodsDetail?goodsId=GI251022896\" >"+item_name+"</a>" ; 
		        html += "</div>" ; 
		        html += "<a href=\"/jspPro/Project/itemDetail.do?item_code="+item_code+"\" class=\"inf\" data-content='GI251022896' data-url=\"/goods/indexGoodsDetail?goodsId=GI251022896\">" ; 
		        html += "<span class=\"prc\"><em class=\"p\">"+item_price+"</em><i class=\"w\">원</i></span>" ; 
		        if (sale_rate != 0) {
		        	html += "<span class=\"pct\"><em class=\"n\">"+sale_rate+"</em><i class=\"w\">%</i></span>" ; 					
				}
		        html += "</a>" ; 
		        html += "</div>" ; 
		        html += "</div>" ; 
		        html += "</li>";
				
		        htmlData.add(html);	
			} while (rs.next());
			
			String listFooter = "</ul> " + 
					"</div> " + 
					"						</section> " + 
					"					</section>";
			
			htmlData.add(listFooter);
			
			
		}
	} finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);
	} // finally

	return htmlData;
	}
*/
	
	public List<ShopDTO> selectNewCategoryItem(Connection con, int lcate_code, int mcate_code) throws SQLException {
		String sql = "select i.item_code, i.item_name, i.item_price, t.sale_rate, i.item_img, l.lcate_code, m.mcate_code, s.scate_code "
				+ "from item i, scate s, mcate m, lcate l, item_sale t "
				+ "where i.scate_code=s.scate_code and s.mcate_code=m.mcate_code and l.lcate_code=m.lcate_code and i.item_code=t.item_code"
				+ " and (sysdate-i.item_date)<200 and l.lcate_code=?";
		if(mcate_code>=1 && mcate_code<=45) {
			sql+= " and m.mcate_code=?";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShopDTO dto = null;
		
		ArrayList<ShopDTO> list=null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lcate_code);
			if(mcate_code>=1 && mcate_code<=45) {

				pstmt.setInt(2, mcate_code);
			}
			
			rs = pstmt.executeQuery();
			list = new ArrayList<ShopDTO>();
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
//					dto.setScate_code(rs.getInt("scate_code"));
					
					list.add(dto);		
					
				} while (rs.next());

			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return list;
	}
	
	public List<ShopDTO> selectMcate(Connection con,int lcate_code) throws SQLException {
		String sql = "select mcate_code, lcate_code, mcate_name from mcate"
				+" where lcate_code=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShopDTO dto = null;
		
		ArrayList<ShopDTO> list=null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lcate_code);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<ShopDTO>();
			if (rs.next()) {
				do {
					dto = new ShopDTO();
					dto.setMcate_code(rs.getInt("mcate_code"));
					dto.setLcate_code(rs.getInt("lcate_code"));
					dto.setMcate_name(rs.getString("mcate_name"));
					
					list.add(dto);		
					
				} while (rs.next());

			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return list;
	}
}
