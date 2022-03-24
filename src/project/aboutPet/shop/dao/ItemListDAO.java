package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import project.aboutPet.shop.model.ShopDTO;

public class ItemListDAO {

	private static ItemListDAO dao = null;

	private ItemListDAO() {
	}

	public static ItemListDAO getInstance() {
		if (dao == null) {
			dao = new ItemListDAO();
		}
		return dao;
	}
	
	public int count(Connection con, int lcate_code, int mcate_code) throws SQLException {
		int cnt = 0;
		String sql = "SELECT count(*) "
				+ "FROM item i LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code "
				+ "            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code "
				+ "            LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code "
				+ "            LEFT OUTER JOIN item_sale t ON i.item_code = t.item_code " + 
				"WHERE m.mcate_code = ? AND l.lcate_code = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mcate_code);
			pstmt.setInt(2, lcate_code);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				cnt = rs.getInt("count(*)");

			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally
		
		
		
		return cnt;
	}

	public List<ShopDTO> selectItemList(Connection con, int lcate_code, int mcate_code) throws SQLException {
		String sql = "SELECT i.item_code, item_name, item_price, sale_rate, item_img, l.lcate_code, m.mcate_code, s.scate_code "
				+ "FROM item i LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code "
				+ "            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code "
				+ "            LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code "
				+ "            LEFT OUTER JOIN item_sale t ON i.item_code = t.item_code " + 
				"WHERE m.mcate_code = ? AND l.lcate_code = ? AND rownum <= 16 ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShopDTO dto = null;
		
		ArrayList<ShopDTO> list=null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mcate_code);
			pstmt.setInt(2, lcate_code);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				list = new ArrayList<ShopDTO>();
				
				do {
					dto = new ShopDTO();
					
					dto.setItem_code(rs.getInt("item_code"));
					dto.setItem_name(rs.getString("item_name"));
					dto.setItem_price(rs.getInt("item_price"));
					dto.setSale_rate(rs.getInt("sale_rate"));
					dto.setItem_img(rs.getString("item_img"));
					dto.setLcate_code(rs.getInt("lcate_code"));
					dto.setMcate_code(rs.getInt("mcate_code"));
					dto.setScate_code(rs.getInt("scate_code"));
					
					list.add(dto);		
					
				} while (rs.next());

			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return list;
	}

	
	public List<ShopDTO> selectScate(Connection con, int mcate_code) throws SQLException {
	      String sql = "SELECT *  " + 
	                 "FROM scate " + 
	                 "WHERE mcate_code = ? AND scate_name NOT LIKE '전체'";

	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      ShopDTO dto = null;
	      
	      ArrayList<ShopDTO> list=null;

	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, mcate_code);
	         
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            
	            list = new ArrayList<ShopDTO>();
	            
	            do {
	               dto = new ShopDTO();
	               
	               dto.setScate_code(rs.getInt("scate_code"));
	               dto.setMcate_code(rs.getInt("mcate_code"));
	               dto.setScate_name(rs.getString("scate_name"));
	               
	               list.add(dto);      
	               
	            } while (rs.next());

	         }
	      } finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      } // finally

	      return list;
	   }
	
	public List<ShopDTO> selectZzim(Connection con, int mem_code) throws SQLException {
        String sql = "SELECT i.item_code, m.mem_code, item_name\r\n" + 
		             "FROM item_mark a LEFT OUTER JOIN member m ON a.mem_code = m.mem_code\r\n" + 
		             "                 LEFT OUTER JOIN item i ON a.item_code = i.item_code\r\n" + 
		             "WHERE m.mem_code = ?";
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<ShopDTO> list = null;
        ShopDTO dto = null;
        
        
        try {
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, mem_code);
           
           rs = pstmt.executeQuery();
           if (rs.next()) {
              
              list = new ArrayList<ShopDTO>();
              
              do {
                 dto = new ShopDTO();
                 dto.setItem_code(rs.getInt("item_code"));
                 
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
