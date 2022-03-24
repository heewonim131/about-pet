package project.aboutPet.video.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.video.dao.EduDAO;
import project.aboutPet.video.model.EduDTO;

public class EduCountService {
	private EduCountService() {}
	private static EduCountService instance = new EduCountService();
	public static EduCountService getInstance() {
		return instance;
	}

	public int eduCountList(String edu_cate) {
		Connection con = null;  
		System.out.println(edu_cate+"edu_cate");
		try {
			con = ConnectionProvider.getConnection();
			EduDAO dao = EduDAO.getInstance();
			int cnt = dao.eduCount(con, edu_cate);
		
			System.out.println("ddddddd");
		return cnt;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
}
	
