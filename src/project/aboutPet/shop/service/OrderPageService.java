package project.aboutPet.shop.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import net.sf.json.JSONObject;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.shop.dao.BestGoodsListDAO;
import project.aboutPet.shop.dao.OrderPageDAO;
import project.aboutPet.shop.model.OrderDTO;

public class OrderPageService {
	
	private OrderPageService() {
	}

	private static OrderPageService instance = new OrderPageService();

	public static OrderPageService getInstance() {
		return instance;
	}
	
	
	public ShopDTO selectOptPage(int item_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			OrderPageDAO dao = OrderPageDAO.getInstance();
			ShopDTO dto = null;
			dto = dao.selectOptItem(con,item_code);
			return dto;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	public OrderDTO memberDel(int mem_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			OrderPageDAO dao = OrderPageDAO.getInstance();
			OrderDTO dto = null;
			dto = dao.memberDel(con,mem_code);
			return dto;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	public String selectFee(int item_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			OrderPageDAO dao = OrderPageDAO.getInstance();
			String item_fee = null;
			item_fee = dao.selectFee(con,item_code);
			return item_fee;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	public String newOrdCode() {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			OrderPageDAO dao = OrderPageDAO.getInstance();
			String ord_code = null;
			ord_code = dao.newOrdCode(con);
			return ord_code;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}
