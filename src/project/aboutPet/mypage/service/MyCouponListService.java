package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.CouponDTO;

public class MyCouponListService {

	private MyCouponListService() {}
	private static MyCouponListService instance = new MyCouponListService();
	public static MyCouponListService getInstance() {
		return instance;
	}

	// 내쿠폰
	public List<CouponDTO> couponList(int mem_code) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			List<CouponDTO> list = null;
			list = dao.couponList(con, mem_code);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}
