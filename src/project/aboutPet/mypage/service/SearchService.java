package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.MyPageDAO;
import project.aboutPet.mypage.dao.SearchDAO;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.SearchDTO;



public class SearchService  {


	   private SearchService() {}   
	   private static SearchService instance = new SearchService();   
	   public static SearchService getInstance() {
	      return instance;
	   } // 
	   
	   public int searchLog(SearchDTO dto){      
	      Connection con = null;  
	      int rowCount=0;

	      try {
	          con = ConnectionProvider.getConnection();
	          SearchDAO dao = SearchDAO.getInstance();         
		         //rowCount=dao.searchLog(con, dto);
	       } catch (Exception e) { 
	         throw new RuntimeException();
	       } finally {
	          JdbcUtil.close(con);
	       }
	        return rowCount;
	     
	      
	      
	   } // search
	
	
      
	   
	   
	
}
