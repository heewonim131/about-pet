package project.aboutPet.log.model;

// import java.util.Date;

public class LogDTO {

   // fields
   private int log_code;        // 펫로그 코드
   private int mem_code;   		// 회원코드
   private String log_date;   	// 등록일
   private String log_content; 	// 내용
   private String log_img;     	// 사진
   
   private String mem_name;		// 회원 이름
   private String nickname;		// 회원 닉네임
   
   // 펫 이미지
   private String pet_img;
   
   // 좋아요, 댓글
   private int log_like;
   private int log_cmt;
   
   // 게시글, 팔로우, 팔로잉
   private int log_count;
   private int mem_follow;
   private int mem_following;
   
   // 팔로우, 팔로잉 코드(이름으로 변환)
   private int mf_code;
   
   // 팔로우회원 코드, 팔로우회원 이름 / 팔로잉회원 코드, 팔로잉회원 이름
   private int folm_code;
   private String folm_name;
   private int folim_code;
   private String folim_name;
   
   // 댓글내용, 댓글작성날짜, 댓글_갯수
   private String lcmt;
   private String lc_date;
   private int lcmt_count;
   
   // 좋아요 상태유지
   private String pilot_like;
   
   
   
   // getter, setter
	public int getLog_code() {
		return log_code;
	}
	public void setLog_code(int log_code) {
		this.log_code = log_code;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public String getLog_date() {
		return log_date;
	}
	public void setLog_date(String log_date) {
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

	
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	// 펫 이미지, 펫 이름 getter, setter
	public String getPet_img() {
		return pet_img;
	}
	public void setPet_img(String pet_img) {
		this.pet_img = pet_img;
	}
	
	
	// 좋아요, 댓글 getter, setter
	public int getLog_like() {
		return log_like;
	}
	public void setLog_like(int log_like) {
		this.log_like = log_like;
	}
	public int getLog_cmt() {
		return log_cmt;
	}
	public void setLog_cmt(int log_cmt) {
		this.log_cmt = log_cmt;
	}
	
	
	// 게시글, 팔로우, 팔로잉 getter, setter
	public int getLog_count() {
		return log_count;
	}
	public void setLog_count(int log_count) {
		this.log_count = log_count;
	}
	public int getMem_follow() {
		return mem_follow;
	}
	public void setMem_follow(int mem_follow) {
		this.mem_follow = mem_follow;
	}
	public int getMem_following() {
		return mem_following;
	}
	public void setMem_following(int mem_following) {
		this.mem_following = mem_following;
	}
	
	
	// 팔로우, 팔로잉 코드(이름으로 변환) getter, setter
	public int getMf_code() {
		return mf_code;
	}
	public void setMf_code(int mf_code) {
		this.mf_code = mf_code;
	}
	
	
	// 팔로우회원 코드, 팔로우회원 이름 / 팔로잉회원 코드, 팔로잉회원 이름 getter, setter
	public int getFolm_code() {
		return folm_code;
	}
	public void setFolm_code(int folm_code) {
		this.folm_code = folm_code;
	}
	public String getFolm_name() {
		return folm_name;
	}
	public void setFolm_name(String folm_name) {
		this.folm_name = folm_name;
	}
	public int getFolim_code() {
		return folim_code;
	}
	public void setFolim_code(int folim_code) {
		this.folim_code = folim_code;
	}
	public String getFolim_name() {
		return folim_name;
	}
	public void setFolim_name(String folim_name) {
		this.folim_name = folim_name;
	}
	
	
	// 댓글내용, 댓글작성날짜, 댓글_갯수
	public String getLcmt() {
		return lcmt;
	}
	public void setLcmt(String lcmt) {
		this.lcmt = lcmt;
	}
	public String getLc_date() {
		return lc_date;
	}
	public void setLc_date(String lc_date) {
		this.lc_date = lc_date;
	}
	public int getLcmt_count() {
		return lcmt_count;
	}
	public void setLcmt_count(int lcmt_count) {
		this.lcmt_count = lcmt_count;
	}

	
	// true, false 여부
	public String getPilot_like() {
		return pilot_like;
	}
	public void setPilot_like(String pilot_like) {
		this.pilot_like = pilot_like;
	}
	
}
