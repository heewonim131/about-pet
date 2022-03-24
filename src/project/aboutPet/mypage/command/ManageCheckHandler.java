package project.aboutPet.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.service.ManageCheckService;

public class ManageCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		int mem_code = (int) session.getAttribute("num");
		
		String pPwd = request.getParameter("pwd");
		
		ManageCheckService checkService = ManageCheckService.getInstance();
		String oPwd = checkService.checkPwd(mem_code);
		
		if(oPwd.equals(pPwd)) {
			return "manageDetail";
		}
		
		return "fail";
		
	}

}
