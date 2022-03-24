package project.aboutPet.shop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.ShopService;
import project.aboutPet.controller.CommandHandler;

public class BestGoodsListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String plcate_code =  request.getParameter("lnbDispClsfNo");
		
		plcate_code = plcate_code == null ? "" : plcate_code;
		 int lcate_code = plcate_code.equals("")?1:Integer.parseInt(plcate_code);
		 String uri = request.getRequestURI();
		 ShopService service = ShopService.getInstance();
		 List<ShopDTO> shopCategory = service.selectCategory(lcate_code);
			
		  request.setAttribute("lnbDispClsfNo", lcate_code);
		  request.setAttribute("uri", uri);
		  request.setAttribute("shopCategory", shopCategory);
		  
		return "bestGoodsList";
	}

}
