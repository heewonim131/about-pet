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

public class PetService {

	private PetService() {}
	private static PetService instance = new PetService();
	public static PetService getInstance() {
		return instance;
	}

	//
	public List<PetDTO> select(int mem_code) {
		Connection con2 = null;            
		try {
			con2 = ConnectionProvider.getConnection();
			MyPageDAO dao = MyPageDAO.getInstance();         
			List<PetDTO> list = null;         
			//list =  dao.selectPet(con2, mem_code);          
			return list; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con2);
		}
	}

}
