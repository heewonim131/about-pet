package project.aboutPet.shop.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;

import net.sf.json.JSONObject;
import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.BrandListService;
import project.aboutPet.shop.service.ItemListService;
import project.aboutPet.shop.service.ShopService;
import project.aboutPet.controller.CommandHandler;

public class getScateGoodsListHandler implements CommandHandler {
	

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String scate_code = request.getParameter("dispClsfNo");
		String mcate_code = request.getParameter("upDispClsfNo");
		ItemListService service = ItemListService.getInstance();
		int mem_code = request.getParameter("mem_code") == null ? 0 : Integer.parseInt(request.getParameter("mem_code"));
	      
	      if (mem_code != 0) {         
	         List<ShopDTO> zzim = service.selectMemZzim(mem_code);
	         request.setAttribute("zzim", zzim);
	      }
		request.setAttribute("scate_code", scate_code);
		request.setAttribute("mcate_code", mcate_code);
		
		
		return "getScateGoodsList";
		
	}

}
