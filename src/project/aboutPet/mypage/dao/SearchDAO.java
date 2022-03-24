package project.aboutPet.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;
import com.util.JdbcUtil;

import project.aboutPet.mypage.model.SearchDTO;

public class SearchDAO {

	private static SearchDAO dao = null;
	private SearchDAO() {}
	public static SearchDAO getInstance() {
		if (dao==null) {
			dao = new SearchDAO();
		}
		return dao;
	}
	
	//로그 검색 결과 갯수
	   public ArrayList<Integer> searchLog(Connection con, String s_word) {
	   ArrayList<Integer>cntLog=new ArrayList<Integer>();
	      
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      String sql="SELECT  ( " + 
	            "        SELECT COUNT(*) " + 
	            "        FROM   member " + 
	            "        where regexp_like(nickname,'"+s_word+"','i')" + 
	            "        ) AS count1," + 
	            "        ( " + 
	            "        SELECT COUNT(*) " + 
	            "        FROM   pet_log " + 
	            "       where regexp_like(log_content,'"+s_word+"','i') " + 
	            "        ) AS count2 " + 
	            "  FROM    dual ";
	      
	  try{      
	            
	            pstmt = con.prepareStatement(sql);
	            rs = pstmt.executeQuery();
	            while( rs.next() ){
	         int cntFriend=rs.getInt("count1");
	         int cntLogContent=rs.getInt("count2");
	         cntLog.add(cntFriend);
	         cntLog.add(cntLogContent);
	            
	            
	            }
	            
	         }catch(Exception e){
	            e.printStackTrace();
	         }finally{
	            JdbcUtil.close(rs);
	            JdbcUtil.close(pstmt);
	            JdbcUtil.close(con);
	         } // try
	      
	      return cntLog;
	   }
	
	
	//브랜드 검색결과
	public ArrayList<String> searchBrand(Connection con,String s_word)throws SQLException{

		ArrayList<String>brandList=new ArrayList<String>();
		String brandName=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		   String sql = " SELECT br_name  " + 
					" FROM brand  " + 
					" where regexp_like(br_name, '"+s_word+"' ,'i') ";
		   
		     
		   try{      
		      
		      pstmt = con.prepareStatement(sql);
		      rs = pstmt.executeQuery();
		      while( rs.next() ){
			brandName=rs.getString("br_name");
			brandList.add(brandName);
		      
		      
		      }
		      
		   }catch(Exception e){
		      e.printStackTrace();
		   }finally{
		      JdbcUtil.close(rs);
		      JdbcUtil.close(pstmt);
		      JdbcUtil.close(con);
		   } // try
		
		
		return brandList;
		
	}
	
	
	
	//상품 개수 가져오기 
	public int searchItem(Connection con,String s_word,int Lcate_code) throws SQLException{
		int cntItem=0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		   String sql =
		   		"SELECT count(*) cntItem " + 
		   		"				 FROM item i LEFT OUTER JOIN item_sale s ON i.item_code = s.item_code    " + 
		   		"				 			  LEFT OUTER JOIN scate s ON i.scate_code = s.scate_code   " + 
		   		"				            LEFT OUTER JOIN mcate m ON s.mcate_code = m.mcate_code  " + 
		   		"				             LEFT OUTER JOIN lcate l ON m.lcate_code = l.lcate_code   " + 
					" where (regexp_like(item_name, '"+s_word+"' ,'i') or regexp_like(itag, '"+s_word+"' ,'i')) and l.lcate_code ="+Lcate_code;
		   
		     
		   try{      
		      
		      pstmt = con.prepareStatement(sql);
		      rs = pstmt.executeQuery();
		      while( rs.next() ){
			
			cntItem=rs.getInt("cntItem");
		      
		      
		      }
		      
		   }catch(Exception e){
		      e.printStackTrace();
		   }finally{
		      JdbcUtil.close(rs);
		      JdbcUtil.close(pstmt);
		      JdbcUtil.close(con);
		   } // try
		
		
		return cntItem;
	}
	
	
	
