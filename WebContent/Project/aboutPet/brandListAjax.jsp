<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
goodsCount = ${count}
$(document).ready(function(){
	var metaImgPath = $(".thum .pic .img").eq(0).attr("src");
	// 공유하기 이미지 셋팅
	$("meta[property='og\\:image']").attr("content", metaImgPath);
	$("meta[property='og\\:image:url']").attr("content", metaImgPath);
	
	$("li[id^=order_] button").click(function(){
		var dispClsfNo = $("li[class~=active][name=dispClsfNo]").children().data("dispclsfno");
		brandGoodsList.list(dispClsfNo, $(this).val());
    });
});
function focusCategory(idx) {
	ui.disp.subnav.elSwiper.el.slideTo(idx-1);
}
</script>
<ul class="list" id="brandUl">
<c:forEach items="${html }" var="html">
${html }
</c:forEach>
</ul>


