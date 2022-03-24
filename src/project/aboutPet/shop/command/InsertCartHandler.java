package project.aboutPet.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;

public class InsertCartHandler  implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String pitem_code = request.getParameter("item_code");
		String pTotalCnt = request.getParameter("totalCnt");
		String pMem_code = request.getParameter("mem_code");
		
		int item_code = pitem_code==null?0:Integer.parseInt(pitem_code);
		int mem_code = pMem_code==null?0:Integer.parseInt(pMem_code);
		int totalCnt = pTotalCnt==null?0:Integer.parseInt(pTotalCnt);
		
		request.setAttribute("item_code", item_code);
		request.setAttribute("mem_code", mem_code);
		request.setAttribute("totalCnt", totalCnt);
		
		return "insertCart";
	}
	

}
