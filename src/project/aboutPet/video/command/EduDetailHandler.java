package project.aboutPet.video.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.video.model.EduDTO;
import project.aboutPet.video.service.EduDetailService;

import project.aboutPet.controller.CommandHandler;

public class EduDetailHandler implements CommandHandler {

	private String edu_title;

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		edu_title = request.getParameter("edu_title");
		EduDetailService detailservice = EduDetailService.getInstance();
		List<EduDTO> elist = detailservice.EduDetail_list(edu_title);
		
		
		request.setAttribute("elist",elist);
		request.setAttribute("edu_title",edu_title);
		System.out.println(elist+"elist");
		
		return "edu_sub";
		
		
		
		
	}
	

}
