package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.MemberDTO;

public class ManageCheckService {

	private ManageCheckService() {}
	private static ManageCheckService instance = new ManageCheckService();
	public static ManageCheckService getInstance() {
		return instance;
	}

	//
	public String checkPwd(int mem_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();         
			String oPwd =  dao.checkPwd(con, mem_code);
			return oPwd; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}
