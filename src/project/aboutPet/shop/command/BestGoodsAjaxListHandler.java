package project.aboutPet.shop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.ItemListService;
import project.aboutPet.controller.CommandHandler;

public class BestGoodsAjaxListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String plnbDispClsfNo = request.getParameter("lnbDispClsfNo") == null ? "" : request.getParameter("lnbDispClsfNo");
		String pdispClsfNo = request.getParameter("dispClsfNo") == null ? "" : request.getParameter("dispClsfNo");

		plnbDispClsfNo = request.getParameter("lnbDispClsfNo").equals("") ? "1" : request.getParameter("lnbDispClsfNo");
		pdispClsfNo = pdispClsfNo.equals("") ? "0" : request.getParameter("dispClsfNo");

		request.setAttribute("lnbDispClsfNo", plnbDispClsfNo);
		request.setAttribute("pdispClsfNo", pdispClsfNo);

		return "bestGoodItemList";
	}

}
