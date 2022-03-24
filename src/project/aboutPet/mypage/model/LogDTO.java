package project.aboutPet.mypage.model;

import java.sql.Date;

public class LogDTO {

	private int log_code;
	private Date log_date;
	private String log_content;
	private String log_img;
	
	// getter, setter
	public int getLog_code() {
		return log_code;
	}
	public void setLog_code(int log_code) {
		this.log_code = log_code;
	}
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
	public String getLog_content() {
		return log_content;
	}
	public void setLog_content(String log_content) {
		this.log_content = log_content;
	}
	public String getLog_img() {
		return log_img;
	}
	public void setLog_img(String log_img) {
		this.log_img = log_img;
	}
	
	
	
}
