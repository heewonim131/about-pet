package project.aboutPet.log.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.log.dao.LogDAO;
import project.aboutPet.log.model.LogDTO;

public class MyPetLogService {

	private MyPetLogService() {}   
	private static MyPetLogService instance = new MyPetLogService();   
	public static MyPetLogService getInstance() {
		return instance;
	} //


	// 마이펫로그
	public LogDTO selectMemLog(int mem_code, int mf_code){      
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			LogDAO dao = LogDAO.getInstance();         
			LogDTO dto = null;         
			dto =  dao.selectMemLog(con, mem_code, mf_code);          
			return dto; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	} // selectMemLog

	
	// 마이펫로그 이미지
	public List<LogDTO> logImgList(int mem_code){
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			LogDAO dao = LogDAO.getInstance();
			List<LogDTO> list = null;

			list = dao.selectMemImgLog(con, mem_code);
			return list;

		} catch (SQLException | NamingException e) {
			 throw new RuntimeException(">목록구하기 실패 : "+e.getMessage(), e);
		} finally {
			JdbcUtil.close(con);
		}
	}


}
