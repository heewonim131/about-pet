package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import project.aboutPet.shop.model.ShopDTO;

public class ShopDAO {

	private static ShopDAO dao = null;
	private ShopDAO() {}
	public static ShopDAO getInstance() {
		if (dao==null) {
			dao = new ShopDAO();
		}
		return dao;
	}


	public List<ShopDTO> select_Stock(Connection con ,int lcate_code )  throws SQLException{
		String sql = "SELECT it.item_code, it.item_name,it.item_img ,it.item_price,it.item_url ,isa.sale_rate,io.opt_stock " + 
				 "FROM ITEM it LEFT OUTER JOIN ITEM_OPTION io ON it.ITEM_CODE = io.ITEM_CODE " + 
				 "             LEFT OUTER JOIN ITEM_SALE isa  ON it.ITEM_CODE = isa.item_code " + 
				 "             LEFT OUTER JOIN scate s ON it.scate_code = s.scate_code " + 
				 "			   LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code " + 
				 "			   LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code " + 
				 "WHERE io.OPT_STOCK <= 50 AND l.lcate_code = ?";

		ArrayList<ShopDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lcate_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<ShopDTO>();
				ShopDTO itemdto = null;
				do {

					itemdto = new ShopDTO();
					
					itemdto .setItem_code(rs.getInt("item_code"));
					itemdto.setItem_name(rs.getString("item_name"));
					itemdto.setItem_img(rs.getString("item_img"));
					itemdto.setItem_price(rs.getInt("item_price"));
					itemdto.setItem_url(rs.getString("item_url"));
					itemdto.setSale_rate(rs.getInt("sale_rate"));
					itemdto.setOpt_stock(rs.getInt("opt_stock"));

					list.add(itemdto);
				} while (rs.next());
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return list;

	}



