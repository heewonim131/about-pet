package project.aboutPet.mypage.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.mypage.dao.SearchDAO;
import project.aboutPet.mypage.model.SearchDTO;



public class TopSearchService  {


	   private TopSearchService() {}   
	   private static TopSearchService instance = new TopSearchService();   
	   public static TopSearchService getInstance() {
	      return instance;
	   } // 
	   
	   public ArrayList<SearchDTO> topSearch(){      
	      Connection con = null;  
	      ArrayList<SearchDTO>topList=new ArrayList<SearchDTO>();


	      try {
	          con = ConnectionProvider.getConnection();
	          
	          SearchDAO dao = SearchDAO.getInstance();         
		         topList=dao.topSearch(con);
	       } catch (Exception e) { 
	         throw new RuntimeException();
	       } finally {
	          JdbcUtil.close(con);
	       }
	        return topList;
	     
	      
	      
	   } // search
	
	
      
	   
	   
	
}
