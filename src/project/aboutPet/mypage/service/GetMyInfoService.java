package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.PetDTO;

public class GetMyInfoService {

	private GetMyInfoService() {}
	private static GetMyInfoService instance = new GetMyInfoService();
	public static GetMyInfoService getInstance() {
		return instance;
	}

	// 회원정보 가져오기
	public MemberDTO select(int mem_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();
			MemberDTO memberDTO = null;         
			memberDTO =  dao.selectMember(con, mem_code);          
			return memberDTO;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}//class
