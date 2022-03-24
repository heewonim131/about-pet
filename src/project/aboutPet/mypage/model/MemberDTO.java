package project.aboutPet.mypage.model;

public class MemberDTO {
	
	// fields
	private int mem_code;	// 회원코드
	private String mem_id;	// 아이디
	private String mem_pw;	// 비밀번호
	private String nickname;	// 닉네임
	private String mem_name;	// 이름
	private String contact;		// 연락처
	private String mem_email;	// 이메일
	private String gr_name;	// 등급
	private int mem_point;	// 포인트
	private String mem_invite;	// 내추천코드
	private String invited;		// 추천인코드
	private String mpl_url;		// 펫로그링크
	private String mtag;	// 관심태그
	private String mpl_intro;	// 펫로그소개
	
	// 프로필 이미지
	private String mem_img;		// 프로필사진
//	private String filesystemname;        // 시스템파일명
//	private String originalfilename;        // 오리지널파일명
//	private long filelength;               // 파일크기

	// getter, setter
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
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getGr_name() {
		return gr_name;
	}
	public void setGr_name(String gr_name) {
		this.gr_name = gr_name;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	public String getMem_invite() {
		return mem_invite;
	}
	public void setMem_invite(String mem_invite) {
		this.mem_invite = mem_invite;
	}
	public String getInvited() {
		return invited;
	}
	public void setInvited(String invited) {
		this.invited = invited;
	}
	public String getMpl_url() {
		return mpl_url;
	}
	public void setMpl_url(String mpl_url) {
		this.mpl_url = mpl_url;
	}
	public String getMtag() {
		return mtag;
	}
	public void setMtag(String mtag) {
		this.mtag = mtag;
	}
	public String getMpl_intro() {
		return mpl_intro;
	}
	public void setMpl_intro(String mpl_intro) {
		this.mpl_intro = mpl_intro;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	
}//class
