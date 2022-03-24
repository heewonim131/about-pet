package project.aboutPet.log.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.log.model.LogDTO;
import project.aboutPet.log.service.LogService;

// MV[C] 핸들러
public class LogHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int log_code = 20; // Integer.parseInt(request.getParameter("log_code"));
		int mem_code = 1;
		
		// 서비스 객체 생성
		LogService service = LogService.getInstance();
		List<LogDTO> loglist = service.selectLog();
		List<LogDTO> cmtlist = service.cmtList(log_code);
		LogDTO like_StateUs = service.likeStateUs(log_code, mem_code);
	    
	    // request, session 저장
	    request.setAttribute("loglist", loglist);
	    request.setAttribute("cmtlist", cmtlist);
	    request.setAttribute("like_StateUs", like_StateUs);
	    
		// return "/jspPro/aboutPet/log/log.jsp";
		return "log";
	}

}
