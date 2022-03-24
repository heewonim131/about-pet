package project.aboutPet.mypage.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.TvDTO;
import project.aboutPet.mypage.model.PetDTO;
import project.aboutPet.mypage.service.MemberService;
import project.aboutPet.mypage.service.MyRecentTvService;
import project.aboutPet.mypage.service.MyPetListService;

public class MyPageHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		  
		if (session.getAttribute("num")==null) {
			return "logon_input";
			
		} else {
			int mem_code = (int) session.getAttribute("num");
		
			// 서비스 객체 생성
			MemberService mservice = MemberService.getInstance();
			MemberDTO memberDTO = mservice.selectMember(mem_code);
			
			// 마이펫 관리
			MyPetListService myPetListService = MyPetListService.getInstance();
			List<PetDTO> petlist = myPetListService.petList(mem_code);
			
			// 찜 갯수
			int tvMark = mservice.markCnt(mem_code, "VIDEO_MARK");
			int logMark = mservice.markCnt(mem_code, "LOG_MARK");
			int itemMark = mservice.markCnt(mem_code, "ITEM_MARK");
			
			// 최근 본 영상
			MyRecentTvService myRecentTvService = MyRecentTvService.getInstance();
			List<TvDTO> mtlist = myRecentTvService.recentTv(mem_code);
			
			int couponCnt = mservice.couponCnt(mem_code, 0);
			int cartCnt = mservice.cartCnt(mem_code);
	
			// request, session 저장
			request.setAttribute("memberDTO", memberDTO);
			request.setAttribute("petlist", petlist);
			request.setAttribute("tvMark", tvMark);
			request.setAttribute("logMark", logMark);
			request.setAttribute("itemMark", itemMark);
			request.setAttribute("mtlist", mtlist);
			request.setAttribute("couponCnt", couponCnt);
			request.setAttribute("cartCnt", cartCnt);
			
			
			return "myPage";
		}
	}

}
