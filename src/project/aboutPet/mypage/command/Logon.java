package project.aboutPet.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.service.LogonService;

public class Logon implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		LogonService service =LogonService.getInstance();
		MemberDTO member = service.select(id);
		

		System.out.println(id);
		request.setAttribute("member", member);
		request.setAttribute("id", id);
		request.setAttribute("passwd", passwd);

		System.out.println(id);
		return "logon";
	
	
	}

}
