package project.aboutPet.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;

public class InsertQnaHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pItem_code = String.valueOf(request.getParameter("item_code"));
		String pMem_code =  String.valueOf(request.getParameter("mem_code"));
		String iqrContent =  (String) request.getParameter("iqrContent");
		String hiddenYn =  (String) request.getParameter("hiddenYn");
		String rplAlmRcvYn =  (String) request.getParameter("rplAlmRcvYn");
		
		
		
		request.setAttribute("pItem_code", pItem_code);
		request.setAttribute("pMem_code", pMem_code);
		request.setAttribute("iqrContent", iqrContent);
		request.setAttribute("hiddenYn", hiddenYn);
		request.setAttribute("rplAlmRcvYn", rplAlmRcvYn);
		
		return "insertQna";
	}

}
