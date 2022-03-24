package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.model.PetDTO;

public class MyPetViewService {

	private MyPetViewService() {}
	private static MyPetViewService instance = new MyPetViewService();
	public static MyPetViewService getInstance() {
		return instance;
	}

	// 마이펫
	public PetDTO petView(int pet_code) {
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();         
			PetDTO petDTO = null;         
			petDTO =  dao.petView(con, pet_code);          
			return petDTO; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}
