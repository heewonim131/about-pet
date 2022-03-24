package project.aboutPet.log.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.log.model.LogDTO;
import project.aboutPet.log.service.PetListMemService;

public class PetMemListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int mem_code = Integer.parseInt(request.getParameter("mem_code"));
		int log_code = Integer.parseInt(request.getParameter("log_code"));;
		int mf_code = mem_code;
		
		//서비스 객체 생성 
		PetListMemService service = PetListMemService.getInstance();
		List<LogDTO> petloglist = service.selectMemLogList(mem_code);
		
		//
		List<LogDTO> cmtlist = service.cmtList(log_code);
		LogDTO select_MemLog = service.selectMemLog(mem_code, mf_code);

		
		request.setAttribute("petloglist", petloglist);
		
		//
		request.setAttribute("cmtlist", cmtlist);
		request.setAttribute("select_MemLog", select_MemLog);

		return "petMemlog";
	}

}