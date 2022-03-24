package project.aboutPet.shop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.ItemListService;
import project.aboutPet.shop.service.indexNewCategoryService;
import project.aboutPet.controller.CommandHandler;

public class getNewGoodsListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		Integer mcate = (Integer) request.getAttribute("mcate");
		request.setAttribute("mcate", mcate);
		 ItemListService service2 = ItemListService.getInstance();
		 
		int mem_code = 0;
	      HttpSession session = request.getSession();
	      if (session.getAttribute("num") != null)
	         mem_code = (int) session.getAttribute("num");
	      
	      if (mem_code != 0) {         
	         List<ShopDTO> zzim = service2.selectMemZzim(mem_code);
	         request.setAttribute("zzim", zzim);
	      }
		
		System.out.println("handler");
		
		return "getNewGoodsListAjax";
	}
	
}
