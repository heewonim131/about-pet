package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.ShopDTO;

public class MyRecentShopService {
	
	private MyRecentShopService() {}
	private static MyRecentShopService instance = new MyRecentShopService();
	public static MyRecentShopService getInstance() {
		return instance;
	}

	//
	public List<ShopDTO> recentShop(int mem_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();         
			List<ShopDTO> list = null;         
			list =  dao.recentShop(con, mem_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}//class
