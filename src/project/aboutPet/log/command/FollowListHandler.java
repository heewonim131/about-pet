package project.aboutPet.log.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.log.model.LogDTO;
import project.aboutPet.log.service.FollowListService;

public class FollowListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int mem_code = Integer.parseInt(request.getParameter("mem_code"));
		
		int mf_code = mem_code;
		
		FollowListService service = FollowListService.getInstance();
		LogDTO follow_Page = service.followPage(mem_code, mf_code);
		List<LogDTO> follow_List = service.followList(mf_code, mem_code);
		List<LogDTO> following_List = service.followingList(mem_code);
		
		
		request.setAttribute("follow_Page", follow_Page);
		request.setAttribute("follow_List", follow_List);
		request.setAttribute("following_List", following_List);
		
		return "followlist";
	}
	
	
	
}
