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

public class BrandListDAO {

	private static BrandListDAO dao = null;

	private BrandListDAO() {
	}

	public static BrandListDAO getInstance() {
		if (dao == null) {
			dao = new BrandListDAO();
		}
		return dao;
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
	
	public Map<String, String> selectItemNameLcate(Connection con , int br_code) throws SQLException{
		
		String sql = "SELECT distinct item_name,lcate_name "
				+ "            FROM item i LEFT OUTER JOIN item_sale t ON i.item_code = t.item_code  "
				+ "            LEFT JOIN brand b on i.br_code = b.br_code "
				+ "            LEFT JOIN ITEM_OPTION ito ON i.item_code = ito.item_code "
				+ "            LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code   "
				+ "            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code   "
				+ "            LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code "
				+ "            WHERE b.br_code = ?";
		
		Map<String, String> map = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String count = null;
		try {
			pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1,br_code); 
			rs = pstmt.executeQuery();
			map = new HashMap<String, String>();
			if (rs.next()) {	
				
				String [] name = rs.getString("item_name").split(" ");	
			 map.put("item_name",name[0] );
			 map.put("lcate_name",rs.getString("lcate_name"));
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally	
		return map;
	}

}
