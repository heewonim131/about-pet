package project.aboutPet.mypage.model;

import java.sql.Date;

public class ShopDTO {
	
	private int item_code;
	private String item_name;	// 상품명
	private String item_img;	// 상품이미지
	private String item_url;	// 상품링크
	private int item_price;	// 상품가격(정가)
	private int sale_rate;	// 할인가격
	
	// 옵션
	private int opt_code;	// 옵션코드
	private String opt_name;	// 옵션명
	private int extra_price;	// 추가가격
	
	// 재입고알림
	private int in_code;
	private Date in_date;	// 입고알림 신청날짜
	
	// 장바구니
	private int cart_code;
	private int cart_cnt;	// 상품개수
	
	private int br_code;	// 브랜드코드
	private String br_name;	// 브랜드명
	

	// 업체...
	private int cpn_code;	// 업체코드
	private String cpn_name;	// 업체명
	private int item_fee;	// 배송비
	private int free_fee;	// 무료배송 금액
	private String cpn_type;	// 업체타입
	
	
	// 주문
	private int ord_code;
	private int odd_code;
	private Date ord_date;
	private String dt_type;
	private Date d_time;
	private String ord_status;
	private int odd_cnt;
	
	// 배송
	private String adr_name;
	private String recipient;
	private String contact;
	private String adr_detail;
	private String dr_loc;
	private String dr_enter;
	private String requests;
	
	// 결제
	private int pm_code;
	private int pm_price;
	private String pd_method;
	
	
	
	// getter, setter
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	public String getItem_url() {
		return item_url;
	}
	public void setItem_url(String item_url) {
		this.item_url = item_url;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getSale_rate() {
		return sale_rate;
	}
	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}
	public int getOpt_code() {
		return opt_code;
	}
	public void setOpt_code(int opt_code) {
		this.opt_code = opt_code;
	}
	public String getOpt_name() {
		return opt_name;
	}
	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}
	public int getExtra_price() {
		return extra_price;
	}
	public void setExtra_price(int extra_price) {
		this.extra_price = extra_price;
	}
	public int getIn_code() {
		return in_code;
	}
	public void setIn_code(int in_code) {
		this.in_code = in_code;
	}
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public int getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}
	public int getBr_code() {
		return br_code;
	}
	public void setBr_code(int br_code) {
		this.br_code = br_code;
	}
	public String getBr_name() {
		return br_name;
	}
	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}	
	public int getCpn_code() {
		return cpn_code;
	}
	public void setCpn_code(int cpn_code) {
		this.cpn_code = cpn_code;
	}
	public String getCpn_name() {
		return cpn_name;
	}
	public void setCpn_name(String cpn_name) {
		this.cpn_name = cpn_name;
	}
	public int getItem_fee() {
		return item_fee;
	}
	public void setItem_fee(int item_fee) {
		this.item_fee = item_fee;
	}
	public int getFree_fee() {
		return free_fee;
	}
	public void setFree_fee(int free_fee) {
		this.free_fee = free_fee;
	}
	public String getCpn_type() {
		return cpn_type;
	}
	public void setCpn_type(String cpn_type) {
		this.cpn_type = cpn_type;
	}
	public int getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(int ord_code) {
		this.ord_code = ord_code;
	}
	public int getOdd_code() {
		return odd_code;
	}
	public void setOdd_code(int odd_code) {
		this.odd_code = odd_code;
	}
	public String getDt_type() {
		return dt_type;
	}
	public void setDt_type(String dt_type) {
		this.dt_type = dt_type;
	}
	public Date getD_time() {
		return d_time;
	}
	public void setD_time(Date d_time) {
		this.d_time = d_time;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public int getOdd_cnt() {
		return odd_cnt;
	}
	public void setOdd_cnt(int odd_cnt) {
		this.odd_cnt = odd_cnt;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	public String getAdr_name() {
		return adr_name;
	}
	public void setAdr_name(String adr_name) {
		this.adr_name = adr_name;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAdr_detail() {
		return adr_detail;
	}
	public void setAdr_detail(String adr_detail) {
		this.adr_detail = adr_detail;
	}
	public String getDr_loc() {
		return dr_loc;
	}
	public void setDr_loc(String dr_loc) {
		this.dr_loc = dr_loc;
	}
	public String getDr_enter() {
		return dr_enter;
	}
	public void setDr_enter(String dr_enter) {
		this.dr_enter = dr_enter;
	}
	public String getRequests() {
		return requests;
	}
	public void setRequests(String requests) {
		this.requests = requests;
	}
	public int getPm_code() {
		return pm_code;
	}
	public void setPm_code(int pm_code) {
		this.pm_code = pm_code;
	}
	public int getPm_price() {
		return pm_price;
	}
	public void setPm_price(int pm_price) {
		this.pm_price = pm_price;
	}
	public String getPd_method() {
		return pd_method;
	}
	public void setPd_method(String pd_method) {
		this.pd_method = pd_method;
	}
	
	
}//class
