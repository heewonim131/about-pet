package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.TvDTO;

public class MyRecentTvService {

	private MyRecentTvService() {}
	private static MyRecentTvService instance = new MyRecentTvService();
	public static MyRecentTvService getInstance() {
		return instance;
	}

	//
	public List<TvDTO> recentTv(int mem_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();         
			List<TvDTO> list = null;         
			list =  dao.recentTv(con, mem_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}//class
