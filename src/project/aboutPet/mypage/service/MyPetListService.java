package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.PetDTO;

public class MyPetListService {

	private MyPetListService() {}
	private static MyPetListService instance = new MyPetListService();
	public static MyPetListService getInstance() {
		return instance;
	}

	// 마이펫
	public List<PetDTO> petList(int mem_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();         
			List<PetDTO> list = null;         
			list =  dao.petList(con, mem_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}
