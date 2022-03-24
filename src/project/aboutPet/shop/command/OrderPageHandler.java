package project.aboutPet.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.shop.model.OrderDTO;
import project.aboutPet.shop.service.OrderPageService;

public class OrderPageHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pTotalCnt =  request.getParameter("totalCnt");
		
		String pTotalPrice = request.getParameter("totalPrice");

		
		String pItem_code = request.getParameter("item_code");
		int item_code = Integer.parseInt(pItem_code);
		

		
		String pMem_code = request.getParameter("mem_code");
		int mem_code = Integer.parseInt(pMem_code);
		
		OrderPageService service = OrderPageService.getInstance();
		
		ShopDTO shopDTO = service.selectOptPage(item_code);
		OrderDTO orderDTO = service.memberDel(mem_code);
		String item_fee = service.selectFee(item_code);
		String ord_code = service.newOrdCode();
		
		
		
		
		request.setAttribute("pTotalCnt", pTotalCnt);
		request.setAttribute("pTotalPrice", pTotalPrice);
		request.setAttribute("shopDTO", shopDTO);
		request.setAttribute("orderDTO", orderDTO);
		request.setAttribute("mem_code", mem_code);
		request.setAttribute("item_fee", item_fee);
		request.setAttribute("item_code", item_code);
		request.setAttribute("ord_code", ord_code);
		
		
		
		
		return "payment";
	}

}
