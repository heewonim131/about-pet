package project.aboutPet.mypage.command;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.mypage.service.MyAlarmListService;

public class MyAlarmListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		int mem_code = (int) session.getAttribute("num");
		
		MyAlarmListService alarmListService = MyAlarmListService.getInstance();
		List<ShopDTO> malist = alarmListService.alarmList(mem_code);
		
		if (malist != null && !malist.isEmpty()) {
			Iterator<ShopDTO> shopir = malist.iterator();
			while (shopir.hasNext()) {
				ShopDTO dto = shopir.next();
				
				// 상품명=옵션명 같으면 옵션이 없는 것 (단일상품)
				if (dto.getItem_name().equals(dto.getOpt_name())) dto.setOpt_name(null);
			}
		}
		
		request.setAttribute("malist", malist);
		
		return "myAlarmList";
		
	}

}//class