package project.aboutPet.video.model;

import java.util.Date;

// 펫스쿨
// 펫 qna
// 교육
// 회원
// 회원학습
// 영상

	public class EduDTO {
		private int edu_code; // 펫스쿨 코드
		private String edu_title; // 펫스쿨 제목
		private String pet_cate; // 펫 분류
		private String edu_cate; // 교육 분류
		private int edu_diff; // 교육 난이도
		private String edu_ready; // 교육 준비물
		private String edu_tip; // 교육 팁
		private String edu_desc; // 교육 설명
		
		// QNA edu qna
		private int eq_code; // 질문 코드
		private String eq_content; // 질문내용
		private String ea_content; // 답변내용
		
		// 교육
		private int ev_code; // 교육 코드
		
		// 회원학습
		private int learn_code; // 학습코드
		
		// video
		private int v_code; // 영상코드
		private String v_video; // 영상
		private String v_img;  // 영상썸네일
		private String v_type; // 영상분류
		private String v_name; // 영상제목
		private String v_content; // 영상내용
		private Date v_date; // 영상 등록일
		private String v_time; // 영상 시간
		
		//getter, setter
		public int getV_code() {
			return v_code;
		}
		public void setV_code(int v_code) {
			this.v_code = v_code;
		}
		public String getV_video() {
			return v_video;
		}
		public void setV_video(String v_video) {
			this.v_video = v_video;
		}
		public String getV_img() {
			return v_img;
		}
		public void setV_img(String v_img) {
			this.v_img = v_img;
		}
		public String getV_type() {
			return v_type;
		}
		public void setV_type(String v_type) {
			this.v_type = v_type;
		}
		public String getV_name() {
			return v_name;
		}
		public void setV_name(String v_name) {
			this.v_name = v_name;
		}
		public String getV_content() {
			return v_content;
		}
		public void setV_content(String v_content) {
			this.v_content = v_content;
		}
		public Date getV_date() {
			return v_date;
		}
		public void setV_date(Date v_date) {
			this.v_date = v_date;
		}
		public String getV_time() {
			return v_time;
		}
		public void setV_time(String v_time) {
			this.v_time = v_time;
		}	
		public void setEv_code(int ev_code) {
			this.ev_code = ev_code;
		}
		// getter, setter
		public int getEdu_code() {
			return edu_code;
		}
		public void setEdu_code(int edu_code) {
			this.edu_code = edu_code;
		}
		public String getEdu_title() {
			return edu_title;
		}
		public void setEdu_title(String edu_title) {
			this.edu_title = edu_title;
		}
		public String getPet_cate() {
			return pet_cate;
		}
		public void setPet_cate(String pet_cate) {
			this.pet_cate = pet_cate;
		}
		public String getEdu_cate() {
			return edu_cate;
		}
		public void setEdu_cate(String edu_cate) {
			this.edu_cate = edu_cate;
		}
		public int getEdu_diff() {
			return edu_diff;
		}
		public void setEdu_diff(int edu_diff) {
			this.edu_diff = edu_diff;
		}
		public String getEdu_ready() {
			return edu_ready;
		}
		public void setEdu_ready(String edu_ready) {
			this.edu_ready = edu_ready;
		}
		public String getEdu_tip() {
			return edu_tip;
		}
		public void setEdu_tip(String edu_tip) {
			this.edu_tip = edu_tip;
		}
		public String getEdu_desc() {
			return edu_desc;
		}
		public void setEdu_desc(String edu_desc) {
			this.edu_desc = edu_desc;
		}
		
		public int getEq_code() {
			return eq_code;
		}
		public void setEq_code(int eq_code) {
			this.eq_code = eq_code;
		}
		public String getEq_content() {
			return eq_content;
		}
		public void setEq_content(String eq_content) {
			this.eq_content = eq_content;
		}
		public String getEa_content() {
			return ea_content;
		}
		public void setEa_content(String ea_content) {
			this.ea_content = ea_content;
		}
		public int getEv_code() {
			return ev_code;
		}
		public int getLearn_code() {
			return learn_code;
		}
		public void setLearn_code(int learn_code) {
			this.learn_code = learn_code;
		}
	}
