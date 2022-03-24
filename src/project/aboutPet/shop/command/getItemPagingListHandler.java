package project.aboutPet.shop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.ItemListService;
import project.aboutPet.controller.CommandHandler;


public class getItemPagingListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String lcate_code = request.getParameter("lcate_code");
		String mcate_code = request.getParameter("mcate_code") == null ? "13" : request.getParameter("mcate_code");
		String page = request.getParameter("page");
		
		request.setAttribute("lcate_code", lcate_code);
		request.setAttribute("mcate_code", mcate_code);
		request.setAttribute("page", page);
		
		int mem_code = request.getParameter("mem_code") == null ? 0 : Integer.parseInt(request.getParameter("mem_code"));
	
		ItemListService service = ItemListService.getInstance();
		
		if (mem_code != 0) {
			List<ShopDTO> zzim = service.selectMemZzim(mem_code);
			request.setAttribute("zzim", zzim);
		}
		
		System.out.println(lcate_code);
		System.out.println(mcate_code);
		System.out.println(page);
		
		return "getItemPagingList";
	}

}
