package project.aboutPet.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.service.LogonService;
import project.aboutPet.mypage.service.SignUpService;

public class SignUpHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//aboutpetpro임
		if (request.getMethod().equalsIgnoreCase("post")) {
		System.out.println("post방식");
		String id=request.getParameter("loginId");
		String passwd=request.getParameter("pswd");
		String nickName=request.getParameter("nickNm");
		String email=request.getParameter("email");
		String inviteCode="IV"+id;
		System.out.println(id);
		System.out.println(passwd);
		System.out.println(inviteCode);
		
		
		
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(id); //  아이디
        dto.setMem_pw(passwd); //  비번
        dto.setNickname(nickName); //  닉넴
        dto.setMem_email(email); //  이메일
        dto.setMem_invite(inviteCode); //  자기 추천인 코드
     
    	
		
        SignUpService signUpService=SignUpService.getInstance();
		
	
        int rowCount=signUpService.signUp(dto);
        if (rowCount==1) {
    		LogonService service =LogonService.getInstance();
        	MemberDTO member = service.select(id);

        	HttpSession session = request.getSession();
        	 session.setAttribute("num",member.getMem_code());
        	 session.setAttribute("loginDTO",dto);
        	return "join2";
		}
	}else {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	}
	
	
	   
		
		
		return "join2";
	}

}
