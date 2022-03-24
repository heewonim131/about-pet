package project.aboutPet.video.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.video.dao.EduDetailDAO;
import project.aboutPet.video.model.EduDTO;

public class EduDetailService {

	private EduDetailService() {}
	private static EduDetailService instance = new EduDetailService(); 
	public static EduDetailService getInstance() {
		return instance;
	}

	

	public List<EduDTO> EduDetail_list(String edu_title) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			EduDetailDAO dao = EduDetailDAO.getInstance();
			
			List<EduDTO> elist = null;
			elist = dao.EduDetail_list(con, edu_title);
			
		    return elist;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}