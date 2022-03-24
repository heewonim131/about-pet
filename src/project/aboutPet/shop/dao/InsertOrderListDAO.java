package project.aboutPet.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

public class InsertOrderListDAO {

	private static InsertOrderListDAO dao = null;
	private InsertOrderListDAO() {}
	public static InsertOrderListDAO getInstance() {
		if (dao==null) {
			dao = new InsertOrderListDAO();
		}
		return dao;
	}
	

	public int insertOrderList(Connection con , int mem_code ,int adr_code ) {
		
		String sql = " INSERT INTO ORDER_LIST (ORD_CODE,MEM_CODE,ADR_CODE,ORD_DATE,ORD_STATUS) "+ 
				" values (item_ORD_seq.nextval,?,?,SYSDATE ,'결제완료') ";
		PreparedStatement pstmt = null; 
		int count = 0;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,mem_code);
			pstmt.setInt(2,adr_code);
			count = pstmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return count;
		
	}
	public int insertOrderDetail(Connection con, int gsptNo, int totalCnt, int dt_code) {
		String sql = "INSERT INTO ORDER_DETAIL(ODD_CODE,ORD_CODE,ST_CODE,ODD_CNT,DT_CODE,D_TIME) "
				+ "values (seq_odd_code.nextval,ITEM_ORD_SEQ.currval,?,?,?,sysdate) ";
		PreparedStatement pstmt = null; 
		int count = 0;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,gsptNo);
			pstmt.setInt(2,totalCnt);
			pstmt.setInt(3,dt_code);
			count = pstmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return count;
	}
	
	
	
	
	public String selectSEQ(Connection con) {
		String sql = "SELECT ITEM_ORD_SEQ.currval seq from dual ";
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String seq = "";
		try {
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				 seq = rs.getString("seq");
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return seq;
	}
	
	   public int insertPayment(Connection con,int totalPay ) {
		      String sql = "INSERT INTO PAYMENT(PM_CODE,ORD_CODE,PM_PRICE) "
		            + "values (item_Payment_seq.nextval,ITEM_ORD_SEQ.currval,?) ";
		      PreparedStatement pstmt = null; 
		      int count = 0;
		      try {
		         pstmt=con.prepareStatement(sql);
		         pstmt.setInt(1,totalPay);
		         count = pstmt.executeUpdate();
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         JdbcUtil.close(pstmt);
		      }
		      return count;
		   }
		   
		   
		   public int insertPaymentDetail(Connection con,int totalPay ) {
		      String sql = "INSERT INTO PAYMENT_DETAIL(PD_CODE,PM_CODE,PD_METHOD,PD_PRICE) "
		            + "values (item_PaymentDetail_seq.nextval,item_Payment_seq.currval,'신용카드',?) ";
		      PreparedStatement pstmt = null; 
		      int count = 0;
		      try {
		         pstmt=con.prepareStatement(sql);
		         pstmt.setInt(1,totalPay);
		         count = pstmt.executeUpdate();
		      }catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         JdbcUtil.close(pstmt);
		      }
		      return count;
		   }
	


}
