package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.html.HTML;

import com.util.JdbcUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import project.aboutPet.shop.model.ShopDTO;

public class BrandListAjaxDAO {

	private static BrandListAjaxDAO dao = null;

	private BrandListAjaxDAO() {
	}

	public static BrandListAjaxDAO getInstance() {
		if (dao == null) {
			dao = new BrandListAjaxDAO();
		}
		return dao;
	}

	public ArrayList<String> brandSelect(Connection con, int br_code, int mem_code) throws SQLException {
		
		String sql = "  SELECT distinct i.item_code, item_name, item_price, sale_rate, item_img "
				+ "            FROM item i left  JOIN item_sale t ON i.item_code = t.item_code  "
				+ "             JOIN brand b on i.br_code = b.br_code "
				+ "             LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code   "
				+ "            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code   "
				+ "            LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code "
				+ "            WHERE b.br_code = ?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<String> list = null;
			try {
				pstmt = con.prepareStatement(sql);
				 pstmt.setInt(1,br_code); 
				rs = pstmt.executeQuery();
				list = new ArrayList<String>();
				if (rs.next()) {	
					do {
							String html = "";
							String item_name = rs.getString("item_name");
							String item_img = rs.getString("item_img");
							int item_code = rs.getInt("item_code");
							int item_price = rs.getInt("item_price");
							int sale_rate = rs.getInt("sale_rate");
							int opt_stock = 100;
							String stock = "";
							
							if(opt_stock == 0){
								stock = "soldouts";
							}else{
								stock ="";
							}
							
							html += "<li>" ;
							html +="<div class='gdset defgd'>";
							html +="<div class='thum'>";
							html +="<a href='/jspPro/Project/aboutPet/itemDetail.do?item_code="+item_code+"' class='pic' data-content='PI000001058' data-url='/jspPro/Project/aboutPet/itemDetail.do?item_code="+item_code+"'>";
							html +=			"<div class='"+stock+"'><em class='ts'>입고예정</em></div>";
							html +=			"<img class='img' src='"+item_img+"' alt='"+item_name+"'  >";
							html +=		"</a>";

							if (mem_code != 0) {
								sql = "SELECT i.item_code, m.mem_code, item_name " + 
									  "FROM item_mark a LEFT OUTER JOIN member m ON a.mem_code = m.mem_code " + 
									  "                 LEFT OUTER JOIN item i ON a.item_code = i.item_code " + 
									  "WHERE m.mem_code = ?";
								
								ResultSet rs2 = null;

								try {
									pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
									pstmt.setInt(1, mem_code);

									rs2 = pstmt.executeQuery();
									if (rs2.next()) {

										do {
											int i_code = rs2.getInt("item_code");
											
											if (i_code == item_code) {
												html += "<button type='button' class='bt zzim on ' " + 
														"id='btnZzim_"+item_code+"' " + 
														"data-itemcode='"+item_code+"' " + 
														"value='Y'>찜하기</button>";
												break;
											}
											
											if(rs2.isLast() && i_code != item_code) {
												html += "<button type='button' class='bt zzim ' " + 
														"id='btnZzim_"+item_code+"' " + 
														"data-itemcode='"+item_code+"' " + 
														"value='N'>찜하기</button>";
											}
											
										} while (rs2.next());

									}
								} finally {
									JdbcUtil.close(pstmt);
									JdbcUtil.close(rs2);
								} // finally
							} else {								
								html += "<button type='button' class='bt zzim ' " + 
										"id='btnZzim_"+item_code+"' " + 
										"data-itemcode='"+item_code+"' " + 
										"value='N'>찜하기</button>";
							}

							
							
							html +=	"</div>";
							html +=	"<div class='boxs'>";
							html +=		"<div class='tit'>";
							html +=			"<a href='/jspPro/Project/aboutPet/itemDetail.do?item_code="+item_code+"' class='lk' data-content='"+item_code+"' data-url='/jspPro/Project/aboutPet/itemDetail.do?item_code="+item_code+"' >"+item_name+"</a>";
							html +=		"</div>";
							html +=		"<a href='/jspPro/Project/aboutPet/itemDetail.do?item_code="+item_code+"' class='inf' data-content='"+item_code+"' data-url='/jspPro/Project/aboutPet/itemDetail.do?item_code="+item_code+"'>";
							html +=		"	<span class='prc'><em class='p'>"+item_price+"</em><i class='w'>원</i></span>";
							html +=		"	<span class='pct'><em class='n'>"+sale_rate+"</em><i class='w'>%</i></span>";
							html +=			"</a>";
							html +=		"</div>";
							html += "</div>";
						    html += "</li>";
						    
							
						    list.add(html);
						
					} while (rs.next());
				}
			} finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			} // finally
		return list;
	}

	public String listCount(Connection con, int br_code) throws SQLException {
		String sql = "SELECT count(i.item_code) count "
				+ "            FROM item i LEFT OUTER JOIN item_sale t ON i.item_code = t.item_code  "
				+ "             JOIN brand b on i.br_code = b.br_code "
				+ "            LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code   "
				+ "            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code   "
				+ "            LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code "
				+ "            WHERE b.br_code = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String count = null;
		try {
			pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1,br_code); 
			rs = pstmt.executeQuery();
			if (rs.next()) {	
			 count = ""+rs.getInt("count");
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally
	return count;
	}
	
}
