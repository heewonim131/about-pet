package project.aboutPet.video.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import project.aboutPet.video.model.EduDTO;

public class EduDetailDAO {

	private static EduDetailDAO dao = null;
	private EduDetailDAO () {}
	public static EduDetailDAO getInstance() {
		if(dao == null) {
			dao = new EduDetailDAO();
		}
		return dao;
	}
	// 작은 소제목들을 뽑아야 하고
		// 기다려 -> 작은 쿼리 줘서 리스트로 받기
		// 쿼리짜고, 스크립트 onclick 함수 -> 함수명, 매개변수 ${list.edutitle  }을 받는 함수 만들고
		// 함수 내용에는 스크립트 선언 -> '핸들러 페이지명.do?edutitle=' + 매개변수에 따라서 계속 바뀌게 함수 선언하고 (jsp)
		// 핸들러 만들고 핸들러 안에서 
		public List<EduDTO>EduDetail_list(Connection con, String edu_title) throws SQLException {
			
			String sql = "SELECT P.EDU_TITLE, P.EDU_DIFF, P.EDU_READY,V.V_VIDEO, V.V_NAME, V.V_CONTENT "+
				         "from PET_EDU P "+
				         "join (select EV.EDU_CODE, min(EV.V_CODE) V_CODE from EDU_VIDEO EV "+
				         "group by EV.EDU_CODE) B "+
				         "on P.EDU_CODE = B.EDU_CODE "+ 
				         "join VIDEO V "+
				         "on V.V_CODE = B.V_CODE " +
				         "where P.EDU_TITLE= '"+edu_title+"' ";
			
			/*
			String sql ="select edu_title, edu_diff, edu_ready, edu_tip, v_video, v_name, v_content, edu_tip " + 
					    "from s_search " + 
					    "where edu_title = ? " + 
					    "group by edu_code, v_code, edu_title, edu_diff, edu_ready, edu_tip, v_video, v_name, v_content, edu_tip   " + 
					    "order by v_code " ;  
			*/	
					        // v_name로 불러와서
			                // 제목에 맞게 보여주려고 하는데
			                // where v_name = ?
			
			
			ArrayList<EduDTO> list = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				pstmt = con.prepareStatement(sql);
				
				// 변수 설정
				//pstmt.setString(1, edu_title); // ? 설정(조건절), 
				System.out.println(edu_title +"edu_title");
				System.out.println(pstmt+"sql");
				rs = pstmt.executeQuery();

				if(rs.next()) {
					list = new ArrayList<EduDTO>();
					EduDTO eduDTO = null;
					do {
						eduDTO = new EduDTO();
						
						eduDTO.setEdu_diff(rs.getInt("edu_diff")); // 난이도
						eduDTO.setEdu_title(rs.getString("edu_title")); //
						eduDTO.setEdu_ready(rs.getString("edu_ready")); // 준비물
						//eduDTO.setEdu_tip(rs.getString("edu_tip")); // 준비물
						eduDTO.setV_video(rs.getString("v_video")); // 영상
						eduDTO.setV_name(rs.getString("v_name")); // 영상이름 : 기다려에 해당하는 영상들 -> title로 가져오기
						eduDTO.setV_content(rs.getString("v_content")); // 영상내용
					
						list.add(eduDTO);
						
						System.out.println(list+"list");
					} while (rs.next());			
				}	
					// 영상
					// 교육소개
					// 난이도
					// 준비물
					
				}finally {
					JdbcUtil.close(pstmt);
					JdbcUtil.close(rs);
			} // finally
			return list;
		} //selectVidao	
	
		}
