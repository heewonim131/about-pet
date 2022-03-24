package project.aboutPet.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.PetDTO;
import project.aboutPet.mypage.service.MyPetViewService;

public class MyPetViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int pet_code = Integer.parseInt(request.getParameter("petNo"));
		
		MyPetViewService pvservice = MyPetViewService.getInstance();
		PetDTO dto = pvservice.petView(pet_code);
		
		// pt_name
		if (dto.getPt_name()==null) dto.setPt_name("-");
		
		// pet_age
		int month = Integer.parseInt(dto.getPet_age());
		String age = (int) Math.floor(month/12) + "세 " + (month%12) + "개월";
		dto.setPet_age(age);
		
		// pet_wei
		if (dto.getPet_wei()==null) dto.setPet_wei("-");
		else dto.setPet_wei(Double.parseDouble(dto.getPet_wei())+"kg");
		
		// pet_neut
		if (dto.getPet_neut().equals("Y")) dto.setPet_neut("중성화 완료");
		else if (dto.getPet_neut()==null || dto.getPet_neut().equals("N")) dto.setPet_neut("-");
		
		// dise
		if (dto.getDise()==null || dto.getDise().equals("N")) dto.setDise("-");
		
		// alg
		if (dto.getAlg()==null) dto.setAlg("-");
		else if (dto.getAlg().equals("N")) dto.setAlg("없음");
		
		request.setAttribute("petDTO", dto);
		
		return "myPetView";
	}

}
