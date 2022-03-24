package project.aboutPet.mypage.command;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.mypage.service.OrderListService;

public class OrderDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		  
		if (session.getAttribute("num")==null) {
			return "logon_input";
			
		} else {
			
			int mem_code = (int) session.getAttribute("num");
			
			int ord_code = Integer.parseInt(request.getParameter("ordNo"));
			
			OrderListService orderListService = OrderListService.getInstance();
			ShopDTO odto = orderListService.orderDetail(mem_code, ord_code);
			List<ShopDTO> oilist = orderListService.orderItemDetail(mem_code, ord_code);
			
			ShopDTO adto = orderListService.selectAdr(ord_code);
			ShopDTO pdto = orderListService.selectPay(ord_code);
			
			int fee = 0, point = 0;
			
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
					
					pdto.setPm_price(pdto.getPm_price()+dto.getItem_price());
					
				}//while
				
			}//if
			
			
			
			// 결제정보
			if (pdto.getPm_price() <= 30000) fee = 2500;
			pdto.setPm_price(pdto.getPm_price()+fee);
			point = (int) Math.floor( (double) pdto.getPm_price() / 1000 );
			
			request.setAttribute("odto", odto);
			request.setAttribute("oilist", oilist);
			request.setAttribute("adto", adto);
			request.setAttribute("pdto", pdto);
			
			request.setAttribute("fee", fee);
			request.setAttribute("point", point);
			
			return "orderDetail";
		}
	}//process

}//class