	//검색 순위 가져오기
	public ArrayList<SearchDTO> topSearch (Connection con) throws SQLException{
	      ArrayList<SearchDTO> topList=new ArrayList<SearchDTO>();
	   
	       Statement  stmt = con.createStatement();
	        

	        
	        
	       /* String sql="select distinct t1.s_word, ROW_NUMBER() OVER(ORDER BY t1.count DESC NULLS LAST) rank,ROW_NUMBER() OVER(ORDER BY t2.count desc NULLS LAST ) rank2,t2.count" + 
	              " from( " + 
	              " select distinct s_word, COUNT(*)OVER(PARTITION BY s_word) count " + 
	              " from search  " + 
	              " where trunc(to_date('202106282145','yyyymmddhh24mi'),'hh24')>s_time and trunc(to_date('202106282145','yyyymmddhh24mi'),'dd')<s_time)t1,  " + 
	              " (  " + 
	              " select distinct s_word, COUNT(*)OVER(PARTITION BY s_word) count  " + 
	              " from search  " + 
	              " where trunc(to_date('202106282145','yyyymmddhh24mi')-1/24,'hh24')>s_time and trunc(to_date('202106282145','yyyymmddhh24mi'),'dd')<s_time)t2  " + 
	              " where t1.s_word=t2.s_word(+)  " + 
	              " order by rank ";*/
	        
	       String sql=" select distinct t1.s_word, ROW_NUMBER() OVER(ORDER BY t1.count DESC NULLS LAST) rank,ROW_NUMBER() OVER(ORDER BY t2.count desc NULLS LAST ) rank2  " + 
	                 " from( " + 
	                 " select distinct s_word, COUNT(*)OVER(PARTITION BY s_word) count " + 
	                 " from search  " + 
	                 " where trunc(sysdate)>s_time and trunc(to_date('20210627','yyyymmdd'))<s_time)t1,  " + 
	                 " (  " + 
	                 " select distinct s_word, COUNT(*)OVER(PARTITION BY s_word) count  " + 
	                 " from search  " + 
	                 " where trunc(to_date('20210629','yyyymmdd'))>s_time and trunc(to_date('20210628','yyyymmdd'))<s_time)t2  " + 
	                 " where t1.s_word=t2.s_word(+)  " + 
	                 " order by rank ";
	        
	        
	        ResultSet rs =  stmt.executeQuery(sql);

	        //String data = "<
	        
	        
	        while(rs.next()){
	           SearchDTO dto=new SearchDTO();
	           String s_word = rs.getString("s_word");
	            int rank=rs.getInt("rank");//현재 랭크
	           int rank2=rs.getInt("rank2");//1시간전 랭크
	                            
	           dto.setS_word(s_word);
	          dto.setChangedRank(rank2-rank);
	          // dto.setRank1(rank);
	         //  dto.setRank2(rank2);
	            
	           topList.add(dto);
	            
	           //data +="<li>"+s_word+" / "+ rank+"</li>";
	        }
	       
	      
	      return topList;
	   }
	
		//영상
	   public ArrayList<Integer> searchVideo(Connection con, String s_word) {
	      ArrayList<Integer>cntVideo=new ArrayList<Integer>();
	         
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         
	         String sql="SELECT  ( " + 
	               "        SELECT COUNT(*) " + 
	               "        FROM   series " + 
	               "        where regexp_like(s_name,'"+s_word+"','i') or  regexp_like(s_desc,'"+s_word+"','i') " + 
	               "        ) AS countS," + 
	               "        ( " + 
	               "        SELECT COUNT(*) " + 
	               "        FROM   video " + 
	               "       where regexp_like(v_name,'"+s_word+"','i') or regexp_like(v_content,'"+s_word+"','i') " + 
	               "        ) AS countV " + 
	               "  FROM    dual ";
	         
	         
	     try{      
	               
	               pstmt = con.prepareStatement(sql);
	               rs = pstmt.executeQuery();
	               while( rs.next() ){
	            int cntS=rs.getInt("countS");
	            int cntV=rs.getInt("countV");
	            cntVideo.add(cntS);
	            cntVideo.add(cntV);
	               
	               
	               }
	               
	            }catch(Exception e){
	               e.printStackTrace();
	            }finally{
	               JdbcUtil.close(rs);
	               JdbcUtil.close(pstmt);
	               JdbcUtil.close(con);
	            } // try
	         
	         return cntVideo;
	      }

	
}
