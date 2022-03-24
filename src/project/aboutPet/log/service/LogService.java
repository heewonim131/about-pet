package project.aboutPet.log.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import project.aboutPet.log.dao.LogDAO;
import project.aboutPet.log.model.LogDTO;


// 싱글톤
public class LogService {
   
   private LogService() {}   
   private static LogService instance = new LogService();   
   public static LogService getInstance() {
      return instance;
   } // 
   
   // 트랜잭션 처리
   public List<LogDTO> selectLog(){      
      Connection con = null;            
      try {
         con = ConnectionProvider.getConnection();
         LogDAO dao = LogDAO.getInstance();         
         List<LogDTO> list = null;         
         list =  dao.selectLog(con);          
         return list; 
      } catch (SQLException | NamingException e) {
         throw new RuntimeException(">목록구하기 실패 : "+e.getMessage(), e);
      } finally {
         JdbcUtil.close(con);
      }
      
   } // selectLog
   	
   
   // 좋아요 상태유지
	public LogDTO likeStateUs(int mem_code, int mf_code){      
		Connection con = null;            
		try {
			con = ConnectionProvider.getConnection();
			LogDAO dao = LogDAO.getInstance();         
			LogDTO dto = null;         
			dto =  dao.selectMemLog(con, mem_code, mf_code);          
			return dto; 
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	} // selectMemLog

   
   // 댓글 목록
   public List<LogDTO> cmtList(int log_code){      
	   Connection con = null;            
	   try {
		   con = ConnectionProvider.getConnection();
		   LogDAO dao = LogDAO.getInstance();         
		   List<LogDTO> list = null;         
		   list =  dao.cmtList(con, log_code);          
		   return list; 
	   } catch (SQLException | NamingException e) {
		   throw new RuntimeException(">목록구하기 실패 : "+e.getMessage(), e);
	   } finally {
		   JdbcUtil.close(con);
	   }
	   
   } // select
   
   
}