package project.aboutPet.video.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import project.aboutPet.video.model.videoDTO;

public class videoDAO{

	private static videoDAO dao = null;
	private videoDAO() {}
	public static videoDAO getInstance() {
		if (dao==null) {
			dao = new videoDAO();
		}
		return dao;
	}
	
	//검은 배너
	public List<videoDTO> blackBanner(Connection con) throws SQLException{
		String sql = "SELECT S_IMG, S_NAME, S_DESC, S_CODE, S_SEASON  "
				+ "FROM V_SEARCH "
				+ "WHERE S_CODE IN (1,2) " //원래는 (3, 6, 7, 9, 10)인데 데이터가 없어 확인용으로 
				+ "GROUP BY S_IMG, S_NAME, S_DESC, S_CODE, S_SEASON ";
		
		ArrayList<videoDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<videoDTO>();
				videoDTO bbdto = null;
				do {
					bbdto =  new videoDTO();
					bbdto.setS_img(rs.getString("s_img"));
					bbdto.setS_name(rs.getString("s_name"));
					bbdto.setS_desc(rs.getString("s_desc"));
					bbdto.setS_code(rs.getInt("s_code"));
					bbdto.setS_season(rs.getInt("s_season"));
					
					list.add(bbdto);
				} while ( rs.next() );
			} 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} 
		return list;
	} //blackBanner
	
	//오늘 뭐볼까? 시리즈추천
	public List<videoDTO> rcmdsList(Connection con) throws SQLException{
		String sql = "SELECT DISTINCT S_NAME, S_IMG, C_IMG, S_CODE, S_SEASON "
				   + "FROM SERIES "
				   + "ORDER BY S_NAME ";
		
		ArrayList<videoDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<videoDTO>();
				videoDTO rcsdto = null;
				do {
					rcsdto =  new videoDTO();
					rcsdto.setS_img(rs.getString("s_img"));
					rcsdto.setS_name(rs.getString("s_name"));
					rcsdto.setC_img(rs.getString("c_img"));
					rcsdto.setS_code(rs.getInt("s_code"));
					rcsdto.setS_season(rs.getInt("s_season"));
					
					list.add(rcsdto);
				} while ( rs.next() );
			} 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} 
		return list;
	} //rcmdsList
	
	//인기영상
	public List<videoDTO> popuList(Connection con) throws SQLException{
		String sql = "SELECT V_NAME, V_IMG, S_NAME, C_IMG, V_TIME, S_CODE, S_SEASON, V_CODE, COUNT(*) AS V_LIKE "
				+ "FROM V_SEARCH "
				+ "GROUP BY V_NAME, V_IMG, S_NAME, C_IMG, V_TIME, S_CODE, S_SEASON, V_CODE "
				+ "ORDER BY V_LIKE DESC ";
		
		ArrayList<videoDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<videoDTO>();
				videoDTO pdto = null;
				do {
					pdto =  new videoDTO();
					pdto.setV_name(rs.getString("v_name"));
					pdto.setV_img(rs.getString("v_img"));
					pdto.setS_name(rs.getString("s_name"));
					pdto.setC_img(rs.getString("c_img"));
					pdto.setV_time(rs.getString("v_time"));
					pdto.setV_like(rs.getInt("v_like"));
					pdto.setV_code(rs.getInt("v_code"));
					pdto.setS_code(rs.getInt("s_code"));
					pdto.setS_season(rs.getInt("s_season"));
					
					list.add(pdto);
				} while ( rs.next() );
			} 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} 
		return list;
	} //popuList
	
	
	//신규영상
	public List<videoDTO> latestList(Connection con) throws SQLException{
		String sql = "SELECT V_IMG, V_NAME, C_IMG, V_DATE, V_TIME, S_NAME, COUNT(*) AS V_LIKE "
				   + "FROM V_SEARCH "
				   + "GROUP BY V_IMG, V_NAME, C_IMG, V_DATE, V_TIME, S_NAME "
				   + "ORDER BY V_DATE DESC ";
		
		ArrayList<videoDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<videoDTO>();
				videoDTO lvdto = null;
				do {
					lvdto =  new videoDTO();
					
					lvdto.setV_img(rs.getString("v_img"));
					lvdto.setV_name(rs.getString("v_name"));
					lvdto.setS_name(rs.getString("s_name"));
					lvdto.setC_img(rs.getString("c_img"));
					lvdto.setV_date(rs.getString("v_date"));
					lvdto.setV_time(rs.getString("v_time"));
					lvdto.setV_like(rs.getInt("v_like"));
					
					list.add(lvdto);
				} while ( rs.next() );
			} // 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally
		return list;
	} // latestList
	
	
	//시리즈별 설명 	?s_code=번호&s_season=번호
	public videoDTO seriesInfo(Connection con, int s_code, int s_season) throws SQLException{
		String sql = "SELECT C_IMG, S_NAME, S_IMG, S_DESC, S_SEASON "
				   + "FROM V_SEARCH "
				   + "WHERE S_CODE=? AND S_SEASON=?"
				   + "GROUP BY C_IMG, S_NAME, S_IMG, S_DESC, S_SEASON ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		videoDTO sidto = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, s_code); //첫번째 ?
			pstmt.setInt(2, s_season); //
			
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
					sidto =  new videoDTO();
					sidto.setC_img(rs.getString("c_img"));
					sidto.setS_name(rs.getString("s_name"));
					sidto.setS_img(rs.getString("s_img"));
					sidto.setS_desc(rs.getString("s_desc"));
					sidto.setS_season(rs.getInt("s_season"));
			} // 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} 
		return sidto;
	} // seriesInfo
	
	
	//시리즈에 따른 영상목록 		
	public List<videoDTO> seriesVideos(Connection con, int s_code, int s_season) throws SQLException{
		String sql = "SELECT V_VIDEO, V_IMG, V_NAME, S_NAME, C_IMG, V_TIME, V_DATE, V_CONTENT, V_CODE, S_CODE, S_SEASON "
				   + "FROM V_SEARCH "
				   + "WHERE S_CODE=? AND S_SEASON=? "
				   + "GROUP BY V_VIDEO, V_IMG, V_NAME, S_NAME, C_IMG, V_TIME, V_DATE, V_CONTENT ,V_CODE, S_CODE, S_SEASON ";
		
		ArrayList<videoDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, s_code); 
			pstmt.setInt(2, s_season); 
			rs = pstmt.executeQuery();
			
			if ( rs.next() ) {
				list = new ArrayList<videoDTO>();
				videoDTO svdto = null;
				do {
					svdto =  new videoDTO();
					svdto.setV_video(rs.getString("v_video"));
					svdto.setV_img(rs.getString("v_img"));
					svdto.setV_name(rs.getString("v_name"));
					svdto.setV_time(rs.getString("v_time"));
					svdto.setS_name(rs.getString("s_name"));
					svdto.setC_img(rs.getString("c_img"));
					svdto.setV_date(rs.getString("v_date"));
					svdto.setV_content(rs.getString("v_content"));
					svdto.setV_code(rs.getInt("v_code"));
					svdto.setS_code(rs.getInt("S_code"));
					svdto.setS_season(rs.getInt("s_season"));
					
					list.add(svdto);
				} while ( rs.next() );
			} // 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally
		return list;
	} // seriesVideos
	

	//영상 재생
	public videoDTO playVideo(Connection con, int v_code) throws SQLException{
		String sql = "SELECT V_VIDEO, V_IMG, V_NAME, S_NAME, C_IMG, V_TIME, V_DATE, V_CONTENT, S_SEASON "
				   + "FROM V_SEARCH "
				   + "WHERE V_CODE=? "
				   + "GROUP BY V_VIDEO, V_IMG, V_NAME, S_NAME, C_IMG, V_TIME, V_DATE, V_CONTENT, S_SEASON ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		videoDTO pvdto = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, v_code); 
			rs = pstmt.executeQuery();
			
			String v_content;
			String [] words;
			
			if ( rs.next() ) {
				
				v_content = rs.getString("v_content");
				words = v_content.split(" ");
				StringBuilder sb = new StringBuilder();
				
					pvdto =  new videoDTO();
					pvdto.setV_video(rs.getString("v_video"));
					pvdto.setV_img(rs.getString("v_img"));
					pvdto.setV_name(rs.getString("v_name"));
					pvdto.setV_time(rs.getString("v_time"));
					pvdto.setS_name(rs.getString("s_name"));
					pvdto.setC_img(rs.getString("c_img"));
					pvdto.setV_date(rs.getString("v_date"));
					pvdto.setS_season(rs.getInt("s_season"));
					//pvdto.setV_content(rs.getString("v_content")); 
					
					for( int i = 0 ; i< words.length ; i++){
	 					if( words[i].startsWith("#")){
						       words[i] = String.format("<a href='#' style='color:#669aff'>%s </a>", words[i]);
						       // out.println( words[i] + "<br>" );
						    }else{
						      words[i] = String.format("<span>%s&nbsp</span>", words[i]);
					}
	 				    sb.append(words[i]);
	 				  }
	 				  
					v_content = sb.toString(); 
	 				pvdto.setV_content(v_content);		
			} // 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally
		return pvdto;
	} // playVideo
	
	
	
}//videoDAO


