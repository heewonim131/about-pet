package project.aboutPet.shop.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.shop.dao.InsertOrderListDAO;
import project.aboutPet.shop.dao.indexNewCategoryDAO;
import project.aboutPet.shop.model.ShopDTO;

public class InsertOrderListService {
	
	private InsertOrderListService() {
	}

	private static InsertOrderListService instance = new InsertOrderListService();

	public static InsertOrderListService getInstance() {
		return instance;
	}
	
	
	public int insertOrderItem(int mem_code, int adr_codeint ) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			InsertOrderListDAO dao = InsertOrderListDAO.getInstance();
			int count = 0;
			count = dao.insertOrderList(con,mem_code,adr_codeint);
			return count;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}


	public int insertOrderDetail(int gsptNo, int totalCnt, int dt_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			InsertOrderListDAO dao = InsertOrderListDAO.getInstance();
			int count = 0;
			count = dao.insertOrderDetail(con,gsptNo,totalCnt,dt_code);
			return count;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	
	public String selectSEQ() {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			InsertOrderListDAO dao = InsertOrderListDAO.getInstance();
			String seq = "";
			seq = dao.selectSEQ(con);
			return seq;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	public int insertPayment(int totalPay) {
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         InsertOrderListDAO dao = InsertOrderListDAO.getInstance();
	         int count = 0;
	         count = dao.insertPayment(con,totalPay);
	         return count;
	      } catch (SQLException | NamingException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }
	   
	   
	   
	   
	   public int insertPaymentDetail(int totalPay) {
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         InsertOrderListDAO dao = InsertOrderListDAO.getInstance();
	         int count = 0;
	         count = dao.insertPaymentDetail(con,totalPay);
	         return count;
	      } catch (SQLException | NamingException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }

}
