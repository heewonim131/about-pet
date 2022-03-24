package project.aboutPet.video.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.video.dao.EduDAO;
import project.aboutPet.video.model.EduDTO;

public class EduService {
	
	private EduService() {}
	private static EduService instance = new EduService();
	public static EduService getInstance() {
		return instance;
	}
	
	//
	public List<EduDTO> eduList(){
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			EduDAO dao =EduDAO.getInstance();
			List<EduDTO> list = null;
			list = dao.eduList(con);
			System.out.println(list+"list");
			return list;
		}catch(SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}

