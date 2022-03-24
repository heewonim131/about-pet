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
import project.aboutPet.shop.service.BrandListAjaxService;
import project.aboutPet.shop.service.BrandListService;
import project.aboutPet.shop.service.ShopService;
import project.aboutPet.controller.CommandHandler;

public class BrandListHandler implements CommandHandler {
	

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int br_code = Integer.parseInt(request.getParameter("br_code"));
		int lcate_code = request.getParameter("lnbDispClsfNo") == null ? 1 : Integer.parseInt(request.getParameter("lnbDispClsfNo"));
		ShopService service2 = ShopService.getInstance();
		BrandListService service = BrandListService.getInstance();
		String count = service.listCount(br_code);
		Map<String, String> map = service.selectItemNameLcate(br_code);
		List<ShopDTO> shopCategory = service2.selectCategory(lcate_code);
		  String uri = request.getRequestURI();
		request.setAttribute("count", count);
		request.setAttribute("lnbDispClsfNo", lcate_code);
	    request.setAttribute("uri", uri);
	    request.setAttribute("shopCategory", shopCategory);
		request.setAttribute("map", map);

		return "brandList";
	}

}
