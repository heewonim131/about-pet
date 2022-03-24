package project.aboutPet.mypage.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.PetDTO;
import project.aboutPet.mypage.service.MemberService;
import project.aboutPet.mypage.service.PetService;
import project.aboutPet.controller.CommandHandler;

public class SearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		
	  HttpSession session = request.getSession();
	  
	  if (session.getAttribute("num")==null) {
	    	return "logon_input";
			
		}else {
			int mem_code =(int) session.getAttribute("num");
		
		
		
		//int mem_code =2;

		// 서비스 객체 생성
		MemberService mservice = MemberService.getInstance();
		//MemberDTO memberDTO = mservice.select(mem_code);
		
		
		PetService pservice = PetService.getInstance();
		List<PetDTO> petlist = pservice.select(mem_code);
		
		//MemberDTO tvMark = mservice.tvMark(mem_code);
		//MemberDTO logMark = mservice.logMark(mem_code);
		//MemberDTO itemMark = mservice.itemMark(mem_code);
		
		// request, session 저장
		//request.setAttribute("memberDTO", memberDTO);
		
		request.setAttribute("petlist", petlist);
		//request.setAttribute("tvMark", tvMark);
		//request.setAttribute("logMark", logMark);
		//request.setAttribute("itemMark", itemMark);
		
		
		return "myPage";
	}
	}
}
