package project.aboutPet.mypage.command;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.scenario.effect.Flood;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.PetDTO;
import project.aboutPet.mypage.service.MyPetListService;

public class MyPetListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		int mem_code = (int) session.getAttribute("num");
		
		MyPetListService pservice = MyPetListService.getInstance();
		List<PetDTO> petlist = pservice.petList(mem_code);
		
		if (petlist != null && !petlist.isEmpty()) {
			Iterator<PetDTO> petir = petlist.iterator();
			while (petir.hasNext()) {
				PetDTO dto = petir.next();
				
				// pt_name
				if (dto.getPt_name()==null) dto.setPt_name("-");
				
				// pet_age
				int month = Integer.parseInt(dto.getPet_age());
				String age = (int) Math.floor(month/12) + "세 " + (month%12) + "개월";
				dto.setPet_age(age);
			}
		}
		
		request.setAttribute("petlist", petlist);
		
		return "myPetList";
	}

}
