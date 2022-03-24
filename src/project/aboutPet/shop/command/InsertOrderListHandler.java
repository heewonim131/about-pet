package project.aboutPet.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.shop.service.InsertOrderListService;

public class InsertOrderListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		
		
		//배송지 코드
		String pAdr_code =request.getParameter("adr_code");
		int adr_code = Integer.parseInt(pAdr_code);
		//사용자 코드
		String pMem_code = request.getParameter("mbrNo"); 
		int mem_code = Integer.parseInt(pMem_code);
		//상품 코드
		String pGsptNo = request.getParameter("gsptNo");
		int gsptNo = Integer.parseInt(pGsptNo);
		//주문자 이름
		String ordNm = request.getParameter("ordNm");
		//주문자 이메일
		String mem_email = request.getParameter("ordrEmail");
		//주문자 전화번호
		String contact = request.getParameter("ordrTel");
		//주문지 상세정보
		String adr_detail = request.getParameter("adr_detail");
		//주문지 이름
		String adr_name = request.getParameter("adr_name");
		//결제 방법
		String PayMethod = request.getParameter("PayMethod");
		//일시불
		String SelectCardCode = request.getParameter("SelectCardCode");
		//총 가격
		String pTotalPay = request.getParameter("totalPay");
		//주문지 요청사항
		String requests = request.getParameter("requests");
		//주문지 비밀번호
		String enter = request.getParameter("dr_enter");
		//상품 카운트
		String pTotalCnt = request.getParameter("totalCnt");
		int totalCnt = Integer.parseInt(pTotalCnt);
		
		//배송타입
		String pDr_code = request.getParameter("dr_code");
		int dt_code = Integer.parseInt(pDr_code);
		
		//
		String pDr_loc = request.getParameter("dr_loc");
		
		
		InsertOrderListService service = InsertOrderListService.getInstance();
		
		int count = service.insertOrderItem(mem_code,adr_code); 
		
		int count2 = service.insertOrderDetail(gsptNo,totalCnt,dt_code); 
		String seq = service.selectSEQ();
		
		int totalPay = Integer.parseInt(pTotalPay);
		
	    int count3 = service.insertPayment(totalPay); 
	    int count4 = service.insertPaymentDetail(totalPay); 
		
		
		request.setAttribute("adr_code", adr_code);
		request.setAttribute("mem_code", mem_code);
		request.setAttribute("ordNo", gsptNo);
		request.setAttribute("ordNm", ordNm);
		request.setAttribute("contact", contact);
		request.setAttribute("adr_name", adr_name);
		request.setAttribute("adr_detail", adr_detail);
		request.setAttribute("PayMethod", PayMethod);
		request.setAttribute("SelectCardCode", SelectCardCode);
		request.setAttribute("pTotalPay", pTotalPay);
		request.setAttribute("requests", requests);
		request.setAttribute("enter", enter);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("seq", seq);
		request.setAttribute("pDr_loc", pDr_loc);
		
		
		return "endOrderItem";
	}

}
