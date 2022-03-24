package project.aboutPet.shop.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import project.aboutPet.controller.CommandHandler;
import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.BestGoodsListService;
import project.aboutPet.shop.service.GoodsCommentListService;
import project.aboutPet.shop.service.ItemDetailService;

public class GoodCommentListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pItem_code =request.getParameter("item_code") ==null?"":request.getParameter("item_code");
		pItem_code = pItem_code.equals("")?"1":pItem_code;
		
		int item_code = Integer.parseInt(pItem_code);
		
		GoodsCommentListService service =  GoodsCommentListService.getInstance();
		ArrayList<String> html= service.selectComment(item_code);
		
		
		request.setAttribute("item_code", item_code);
		request.setAttribute("html", html);
		
		return "getGoodsCommentList";
	}

}
