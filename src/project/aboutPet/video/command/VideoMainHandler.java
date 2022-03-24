package project.aboutPet.video.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.video.model.EduDTO;
import project.aboutPet.video.model.videoDTO;
import project.aboutPet.video.service.EduService;
import project.aboutPet.video.service.videoService;

public class VideoMainHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println(">>> " );
		
		//검은배너 blist
		videoService bservice = videoService.getInstance();
		List<videoDTO> blist = bservice.blackBanner();
		
		//신규 llist, 인기 plist, 추천 rslist
		videoService lservice = videoService.getInstance();
		List<videoDTO> llist = lservice.latestList();
		
		videoService pservice = videoService.getInstance();
		List<videoDTO> plist = pservice.popuList();
		
		videoService rsservice = videoService.getInstance();
		List<videoDTO> rslist = rsservice.rcmdsList();
		
		request.setAttribute("blist", blist); 
		request.setAttribute("llist", llist); 
		request.setAttribute("plist", plist); 
		request.setAttribute("rslist", rslist); 
		
		
		EduService service = EduService.getInstance();
		List<EduDTO>Edu_list = service.eduList();
		
		request.setAttribute("Edu_list", Edu_list );
		
		//return 주소
		return "tv_main";
		
		
		/*
		 * ListService service = ListService.getInstance();
		List<AboutPetDTO> list = service.select();
	
		request.setAttribute("list", list);
		return "/aboutPet/list.jsp";
		 * 
		 * */
	}

}
