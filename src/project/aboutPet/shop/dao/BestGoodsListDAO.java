package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BestGoodsListDAO {

	private static BestGoodsListDAO dao = null;

	private BestGoodsListDAO() {
	}

	public static BestGoodsListDAO getInstance() {
		if (dao == null) {
			dao = new BestGoodsListDAO();
		}
		return dao;
	}
	
	public JSONObject bestGoodsList(Connection con ) throws SQLException {
		String sql = "SELECT distinct t.name, COUNT(t.code)OVER(partition by t.name) as panmai ,item_img , t.code, item_price, sale_rate " + 
				   "FROM( " + 
				   "SELECT it.item_code as code ,item_name as name ,mem.mem_code as mcode , item_img,item_price,sale_rate " + 
				   "FROM item it JOIN item_option ito ON it.item_code = ito.item_code " + 
				   "     JOIN STOCK st ON ito.opt_code = st.opt_code " + 
				   "     JOIN ORDER_DETAIL ord ON st.st_code = ord.st_code " + 
				   "     JOIN ORDER_LIST orl ON orl.ord_code = ord.ord_code " + 
				   "     JOIN MEMBER mem ON orl.mem_code = mem.mem_code " + 
				   "     JOIN item_sale its on it.item_code = its.item_code " + 
				   "     LEFT OUTER JOIN scate s ON it.scate_code = s.scate_code " + 
				   "     LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code " + 
				   "     LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code " + 
				   "     WHERE l.lcate_code = 1 " + 
				   "     ) t ";
			
		    PreparedStatement pstmt = null; 
		    ResultSet rs= null;
		    JSONObject jsonData = new JSONObject();
		    JSONArray  jsonArray = new JSONArray();
		  
		  try {
		     pstmt=con.prepareStatement(sql);
		     rs=pstmt.executeQuery();
		    
		     if(rs.next()) {
		        do {
		           int item_code = rs.getInt(4);
		           String item_name = rs.getString(1);
		           String item_img = rs.getString(3);
		           int item_price = rs.getInt(5);
		           int sale_rate = rs.getInt(6);
		    	   JSONObject jsonSaveData = new JSONObject();
		           
		           jsonSaveData.put("item_code", item_code);
		           jsonSaveData.put("item_name", item_name);
		           jsonSaveData.put("item_img", item_img);
		           jsonSaveData.put("item_price", item_price);
		           jsonSaveData.put("sale_rate", sale_rate);
		           jsonArray.add(jsonSaveData);
		           
		        } while ( rs.next() );
		        jsonData.put("jsonArray", jsonArray);
		     } // 
		  }catch (SQLException e) {
			// TODO: handle exception
		}  finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);  
		  } // finally
		  return jsonData;
	}

}
