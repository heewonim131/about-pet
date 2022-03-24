package project.aboutPet.video.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.video.model.videoDTO;
import project.aboutPet.video.service.videoService;

public class RcmdSeriesHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		videoService service = videoService.getInstance();
		List<videoDTO> rslist = service.rcmdsList();
		
		request.setAttribute("rslist", rslist);
		return "rcmd_total";
		
		
		/*
		 * ListService service = ListService.getInstance();
		List<AboutPetDTO> list = service.select();
		
		
		request.setAttribute("list", list);
		return "/aboutPet/list.jsp";
		 * 
		 * */
	}

}
