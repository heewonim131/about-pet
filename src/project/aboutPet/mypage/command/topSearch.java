package project.aboutPet.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.service.LogonService;
import project.aboutPet.mypage.service.SignUpService;
import project.aboutPet.controller.CommandHandler;

public class topSearch implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		
		
		
		return "commonSearch";
	}

}
