package project.aboutPet.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import project.aboutPet.controller.CommandHandler;

public class CartCntHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String pMem_code = String.valueOf(session.getAttribute("num")) ;
		
		
		request.setAttribute("pMem_code", pMem_code);
		return "cartCnt";
	}
	

}
