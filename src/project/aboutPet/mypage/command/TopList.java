package project.aboutPet.mypage.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.SearchDTO;
import project.aboutPet.mypage.service.TopSearchService;

public class TopList implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ArrayList<SearchDTO> topList = new ArrayList<SearchDTO>();

		// 서비스 객체 생성
		TopSearchService topService = TopSearchService.getInstance();

		topList = topService.topSearch();

		request.setAttribute("topList", topList);

		System.out.println("탑리스트핸들러들름");

		return "commonSearch";
		// return "list";
	}

}
