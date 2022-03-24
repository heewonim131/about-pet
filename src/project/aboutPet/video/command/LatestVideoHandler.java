package project.aboutPet.video.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.video.model.videoDTO;
import project.aboutPet.video.service.videoService;

public class LatestVideoHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		videoService service = videoService.getInstance();
		List<videoDTO> llist = service.latestList();
		
		request.setAttribute("llist", llist);
		return "latest_total";
		
	}

}
