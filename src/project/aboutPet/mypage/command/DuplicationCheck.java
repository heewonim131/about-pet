package project.aboutPet.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;

public class DuplicationCheck implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		
		return "duplicationCheck";
	}

}
