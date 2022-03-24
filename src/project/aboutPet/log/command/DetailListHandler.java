package project.aboutPet.log.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.log.model.LogDTO;
import project.aboutPet.log.service.DetailListService;


public class DetailListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {


		int log_code = Integer.parseInt(request.getParameter("log_code"));


		//서비스객체 생성
		DetailListService detailListService = DetailListService.getInstance();
		LogDTO dto = DetailListService.select(log_code);
		List<LogDTO> cmtlist = DetailListService.cmtList(log_code);


		request.setAttribute("dto", dto);
		request.setAttribute("cmtlist", cmtlist);

		// return "/aboutPet/detailpetlog.jsp";  //log붙ㅇ
		return "detailpetlog";
	}

}