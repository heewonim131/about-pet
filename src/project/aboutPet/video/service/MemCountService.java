package project.aboutPet.video.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.video.dao.EduDAO;
import project.aboutPet.video.model.EduDTO;

public class MemCountService {
	
	private MemCountService() {}
	private static MemCountService instance = new MemCountService();
	public static MemCountService getInstance() {
		return instance;
	}
	

	public int memCountList(int mem_code, String edu_cate) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			EduDAO dao =EduDAO.getInstance();
			// List<EduDTO> list = null;
			int cnt = dao.memCount(con, mem_code, edu_cate);
			
			return cnt;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
	}
	
}