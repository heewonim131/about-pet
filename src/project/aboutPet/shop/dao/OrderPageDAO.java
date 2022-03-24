package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.JdbcUtil;

import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.shop.model.OrderDTO;

public class OrderPageDAO {

	
	private static OrderPageDAO dao = null;

	private OrderPageDAO() {
	}

	public static OrderPageDAO getInstance() {
		if (dao == null) {
			dao = new OrderPageDAO();
		}
		return dao;
	}
	
	

	public ShopDTO selectOptItem(Connection con, int item_code) {
		String sql = "SELECT i.item_code, item_name, opt_name, st_code, st_avail, o.opt_code ,(EXTRA_PRICE+item_price) as price  " + 
	 			"FROM item i LEFT OUTER JOIN item_option o ON i.item_code = o.item_code " + 
	 			"            LEFT OUTER JOIN stock s ON o.opt_code = s.opt_code " + 
	 			"WHERE i.item_code = ? AND rownum = 1";
		ShopDTO dto = null;
		 PreparedStatement pstmt = null; 
		 ResultSet rs = null;
		 int opt_code = 0;
		
		try {
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1,item_code);
	         rs = pstmt.executeQuery();
	         dto = new ShopDTO();    
	         
	         if(rs.next()){
	        	 dto.setOpt_code(rs.getInt("opt_code"));
	        	 dto.setOpt_name(rs.getString("opt_name"));
	        	 dto.setItem_price(rs.getInt("price"));
	         }
		
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return dto;
		
	}
	
	
	public OrderDTO memberDel(Connection con , int mem_code) {
		String sql =" SELECT adr.adr_code,adr_name,mem_name,m.contact , recipient,adr.contact as d_contact, adr_detail,dr_loc,dr_enter,requests ,mem_email"
				+ "    FROM member m JOIN ADDRESS adr ON m.mem_code = adr.mem_code "
				+ "    JOIN DEL_REQUEST del ON adr.adr_code = del.dr_code "
				+ "    WHERE m.mem_code = ?";
		OrderDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, mem_code);
			rs = pstmt.executeQuery();
			dto= new OrderDTO();			
			if (rs.next()) {
				dto.setAdr_code(rs.getInt("adr_code"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setAdr_name(rs.getString("adr_name"));
				dto.setContact(rs.getString("contact"));
				dto.setRecipient(rs.getString("recipient"));
				dto.setD_contact(rs.getString("d_contact"));
				dto.setAdr_detail(rs.getString("adr_detail"));
				dto.setDr_loc(rs.getString("dr_loc"));
				dto.setDr_enter(rs.getString("dr_enter"));
				dto.setRequests(rs.getString("requests"));	
				dto.setMem_email(rs.getString("mem_email"));	
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return dto;
		
	}
	
	
	
	
	public String selectFee(Connection con , int item_code) {
		String sql ="  SELECT item_fee "
				+ "            FROM item i JOIN company compp ON i.cpn_code = compp.cpn_code "
				+ "            WHERE item_code =?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String item_fee ="";
		
		try {
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, item_code);
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				item_fee  = rs.getString("item_fee");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return item_fee;
		
	}
	
	
	public String newOrdCode(Connection con ) {
		String sql =" SELECT ord_code "
				+ "            FROM ORDER_LIST "
				+ "            where rownum =1 "
				+ "            order by ord_code desc ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ord_code ="";
		
		try {
			pstmt= con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				ord_code  = rs.getString("ord_code");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return ord_code;
		
	}
	
	
	
	
	
	
	
}
