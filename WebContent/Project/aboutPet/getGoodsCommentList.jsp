<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
ArrayList<String> html =  (ArrayList<String>) request.getAttribute("html");

%>
<script type="text/javascript">
	goodsComment.totalPageCount = <%=html.size()%>;
	goodsComment.page = 1;
	if(goodsComment.totalPageCount == goodsComment.page){
		$("#commentMore").hide();
	}else{
		$("#commentMore").show();
	}
	
	<%
	
	if(html.size()==0){

	%>
	if(goodsComment.goodsCstrtTpCd == 'ATTR' || goodsComment.goodsCstrtTpCd == 'PAK'){
		$('#commentListUl').html('<li style="text-align:center;">등록된 후기가 없습니다.</li>');
	}else{
		$("div[name=commentArea]").text("등록된 후기가 없습니다.");
		$("div[name=commentArea]").css("text-align" , "center");
		$(".btn[data-ui-tab-val=tab_rvt_b]").trigger('click');
		goodsComment.selectTab = "PLG";
	} 
	<%
	}
	%>
	/* $("span[name=commentAllCnt]").text('0 건');
	$("a[name=pdRevCnt]").text('(0)');
	$("i[name=pdRevCnt]").text('0'); */
</script>

<c:forEach items="${html }" var="html">
${html }
</c:forEach>






<%
request.setAttribute("html_size", html.size());
%>
