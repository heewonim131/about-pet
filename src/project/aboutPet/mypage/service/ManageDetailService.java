package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.PetDTO;

public class ManageDetailService {

	private ManageDetailService() {}
	private static ManageDetailService instance = new ManageDetailService();
	public static ManageDetailService getInstance() {
		return instance;
	}

	// 회원정보 수정
	public int updatePrf(MemberDTO dto) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			int rowCount = dao.updatePrf(con, dto);
			return rowCount;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}
