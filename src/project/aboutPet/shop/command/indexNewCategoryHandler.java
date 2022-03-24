package project.aboutPet.shop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.ItemDetailService;
import project.aboutPet.shop.service.ItemListService;
import project.aboutPet.shop.service.ShopService;
import project.aboutPet.shop.service.indexNewCategoryService;
import project.aboutPet.controller.CommandHandler;

public class indexNewCategoryHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String uri = request.getRequestURI();
		
		String dispClsfNo = (String) request.getAttribute("dispClsfNo");
		String cateCdM = (String) request.getAttribute("cateCdM");


		int lcate_code = request.getParameter("lnbDispClsfNo") == null ? 1 : Integer.parseInt(request.getParameter("lnbDispClsfNo"));
		int mcate_code = Integer.parseInt(cateCdM == null ?"0" : cateCdM);
		indexNewCategoryService service = indexNewCategoryService.getInstance();
		ShopService service2 = ShopService.getInstance();
		
		
		List<ShopDTO> NewCategory = service.selectIndexNewCategory(lcate_code, mcate_code);
		List<ShopDTO> mcate = service.selectMcate(lcate_code);
		
		 List<ShopDTO> shopCategory = service2.selectCategory(lcate_code);
		 
		 ItemListService service3 = ItemListService.getInstance();
	      int mem_code = 0;
	      HttpSession session = request.getSession();
	      if (session.getAttribute("num") != null)
	         mem_code = (int) session.getAttribute("num");
	      
	      if (mem_code != 0) {         
	         List<ShopDTO> zzim = service3.selectMemZzim(mem_code);
	         request.setAttribute("zzim", zzim);
	      }
		
		int newCategoryLength=NewCategory.size();
				
		request.setAttribute("newCategoryLength", newCategoryLength);
		request.setAttribute("NewCategory", NewCategory);
		request.setAttribute("mcate", mcate);
		request.setAttribute("dispClsfNo", dispClsfNo);
		request.setAttribute("uri", uri);
		request.setAttribute("shopCategory", shopCategory);
		request.setAttribute("lnbDispClsfNo", lcate_code);
		
		return "indexNewCategory";
	}

}
