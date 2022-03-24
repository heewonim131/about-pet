package project.aboutPet.log.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.log.model.LogDTO;
import project.aboutPet.log.service.MyPetLogService;

public class MyPetLogHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int mem_code = Integer.parseInt(request.getParameter("mem_code"));
		int mf_code = mem_code;

		// 서비스 객체 생성
		MyPetLogService service = MyPetLogService.getInstance();
		LogDTO select_MemLog = service.selectMemLog(mem_code, mf_code);
		List<LogDTO> logImg_List = service.logImgList(mem_code);


		request.setAttribute("select_MemLog", select_MemLog);
		request.setAttribute("logImg_List", logImg_List);

		return "myPetlog";
	}



}
