package project.aboutPet.video.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.video.model.videoDTO;
import project.aboutPet.video.service.videoService;

public class VideoDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println(">>> " );
		
		
		int s_code = Integer.parseInt(request.getParameter("s_code"));
		int s_season = Integer.parseInt(request.getParameter("s_season")); 
		int v_code = Integer.parseInt(request.getParameter("v_code"));
		
		//시리즈별 영상 svlist
		videoService svservice = videoService.getInstance();
		List<videoDTO> svlist = svservice.seriesVideos(s_code, s_season); 
		
		//영상재생 pvdto
		videoService pvservice = videoService.getInstance();
		videoDTO pvdto = pvservice.playVideo(v_code);
		
		request.setAttribute("svlist", svlist); 
		request.setAttribute("pvdto", pvdto); 
		
		//return 주소
		return "video_detail";
	}

}
