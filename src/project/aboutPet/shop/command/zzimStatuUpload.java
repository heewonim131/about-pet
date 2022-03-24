package project.aboutPet.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;

public class zzimStatuUpload implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("post")) {
			
			
		}else if(request.getMethod().equalsIgnoreCase("GET")){
			
			
		}
		
		
		
		return null;
	}
	
}
