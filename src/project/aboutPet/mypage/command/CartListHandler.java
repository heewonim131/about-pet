package project.aboutPet.mypage.command;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.CompanyDTO;
import project.aboutPet.mypage.model.ShopDTO;
import project.aboutPet.mypage.service.CartListService;

public class CartListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		  
		if (session.getAttribute("num")==null) {
			return "logon_input";
			
		} else {
			int mem_code = (int) session.getAttribute("num");
		
			CartListService cartListService = CartListService.getInstance();
			List<ShopDTO> ownItem = cartListService.cartList(mem_code, "자사");
			List<ShopDTO> cpnItem = cartListService.cartList(mem_code, "업체");
			List<CompanyDTO> ownList = null;
			List<CompanyDTO> cpnList = null;
			
			int ownMax = 0, cpnMax = 0;
			int ownCnt = 0, cpnCnt = 0, allCnt;
			int ownPr = 0, cpnPr = 0, allPr;
			int ownFee = 0, cpnFee = 0, allFee;
			String latestType;
			
			if (ownItem != null && !ownItem.isEmpty()) {
				// 데이터 정리
				ownItem = dataProcess(ownItem);
				// 업체별 총합
				ownList = cpnTotal(ownItem);
				ownMax = ownItem.get(0).getCart_code();
				for (int i = 0; i < ownList.size(); i++) {
					ownCnt += ownList.get(i).getTotal_cnt();
					ownPr += ownList.get(i).getTotal_price();
					ownFee += ownList.get(i).getTotal_fee();
				}
			}
			
			if (cpnItem != null && !cpnItem.isEmpty()) {
				cpnItem = dataProcess(cpnItem);
				cpnList = cpnTotal(cpnItem);			
				cpnMax = cpnItem.get(0).getCart_code();
				for (int i = 0; i < cpnList.size(); i++) {
					cpnCnt += cpnList.get(i).getTotal_cnt();
					cpnPr += cpnList.get(i).getTotal_price();
					cpnFee += cpnList.get(i).getTotal_fee();
				}
			}
			
			// 최근 담은 상품이 제일 위로 오게
			if ( Math.max(ownMax, cpnMax) == ownMax ) latestType = "자사";
			else latestType = "업체";
			
			// 진짜 총총총
			allCnt = ownCnt + cpnCnt;
			allPr = ownPr + cpnPr;
			allFee = ownFee + cpnFee;
			
			request.setAttribute("ownItem", ownItem);
			request.setAttribute("cpnItem", cpnItem);
			
			request.setAttribute("ownList", ownList);
			request.setAttribute("cpnList", cpnList);
			
			request.setAttribute("latestType", latestType);
			
			request.setAttribute("allCnt", allCnt);
			request.setAttribute("allPr", allPr);
			request.setAttribute("allFee", allFee);
			
			return "cartList";
		}
	}//process
	
	public List<ShopDTO> dataProcess(List<ShopDTO> list) {
		if (list != null && !list.isEmpty()) {
			int idx, rate, extra, price;
			Iterator<ShopDTO> shopir = list.iterator();
			while (shopir.hasNext()) {
				ShopDTO dto = shopir.next();
				
				// item_img
				String img = dto.getItem_img();
				idx = img.indexOf(",");
				if (idx != -1) dto.setItem_img(img.substring(0, idx));
				
				// item_price
				rate = dto.getSale_rate();
				extra = dto.getExtra_price();
				price = dto.getItem_price();
				if (rate != 0) {	// 정가 -> 할인적용 (백원단위)
					price = (int) (Math.floor(price*(1- (double) rate/100)/100)*100);
				}
				if (extra != 0) {
					price = extra;
				}
				dto.setItem_price(price * dto.getCart_cnt());
				
				// 옵션
				if (dto.getItem_name().equals(dto.getOpt_name())) dto.setOpt_name(null);
				
			}//while
			
		}//if
		return list;
	}//dataProcess
	
	public List<CompanyDTO> cpnTotal(List<ShopDTO> list) {
		
		CompanyDTO cdto = null;
		List<CompanyDTO> clist = null;
		
		if (list != null && !list.isEmpty()) {
			
			clist = new ArrayList<CompanyDTO>();
			
			Iterator<ShopDTO> shopir = list.iterator();
			while (shopir.hasNext()) {
				ShopDTO dto = shopir.next();
				
				// 업체별 dto
				if (cpnDuplicate(clist, dto.getCpn_code()) != null) {
					cdto = cpnDuplicate(clist, dto.getCpn_code());
					cdto.setTotal_cnt(cdto.getTotal_cnt() + dto.getCart_cnt());
					cdto.setTotal_price(cdto.getTotal_price() + dto.getItem_price());

				} else {
					cdto = new CompanyDTO();
					cdto.setCpn_code(dto.getCpn_code());
					cdto.setCpn_name(dto.getCpn_name());
					cdto.setFree_fee(dto.getFree_fee());
					cdto.setTotal_cnt(dto.getCart_cnt());
					cdto.setTotal_price(dto.getItem_price());
					cdto.setTotal_fee(dto.getItem_fee());	
					clist.add(cdto);
				}
				
				// 해당업체의 모든 상품가격으로 -> 무료배송 여부
				if (cdto.getTotal_price() >= cdto.getFree_fee()) cdto.setTotal_fee(0);;
				
			}//while
		}//if
		
		return clist;
	}//cpnTotal

	
	private CompanyDTO cpnDuplicate(List<CompanyDTO> list, int i) {
		if (list != null && !list.isEmpty()) {
			Iterator<CompanyDTO> ir = list.iterator();
			while (ir.hasNext()) {
				CompanyDTO cdto = ir.next();
				if (cdto.getCpn_code()==i) return cdto;
			}
		}
		return null;
	}//cpnDuplicate
	

}//class