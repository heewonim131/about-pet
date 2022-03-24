package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.LogDTO;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.mypage.model.TvDTO;
import project.aboutPet.mypage.model.PetDTO;

public class MyWishListService {
	
	private MyWishListService() {}
	private static MyWishListService instance = new MyWishListService();
	public static MyWishListService getInstance() {
		return instance;
	}
	
	// 마이 찜 리스트
	
	// TV
	public List<TvDTO> wishTv(int mem_code){
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();         
			List<TvDTO> list = null;         
			list =  dao.wishTv(con, mem_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	
	// 로그
	public List<LogDTO> wishLog(int mem_code){
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();         
			List<LogDTO> list = null;         
			list =  dao.wishLog(con, mem_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	
	// 샵
	public List<ShopDTO> wishShop(int mem_code){
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			List<ShopDTO> list = null;         
			list =  dao.wishShop(con, mem_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	
}
