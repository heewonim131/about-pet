package com.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
 
@WebFilter("/days09/xml/*")
public class XSLTFilter implements Filter {

	private String xslPath = null;

	@Override
	public void destroy() { 
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 response.setContentType("text/html; charset=UTF-8");
		 
		 PrintWriter writer = response.getWriter();
		 
		 // response   객체로 부터  xml->html 변환 시키는 응답용 response 객체
		 XSLTResponseWrapper responseWrapper =
				 new XSLTResponseWrapper((HttpServletResponse) response);
		 
		 chain.doFilter(request, responseWrapper);  // chain.doFilter() 기준
		 
		 // [응답]
		 // XSLT 변환
		 try {
			 // TransformerFactory 공장
TransformerFactory factory = TransformerFactory.newInstance();			
			Reader xslReader = new BufferedReader(new FileReader(xslPath));
			StreamSource xslSource = new StreamSource(xslReader);	
			// xml - > html 변환기 == Transformer 클래스 객체
Transformer transformer = factory.newTransformer(xslSource);
			
			String xmlDocument = responseWrapper.getBufferedString();
//System.out.println("변환할 문서 : " + xmlDocument);
			Reader xmlReader = new StringReader(xmlDocument);
			StreamSource xmlSource = new StreamSource(xmlReader);
			
			StringWriter buffer = new StringWriter(4096);

			// 변환 시켜라..
transformer.transform(xmlSource, new StreamResult(buffer));
			
			writer.print( buffer.toString() );
			
		} catch (Exception e) {
		    throw new ServletException(e);
		}
		 
		 writer.flush();  // 응답
		 writer.close(); // 
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		 	this.xslPath = filterConfig.getServletContext().getRealPath("/WEB-INF/xsl/book.xsl");
	}
     
} // filter
