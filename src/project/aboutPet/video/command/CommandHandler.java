package project.aboutPet.video.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//로직을 처리할 모델(Model) 객체가 공통적으로 구현할 인터페이스
public interface CommandHandler {
	
	// View==Jsp  경로
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//viewPage: tv_main???
	
}
