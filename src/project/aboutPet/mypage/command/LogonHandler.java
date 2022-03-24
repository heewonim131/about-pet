package project.aboutPet.mypage.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;

import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.PetDTO;
import project.aboutPet.mypage.service.LogonService;
import project.aboutPet.mypage.service.MemberService;

public class LogonHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		LogonService service =LogonService.getInstance();
		MemberDTO member = service.select(id);
		
		if (member==null) {
			request.setAttribute("member", null);
			request.setAttribute("id", id);
			request.setAttribute("passwd", passwd);

			return "logon";
			 
			
		}
		request.setAttribute("member", member);
		request.setAttribute("id", id);
		request.setAttribute("passwd", passwd);
		
		return "logon";
	
	
	}

}
