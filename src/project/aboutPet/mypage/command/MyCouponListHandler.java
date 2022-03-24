package project.aboutPet.mypage.command;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.CouponDTO;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.service.MemberService;
import project.aboutPet.mypage.service.MyCouponListService;

public class MyCouponListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		int mem_code = (int) session.getAttribute("num");
		
		// 쿠폰 갯수
		MemberService mservice = MemberService.getInstance();
		int not_used = mservice.couponCnt(mem_code, 0); 
		int used = mservice.couponCnt(mem_code, 1); 
		
		// 쿠폰 리스트
		MyCouponListService couponListService = MyCouponListService.getInstance();
		List<CouponDTO> mclist = couponListService.couponList(mem_code);

		
		Calendar endday = Calendar.getInstance();
		Calendar today = Calendar.getInstance();
		today.setTime(new Date());
		
		if (mclist != null && !mclist.isEmpty()) {
			Iterator<CouponDTO> cpir = mclist.iterator();
			while (cpir.hasNext()) {
				CouponDTO dto = cpir.next();
				
				// 사용가능 쿠폰이면 현재날짜 만료일날짜 차이
				if (dto.getMc_used() == 0) {
					endday.setTime(dto.getMc_edate());
					long diffday = (today.getTimeInMillis() - endday.getTimeInMillis()) /1000/60/60/24;
					dto.setDiffday(diffday);
				}
			}
		}
		
		request.setAttribute("not_used", not_used);
		request.setAttribute("used", used);
		request.setAttribute("mclist", mclist);
		
		return "myCouponList";
		
	}

}//class