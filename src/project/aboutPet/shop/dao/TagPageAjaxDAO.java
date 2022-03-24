package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.util.JdbcUtil;

import net.sf.json.JSONObject;
import project.aboutPet.shop.model.ShopDTO;

public class TagPageAjaxDAO {

	private static TagPageAjaxDAO dao = null;
	private TagPageAjaxDAO() {}
	public static TagPageAjaxDAO getInstance() {
		if (dao==null) {
			dao = new TagPageAjaxDAO();
		}
		return dao;
	}
	public List<ShopDTO> selectTagList(Connection con,String tagName) {
		ShopDTO dto = null;
		String sql = " SELECT i.item_code, i.item_name , i.item_price ,its.sale_rate,item_img "
				+ "             FROM item i LEFT JOIN item_sale its ON i.item_code = its.item_code  "
				+ "             WHERE i.itag LIKE " + "'%"+tagName+"%'" ;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShopDTO> list = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<ShopDTO>();
				
				do {
					dto = new ShopDTO();
					dto.setItem_code(rs.getInt("item_code"));
					dto.setItem_name(rs.getString("item_name"));
					dto.setItem_img(rs.getString("item_img"));
					dto.setItem_price(rs.getInt("item_price"));
					dto.setSale_rate(rs.getInt("sale_rate"));
					
					list.add(dto);
					
				} while (rs.next());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);    
		}	
		return list;
	}


	
	
	
	public String countList(Connection con,String tagName) throws SQLException{
		String sql = "SELECT count(i.item_code) count "
				+ "             FROM item i LEFT JOIN item_sale its ON i.item_code = its.item_code  "
				+ "             WHERE i.itag LIKE "+ "'%"+tagName+"%'" ;
		
		String count ="";
	    PreparedStatement pstmt = null; 
	    ResultSet rs= null;
      
      try {
         pstmt=con.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            count = rs.getString("count");
         } // 
      }catch (SQLException e) {
    	  e.printStackTrace();
	} finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);  
      } // finally
		
		return count;
	}


	

}
