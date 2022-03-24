package project.aboutPet.log.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.util.JdbcUtil;

import project.aboutPet.log.model.LogDTO;


// 싱글톤
public class LogDAO {
	
	private static LogDAO dao = null;
	private LogDAO() {}
	
	public static LogDAO getInstance() {
		if (dao == null) {
			dao = new LogDAO();
		}
		return dao;
	}
	
	// 펫로그
	public List<LogDTO> selectLog(Connection con) throws SQLException {
		
		String sql = " SELECT log_code, log_img, pet_img, nickname, log_content, "
				  +	 " CASE "
				  +	 " 	 WHEN TRUNC(sysdate - log_date ) < 1 THEN TO_CHAR(sysdate, ' HH24') - TO_CHAR(log_date, 'HH24')||'시간 전' " 
				  +	 " 	 WHEN TRUNC(sysdate - log_date ) BETWEEN 1 AND 20 THEN TRUNC(sysdate - log_date )||'일 전' " 
				  +	 " 	 WHEN TRUNC(sysdate - log_date ) > 20 THEN TO_CHAR(log_date,'MM\"월\"dd\"일\"') "
				  +	 " END log_date "
				  +	 " , (SELECT count(log_code) FROM log_like WHERE log_code = pl.log_code) log_like "
				  +	 " , (SELECT count(log_code) FROM log_cmt WHERE log_code = pl.log_code) log_cmt "
				  +	 " , m.mem_code mem_code "
				  +	 " FROM pet_log pl JOIN member m  ON pl.mem_code = m.mem_code "
				  +	 "                 JOIN pet p ON p.mem_code = m.mem_code "
				  +	 " ORDER BY log_code desc ";
		
		
	      ArrayList<LogDTO> list = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         //
	         //pstmt.setInt(1, log_code);
	         rs = pstmt.executeQuery();
	         
	         String log_content;
             String [] words ;
             // 이미지
             String log_img ;
             String[] pcs ;
	         
	         if ( rs.next() ) {
	            list = new ArrayList<LogDTO>();
	            LogDTO dto = null;
	            do {
	               dto =  new LogDTO();
	               
	               dto.setLog_code(rs.getInt("log_code"));
	               //dto.setLog_img(rs.getString("log_img"));
	               
	               dto.setPet_img(rs.getString("pet_img"));
	               dto.setNickname(rs.getString("nickname"));
	               dto.setLog_date(rs.getString("log_date"));
	               
	               //
	               // 해시태그(#) - log_content
	               log_content = rs.getString("log_content");
	               words = log_content.split(" ");
	               StringBuilder sb = new StringBuilder();
	               
	               
	               // 이미지 슬라이드
	               log_img = rs.getString("log_img");
                   pcs = log_img.split(" ");   
                   StringBuilder sb1 = new StringBuilder();      
                   int check = pcs.length;

                   //이미지 부분
                   switch(check) {
                   case 1:
                	   pcs[0] = String.format(" <div class='lcbPicture' style='height:800px;'> "
                			   				+ "  <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ " </div> ", pcs[0]);
                     
                	   sb1.append(pcs[0]);
                   break;
                    
                   case 2:
                	   pcs[0] = String.format(" <li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                                          	+ "  <div class='inr' style='height:800px;'> "
                                          	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                                          	+ "  </div> "
                                          	+ " </li> ", pcs[0]);
                	   pcs[1] = String.format(" <li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                                          	+ "  <div class='inr' style='height:800px;'> "
                                          	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                                          	+ "  </div> "
                                          	+ " </li> " 
                                          	+ " <div class='remote-area'> "
                                          	+ " </div> ", pcs[1]);
                         
                	   sb1.append(pcs[0]);
                	   sb1.append(pcs[1]);
                   break;

                    
                   case 3:
                	   pcs[0] = String.format(" <li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " ,pcs[0]);
                	   pcs[1] = String.format(" <li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                    		   				+ "  <div class='inr' style='height:800px;'> "
                    		   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                    		   				+ "  </div> "
                    		   				+ " </li> " 
                    		   				+ " <div class='remote-area'> "
                    		   				+ " </div> ",pcs[1]);
                	   pcs[2] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[2]);
                    
                	   sb1.append(pcs[0]);
                	   sb1.append(pcs[1]);
                	   sb1.append(pcs[2]);
                   break;      
                    
                   
                   case 4:
                	   pcs[0] = String.format("<li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                               				+ " <div class='inr' style='height:800px;'> "
                               				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                               				+ " </div> "
                               				+ " </li> ", pcs[0]);
                	   pcs[1] = String.format(" <li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
			                			   	+ "  <div class='inr' style='height:800px;'> "
			                			   	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
			                			   	+ "  </div> "
			                			   	+ " </li> " 
			                			   	+ " <div class='remote-area'> "
			                			   	+ " </div> ", pcs[1]);
                	   pcs[2] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
			                			 	+ "  <div class='inr' style='height:800px;'> "
			                			 	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
			                			 	+ "  </div> "
			                			 	+ " </li> " 
			                			 	+ " <div class='remote-area'> "
			                			 	+ " </div> ", pcs[2]);
                	   pcs[3] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
			                			  	+ "  <div class='inr' style='height:800px;'> "
			                			  	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
			                			  	+ "  </div> "
			                			  	+ " </li> " 
			                			  	+ " <div class='remote-area'> "
			                			  	+ " </div> ", pcs[3]);
                    
                	   sb1.append(pcs[0]);
                	   sb1.append(pcs[1]);
                	   sb1.append(pcs[2]);
                	   sb1.append(pcs[3]);
                   break;   

                 
                   case 5:
                     
                	   pcs[0] = String.format(" <li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> ", pcs[0]);
                	   pcs[1] = String.format(" <li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[1]);
                	   pcs[2] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[2]);
                	   pcs[3] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[3]);
                	   pcs[4] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[4]);
                    
