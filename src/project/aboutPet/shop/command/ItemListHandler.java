package project.aboutPet.shop.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.ItemListService;
import project.aboutPet.shop.service.ShopService;
import project.aboutPet.controller.CommandHandler;

public class ItemListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String uri = request.getRequestURI();

		int mem_code = 0;
		HttpSession session = request.getSession();
		if (session.getAttribute("num") != null)
			mem_code = (int) session.getAttribute("num");

		int lcate_code = request.getParameter("lnbDispClsfNo") == null ? 1 : Integer.parseInt(request.getParameter("lnbDispClsfNo"));
		int mcate_code = 0;

		if (request.getParameter("dispClsfNo") == null) {
			switch (lcate_code) {
			case 1:
				mcate_code = 1;
				break;
			case 2:
				mcate_code = 13;
				break;
			}
		} else {
			mcate_code = Integer.parseInt(request.getParameter("dispClsfNo"));
		}

		ItemListService service = ItemListService.getInstance();
		ShopService service2 = ShopService.getInstance();

		if (mem_code != 0) {
			List<ShopDTO> zzim = service.selectMemZzim(mem_code);
			request.setAttribute("zzim", zzim);
		}
		List<ShopDTO> itemList = service.selectItemList(lcate_code, mcate_code);
		List<ShopDTO> shopCategory = service2.selectCategory(lcate_code);
		List<ShopDTO> Scate = service.selectScate(mcate_code);
		int cnt = service.getCount(lcate_code, mcate_code);

		request.setAttribute("itemList", itemList);
		request.setAttribute("shopCategory", shopCategory);
		request.setAttribute("lnbDispClsfNo", lcate_code);
		request.setAttribute("uri", uri);
		request.setAttribute("dispClsfNo", mcate_code);
		request.setAttribute("Scate", Scate);
		request.setAttribute("cnt", cnt);

		return "shop_list";
	}
}
