package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.util.JdbcUtil;

import project.aboutPet.shop.model.ShopDTO;

public class ItemDetailDAO {

	private static ItemDetailDAO dao = null;
	private ItemDetailDAO() {}
	public static ItemDetailDAO getInstance() {
		if (dao==null) {
			dao = new ItemDetailDAO();
		}
		return dao;
	}
	public ShopDTO selectItem(Connection con, int item_code) {
		ShopDTO dto = null;
		String sql = " SELECT item_name,item_img,item_price,it.br_code,item_content,nvl(sale_rate,0) as sale_rate,itag,br_name,item_fee,free_fee,scate_name,mcate_name,lcate_name "+
				" FROM item it LEFT OUTER JOIN ITEM_SALE isa ON it.ITEM_CODE = isa.item_code "+
	            " LEFT OUTER JOIN scate s ON it.scate_code = s.scate_code "+
	            " LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code "+
	            " LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code "+
	            " LEFT OUTER JOIN BRAND b ON b.br_code = it.br_code "+ 
	            " LEFT OUTER JOIN COMPANY c ON it.cpn_code = c.cpn_code "+
	            " WHERE it.item_code = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,item_code );
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new ShopDTO();
				
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_img(rs.getString("item_img"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setItem_content(rs.getString("item_content"));
				dto.setSale_rate(rs.getInt("sale_rate"));
				dto.setItag(rs.getString("itag"));
				dto.setBr_name(rs.getString("br_name"));
				dto.setBr_code(rs.getInt("br_code"));
				dto.setLcate_name(rs.getString("lcate_name"));
				dto.setMcate_name(rs.getString("mcate_name"));
				dto.setScate_name(rs.getString("scate_name"));
				dto.setItem_fee(rs.getInt("item_fee"));
				dto.setFree_fee(rs.getInt("free_fee"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);    
		}
		
		return dto;
	}


	
	public List<ShopDTO> selectCompareItem(Connection con ,int item_code) {
		
		String sql = " SELECT  it.item_code,item_name,item_price,item_img ,sale_rate "
				+ " FROM item it left JOIN SCATE s ON it.scate_code = s.scate_code "
				+ "            left JOIN MCATE m on s.mcate_code = m.mcate_code "
				+ "            left JOIN ITEM_SALE  its ON it.item_code = its.item_code "
				+ " where m.mcate_code = (select  m.mcate_code from item it  left JOIN SCATE s ON it.scate_code = s.scate_code "
				+ "            left JOIN MCATE m on s.mcate_code = m.mcate_code "
				+ "            where it.item_code = ? ) AND rownum <= 10 ";
		 	ArrayList<ShopDTO> list = null; 
		    PreparedStatement pstmt = null; 
		    ResultSet rs= null;
	      
	      try {
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1,item_code );
	         rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	            list=new ArrayList<ShopDTO>();
	            ShopDTO dto=null;
	            do {
	               dto =  new ShopDTO();
	               dto.setItem_code(rs.getInt("item_code"));
	               dto.setItem_name(rs.getString("item_name"));
	               dto.setItem_img(rs.getString("item_img"));
	               dto.setItem_price(rs.getInt("item_price"));
	               dto.setSale_rate(rs.getInt("sale_rate"));
	               list.add(dto);
	            } while ( rs.next() );
	         } // 
	      }catch (SQLException e) {
	    	  e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);  
	      } // finally
	  
