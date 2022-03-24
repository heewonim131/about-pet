package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	@Override
	public void destroy() { 
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException { 
		System.out.println("> LoginCheckFilter.doFilter() ...");
		
		// jsp 페이지 : session 기본 내장 객체
		// 서블릿 또는 필터 안에서 session 사용 ?
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		// HttpSession session = httpRequest.getSession();  세션 객체가 있으면 반환, 없으면 생성해서 세션 반환
		HttpSession session = httpRequest.getSession(false);  //  세션 객체가 있으면 반환, 없으면 null 반환
		
		boolean loginFlag = false;
		if (session != null) {
			if( session.getAttribute("member")  != null ) {   // id 로그인 인증 O
				loginFlag = true;
			}
		}
		
		if (loginFlag) {
			// 다음 체인(필터, jsp, 서블릿)으로 전달
			chain.doFilter(request, response);
		}else {  // 인증받지 않은 경우
			// 원래 요청 URL 확인
			String referer = httpRequest.getRequestURI();
			System.out.println("> 원래 요청 URL : "		+ referer );
			session.setAttribute("referer", referer);
			
			/*
			request.setAttribute("referer", httpRequest.getRequestURI());
			*/
			
			String path = "/days10/member/ex01_loginForm.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
	} 

}  // class














