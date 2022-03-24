package project.aboutPet.shop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.shop.model.ShopDTO;
import project.aboutPet.shop.service.TagPagAjaxService;
import project.aboutPet.controller.CommandHandler;

public class TagPageAjaxListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String tagName = request.getParameter("tagNm");
		TagPagAjaxService service = TagPagAjaxService.getInstance();
		List<ShopDTO> list = service.selectTagList(tagName);
		String count = service.countPage(tagName);
		
		
		

		request.setAttribute("tagName", tagName);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		return "tagPageAjaxList";
	}

}
