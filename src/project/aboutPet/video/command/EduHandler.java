package project.aboutPet.video.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.video.model.EduDTO;
import project.aboutPet.video.service.EduCountService;
import project.aboutPet.video.service.EduService;
import project.aboutPet.video.service.MemCountService;

import project.aboutPet.controller.CommandHandler;

public class EduHandler implements CommandHandler {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		
		EduService service = EduService.getInstance();
		List<EduDTO>Edu_list = service.eduList();
		
		request.setAttribute("Edu_list", Edu_list ); // String만 받아올 수 있다.
		//return "edu_main"; // jsp 페이지
	//}
	
	
	
	
	//public class EduCountHandler implements CommandHandler {
	//@Override
	//public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 교육 개수 (전체 교육의 개수)
		EduCountService countservice = EduCountService.getInstance();
		//교육 리스트
		int cnt1 = countservice.eduCountList("기초교육"); // 
		int cnt2 = countservice.eduCountList("사회화교육"); // 
		int cnt3 = countservice.eduCountList("실내놀이"); // 
		int cnt4 = countservice.eduCountList("케어"); // 
		
		request.setAttribute("cnt1",cnt1);
		request.setAttribute("cnt2",cnt2);
		request.setAttribute("cnt3",cnt3);
		request.setAttribute("cnt4",cnt4);
		//${cnt1}
		//리스트.이름 -> 리스트 이름을 뽑아오겠다.
		
		System.out.println(cnt1);
		

			
			// 회원 수 -> 회원 코드
			//어떤 회원이 어떤 영상을 봤다는 것을 보여줌
			
			MemCountService mcountservice = MemCountService.getInstance();
			//  학습완료된 영상 리스트 -> 어떤 회원이 본 영상 리스트
			// 비회원 == null
	       int mlist1 = 0 ;
	       int mlist2 = 0 ;
	       int mlist3 = 0 ;
	       int mlist4 = 0 ;
		
			if (session.getAttribute("num")!= null) {
				// 회원일 때 
				int mem_code = (int) session.getAttribute("num");
				
				mlist1 = mcountservice.memCountList(mem_code,"기초교육");
				mlist2 = mcountservice.memCountList(mem_code, "사회화교육");
				mlist3 = mcountservice.memCountList(mem_code, "실내놀이");
				mlist4 = mcountservice.memCountList(mem_code, "케어");
			}
			
			
			request.setAttribute("mlist1",mlist1);
			request.setAttribute("mlist2",mlist2);
			request.setAttribute("mlist3",mlist3);
			request.setAttribute("mlist4",mlist4);
			
			return "edu_main";
		}


	}

	
