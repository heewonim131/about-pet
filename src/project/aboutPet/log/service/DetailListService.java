package project.aboutPet.log.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.log.dao.LogDAO;
import project.aboutPet.log.model.LogDTO;

public class DetailListService {

	private DetailListService() {}
	private static DetailListService instance = new DetailListService();
	public static DetailListService getInstance() {

		return instance;
	}

	public static  LogDTO select(int log_code) {
		Connection con = null;            
		try { 
			con = ConnectionProvider.getConnection();
			LogDAO dao = LogDAO.getInstance();         
			LogDTO dto = null;         
			dto =  dao.selectPetDetailLog(con, log_code);     
			return dto; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	// 댓글 목록
	public static List<LogDTO> cmtList(int log_code){      
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			LogDAO dao = LogDAO.getInstance();         
			List<LogDTO> list = null;         
			list =  dao.cmtList(con, log_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(">목록구하기 실패 : "+e.getMessage(), e);
		} finally {
			JdbcUtil.close(con);
		}

	} // cmtList

}