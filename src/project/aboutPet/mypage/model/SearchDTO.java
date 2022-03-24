package project.aboutPet.mypage.model;

import java.sql.Date;

public class SearchDTO {

	private int s_code;
	private int mem_code;
	private String s_word;
	private Date s_time;
	private int rank1;
	private int rank2;
	private int changedRank;
	
	
	public int getRank1() {
		return rank1;
	}
	public void setRank1(int rank1) {
		this.rank1 = rank1;
	}
	public int getRank2() {
		return rank2;
	}
	public void setRank2(int rank2) {
		this.rank2 = rank2;
	}
	public int getChangedRank() {
		return changedRank;
	}
	public void setChangedRank(int changedRank) {
		this.changedRank = changedRank;
	}
	public int getS_code() {
		return s_code;
	}
	public void setS_code(int s_code) {
		this.s_code = s_code;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getS_word() {
		return s_word;
	}
	public void setS_word(String s_word) {
		this.s_word = s_word;
	}
	public Date getS_time() {
		return s_time;
	}
	public void setS_time(Date s_time) {
		this.s_time = s_time;
	}
	
	
	
	
	
}
