package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.ShopDTO;

public class CartListService {

	private CartListService() {}
	private static CartListService instance = new CartListService();
	public static CartListService getInstance() {
		return instance;
	}

	// 장바구니
	public List<ShopDTO> cartList(int mem_code, String cpn_type) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			List<ShopDTO> list = null;
			list = dao.cartList(con, mem_code, cpn_type);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}//cartList
	
}//class
