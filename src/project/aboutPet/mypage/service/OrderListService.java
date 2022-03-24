package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.ShopDTO;

public class OrderListService {

	private OrderListService() {}
	private static OrderListService instance = new OrderListService();
	public static OrderListService getInstance() {
		return instance;
	}

	// 주문리스트
	public List<ShopDTO> orderList(int mem_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			List<ShopDTO> list = null;
			list = dao.orderList(con, mem_code);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}//orderList
	
	
	// 주문상품 리스트
	public List<ShopDTO> orderItemList(int mem_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			List<ShopDTO> list = null;
			list = dao.orderItemList(con, mem_code);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}//orderItemList
	
	// 주문상세
	// 주문
	public ShopDTO orderDetail(int mem_code, int ord_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			ShopDTO dto = null;
			dto = dao.orderDetail(con, mem_code, ord_code);
			return dto;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}//orderDetail
	
	// 주문상세
	// 주문상품
	public List<ShopDTO> orderItemDetail(int mem_code, int ord_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			List<ShopDTO> list = null;
			list = dao.orderItemDetail(con, mem_code, ord_code);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}//orderItemDetail
	
	// 배송지
	public ShopDTO selectAdr(int mem_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			ShopDTO dto = null;
			dto = dao.selectAdr(con, mem_code);
			return dto;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}//selectAdr
	
	
	// 결제정보
	public ShopDTO selectPay(int mem_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			ShopDTO dto = null;
			dto = dao.selectPay(con, mem_code);
			return dto;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}//selectPay
	
	
	
	
	
	
	
	
	
}//class