	public List<ShopDTO> selectShelfLife(Connection con ,int lcate_code)  throws SQLException{
		String sql = "SELECT distinct t.*  " + 
				 "FROM ( " + 
				 "      SELECT it.item_code, item_name,item_img ,item_price+EXTRA_PRICE as price,item_url ,nvl(isa.sale_rate,0) as rate,st.exp_date  " + 
				 "      FROM ITEM it LEFT OUTER JOIN ITEM_OPTION io ON it.ITEM_CODE = io.ITEM_CODE " + 
				 "	    			 LEFT OUTER JOIN ITEM_SALE isa  ON it.ITEM_CODE = isa.item_code " + 
				 "	  				 LEFT OUTER JOIN STOCK st  ON io.OPT_CODE = st.OPT_code " + 
				 "     				 LEFT OUTER JOIN scate s ON it.scate_code = s.scate_code " + 
				 "     				 LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code " + 
				 "     				 LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code " + 
				 "	    WHERE exp_date BETWEEN sysdate+1 AND sysdate+60 AND l.lcate_code = ? " + 
				 "      ORDER BY exp_date " + 
				 "      ) t " + 
				 "WHERE ROWNUM<=10";

		ArrayList<ShopDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lcate_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<ShopDTO>();
				ShopDTO itemdto = null;
				do {

					itemdto = new ShopDTO();
					itemdto.setItem_code(rs.getInt("item_code"));
					itemdto.setItem_name(rs.getString("item_name"));
					itemdto.setItem_img(rs.getString("item_img"));
					itemdto.setItem_price(rs.getInt("price"));
					itemdto.setItem_url(rs.getString("item_url"));
					itemdto.setSale_rate(rs.getInt("rate"));
					itemdto.setExp_date(rs.getDate("exp_date"));

					list.add(itemdto);
				} while (rs.next());
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return list;

	}
	public List<ShopDTO> selectShelfLife(Connection con, String temp) {
	    String sql=" select item_code,item_name,item_img,item_content,scate_code,item_price "
	            + " item_date,item_url,itag,item_filter "
	            + " from item "
	            + " where item_code in (select item_code from rec_item where rec_type='MD추천상품') ";
	      
	    	ArrayList<ShopDTO> list = null; 
		    PreparedStatement pstmt = null; 
		    ResultSet rs= null;
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         
	         
	         if(rs.next()) {
	            list=new ArrayList<ShopDTO>();
	            ShopDTO dto=null;
	            do {
	               dto =  new ShopDTO();
	               
	               dto.setItem_code(rs.getInt("item_code"));
	               dto.setItem_name(rs.getString("item_name"));
	               dto.setItem_img(rs.getString("item_img"));
	               dto.setItem_content(rs.getString("item_content"));
	               dto.setScate_code(rs.getInt("scate_code"));
	               dto.setItem_price(rs.getInt("item_price"));
	               dto.setItem_date(rs.getDate("item_date"));
	               dto.setItem_url(rs.getString("item_url"));
	               dto.setItag(rs.getString("itag"));
	               dto.setItem_filter(rs.getString("item_filter"));
	               
	               
	               list.add(dto);
	            } while ( rs.next() );
	         } // 
	      } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
	               
	      } // finally

	      return list;

	}

	
	
	  
	  public List<ShopDTO> timeDeal(Connection con,int lcate_code) throws SQLException{
		  String sql = " SELECT it.item_code,item_name,item_price,item_img,sale_rate " + 
					 "FROM item it LEFT OUTER JOIN item_sale s ON it.item_code = s.item_code " + 
					 "             LEFT OUTER JOIN scate s ON it.scate_code = s.scate_code " + 
					 "             LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code " + 
					 "             LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code " + 
					 "WHERE l.lcate_code = ? ";
		      
		        ArrayList<ShopDTO> list = null; 
			    PreparedStatement pstmt = null; 
			    ResultSet rs= null;
			   
		      
		      try {
		         pstmt=con.prepareStatement(sql);
		         pstmt.setInt(1, lcate_code);
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
				// TODO: handle exception
			} finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);  
		      } // finally
		  
		  return list; 
	  }
	  
	public JSONObject getBestGoodsList(Connection con) {
		
		String sql = " SELECT distinct name, COUNT(t.code)OVER(partition by t.name) as panmai ,item_img ,t.code,item_price,sale_rate "
				+ " FROM( "
				+ " SELECT it.item_code as code ,item_name as name ,mem.mem_code as mcode , item_img,item_price,sale_rate "
				+ " FROM item it  JOIN item_option ito ON it.item_code = ito.item_code "
				+ "      JOIN STOCK st ON ito.opt_code = st.opt_code "
				+ "       JOIN ORDER_DETAIL ord ON st.st_code = ord.st_code "
				+ "       JOIN ORDER_LIST orl ON orl.ord_code = ord.ord_code "
				+ "        JOIN MEMBER mem ON orl.mem_code = mem.mem_code "
				+ "        JOIN item_sale its on it.item_code = its.item_code "
				+ "     )t ";
		
		  ArrayList<ShopDTO> list = null; 
		    PreparedStatement pstmt = null; 
		    ResultSet rs= null;
		    JSONObject jsonData = new JSONObject();
		    JSONArray  jsonArray = new JSONArray();
	      
	      try {
	         pstmt=con.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         JSONObject jsonSaveData = new JSONObject();
	        
	         if(rs.next()) {
	            list=new ArrayList<ShopDTO>();
	            ShopDTO dto=null;
	            do {
					/*
					 * dto = new ShopDTO(); dto.setItem_code(rs.getInt("code"));
					 * dto.setCount(rs.getInt("panmai")); dto.setItem_name(rs.getString("name"));
					 * dto.setItem_img(rs.getString("item_img"));
					 * dto.setItem_price(rs.getInt("item_price"));
					 * dto.setSale_rate(rs.getInt("sale_rate")); list.add(dto);
					 */
	               int item_code = rs.getInt("code");
	               String item_name = rs.getString("name");
	               String item_img = rs.getString("item_img");
	               int item_price = rs.getInt("item_price");
	               int sale_rate = rs.getInt("sale_rate");
	               
	               jsonSaveData.put("item_code", item_code);
	               jsonSaveData.put("item_name", item_name);
	               jsonSaveData.put("item_img", item_img);
	               jsonSaveData.put("item_price", item_price);
	               jsonSaveData.put("sale_rate", sale_rate);
	               jsonArray.add(jsonData);
	               
	            } while ( rs.next() );
	            jsonData.put("jsonArray", jsonArray);
	         } // 
	      }catch (SQLException e) {
			// TODO: handle exception
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);  
	      } // finally
	  
	  return jsonData; 
	}
	


	// MD
	   public List<ShopDTO> selectMDItem(Connection con, String type ,int lcate_code) throws SQLException {
		   String sql = "SELECT i.item_code,item_name,item_img, item_price, rec_cmt, sale_rate " + 
					 "FROM item i LEFT OUTER JOIN rec_item r ON i.item_code = r.item_code " +
					 "			  LEFT OUTER JOIN item_sale s ON i.item_code = s.item_code " +
					 "			  LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code " + 
					 "            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code " + 
					 "            LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code " +
					 "WHERE rec_type = ? AND l.lcate_code = ? ";

	      ArrayList<ShopDTO> list = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, type);
	         pstmt.setInt(2, lcate_code);
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            list = new ArrayList<ShopDTO>();
	            ShopDTO dto = null;
	            do {
	               dto = new ShopDTO();

	               dto.setItem_code(rs.getInt("item_code"));
	               dto.setItem_name(rs.getString("item_name"));
	               dto.setItem_img(rs.getString("item_img"));
	               dto.setItem_price(rs.getInt("item_price"));
	               dto.setRec_cmt(rs.getString("rec_cmt"));
	               dto.setSale_rate(rs.getInt("sale_rate"));

	               list.add(dto);
	            } while (rs.next());
	         } //
	      } finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      } // finally

	      return list;
	   }


	   // 카테고리
	   public List<ShopDTO> selectCategory(Connection con,int lcate_code ) throws SQLException {
		   String sql = "SELECT * " + 
					 "FROM mcate " + 
					 "WHERE lcate_code = ?";

	      ArrayList<ShopDTO> list = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      

	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, lcate_code);
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            list = new ArrayList<ShopDTO>();
	            ShopDTO dto = null;
	            do {
	               dto = new ShopDTO();

	               dto.setMcate_code(rs.getInt("mcate_code"));
	               dto.setLcate_code(rs.getInt("lcate_code"));
	               dto.setMcate_name(rs.getString("mcate_name"));

	               list.add(dto);
	            } while (rs.next());
	         } //
	      } finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      } // finally

	      return list;
	   }



	      // 회원정보 가져오기
	      public ShopDTO selectMemberInfo(Connection con, int mem_code) throws SQLException {
	         String sql = "SELECT m.mem_code, mem_name, pet_cate, pet_name " + 
	                   "FROM member m JOIN pet p ON m.mem_code = p.mem_code  " + 
	                   "              JOIN pet_type t ON p.pt_code = t.pt_code  " + 
	                   "WHERE m.mem_code = ? AND rownum = 1";

	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         ShopDTO dto = null;

	         try {
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, mem_code);

	            rs = pstmt.executeQuery();
	            if (rs.next()) {

	               dto = new ShopDTO();

	               dto.setMem_code(rs.getInt("mem_code"));
	               dto.setMem_name(rs.getString("mem_name"));
	               dto.setPet_cate(rs.getString("pet_cate"));
	               dto.setPet_name(rs.getString("pet_name"));
	            }
	         } finally {
	            JdbcUtil.close(pstmt);
	            JdbcUtil.close(rs);
	         } // finally

	         return dto;
	      }

	      // 맞춤상품 가져오기
	      public List<ShopDTO> selectRecommedItem(Connection con, int mem_code) throws SQLException {

	    	  String sql = "SELECT i.item_code, item_name, item_img , item_price, itag, sale_rate " + 
	                   "FROM item i LEFT JOIN item_sale s ON i.item_code = s.item_code " + 
	                   "WHERE itag LIKE  ( " + 
	                   "    SELECT '%' || pet_cate || '%' " + 
	                   "    FROM member m  JOIN pet p ON m.mem_code = p.mem_code " + 
	                   "                   JOIN pet_type t ON p.pt_code = t.pt_code " + 
	                   "    WHERE m.mem_code = ? AND rownum = 1 " + 
	                   "    )";

	         ArrayList<ShopDTO> list = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         
	         try {

	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, mem_code);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	               list = new ArrayList<ShopDTO>();
	               ShopDTO dto = null;
	               do {
	                  dto = new ShopDTO();

	                  dto.setItem_code(rs.getInt("item_code"));
	                  dto.setItem_name(rs.getString("item_name"));
	                  dto.setItem_img(rs.getString("item_img"));
	                  dto.setItem_price(rs.getInt("item_price"));
	                  dto.setItag(rs.getString("itag"));
	                  dto.setSale_rate(rs.getInt("sale_rate"));

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
