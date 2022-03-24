package project.aboutPet.shop.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.ItemListService;
import project.aboutPet.shop.service.ShopService;
import project.aboutPet.controller.CommandHandler;

public class ShopHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int mem_code = 0;
		HttpSession session = request.getSession();
		if (session.getAttribute("num") != null)
			mem_code = (int) session.getAttribute("num");
		// 서비스 객체 생성
		int lcate_code = request.getParameter("lnbDispClsfNo") == null ? 1
				: Integer.parseInt(request.getParameter("lnbDispClsfNo"));

		ShopService service = ShopService.getInstance();
		ItemListService service2 = ItemListService.getInstance();
		List<ShopDTO> shopDTO = service.select_Stock(lcate_code);
		// ShopDTO shopMemberDTO = service.selectMember(mem_name);
		// List<ShopDTO> shopRecommendDTO = service.selectRecommed(mem_name);
		List<ShopDTO> shopShelfLifelDTO = service.selectShelfLife(lcate_code);
		List<ShopDTO> timeDeal = service.selectTimeDeal(lcate_code);

		if (mem_code != 0) {
			List<ShopDTO> zzim = service2.selectMemZzim(mem_code);
			request.setAttribute("zzim", zzim);
		}

		if (mem_code != 0) {
			ShopDTO shopMemberDTO = service.selectMember(mem_code);
			List<ShopDTO> shopRecommendDTO = service.selectRecommed(mem_code);

			request.setAttribute("shopMemberDTO", shopMemberDTO);
			request.setAttribute("shopRecommendDTO", shopRecommendDTO);
		}

		String md = "MD추천상품";
		String only = "어바웃펫 단독상품";

		List<ShopDTO> shopMDDTO = service.selectMD(md, lcate_code);
		List<ShopDTO> shopOnlyItemDTO = service.selectMD(only, lcate_code);
		List<ShopDTO> shopCategory = service.selectCategory(lcate_code);

		String uri = request.getRequestURI();

		request.setAttribute("shopMDDTO", shopMDDTO);
		request.setAttribute("shopOnlyItemDTO", shopOnlyItemDTO);
		request.setAttribute("lnbDispClsfNo", lcate_code);
		request.setAttribute("uri", uri);
		request.setAttribute("shopCategory", shopCategory);
		request.setAttribute("timeDeal", timeDeal);
		request.setAttribute("shopDTO", shopDTO);
		request.setAttribute("shopShelfLifelDTO", shopShelfLifelDTO);
		return "shop_home";
	}

}