                	   sb1.append(pcs[0]);
                	   sb1.append(pcs[1]);
                	   sb1.append(pcs[2]);
                	   sb1.append(pcs[3]);
                	   sb1.append(pcs[4]);
                   break;
                   
                }
                   log_img = sb1.toString();
                   dto.setLog_img(log_img);
                   
                   //
	               for( int i = 0 ; i < words.length ; i++){
	                   if( words[i].startsWith("#")){
	                         words[i] = String.format("<a href='#' style='color:#669aff'>%s </a>", words[i]);
	                         // out.println( words[i] + "<br>" );
	                      }else{
	                        words[i] = String.format("<span>%s</span>&nbsp", words[i]);
	                      } // if()
	                   
	                    sb.append(words[i]);
	                    
	               } // for()
	               log_content = sb.toString();
	               
	               dto.setLog_content(log_content);
		               
		           dto.setLog_like(rs.getInt("log_like"));
		           dto.setLog_cmt(rs.getInt("log_cmt"));
		           dto.setMem_code(rs.getInt("mem_code"));

		           		           
	               list.add(dto);
	            } while ( rs.next() );
	         } // 
	      } finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);         
	      } // finally
	      
	      return list;
	}
	
	
	// 좋아요 상태유지
	public LogDTO likeStateUs(Connection con, int log_code, int mem_code) throws SQLException {		
		
		String sql = " SELECT DECODE ( COUNT(*), 0, 'false', 1, 'true') pilot_like "
				   + " FROM log_like "
				   + " WHERE log_code = ? AND mem_code = ? ";
		
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      LogDTO dto = null;
      
      try {
         pstmt = con.prepareStatement(sql);
         
         //
         pstmt.setInt(1, log_code);
         pstmt.setInt(2, mem_code);

         rs = pstmt.executeQuery();
         
         if ( rs.next() ) {
        	 
        	 dto =  new LogDTO();
        	 
        	 dto.setPilot_like(rs.getString("pilot_like"));
        	 
         } // 
      } finally {
         JdbcUtil.close(pstmt);
      } // finally
      
      return dto;
	}

	
	// 마이펫로그
	public LogDTO selectMemLog(Connection con, int mem_code, int mf_code) throws SQLException {		
		
		String sql = " SELECT pet_img, m.mem_code mem_code, nickname "
				   + " , (SELECT count(*) FROM pet_log WHERE mem_code = ?) log_count "
				   + " , (SELECT count(*) FROM mem_follow WHERE mf_code = ?) mem_follow "
				   + " , (SELECT count(*) FROM mem_follow WHERE mem_code = ?) mem_following "
				   + " FROM member m FULL JOIN pet_log pl ON pl.mem_code = m.mem_code "
				   + "               FULL JOIN pet p ON m.mem_code = p.mem_code "
				   + "               FULL JOIN mem_follow mf ON pl.mem_code = mf.mem_code "
				   + " WHERE m.mem_code = ? "
				   + " ORDER BY log_code desc ";
		
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      LogDTO dto = null;
      
      try {
         pstmt = con.prepareStatement(sql);
         
         //
         pstmt.setInt(1, mem_code);
         pstmt.setInt(2, mem_code);
         pstmt.setInt(3, mf_code);
         pstmt.setInt(4, mem_code);
         rs = pstmt.executeQuery();
         
         if ( rs.next() ) {
        	 
        	 dto =  new LogDTO();
        	 
        	 dto.setPet_img(rs.getString("pet_img"));
        	 dto.setMem_code(rs.getInt("mem_code"));
        	 dto.setNickname(rs.getString("nickname"));

        	 
        	 dto.setLog_count(rs.getInt("log_count"));
        	 dto.setMem_follow(rs.getInt("mem_follow"));
        	 dto.setMem_following(rs.getInt("mem_following"));
             
         } // 
      } finally {
         JdbcUtil.close(pstmt);
      } // finally
      
      return dto;
	}
	
	
	// 마이펫로그 이미지
    public List<LogDTO> selectMemImgLog(Connection con, int mem_code) throws SQLException{
            
        String sql = " SELECT log_code, mem_code, "
                   + " CASE "
                   + " 	 WHEN INSTR(log_img, ' ') = 0 THEN log_img "
                   + " 	 WHEN INSTR(log_img, ' ') != 0 THEN SUBSTR(log_img, 0, INSTR(log_img, ' ', 1, 1)) "
                   + " END log_img "
                   + " , log_date "
                   + " FROM pet_log "
                   + " WHERE mem_code= ? "
                   + " ORDER BY log_date desc ";
             
        ArrayList<LogDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
                  
        try {
           pstmt = con.prepareStatement(sql);
           
           //
           pstmt.setInt(1, mem_code);
           rs = pstmt.executeQuery();
                    
           if ( rs.next() ) {
              list = new ArrayList<LogDTO>();
              LogDTO dto = null;
                        
              do {
                 dto =  new LogDTO();

                 dto.setLog_code( rs.getInt("log_code"));
                 dto.setMem_code(rs.getInt("mem_code"));
                 dto.setLog_img(rs.getString("log_img"));
                 dto.setLog_date(rs.getString("log_date")); 
                         
                 list.add(dto);
              } while ( rs.next() );
           }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);         
        } // finally
                  
        return list;
    }
	
    
    // 마이펫로그 이미지 클릭
    public List<LogDTO> selectMemLogList(Connection con, int mem_code) throws SQLException{

    	String sql = " SELECT log_code, log_img, pet_img, nickname, "
    			   + " CASE "
    			   + "   WHEN TRUNC(sysdate - log_date) < 1 THEN TO_CHAR(sysdate, ' HH24') - TO_CHAR(log_date, 'HH24')||'시간 전' "
    			   + "   WHEN TRUNC(sysdate - log_date) BETWEEN 1 AND 20 THEN TRUNC(sysdate - log_date)||'일 전' "
    			   + "   WHEN TRUNC(sysdate - log_date) > 20 THEN TO_CHAR(log_date,'MM\"월\"dd\"일\"') "
    			   + " END log_date "
    			   + " , log_content "
    			   + " , (SELECT COUNT(log_code) FROM log_like WHERE log_code = pl.log_code) log_like "
    			   + " , (SELECT COUNT(log_code) FROM log_cmt WHERE log_code = pl.log_code) log_cmt "
    			   + " , m.mem_code mem_code "
    			   + " FROM pet_log pl JOIN member m ON pl.mem_code = m.mem_code "
    			   + "           	   JOIN pet p ON p.mem_code = m.mem_code "
    			   + " WHERE m.mem_code = ? "
    			   + " ORDER BY log_code desc ";
    	
    	ArrayList<LogDTO> list = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;

    	try {
	         pstmt = con.prepareStatement(sql);
	         
	         //
	         pstmt.setInt(1, mem_code);
	         rs = pstmt.executeQuery();
	         
	         String log_content;
             String [] words ;
             // 이미지  
             String log_img ;
             String[] pcs ;
	          
	          if ( rs.next() ) {
	             list = new ArrayList<LogDTO>();
	             LogDTO dto = null;
	             do {
	                dto =  new LogDTO();
	                
	                dto.setLog_code(rs.getInt("log_code"));
	                //dto.setLog_img(rs.getString("log_img"));
	                
	                dto.setPet_img(rs.getString("pet_img"));
	                dto.setNickname(rs.getString("nickname"));
	                
	                dto.setLog_date(rs.getString("log_date"));
	                
	                //
	                // 해시태그(#) - log_content
	                log_content = rs.getString("log_content");
	                words = log_content.split(" ");
	                StringBuilder sb = new StringBuilder();
	                
	                
	                // 이미지 슬라이드
	                log_img = rs.getString("log_img");
                   pcs = log_img.split(" ");   
                   StringBuilder sb1 = new StringBuilder();      
                   int check = pcs.length;
             
                   //이미지 부분
                   switch(check) {
                   case 1:
                	   pcs[0] = String.format(" <div class='lcbPicture' style='height:800px;'> "
                			   				+ "  <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ " </div> ", pcs[0]);
                     
                	   sb1.append(pcs[0]);
                   break;
                    
                   case 2:
                	   pcs[0] = String.format(" <li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                                          	+ "  <div class='inr' style='height:800px;'> "
                                          	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                                          	+ "  </div> "
                                          	+ " </li> ", pcs[0]);
                	   pcs[1] = String.format(" <li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                                          	+ "  <div class='inr' style='height:800px;'> "
                                          	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                                          	+ "  </div> "
                                          	+ " </li> " 
                                          	+ " <div class='remote-area'> "
                                          	+ " </div> ", pcs[1]);
                         
                	   sb1.append(pcs[0]);
                	   sb1.append(pcs[1]);
                   break;
             
                    
                   case 3:
                	   pcs[0] = String.format(" <li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "    <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " ,pcs[0]);
                	   pcs[1] = String.format(" <li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                    		   				+ "  <div class='inr' style='height:800px;'> "
                    		   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                    		   				+ "  </div> "
                    		   				+ " </li> " 
                    		   				+ " <div class='remote-area'> "
                    		   				+ " </div> ",pcs[1]);
                	   pcs[2] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[2]);
                    
                	   sb1.append(pcs[0]);
                	   sb1.append(pcs[1]);
                	   sb1.append(pcs[2]);
                   break;      
                    
                   
                   case 4:
                	   pcs[0] = String.format(" <li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                               				+ "  <div class='inr' style='height:800px;'> "
                               				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                               				+ "  </div> "
                               				+ " </li> ", pcs[0]);
                	   pcs[1] = String.format(" <li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
			                 			   	+ "  <div class='inr' style='height:800px;'> "
			                 			   	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
			                 			   	+ "  </div> "
			                 			   	+ " </li> " 
			                 			   	+ " <div class='remote-area'> "
			                 			   	+ " </div> ", pcs[1]);
                	   pcs[2] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
			                 			 	+ "  <div class='inr' style='height:800px;'> "
			                 			 	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
			                 			 	+ "  </div> "
			                 			 	+ " </li> " 
			                 			 	+ " <div class='remote-area'> "
			                 			 	+ " </div> ", pcs[2]);
                	   pcs[3] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
			                 			  	+ "  <div class='inr' style='height:800px;'> "
			                 			  	+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
			                 			  	+ "  </div> "
			                 			  	+ " </li> " 
			                 			  	+ " <div class='remote-area'> "
			                 			  	+ " </div> ", pcs[3]);
                    
                	   sb1.append(pcs[0]);
                	   sb1.append(pcs[1]);
                	   sb1.append(pcs[2]);
                	   sb1.append(pcs[3]);
                   break;   
             
                 
                   case 5:
                     
                	   pcs[0] = String.format(" <li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> ", pcs[0]);
                	   pcs[1] = String.format(" <li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[1]);
                	   pcs[2] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[2]);
                	   pcs[3] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[3]);
                	   pcs[4] = String.format(" <li class='swiper-slide' style='width: 600px;'> "
                			   				+ "  <div class='inr' style='height:800px;'> "
                			   				+ "   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                			   				+ "  </div> "
                			   				+ " </li> " 
                			   				+ " <div class='remote-area'> "
                			   				+ " </div> ", pcs[4]);
                    
                	   sb1.append(pcs[0]);
                	   sb1.append(pcs[1]);
                	   sb1.append(pcs[2]);
                	   sb1.append(pcs[3]);
                	   sb1.append(pcs[4]);
                   break;
                   
                }
                   log_img = sb1.toString();
                   dto.setLog_img(log_img);
                   
                   //
	                for( int i = 0 ; i < words.length ; i++){
	                    if( words[i].startsWith("#")){
	                          words[i] = String.format("<a href='#' style='color:#669aff'>%s </a>", words[i]);
	                          // out.println( words[i] + "<br>" );
	                       }else{
	                         words[i] = String.format("<span>%s</span>&nbsp", words[i]);
	                       } // if()
	                    
	                     sb.append(words[i]);
	                     
	                } // for()
	                log_content = sb.toString();
	                
	                dto.setLog_content(log_content);
		                
		            dto.setLog_like(rs.getInt("log_like"));
		            dto.setLog_cmt(rs.getInt("log_cmt"));
		            dto.setMem_code(rs.getInt("mem_code"));

		           
    				list.add(dto);
    			} while ( rs.next() );
    		} // 
    	} finally {
    		JdbcUtil.close(pstmt);
    		JdbcUtil.close(rs);         
    	} // finally

    	return list;
    } //
    
    
	// 팔로우, 팔로잉 페이지
	public LogDTO followPage(Connection con, int mem_code, int mf_code) throws SQLException {		
		
		String sql = " SELECT m.mem_code mem_code, p.pet_img pet_img, m.nickname nickname "
				   + " , (SELECT COUNT(*) FROM mem_follow WHERE  mf_code = ?) mem_follow "
				   + " , (SELECT COUNT(*) FROM mem_follow WHERE  mem_code =  ?) mem_following "
				   + " FROM member m FULL JOIN pet p ON m.mem_code = p.mem_code "
				   + "               FULL JOIN mem_follow mf ON m.mem_code = mf.mem_code "
				   + " WHERE m.mem_code = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		LogDTO dto = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			
			//
			pstmt.setInt(1, mf_code);
			pstmt.setInt(2, mem_code);
			pstmt.setInt(3, mem_code);

			rs = pstmt.executeQuery();
			
			if ( rs.next() ) {
				
				dto =  new LogDTO();
				
				dto.setMem_code(rs.getInt("mem_code"));
				dto.setPet_img(rs.getString("pet_img"));
				dto.setNickname(rs.getString("nickname"));
				
				dto.setMem_follow(rs.getInt("mem_follow"));
				dto.setMem_following(rs.getInt("mem_following"));
				
			} // 
		} finally {
			JdbcUtil.close(pstmt);
		} // finally
		
		return dto;
	}
	
	
	// 팔로우리스트
	public List<LogDTO> followList(Connection con, int mf_code, int mem_code) throws SQLException {
		
		String sql = " SELECT mf.mem_code folm_code, m1.nickname folm_name, p.pet_img pet_img, mf.mf_code mem_code, m2.nickname nickname "
				   + " , (SELECT COUNT(*) FROM mem_follow WHERE mf_code =  ?) mem_follow "
				   + " FROM mem_follow mf JOIN member m1 ON  mf.mem_code = m1.mem_code "
				   + "                    JOIN member m2 ON  mf.mf_code= m2.mem_code "
				   + "                    JOIN pet p ON m1.mem_code = p.mem_code "
				   + " WHERE m2.mem_code = ? "
				   + " ORDER BY mf_date desc ";
								
	      ArrayList<LogDTO> list = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         //
	         pstmt.setInt(1, mf_code);
	         pstmt.setInt(2, mem_code);
	         rs = pstmt.executeQuery();
	         
	         
	         if ( rs.next() ) {
	            list = new ArrayList<LogDTO>();
	            LogDTO dto = null;
	            do {
	               dto =  new LogDTO();
	               	               
	               dto.setFolm_code(rs.getInt("folm_code"));
	               dto.setFolm_name(rs.getString("folm_name"));
	               
	               dto.setPet_img(rs.getString("pet_img"));
	               dto.setMem_code(rs.getInt("mem_code"));
	               dto.setNickname(rs.getString("nickname"));
	               	               
	               dto.setMem_follow(rs.getInt("mem_follow"));

	               list.add(dto);
	            } while ( rs.next() );
	         } // 
	      } finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);         
	      } // finally
	      
	      return list;
	}
	
	
	// 팔로잉 리스트
	public List<LogDTO> followingList(Connection con, int mem_code) throws SQLException {
		
		String sql = " SELECT mf.mem_code mem_code, m1.nickname nickname, p.pet_img pet_img, mf.mf_code folim_code, m2.nickname folim_name "
				   + " FROM mem_follow mf JOIN member m1 ON  mf.mem_code = m1.mem_code "
				   + "                    JOIN member m2 ON  mf.mf_code= m2.mem_code "
				   + "                    JOIN pet p ON m2.mem_code = p.mem_code "
				   + " WHERE m1.mem_code = ? "
				   + " ORDER BY mf_date desc ";
								
	      ArrayList<LogDTO> list = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         //
	         pstmt.setInt(1, mem_code);
	         rs = pstmt.executeQuery();
	         
	         
	         if ( rs.next() ) {
	            list = new ArrayList<LogDTO>();
	            LogDTO dto = null;
	            do {
	               dto =  new LogDTO();
	               	               
	               dto.setMem_code(rs.getInt("mem_code"));
	               dto.setNickname(rs.getString("nickname"));
	               dto.setPet_img(rs.getString("pet_img"));
	               	               
	               dto.setFolim_code(rs.getInt("folim_code"));
	               dto.setFolim_name(rs.getString("folim_name"));
	               
	               list.add(dto);
	            } while ( rs.next() );
	         } // 
	      } finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);         
	      } // finally
	      
	      return list;
	}
	
	
	// 댓글 목록
	public List<LogDTO> cmtList(Connection con, int log_code) throws SQLException {
		
		String sql = " SELECT lc.log_code log_code, m.mem_code mem_code, p.pet_img pet_img, m.nickname nickname, lc.lcmt lcmt, TO_CHAR(lc.lc_date, 'MM\"월\" dd\"일\"') lc_date "
				   + " FROM log_cmt lc FULL JOIN pet p ON lc.mem_code = p.mem_code "
				   + " 	               FULL JOIN member m ON lc.mem_code = m.mem_code "
				   + " 	               FULL JOIN pet_log pl ON lc.log_code = pl.log_code "
				   + " WHERE lc.log_code = ? "
				   + " ORDER BY lc.lc_date desc ";
		   
	      ArrayList<LogDTO> list = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         //
	         pstmt.setInt(1, log_code);
	         rs = pstmt.executeQuery();
	         
	         
	         if ( rs.next() ) {
	            list = new ArrayList<LogDTO>();
	            LogDTO dto = null;
	            do {
	               dto =  new LogDTO();
	               	               
	               dto.setLog_code(rs.getInt("log_code"));
	               dto.setMem_code(rs.getInt("mem_code"));
	               dto.setPet_img(rs.getString("pet_img"));
	               dto.setNickname(rs.getString("nickname"));
	               	               
	               dto.setLcmt(rs.getString("lcmt"));
	               dto.setLc_date(rs.getString("lc_date"));
	               
	               
	               list.add(dto);
	            } while ( rs.next() );
	         } // 
	      } finally {
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);         
	      } // finally
	      
	      return list;
	}
	
	
	// 링크 
    public LogDTO selectPetDetailLog( Connection con, int log_code )throws SQLException{
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       LogDTO dto = null;
       
       String sql =	" SELECT log_code, log_img, pet_img, nickname "
    		   	  + " , CASE "
    		   	  + "     WHEN TRUNC(sysdate - log_date) < 1 THEN TO_CHAR(sysdate, 'HH24') - TO_CHAR(log_date, 'HH24')||'시간 전' "
    		   	  + "     WHEN TRUNC(sysdate - log_date) BETWEEN 1 AND 20 THEN TRUNC(sysdate - log_date)||'일 전' "
    		   	  + "     WHEN TRUNC(sysdate - log_date) > 20 THEN TO_CHAR(log_date,'MM\"월\"dd\"일\"') "
    		   	  + "   END log_date "
    		   	  + " , log_content "
    		   	  + " , ( SELECT COUNT(log_code) FROM log_like WHERE log_code = ? ) log_like "
    		   	  + " , ( SELECT COUNT(log_code) FROM log_cmt WHERE log_code = ? ) log_cmt "
    		   	  + " , m.mem_code mem_code "
    		   	  + " FROM pet_log pl JOIN member m ON pl.mem_code = m.mem_code "
    		   	  + "                 JOIN pet p ON p.mem_code = m.mem_code "
    		   	  + " WHERE log_code = ? "
    		   	  + " ORDER BY log_code desc ";
       
       try {
          
          pstmt = con.prepareStatement(sql);
          
          //변수설정
          pstmt.setInt(1, log_code);
          pstmt.setInt(2, log_code);
          pstmt.setInt(3, log_code);
          
          rs = pstmt.executeQuery();
          
          String log_content;
          String [] words ;
          

             String log_img ;
             String[] pcs ;
          
          if (rs.next()) {
            
             
             
             log_content = rs.getString("log_content");
              words = log_content.split(" ");
              StringBuilder sb = new StringBuilder();
              
              
              log_img = rs.getString("log_img");
                   pcs = log_img.split(" ");   
                   StringBuilder sb1 = new StringBuilder();      
                   int check = pcs.length;
              
             dto = new LogDTO();
             
             

             dto.setLog_code( rs.getInt("log_code"));
             
             
             //이미지 부분
                  switch(check) {


                 case 1:

                    pcs[0] = String.format("<div class='lcbPicture' style='height:800px;'> "
                            +" <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                            +" </div> " ,pcs[0]);
                        
                  sb1.append(pcs[0]);


                   break;


                 case 2:

                    pcs[0] = String.format("<li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                                        +" <div class='inr' style='height:800px;'> "
                                          +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                                          +" </div> "
                                          +"</li> " ,pcs[0]);
                    pcs[1] = String.format("<li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                                      +" <div class='inr' style='height:800px;'> "
                                          +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                                          +" </div> "
                                          +"</li> " 
                                          +"<div class='remote-area'> "
                                      +" </div> ",pcs[1]);
                        
                  sb1.append(pcs[0]);
                  sb1.append(pcs[1]);
                  


                   break;

                   
                 case 3:
                    
                    pcs[0] = String.format("<li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                             +" <div class='inr' style='height:800px;'> "
                              +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                              +" </div> "
                              +"</li> " ,pcs[0]);
                  pcs[1] = String.format("<li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                          +" <div class='inr' style='height:800px;'> "
                              +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                              +" </div> "
                              +"</li> " 
                              +"<div class='remote-area'> "
                          +" </div> ",pcs[1]);
                  pcs[2] = String.format("<li class='swiper-slide' style='width: 600px;'> "
                          +" <div class='inr' style='height:800px;'> "
                            +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                            +" </div> "
                            +"</li> " 
                            +"<div class='remote-area'> "
                         +" </div> ",pcs[2]);
                   
                  sb1.append(pcs[0]);
                  sb1.append(pcs[1]);
                  sb1.append(pcs[2]);
                  
                  break;      
                   
                  
                 case 4:
                    
                    pcs[0] = String.format("<li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                             +" <div class='inr' style='height:800px;'> "
                              +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                              +" </div> "
                              +"</li> " ,pcs[0]);
                  pcs[1] = String.format("<li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                          +" <div class='inr' style='height:800px;'> "
                              +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                              +" </div> "
                              +"</li> " 
                              +"<div class='remote-area'> "
                          +" </div> ",pcs[1]);
                  pcs[2] = String.format("<li class='swiper-slide' style='width: 600px;'> "
                          +" <div class='inr' style='height:800px;'> "
                            +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                            +" </div> "
                            +"</li> " 
                            +"<div class='remote-area'> "
                         +" </div> ",pcs[2]);
                  pcs[3] = String.format("<li class='swiper-slide' style='width: 600px;'> "
                          +" <div class='inr' style='height:800px;'> "
                             +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                             +" </div> "
                             +"</li> " 
                             +"<div class='remote-area'> "
                         +" </div> ",pcs[3]);
                   
                  sb1.append(pcs[0]);
                  sb1.append(pcs[1]);
                  sb1.append(pcs[2]);
                  sb1.append(pcs[3]);
                  
                  break;   

                
               case 5:
                    
                    pcs[0] = String.format("<li class='swiper-slide swiper-slide-active' style='width: 600px;'> "
                             +" <div class='inr' style='height:800px;'> "
                              +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                              +" </div> "
                              +"</li> " ,pcs[0]);
                  pcs[1] = String.format("<li class='swiper-slide swiper-slide-next' style='width: 600px;'> "
                          +" <div class='inr' style='height:800px;'> "
                              +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                              +" </div> "
                              +"</li> " 
                              +"<div class='remote-area'> "
                          +" </div> ",pcs[1]);
                  pcs[2] = String.format("<li class='swiper-slide' style='width: 600px;'> "
                          +" <div class='inr' style='height:800px;'> "
                            +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                            +" </div> "
                            +"</li> " 
                            +"<div class='remote-area'> "
                         +" </div> ",pcs[2]);
                  pcs[3] = String.format("<li class='swiper-slide' style='width: 600px;'> "
                          +" <div class='inr' style='height:800px;'> "
                             +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                             +" </div> "
                             +"</li> " 
                             +"<div class='remote-area'> "
                         +" </div> ",pcs[3]);
                  
                  pcs[4] = String.format("<li class='swiper-slide' style='width: 600px;'> "
                          +" <div class='inr' style='height:800px;'> "
                             +"   <img src='%s' alt='img01' class='tempImgSize' style='position:relative;height:799px;'> "
                             +" </div> "
                             +"</li> " 
                             +"<div class='remote-area'> "
                         +" </div> ",pcs[4]);
                   
                  sb1.append(pcs[0]);
                  sb1.append(pcs[1]);
                  sb1.append(pcs[2]);
                  sb1.append(pcs[3]);
                  sb1.append(pcs[4]);
                  
                  break;   
                  }
                  log_img = sb1.toString();
                  dto.setLog_img( log_img);
                  
             dto.setPet_img(rs.getString("pet_img"));
             dto.setNickname(rs.getString("nickname"));
             dto.setLog_date(rs.getString("log_date")); 
             
             
              for( int i = 0 ; i< words.length ; i++){
                      if( words[i].startsWith("#")){
                            words[i] = String.format("<a href='#' style='color:#669aff'>%s </a>", words[i]);
                          
                         }else{
                            words[i] = String.format("<span>%s</span>&nbsp", words[i]);
                         }
                       sb.append(words[i]);
                     }
                     
             log_content = sb.toString(); 
             dto.setLog_content(log_content);
                 
             dto.setLog_like(rs.getInt("log_like"));
             dto.setLog_cmt(rs.getInt("log_cmt"));
             dto.setMem_code(rs.getInt("mem_code"));
             
         }
          
       } finally {
         JdbcUtil.close(pstmt);
          JdbcUtil.close(rs);
      }//finally
      
      return dto;
    }
    
	
} // class
