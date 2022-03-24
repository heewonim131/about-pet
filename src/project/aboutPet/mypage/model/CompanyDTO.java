package project.aboutPet.mypage.model;

public class CompanyDTO {
	
	private int cpn_code;	// 업체코드
	private String cpn_name;	// 업체명
	private int free_fee;	// 무료배송 금액
//	private String isFree;
	
	// 업체별...
	private int total_cnt;
	private int total_price;
	private int total_fee;
	
	// getter, setter
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
	public int getFree_fee() {
		return free_fee;
	}
	public void setFree_fee(int free_fee) {
		this.free_fee = free_fee;
	}
//	public String isFree() {
//		return isFree;
//	}
//	public void setFree(String isFree) {
//		this.isFree = isFree;
//	}
	public int getTotal_cnt() {
		return total_cnt;
	}
	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(int total_fee) {
		this.total_fee = total_fee;
	}
	
}//class
