package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.Date;
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

public class GoodCommentListAjaxDAO {

	private static GoodCommentListAjaxDAO dao = null;

	private GoodCommentListAjaxDAO() {
	}

	public static GoodCommentListAjaxDAO getInstance() {
		if (dao == null) {
			dao = new GoodCommentListAjaxDAO();
		}
		return dao;
	}

	public ArrayList<String> getComment(Connection con, int item_code) throws SQLException {
		
		String sql = "   SELECT RV_CONTENT ,RV_DATE ,RV_STAR,MEM_ID "
				+ "                 FROM REVIEW rew JOIN  ORDER_DETAIL ord ON rew.odd_code = ord.odd_code "
				+ "                 JOIN STOCK stock ON ord.st_code = stock.st_code "
				+ "                 JOIN ITEM_OPTION ito ON ito.opt_code = stock.opt_code "
				+ "                 JOIN item it ON it.item_code = ito.item_code "
				+ "                 JOIN ORDER_LIST orl ON ord.ord_code = orl.ord_code "
				+ "                 JOIN MEMBER mb ON mb.mem_code = orl.MEM_CODE "
				+ "                 WHERE it.item_code = ? "
				+ "				order by RV_DATE desc ";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<String> list = null;
			try {
				pstmt = con.prepareStatement(sql);
				 pstmt.setInt(1,item_code); 
				rs = pstmt.executeQuery();
				list = new ArrayList<String>();
				if (rs.next()) {	
					do {
							String html = "";
							String rv_content = rs.getString("RV_CONTENT");
							Date rv_date = rs.getDate("rv_date");
							double rv_star = rs.getInt("rv_star");
							String mem_id = rs.getString("mem_id");
							
							String star_date = ""+rv_star;
							star_date = star_date.replace('.', '_');
							
							
							
							
						html +=	"<li>";
						html +=	"<div class='box' name='estmDataArea' data-goods-id='"+item_code+"' data-goods-estm-no='197837' data-ord-no='C202107160071082' data-ord-dtl-seq='3' >";
						html +=	"<div class='rhdt'>";
						html +=		"<div class='tinfo'>";
						html +=		"		<span class='pic'><img src='https://aboutpet.co.kr/_images/common/img-default-profile@2x.png' alt='사진' class='img' onerror='this.src='../../_images/common/img-default-profile@2x.png''></span>";
						html +=		"			<div class='def'>";
						html +=				"<em class='dd ids'>"+mem_id+"</em>";
						html += 	"		<em class='dd date'>"+rv_date+"</em>";
						html +=     "					<nav class='uidropmu dmenu'>";
						html += 	"<button type='button' class='bt st gb'>메뉴열기</button>";
						html += 						"<div class='list'>";
						html += 							"<ul class='menu'>";
						html += 								"<li><button type='button' class='bt' onclick='goodsComment.commentReportPop(this)'>신고</button></li>";
						html += 							"</ul>";
						html += "</div>";
						html += "					</nav>";
						html += "</div>";
						html += "</div>";	
						html += "<div class='hpset'>";
						html += "<em class='htxt'>도움이돼요</em>";
						html += "<button type='button' onclick='goodsComment.likeComment(this)' class='bt hlp  '>";
						html += "<i class='n'>0</i><b class='t'>도움</b>";
						html += "</button>";
						html += "</div>";
						html += "</div>";
						html += "<div class='rcdt'>";
						html += "<div class='stpnt starpoint'>";
						html += "<span class='stars sm p_"+star_date+"'></span>";
						html += "</div>";
						html += "			<div class='opts'>";
						html += "</div>";
						html += "<div class='msgs'>";
						html += rv_content+" </div>";
						html += "									<div class='addpic'>";
						html += "<ul class='pics'>";
						html += "</ul>";
						html += "									</div>";
						html += "								</div>";
						html += "							</div>";
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

}
