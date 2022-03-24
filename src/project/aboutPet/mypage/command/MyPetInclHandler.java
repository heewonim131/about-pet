package project.aboutPet.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.PetDTO;
import project.aboutPet.mypage.service.MyPetViewService;

public class MyPetInclHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int pet_code = Integer.parseInt(request.getParameter("petNo"));
		
		MyPetViewService pvservice = MyPetViewService.getInstance();
		PetDTO dto = pvservice.petView(pet_code);
		
		// pet_cate
		if (dto.getPet_cate().equals("1")) dto.setPet_cate("강아지");
		else dto.setPet_cate("고양이");
		
		request.setAttribute("petDTO", dto);
		
		return "myPetIncl";
	}

}
