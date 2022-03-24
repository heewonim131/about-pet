package project.aboutPet.log.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.log.dao.LogDAO;
import project.aboutPet.log.model.LogDTO;

public class FollowListService {

	private FollowListService() {}   
	private static FollowListService instance = new FollowListService();   
	public static FollowListService getInstance() {
		return instance;
	} // 

	// 트랜잭션 처리
	// 팔로우, 팔로잉 페이지
	public LogDTO followPage(int mem_code, int mf_code){      
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			LogDAO dao = LogDAO.getInstance();         
			LogDTO dto = null;         
			dto =  dao.followPage(con, mem_code, mf_code);          
			return dto; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	} // followPage
	
	
	// 팔로우리스트
	public List<LogDTO> followList(int mf_code, int mem_code){      
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			LogDAO dao = LogDAO.getInstance();         
			List<LogDTO> list = null;         
			list =  dao.followList(con, mf_code, mem_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(">목록구하기 실패 : "+e.getMessage(), e);
		} finally {
			JdbcUtil.close(con);
		}

	} // followList
	
	
	
	// 팔로잉리스트
	public List<LogDTO> followingList(int mem_code){ 
		Connection con = null;
		try { 
			con = ConnectionProvider.getConnection();
			LogDAO dao = LogDAO.getInstance();
			List<LogDTO> list = null;
			list = dao.followingList(con, mem_code);
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(">목록구하기 실패 : "+e.getMessage(), e);
		} finally {
			JdbcUtil.close(con); }
	} // followingList
	
	
}