	  return list; 
	}
	
	
	
	public String countPage(Connection con,int item_code) throws SQLException{
		String sql = "SELECT COUNT(RV_CONTENT )  count "
				+ "                 FROM REVIEW rew JOIN  ORDER_DETAIL ord ON rew.odd_code = ord.odd_code "
				+ "                 JOIN STOCK stock ON ord.st_code = stock.st_code "
				+ "                 JOIN ITEM_OPTION ito ON ito.opt_code = stock.opt_code "
				+ "                 JOIN item it ON it.item_code = ito.item_code "
				+ "                 JOIN ORDER_LIST orl ON ord.ord_code = orl.ord_code "
				+ "                 JOIN MEMBER mb ON mb.mem_code = orl.MEM_CODE "
				+ "                 WHERE it.item_code = ?";
		
		String count ="";
	    PreparedStatement pstmt = null; 
	    ResultSet rs= null;
      
      try {
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1,item_code );
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
	public Map<Integer, Double> countStar(Connection con, int item_code) {
		// TODO Auto-generated method stub
		
		String sql = "SELECT t.rv_star as star, (t.svote / t.total) as pstar "
				+ "FROM( "
				+ "    SELECT i.item_code, rv_star, count(rv_star) as svote, "
				+ "        (SELECT count(*) "
				+ "        FROM item i,item_option o,stock s,order_detail d, review r "
				+ "        WHERE i.item_code=o.item_code and s.opt_code=o.item_code and d.st_code=s.st_code and r.odd_code=d.odd_code and i.item_code=? "
				+ "        GROUP BY i.item_code) as total   "
				+ "    FROM item i,item_option o,stock s,order_detail d, review r "
				+ "    WHERE i.item_code=o.item_code and s.opt_code=o.item_code and d.st_code=s.st_code and r.odd_code=d.odd_code and i.item_code=? "
				+ "    GROUP BY i.item_code, rv_star "
				+ ") t "
				+ "ORDER BY rv_star DESC";
		
		Map<Integer, Double> map =null;
	    PreparedStatement pstmt = null; 
	    ResultSet rs= null;
      
      try {
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1,item_code );
         pstmt.setInt(2,item_code );
         rs=pstmt.executeQuery();
         
         map = new HashedMap();
         if(rs.next()) {
           do {
        	   int star = rs.getInt("star");
        	   double pstar = rs.getDouble("pstar");
        	   
        	   map.put(star, pstar);
			
		} while (rs.next());
         } // 
      }catch (SQLException e) {
    	  e.printStackTrace();
	} finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);  
      } // finally
		return map;
	}


	  public ShopDTO selectRequiredInfo(Connection con, int item_code) throws SQLException {
	      String sql = "select i.item_name, r.legal,r.country, r.company, r.as_contact "
	            + "from required_info r, item i where r.item_code=i.item_code and i.item_code=?";

	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      ShopDTO dto = null;
	      try {
	         pstmt = con.prepareStatement(sql);

	         pstmt.setInt(1, item_code);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {

	            dto = new ShopDTO();

	            dto.setItem_name(rs.getString("item_name"));
	            dto.setLegal(rs.getString("legal"));
	            dto.setCountry(rs.getString("country"));
	            dto.setCompany(rs.getString("company"));
	            dto.setAs_contact(rs.getString("as_contact"));
	         }
	      } finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      } // finally
	      return dto;

	   }

	   // 별점
	   public ShopDTO selectItemStar(Connection con, int item_code) throws SQLException {
	      String sql = "select i.item_code, avg(r.rv_star) rv_star, count(*) c_vote " + 
	            "from item i,item_option o,stock s,order_detail d, review r " + 
	            "where i.item_code=o.item_code and s.opt_code=o.item_code and d.st_code=s.st_code and r.odd_code=d.odd_code and i.item_code=? " + 
	            "group by i.item_code";
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      ShopDTO dto = null;

	      try {
	         pstmt = con.prepareStatement(sql);

	         pstmt.setInt(1, item_code);
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            dto = new ShopDTO();

	            dto.setRv_star(rs.getDouble("rv_star") != 0 ? Math.floor(rs.getDouble("rv_star")*10)/10 : 0);
	            dto.setC_vote(rs.getInt("c_vote"));
	            
	         }
	      } finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      } // finally

	      return dto;
	   }
	public void insertItemView(Connection con, int item_code, int mem_code) throws SQLException, ParseException {
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO item_view (iv_code, item_code, mem_code, vi_date) VALUES ( seq_item_view.nextval, ?, ?, sysdate) ";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item_code);
			pstmt.setInt(2, mem_code);
			
			pstmt.executeUpdate();
			
			con.commit();		
			
		} finally {
			JdbcUtil.close(pstmt);
		}
		
	}

}
