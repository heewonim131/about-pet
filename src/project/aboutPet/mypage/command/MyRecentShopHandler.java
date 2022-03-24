package project.aboutPet.mypage.command;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.mypage.service.MyRecentShopService;

public class MyRecentShopHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		int mem_code = (int) session.getAttribute("num");
		
		// 서비스 객체 생성
		MyRecentShopService myRecentShopService = MyRecentShopService.getInstance();
		List<ShopDTO> rslist = myRecentShopService.recentShop(mem_code);
		
		if (rslist != null && !rslist.isEmpty()) {
			Iterator<ShopDTO> shopir = rslist.iterator();
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
			}
		}

		// request, session 저장
		request.setAttribute("rslist", rslist);
		
		return "myRecentShop";
	}

}//class
