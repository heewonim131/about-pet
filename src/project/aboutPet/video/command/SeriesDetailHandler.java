package project.aboutPet.video.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.video.model.videoDTO;
import project.aboutPet.video.service.videoService;

public class SeriesDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println(">>> " );
		
		int s_code = Integer.parseInt(request.getParameter("s_code"));
		int s_season = Integer.parseInt(request.getParameter("s_season"));
		//int v_code = Integer.parseInt(request.getParameter("v_code"));
		//여기서 문제 발생	v_code를 아예 없애야 하나? 그럼 같은 페이지의 시리즈별 영상 가져오는 건 어떻게 하지?
		
		//시리즈 sidto, 시리즈별 영상 svlist
		videoService siservice = videoService.getInstance();
		videoDTO sidto = siservice.seriesInfo(s_code, s_season);
		
		videoService svservice = videoService.getInstance();
		List<videoDTO> svlist = svservice.seriesVideos(s_code, s_season);
		
		
		request.setAttribute("sidto", sidto);  //이 이름으로 객체를 보내겠다-> 시리즈 상세도 같은 이름으로 받아야 함
		request.setAttribute("svlist", svlist); 
		
		//return 주소
		return "series_detail";

	}

}
