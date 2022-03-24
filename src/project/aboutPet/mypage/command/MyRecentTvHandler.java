package project.aboutPet.mypage.command;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.model.TvDTO;
import project.aboutPet.mypage.model.PetDTO;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.mypage.service.MemberService;
import project.aboutPet.mypage.service.MyRecentTvService;
import project.aboutPet.mypage.service.MyPetListService;

public class MyRecentTvHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		int mem_code = (int) session.getAttribute("num");
		
		// 서비스 객체 생성
		MyRecentTvService myRecentTvService = MyRecentTvService.getInstance();
		List<TvDTO> mtlist = myRecentTvService.recentTv(mem_code);
		
		if (mtlist != null && !mtlist.isEmpty()) {
			Iterator<TvDTO> tvir = mtlist.iterator();
			while (tvir.hasNext()) {
				TvDTO dto = tvir.next();
				
				// v_img
				String img = dto.getV_img();
				int idx = img.indexOf(",");
				if (idx != -1) dto.setV_img(img.substring(0, idx));
			}
		}

		// request, session 저장
		request.setAttribute("mtlist", mtlist);
		
		return "myRecentTv";
	}

}
