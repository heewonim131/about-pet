package project.aboutPet.shop.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.ItemDetailService;
import project.aboutPet.shop.service.ItemListService;

public class ItemDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pitem_code = request.getParameter("item_code");
		int item_code = pitem_code.equals("")?1: Integer.parseInt(pitem_code);

		ItemDetailService service = ItemDetailService.getInstance();
		List<ShopDTO> compareList = service.selectCompareItem(item_code);
		String count = service.countPage(item_code);
		Map<Integer,Double> map  = service.countStar(item_code);

		ShopDTO shopRequiredInfo = service.selectRequiredInfo(item_code);
		ShopDTO itemStar = service.selectItemStar(item_code);

		String [] star = {"0", "0"};
		if (itemStar != null) {
			star = Double.toString(itemStar.getRv_star()).replace('.', '_').split("_");         
		}

		
		
		ItemListService service2 = ItemListService.getInstance();
	      int mem_code = 0;
	      HttpSession session = request.getSession();
	      if (session.getAttribute("num") != null)
	         mem_code = (int) session.getAttribute("num");
	      
	      if (mem_code != 0) {         
	         List<ShopDTO> zzim = service2.selectMemZzim(mem_code);
	         request.setAttribute("zzim", zzim);
	      }
	    
	    ShopDTO dto = service.selectItem(item_code, mem_code);  

		String [] tag = dto.getItag().split(",");

		request.setAttribute("dto", dto);
		request.setAttribute("map", map);
		request.setAttribute("tag", tag);
		request.setAttribute("compareList", compareList);
		request.setAttribute("item_code", item_code);
		request.setAttribute("count", count);	
		request.setAttribute("shopRequiredInfo", shopRequiredInfo);
		request.setAttribute("itemStar", itemStar);
		request.setAttribute("star", star);



		return "itemDetail";
	}

}
