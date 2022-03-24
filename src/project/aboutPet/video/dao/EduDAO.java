 package project.aboutPet.video.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import project.aboutPet.video.model.EduDTO;

public class EduDAO {

	private static EduDAO dao = null;
	private EduDAO() {}
	public static EduDAO getInstance() {
		if(dao == null) {
			dao = new EduDAO();
		}
		return dao;
	}
	/*
	// 펫스쿨 미리보기
	public List<EduDTO> PeteduList(Connection con) throws SQLException {
		 String sql ="";
		 
		 ArrayList<EduDTO> list = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
					if(rs.next()) {
						list = new ArrayList<EduDTO>();
						EduDTO pdto = null;
						do {
							pdto = new EduDTO();
							// 이미지, 교육 이름
							pdto.setPet_cate(rs.getString("pet_cate")); // 펫 카테고리
							pdto.setEdu_title(rs.getString("edu_title")); // 영상제목
							pdto.setV_img(rs.getString("v_img")); // 영상 이미지
						list.add(pdto);
					}while( rs.next());
				}
			}finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);			
			}// finally
			return list;
		}// 
		*/				
	// 팻스쿨 메인
	//하나만 선택이 아니라 전체보기니까 selectList에서 하나 선택하는 것만이 아닌건가??
	//eduvideo 데이터 하나 본 것
	// count는 public int 함수 이름
	public List<EduDTO> eduList(Connection con) throws SQLException {
		// 이 쿼리는 어떻게 해야할 까?
		// 쿼리 바꾸기 
		
	    String sql = "select A.PET_CATE, A.EDU_CATE, A.EDU_TITLE, A.EDU_DIFF , C.V_IMG "+
	    	    "from PET_EDU a  "+
	    	    "join (select EV.EDU_CODE, min(EV.V_CODE) V_CODE from EDU_VIDEO EV "+
	    	    " group by EV.EDU_CODE) B "+
	    	    "on  A.EDU_CODE = B.EDU_CODE "+
	    	    "join VIDEO c "+
	    	    "on C.V_CODE = B.V_CODE ";
		
		
		/*
		String sql = "SELECT A.PET_CATE, A.EDU_CATE, A.EDU_TITLE, A.EDU_DIFF, C.V_IMG " +
					 "FROM PET_EDU A, EDU_VIDEO B, VIDEO C " +
					 "WHERE A.EDU_CODE = B.EDU_CODE " +
					 "AND C.V_CODE = B.V_CODE " +
					 "group by A.PET_CATE, A.EDU_CATE, A.EDU_TITLE,A.EDU_DIFF, C.V_IMG "; // oracle에 추가 
		*/
		/*
		String sql = "SELECT A.EDU_CODE, A.PET_CATE, A.EDU_CATE,A.EDU_TITLE,B.V_CODE,C.V_IMG " +
				     "FROM PET_EDU A, EDU_VIDEO B, VIDEO C "+
				     "WHERE A.EDU_CODE = B.EDU_CODE "+
				     "AND C.V_CODE = B.V_CODE " + 
				     "ORDER BY A.EDU_CODE, B.V_CODE ASC ";
		*/
		
		ArrayList<EduDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				list = new ArrayList<EduDTO>();
				EduDTO dto = null;
				do {
					// 이미지, 제목, 난이도, 교육 분류
					dto = new EduDTO();
					dto.setPet_cate(rs.getString("pet_cate")); // 펫분류
					dto.setEdu_cate(rs.getString("edu_cate")); // 교육분류
					dto.setEdu_diff(rs.getInt("edu_diff")); // 교육난이도	
					dto.setEdu_title(rs.getString("edu_title")); // 영상제목
					dto.setV_img(rs.getString("v_img")); // 영상 이미지
					list.add(dto);
				}while( rs.next());
			}
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);			
		}// finally
		return list;
	}// selectList
	

	// count는 public int 함수 이름
	
//교육 개수
	//public List<EduDTO> eduCountList(Connection con, int edu_cate) {
	public int eduCount(Connection con, String edu_cate) throws SQLException {
		
		// 변수
		// 결과물 -> int변수에 담겠다 (int변수 만들어서 )
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql ="select count(*) cnt22 " + 
				    "from pet_edu " + 
				    "where edu_cate = ? ";
			    
		 try {
			  
			 //sql = sql.replace("$edu_cate", edu_cate);
			   pstmt = con.prepareStatement(sql);
			   System.out.println(sql+"sql");
			   // 변수설정
			  pstmt.setString(1, edu_cate);
			  //pstmt.setInt(1, cnt1);
			  rs = pstmt.executeQuery();
			  System.out.println(rs+"rs");
			  //rs = pstmt.executeQuery();
			  if(rs.next()) {
				 
				  cnt = rs.getInt("cnt22");
				  
			  }
		 } finally {
				JdbcUtil.close(pstmt);
			}//finally
		System.out.println(cnt);	
		 
			return cnt;
	}


// 회원이 들은 학습완료한 개수
	
public int memCount(Connection con, int mem_code, String edu_cate) throws SQLException {
	
	// 변수
	// 결과물 -> int변수에 담겠다 (int변수 만들어서 )
			  
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;
	
	// 조인으로 
	 String sql = "SELECT COUNT(*) LEARN " +
	              "FROM S_SIMPLE " +
	  		      "WHERE MEM_CODE = ? AND EDU_CATE =? ";
	
	
	 try {
		  pstmt = con.prepareStatement(sql);
		   // 변수설정
		  pstmt.setInt(1, mem_code);
		  pstmt.setString(2, edu_cate);
		  
		  rs = pstmt.executeQuery();
		  
		  //rs = pstmt.executeQuery();
		  if(rs.next()) {
			  cnt = rs.getInt("LEARN");
		  }
	 } finally {
			JdbcUtil.close(pstmt);
		}//finally
		
		return cnt;
}


}		
	