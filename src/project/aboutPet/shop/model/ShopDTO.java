package project.aboutPet.shop.model;

import java.util.Date;

public class ShopDTO {


	private int mem_code;
	private String mem_name;
	private String pet_cate;
	private String pet_name;

	private int item_code;
	private String item_name;
	private String item_img;
	private String item_content;
	private int scate_code;
	private int cpn_code;
	private int item_price;
	private Date item_date;
	private String item_url;
	private String itag;
	private String item_filter;
	private Date exp_date;

	//
	private String lcate_name;
	private String mcate_name;
	private String scate_name;
	private String br_name;
	private String cpn_name;
	private int item_fee;
	private int free_fee;

	// MD, 단독 상품
	private String rec_cmt;

	// 상품리스트
	private int lcate_code;
	private int mcate_code;



	//베스트 20
	private int count;

	//브랜드
	private int br_code;


	private double rv_star;
	private int c_vote;

	private int star;
	private double pstar;
	
	
	private String legal;
	   private String country;
	   private String company;
	   private String as_contact;






	public String getLegal() {
		return legal;
	}
	public void setLegal(String legal) {
		this.legal = legal;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getAs_contact() {
		return as_contact;
	}
	public void setAs_contact(String as_contact) {
		this.as_contact = as_contact;
	}
	public double getRv_star() {
		return rv_star;
	}
	public void setRv_star(double rv_star) {
		this.rv_star = rv_star;
	}
	public int getC_vote() {
		return c_vote;
	}
	public void setC_vote(int c_vote) {
		this.c_vote = c_vote;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public double getPstar() {
		return pstar;
	}
	public void setPstar(double pstar) {
		this.pstar = pstar;
	}



	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getPet_cate() {
		return pet_cate;
	}
	public void setPet_cate(String pet_cate) {
		this.pet_cate = pet_cate;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}


	public int getBr_code() {
		return br_code;
	}
	public void setBr_code(int br_code) {
		this.br_code = br_code;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getRec_cmt() {
		return rec_cmt;
	}
	public void setRec_cmt(String rec_cmt) {
		this.rec_cmt = rec_cmt;
	}
	public int getLcate_code() {
		return lcate_code;
	}
	public void setLcate_code(int lcate_code) {
		this.lcate_code = lcate_code;
	}
	public int getMcate_code() {
		return mcate_code;
	}
	public void setMcate_code(int mcate_code) {
		this.mcate_code = mcate_code;
	}
	public String getLcate_name() {
		return lcate_name;
	}
	public void setLcate_name(String lcate_name) {
		this.lcate_name = lcate_name;
	}
	public String getMcate_name() {
		return mcate_name;
	}
	public void setMcate_name(String mcate_name) {
		this.mcate_name = mcate_name;
	}
	public String getScate_name() {
		return scate_name;
	}
	public void setScate_name(String scate_name) {
		this.scate_name = scate_name;
	}
	public String getBr_name() {
		return br_name;
	}
	public void setBr_name(String br_name) {
		this.br_name = br_name;
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
	private int sale_rate;
	private int opt_stock;






	public Date getExp_date() {
		return exp_date;
	}
	public void setExp_date(Date exp_date) {
		this.exp_date = exp_date;
	}
	public int getSale_rate() {
		return sale_rate;
	}
	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}
	public int getOpt_stock() {
		return opt_stock;
	}
	public void setOpt_stock(int opt_stock) {
		this.opt_stock = opt_stock;
	}
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
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public int getScate_code() {
		return scate_code;
	}
	public void setScate_code(int scate_code) {
		this.scate_code = scate_code;
	}
	public int getCpn_code() {
		return cpn_code;
	}
	public void setCpn_code(int cpn_code) {
		this.cpn_code = cpn_code;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public Date getItem_date() {
		return item_date;
	}
	public void setItem_date(Date item_date) {
		this.item_date = item_date;
	}
	public String getItem_url() {
		return item_url;
	}
	public void setItem_url(String item_url) {
		this.item_url = item_url;
	}
	public String getItag() {
		return itag;
	}
	public void setItag(String itag) {
		this.itag = itag;
	}
	public String getItem_filter() {
		return item_filter;
	}
	public void setItem_filter(String item_filter) {
		this.item_filter = item_filter;
	}


}
