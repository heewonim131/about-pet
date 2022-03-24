package project.aboutPet.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ControllerUsingURI extends HttpServlet{
	
	private static final long serialVersionUID = 9027088350068503732L;
	
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<String, CommandHandler>();
	
	@Override
	public void init() throws ServletException {
		String path = this.getInitParameter("path");
		String configFilePath = this.getServletContext().getRealPath(path);
		
		Properties prop = new Properties();
		try (FileReader fr = new FileReader(configFilePath)) {
			prop.load(fr);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		Iterator<Object> ir = prop.keySet().iterator();
		while (ir.hasNext()) {
			String url = (String)ir.next();
			String handlerClassFullName = prop.getProperty(url);
			
			try {
				Class<?> handlerClass = Class.forName(handlerClassFullName);
				CommandHandler handlerInstance = (CommandHandler)handlerClass.newInstance();
				this.commandHandlerMap.put(url, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}
			
		} // while()
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. http 요청 분석
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		if(requestURI.indexOf(contextPath) == 0) {
			int beginIndex = contextPath.length();
			requestURI = requestURI.substring(beginIndex);
		} // if()
		
		
		// 2. 모델(Model) 얻어오기
		CommandHandler handler = this.commandHandlerMap.get(requestURI);
		String viewPage = null;
		try {
			// 3. request.setAttribute() 결과물 저장하고
			// 4. View 리턴
			viewPage = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 5. 포워딩
		if (viewPage != null) {
			// String prefix = "/aboutPet/log/";
			String prefix = "/Project/aboutPet/";
			String suffix = ".jsp";
			viewPage = String.format("%s%s%s", prefix, viewPage, suffix);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
			// System.out.println(viewPage);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
