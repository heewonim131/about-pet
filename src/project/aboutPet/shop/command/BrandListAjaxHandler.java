package project.aboutPet.shop.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;

import net.sf.json.JSONObject;
import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.BrandListAjaxService;
import project.aboutPet.shop.service.ItemListService;
import project.aboutPet.shop.service.ShopService;
import project.aboutPet.controller.CommandHandler;

public class BrandListAjaxHandler implements CommandHandler {
	

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int br_code = Integer.parseInt(request.getParameter("br_code"));
		
		int mem_code = 0;
		HttpSession session = request.getSession();
		if (session.getAttribute("num") != null)
			mem_code = (int) session.getAttribute("num");
		
		BrandListAjaxService service = BrandListAjaxService.getInstance();
		ArrayList<String> html= service.brandSelect(br_code, mem_code);
		String count = service.listCount(br_code);
	
		request.setAttribute("html", html);
		request.setAttribute("count", count);


		return "brandListAjax";
	}

}
