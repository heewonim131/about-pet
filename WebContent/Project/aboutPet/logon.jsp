<%@page import="java.util.Iterator"%>
<%@page import="project.aboutPet.mypage.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.Cookies"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>


<%
MemberDTO member=null;
if(request.getAttribute("member")==null){
	System.out.println("리다이렉트 되나 확인용");
	response.sendRedirect("logon_input.jsp?logon=fail"); 
	
}else{
	
 member =(MemberDTO)request.getAttribute("member");

String id=request.getParameter("id");
String passwd=request.getParameter("passwd");


/* if(id.equals("admin")&&passwd.equals("1234")){
    session.setAttribute("auth","관리자");
	response.sendRedirect("ex06_default.jsp"); */
 	


 if(passwd.equals(member.getMem_pw())){
     session.setAttribute("loginDTO",member);
	// session.setAttribute("logonMember","일반회원");
    session.setAttribute("num",member.getMem_code());
    System.out.println(member.getMem_id());
	response.sendRedirect("shop_home.do");
	/* String location="/jspPro/AboutPet/myPage.pet";
	RequestDispatcher dispatcher = request.getRequestDispatcher(location);
	dispatcher.forward(request, response); */
	
	
}else{
	response.sendRedirect("logon_input.jsp?logon=fail"); 
} 

}
   %>
   
  <%


%>

일단여기까지 오는거지?