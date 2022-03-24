package project.aboutPet.shop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.ItemListService;
import project.aboutPet.shop.service.TagPagAjaxService;
import project.aboutPet.controller.CommandHandler;

public class TagPageListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String tagName = request.getParameter("tagNm");
		TagPagAjaxService service = TagPagAjaxService.getInstance();
		List<ShopDTO> list = service.selectTagList(tagName);
		String count = service.countPage(tagName);

		ItemListService service2 = ItemListService.getInstance();
		int mem_code = 0;
		HttpSession session = request.getSession();
		if (session.getAttribute("num") != null)
			mem_code = (int) session.getAttribute("num");

		if (mem_code != 0) {
			List<ShopDTO> zzim = service2.selectMemZzim(mem_code);
			request.setAttribute("zzim", zzim);
		}

		request.setAttribute("tagName", tagName);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		return "tagPageList";
	}

}
