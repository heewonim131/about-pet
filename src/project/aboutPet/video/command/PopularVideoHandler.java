package project.aboutPet.video.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.video.model.videoDTO;
import project.aboutPet.video.service.videoService;

public class PopularVideoHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		videoService service = videoService.getInstance();
		List<videoDTO> plist = service.popuList();
		
		request.setAttribute("plist", plist);
		return "popu_total";
		
	}

}
