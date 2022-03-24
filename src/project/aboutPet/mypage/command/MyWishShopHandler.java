package project.aboutPet.mypage.command;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.LogDTO;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.mypage.model.TvDTO;
import project.aboutPet.mypage.service.MemberService;
import project.aboutPet.mypage.service.MyWishListService;

public class MyWishShopHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		int mem_code = (int) session.getAttribute("num");
		
		// 찜 수
		MemberService mservice = MemberService.getInstance();
		int tvMark = mservice.markCnt(mem_code, "VIDEO_MARK");
		int logMark = mservice.markCnt(mem_code, "LOG_MARK");
		int itemMark = mservice.markCnt(mem_code, "ITEM_MARK");
		
		// 마이 찜 리스트
		MyWishListService wservice = MyWishListService.getInstance();
		// tv 리스트
		List<TvDTO> tvlist = wservice.wishTv(mem_code);
		
		if (tvlist != null && !tvlist.isEmpty()) {			
			Iterator<TvDTO> tvir = tvlist.iterator();
			while (tvir.hasNext()) {
				TvDTO dto = tvir.next();
				
				// v_img
				String img = dto.getV_img();
				int idx = img.indexOf(",");
				if (idx != -1) dto.setV_img(img.substring(0, idx));
			}
		}
		
		// 로그 리스트
		List<LogDTO> loglist = wservice.wishLog(mem_code);
		// 샵 리스트
		List<ShopDTO> shoplist = wservice.wishShop(mem_code);
		
		if (shoplist != null && !shoplist.isEmpty()) {
			Iterator<ShopDTO> shopir = shoplist.iterator();
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
		
		request.setAttribute("tvMark", tvMark);
		request.setAttribute("logMark", logMark);
		request.setAttribute("itemMark", itemMark);
		
		request.setAttribute("tvlist", tvlist);
		request.setAttribute("loglist", loglist);
		request.setAttribute("shoplist", shoplist);
		
		return "myWishShop";
	}

}
