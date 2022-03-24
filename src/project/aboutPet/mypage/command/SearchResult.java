package project.aboutPet.mypage.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.service.SearchResultService;

public class SearchResult implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String s_word = request.getParameter("srchWord");
		int Lcate_code = 1;
		if (request.getParameter("cateCdL") != null) {
			Lcate_code = Integer.parseInt(request.getParameter("cateCdL"));
		}

		SearchResultService srService = SearchResultService.getInstance();
		SearchResultService brService = SearchResultService.getInstance();
		SearchResultService logService = SearchResultService.getInstance();
		SearchResultService videoService = SearchResultService.getInstance();
		System.out.println(s_word);
		int cntItem = srService.searchItem(s_word, Lcate_code);

		ArrayList<String> brandList = brService.searchBrand(s_word);
		ArrayList<Integer> cntLog = logService.searchLog(s_word);
		ArrayList<Integer> cntVideo = videoService.searchVideo(s_word);

		request.setAttribute("cntItem", cntItem);
		request.setAttribute("s_word", s_word);
		request.setAttribute("brandList", brandList);

		request.setAttribute("cntLog", cntLog);
		request.setAttribute("cntVideo", cntVideo);

		System.out.println("result핸들러 들럿다감");
		System.out.println(cntItem);
		System.out.println(s_word);
		return "searchResultAjax";
	}

}
