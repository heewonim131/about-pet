package project.aboutPet.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;


public class zzimHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String item_code = request.getParameter("item_code");
		String zzimcheck = request.getParameter("zzimcheck");
		String mem_code = request.getParameter("mem_code");
		
		request.setAttribute("item_code", item_code);
		request.setAttribute("zzimcheck", zzimcheck);
		request.setAttribute("mem_code", mem_code);
		
		System.out.println(item_code);
		System.out.println(zzimcheck);
		System.out.println(mem_code);
		
		return "zzimAjax";
	}

}
