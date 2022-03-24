package project.aboutPet.shop.model;

import java.util.Date;

public class OrderDTO {
	
	private int mem_code;   
	private String mem_id;  
	private String mem_name;	
	private int mem_point;
	       
	private String adr_name;   
	private String recipient;  
	private String contact;         
	private String adr_detail; 
	private int adr_default;
	
	private String dr_loc;   
	private String dr_enter; 
	private String requests;
	
	private int adr_code;
	private String d_contact;
	private String mem_email;
	
	
	public int getAdr_code() {
		return adr_code;
	}
	public void setAdr_code(int adr_code) {
		this.adr_code = adr_code;
	}
	public String getD_contact() {
		return d_contact;
	}
	public void setD_contact(String d_contact) {
		this.d_contact = d_contact;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
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
	public int getAdr_default() {
		return adr_default;
	}
	public void setAdr_default(int adr_default) {
		this.adr_default = adr_default;
	}
	public String getDr_loc() {
		return dr_loc;
	}
	public void setDr_loc(String dr_log) {
		this.dr_loc = dr_log;
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
	
}
