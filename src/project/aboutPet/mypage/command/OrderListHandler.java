package project.aboutPet.mypage.command;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.mypage.service.OrderListService;

public class OrderListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		  
		if (session.getAttribute("num")==null) {
			return "logon_input";
			
		} else {
			
			int mem_code = (int) session.getAttribute("num");
			
			OrderListService orderListService = OrderListService.getInstance();
			List<ShopDTO> olist = orderListService.orderList(mem_code);
			List<ShopDTO> oilist = orderListService.orderItemList(mem_code);
			
			if (oilist != null && !oilist.isEmpty()) {
				
				Iterator<ShopDTO> shopir = oilist.iterator();
				while (shopir.hasNext()) {
					ShopDTO dto = shopir.next();
					
					// item_img
					String img = dto.getItem_img();
					int idx = img.indexOf(",");
					if (idx != -1) dto.setItem_img(img.substring(0, idx));
					
					// item_price
					int rate = dto.getSale_rate();
					if (rate != 0) {
						int price = dto.getItem_price();	// 정가 -> 할인적용 (백원단위)
						price = (int) (Math.floor(price*(1- (double) rate/100)/100)*100);
						dto.setItem_price(price);
					}
					
					// 상품명=옵션명 같으면 옵션이 없는 것 (단일상품)
					if (dto.getItem_name().equals(dto.getOpt_name())) dto.setOpt_name(null);
					
				}//while
			}//if
			
			
			request.setAttribute("olist", olist);
			request.setAttribute("oilist", oilist);
			
			return "orderList";
		}
	}//process

}//class