package project.aboutPet.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;

public class MemberPointHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pMem_code = request.getParameter("mem_code");
		
		
		request.setAttribute("pMem_code", pMem_code);
		return "selectPoint";
	}

}
