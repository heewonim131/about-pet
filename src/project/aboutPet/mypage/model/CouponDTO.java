package project.aboutPet.mypage.model;

import java.sql.Date;

public class CouponDTO {
	
	private int cp_code;
	private String cp_name;
	private String cp_type;
	private int cp_rate;
	private int cp_term;
	private String cp_cate;
	private int cp_max;
	
	// 회원쿠폰
	private Date mc_sdate;
	private Date mc_edate;
	private int mc_used;
	
	// 현재~만료일 날짜 차이
	private long diffday;
	
	
	// getter, setter
	public int getCp_code() {
		return cp_code;
	}
	public void setCp_code(int cp_code) {
		this.cp_code = cp_code;
	}
	public String getCp_name() {
		return cp_name;
	}
	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}
	public String getCp_type() {
		return cp_type;
	}
	public void setCp_type(String cp_type) {
		this.cp_type = cp_type;
	}
	public int getCp_rate() {
		return cp_rate;
	}
	public void setCp_rate(int cp_rate) {
		this.cp_rate = cp_rate;
	}
	public int getCp_term() {
		return cp_term;
	}
	public void setCp_term(int cp_term) {
		this.cp_term = cp_term;
	}
	public String getCp_cate() {
		return cp_cate;
	}
	public void setCp_cate(String cp_cate) {
		this.cp_cate = cp_cate;
	}
	public int getCp_max() {
		return cp_max;
	}
	public void setCp_max(int cp_max) {
		this.cp_max = cp_max;
	}
	public Date getMc_sdate() {
		return mc_sdate;
	}
	public void setMc_sdate(Date mc_sdate) {
		this.mc_sdate = mc_sdate;
	}
	public Date getMc_edate() {
		return mc_edate;
	}
	public void setMc_edate(Date mc_edate) {
		this.mc_edate = mc_edate;
	}
	public int getMc_used() {
		return mc_used;
	}
	public void setMc_used(int mc_used) {
		this.mc_used = mc_used;
	}
	public long getDiffday() {
		return diffday;
	}
	public void setDiffday(long diffday) {
		this.diffday = diffday;
	}
	
}//class
