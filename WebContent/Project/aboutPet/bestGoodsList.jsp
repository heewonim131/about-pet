<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% int mem_code=0;
if(session.getAttribute("num")!=null){
	mem_code=(int)session.getAttribute("num");
}
%>
 <c:set var="mem_code" value="<%=mem_code%>"></c:set> 
<c:if test='${ mem_code eq 0 }'>
<c:import url="header.jsp" />
</c:if>
<c:if test='${ mem_code ne 0 }'>
<c:import url="loginheader.jsp" />
</c:if>

<script type="text/template" id="bestTemplate">
	<li data-dispclsfno="{{dispClsfNo}}">
		<div class="gdset bests">
			<div class="num">
				<em class="b">{{count}}</em>
			</div>
			<div class="thum">
				<a href="/goods/indexGoodsDetail?goodsId={{goodsId}}" class="pic" data-content='{{goodsId}}' data-url="/goods/indexGoodsDetail?goodsId={{goodsId}}">
					<img class="img" src="{{imgSrc}}" alt="{{goodsNm}}" onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
				</a>
			</div>
			<div class="boxs">
				<div class="tit">
					<a href="/goods/indexGoodsDetail?goodsId={{goodsId}}" class="lk" data-content='{{goodsId}}' data-url="/goods/indexGoodsDetail?goodsId={{goodsId}}">{{goodsNm}}</a>
				</div>
				<a href="/goods/indexGoodsDetail?goodsId={{goodsId}}" class="inf" data-content='{{goodsId}}' data-url="/goods/indexGoodsDetail?goodsId={{goodsId}}">
					<span class="prc"><em class="p">{{foSaleAmt}}</em><i class="w">원</i></span>
					<span class="pct" {{rateStyle}}><em class="n">{{rate}}</em><i class="w">%</i></span>
				</a>
			</div>
		</div>
	</li>
	</script>

<script type="text/javascript">
		//베스트 자동/수동 세팅
		var dispType = 'AUTO';
		//PC/모바일
		var deviceGb = 'PC';
		var selectedDispClsfNo = null;
		
		
		//베스트20 목록
		var bestList = [];
		var bestListPeriod = [];
		var template = document.querySelector("#bestTemplate").innerHTML;
		
		$(document).ready(function(){
			// 베스트 20 목록 조회
			 if(dispType == 'AUTO') {
				 getGoodsBestAutoPeriod(<%=request.getParameter("lnbDispClsfNo")%>);
			} 
			
		 	// 카테고리별 클릭시 이벤트
			$("button[id^=dispClsfNo_]").click(function(){
				var dispClsfNo = $(this).data("dispclsfno");
				<%-- var lnbDispClsfNo = <%=request.getParameter("lnbDispClsfNo")%>; --%>
				if(dispType == 'AUTO') {
					var nowPeriod = $("li[name=range][class=active]").data("range");
					getGoodsBestManual(dispClsfNo, nowPeriod);
				}else {
					getGoodsBestManual(dispClsfNo);
				}
			});
			
			 $("li[name=range]").children('a').click(function(){
				var period = $(this).parent().data("range");
				var dispClsfNoPeriod = $("button[id^=dispClsfNo_][class~=active]").data("dispclsfno");
				getGoodsBestManual(dispClsfNoPeriod, period);
			 });
			 
		});
		
</script>
<script type="text/javascript">
		
		// 자동 베스트 상품 셋팅
		function getGoodsBestAuto( target) {
			$('#bestGoodsList').html('');
			$('#bestGoodsList').append(target);
			/* $('#bestGoodsList li:eq('+(rowNum -1)+') div.num > em:eq(0)').text(rowNum); */
		} 
		// 콤마
		function numberWithCommas(x) {
			x = String(x);
			var pattern = /(-?\d+)(\d{3})/;
			while (pattern.test(x))
				x = x.replace(pattern, "$1,$2");
			return x;
		}
		
		var res = {
		          loader : $("<div />" , {"class":"loader"})
		          , container: $("body")
		    };
		// 카테고리별  수동 베스트 상품 
			function getGoodsBestManual(dispClsfNo, period) {
				 $.ajax({
			          url:"indexBestGoodsAjaxList.do",
						 data: {lnbDispClsfNo:<%=request.getParameter("lnbDispClsfNo")%>,
							 		dispClsfNo:dispClsfNo},
						 type:"get",
						 dataType: "JSON",
						 cache: false,
			         success :function (data){ 
						var html = "";
			        	 //alert("성공");
			        	 	$("#bestGoodsList").empty();
			        	 	var item = data.jsonArray;
							 for (var i = 0; i < item.length; i++) {
			        	 		imgPath = item[i].item_img;
			        	 		html += '<li>';
								html += '<div class="gdset bests">';
								html += '<div class="num"> ';
								html += '<em class="b">'+(i*1+1)+'</em> ';
								html += '</div>';
								html += '<div class="thum">';
								html += "<a href='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"' class='pic' data-content='"+item[i].item_code+" 'data-url='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"'>";
								html += "<img class='img' src='"+imgPath+"' alt='"+item[i].goodsNm+"'>";
								html += "</a>";		
								html += "</div>";
								html += "<div class='boxs'>";
								html += "<div class='tit'>";
								html += "<a href='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"' class='lk' data-content="+item[i].item_code+" data-url='/goods/indexGoodsDetail?goodsId="+item[i].item_code+"'>"+item[i].item_name+"</a>";
								html += "</div>";
								html += "<a href='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"' class='inf' data-content='"+item[i].item_code+"' data-url='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"'>";
								html += "<span class='prc'><em class='p'>"+numberWithCommas(item[i].item_price)+"</em><i class='w'>원</i></span>";
								html += '</a></div></div></li>'; 
							} 
								$("#bestGoodsList").append(html);
					}
				 	});  
			}
			
			
			 function getGoodsBestAutoPeriod(lnbDispClsfNo) {
				 
				 $.ajax({
					 url:"indexBestGoodsAjaxList.do",
					 data: {lnbDispClsfNo:lnbDispClsfNo},
					 type:"get",
					 dataType: "JSON",
					 cache: true,
					 success: function(data) {
						var item = data.jsonArray; 
						bestListPeriod = [];
						var templatePeriod = document.querySelector("#bestTemplate").innerHTML;
						$("#bestGoodsList").empty();
						for (var i = 0; i < item.length; i++) {
							var countPeriod = i+1;
							var goodsIdPeriod = item[i].item_code;
							var goodsNmPeriod = item[i].item_name;
							var imgSrcPeriod = item[i].item_img;
							var orgSaleAmtPeriod = item[i].item_price;
							var saleAmtPeriod = item[i].sale_rate;
							
							var bestPeriod = templatePeriod
							.replace(/{{count}}/gi, countPeriod)
							.replace(/{{goodsId}}/gi, goodsIdPeriod)
							.replace(/{{goodsNm}}/gi, goodsNmPeriod)
							.replace(/{{imgSrc}}/gi, imgSrcPeriod)
							.replace(/{{foSaleAmt}}/gi, numberWithCommas(orgSaleAmtPeriod))
							.replace(/{{rate}}/gi, saleAmtPeriod);
							
							 bestListPeriod.push(bestPeriod); 
							 
						}
						 getGoodsBestAuto( bestListPeriod); 
						
					}
					 
					 
					 
				 });
			
					 /*  $.ajax({
				          url:"/AboutPet/Project/aboutPet/indexBestGoodsAjaxList.do",
				          dataType : "JSON",
				          data: {lnbDispClsfNo:dispClsfNo},
				          type:"GET",
				          cache : true,
				         success :function (data){
				          var item = data.jsonArray; 
				          bestListPeriod = [];
						var templatePeriod = document.querySelector("#bestTemplate").innerHTML;
						$("#bestGoodsList").empty();
						for (var i = 0; i < item.length; i++) {
							var countPeriod = i+1;
							var filterInfoPeriod = '02_간식';
							var goodsIdPeriod = item[i].item_code;
							var goodsNmPeriod = item[i].item_name;
							var rasingPeriod = '3';
							 var rasingStylePeriod = dispType == 'AUTO' ? 'style="display:"' : 'style="display:none"';
							var rasingStylePeriod = 'style="display:none"' ;
							var rasingClassPeriod = (rasingPeriod == 0) ? 'nn' : ( rasingPeriod > 0 ? 'up' : 'dn');
							rasingPeriod = Math.abs(rasingPeriod);
							var imgPathPeriod = item[i]item_img;
							 var imgSrcPeriod = item[i]item_img;
							var interestYnPeriod = 'Y';
							var zzimCalssPeriod = (interestYnPeriod == 'Y') ? 'on' : '';
							var foSaleAmtPeriod = item[i].item_price;
							var orgSaleAmtPeriod = item[i].item_price;
							var saleAmtPeriod = item[i].sale_rate;
							var ratePeriod = 0;
							var rateStylePeriod = 'style="display:none"';
							
							var bestPeriod = templatePeriod.replace(/{{count}}/gi, countPeriod)
							.replace(/{{dispClsfNo}}/gi, filterInfoPeriod)
							.replace(/{{goodsId}}/gi, goodsIdPeriod)
							.replace(/{{goodsNm}}/gi, goodsNmPeriod)
							.replace(/{{rasing}}/gi, rasingPeriod)
							.replace(/{{rasingClass}}/gi, rasingClassPeriod)
							.replace(/{{imgSrc}}/gi, imgSrcPeriod)
							.replace(/{{zzimCalss}}/gi, zzimCalssPeriod)
							.replace(/{{rasingStyle}}/gi, rasingStylePeriod)
							.replace(/{{foSaleAmt}}/gi, numberWithCommas(foSaleAmtPeriod))
							.replace(/{{rateStyle}}/gi, rateStylePeriod)
							.replace(/{{rate}}/gi, ratePeriod);
		
							 bestListPeriod.push(bestPeriod); 
						}
					 getGoodsBestAuto(dispClsfNoPeriod, bestListPeriod, 'filterBestListPeriod'); 
					}
				    ,error: function () {
						alert("실패");
					}
				});  */
			}
		 
	</script>
</head>

<body class="body">

	<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData"
			value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">
		<!-- e : gnb 영역 -->
		<!-- s : LNB 영역 -->
		<c:import url="./sidebar.jsp"></c:import>
		<script type="text/javascript">
				
	$(document).ready(function(){
		var cateCdL = "<%=request.getAttribute("lnbDispClsfNo")%>"	// 12564
 		var reqUri = "<%=request.getAttribute("uri")%>"		
		
 		$.each($('li[id^=shortCut] a'), function(){
			$(this).parent('li').attr("class", "");
	 		if($(this).attr("onclick").indexOf(reqUri) != -1){
	 				$(this).parent('li').attr("class", "active");
	 		}
 		});
		
 		// 분류창 열고 보내기
		showMyLnbList(cateCdL);
 		
		$("#lnb").show();
		$("#contents").show();
		

		$("li[id^=menu_tab_]").one('click', function(){	
			var dispClsfNo = $(this).data("dispclsfno");	// 클릭한 li태그의 data : dispclsfno 값
			$("#lnb").hide();
			$("#contents").hide();
			sendDispClsfNo(dispClsfNo);
		});
		
		// 카테고리 버튼 열기/닫기 버튼 쿠키 저장
		$("li[id^=tab_category_]").children('a').click(function(){
			var categoryClass = $(this).parent().attr("class");
			if(categoryClass == 'open') {
				$.cookie('categoryYn', 'N', {path:'/'});
			}else{
				$.cookie('categoryYn', 'Y', {path:'/'});
			}
		});
	});
	
	function loadCornerGoodsList(dispClsfNo, dispCornNo, dispClsfCornNo, dispType, timeDeal) {
		var petNo = $("#petNo_rec").val();
		var form = document.createElement("form");
		document.body.appendChild(form);
		var url = "/shop/indexGoodsList";
		form.setAttribute("method", "GET");
		form.setAttribute("action", url);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispClsfNo");
		hiddenField.setAttribute("value", dispClsfNo);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispCornNo");
		hiddenField.setAttribute("value", dispCornNo);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispClsfCornNo");
		hiddenField.setAttribute("value", dispClsfCornNo);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispType");
		hiddenField.setAttribute("value", dispType);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		if(timeDeal != undefined) {
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "timeDeal");
			hiddenField.setAttribute("value", timeDeal);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}
		if(dispType == 'RCOM') {
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "petNo");
			hiddenField.setAttribute("value", petNo);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}
		form.submit();
	}
	
	function setCateList(dispClsfNo, upDispClsfNo, scateYN) {
		var dispClsfNo2 ='';	
		if('1' == upDispClsfNo ) {			// 강아지
			dispClsfNo2 = '1'
		} else if('2' == upDispClsfNo ) {	// 고양이
			dispClsfNo2 = '2'
		}
		url = "/AboutPet/Project/aboutPet/itemList.do?dispClsfNo="+dispClsfNo+"&lnbDispClsfNo="+dispClsfNo2; //+"&cateCdL="+cateCdL+"&cateCdM="+cateCdM;
		var cateCdL = $("#cateCdL").val();
		var cateCdM = $("#cateCdM").val();
		if(scateYN == 'Y') {
// 			if(dispClsfNo == '') {
// 				url = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&lnbDispClsfNo="+lnbDispClsfNo+"&cateCdL="+cateCdL+"&cateCdM="+cateCdM;
// 			}else {
// 				url = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&lnbDispClsfNo="+lnbDispClsfNo+"&cateCdL="+cateCdL+"&cateCdM="+cateCdM;
// 			}
			url = "/AboutPet/Project/aboutPet/itemList.do?dispClsfNo="+dispClsfNo+"&lnbDispClsfNo="+dispClsfNo2; //+"&cateCdL="+cateCdL+"&cateCdM="+cateCdM;
		}
		location.href = url;
	}
	
	// 분류번호 보내기
	function sendDispClsfNo(dispClsfNo){		// 대분류 코드 받아서
		var lnbDispClsfNo = dispClsfNo
		var cateCdL = dispClsfNo
		
		
		if('1' == dispClsfNo ) {			// 강아지
			lnbDispClsfNo = '1'
		} else if('2' == dispClsfNo ) {	// 고양이
			lnbDispClsfNo = '2'
		} 
	
		var form = document.createElement("form");		//
		document.body.appendChild(form);
		var url = "<%=request.getAttribute("uri")%>";
		if("<%=request.getAttribute("uri")%>" == "/event/indexSpecialExhibitionZone" || 
		   "<%=request.getAttribute("uri")%>" == "/shop/indexGoodsList"){
			url = "shop_home.do";
		}		// 없는 페이지 호출시 홈으로 되돌려줌
		
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lnbDispClsfNo');
		hiddenField.setAttribute('value', lnbDispClsfNo);	// 페이지를 클릭할 때마다 넘어가는 대분류 코드
		form.appendChild(hiddenField);
		
		var uri = "<%=request.getAttribute("uri")%>";
		
		if(uri == "/AboutPet/Project/aboutPet/itemList.do" ||
		   uri == "/event/indexExhibitionZone") {
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "cateCdL");
			hiddenField.setAttribute("value", cateCdL);	// 12564
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/AboutPet/Project/aboutPet/indexNewCategory.do" ||
				 uri == "/AboutPet/Project/aboutPet/indexBestGoodsList.do") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);	// NEW BEST?
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/brand/indexBrandDetail"){
			var bndNo = $("input[id=bndNo]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "bndNo");
			hiddenField.setAttribute("value", bndNo);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/shop/indexPetShopTagGoods"){	
			var tags = new Array();
			tags.push( $("#tags").val() );
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "tags");
			hiddenField.setAttribute("value", tags);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "tagNm");
			hiddenField.setAttribute("value", $("#tagNm").val());
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/pet/event/petshopEventList" ||
				 uri == "/shop/indexLive"){
			form.setAttribute("method", "GET");
		}else if(uri == "/event/shop/main"){
			form.setAttribute("method", "GET");
			form.removeChild(hiddenField);

			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispClsfNo");
			hiddenField.setAttribute("value", lnbDispClsfNo);
			form.appendChild(hiddenField);
		}else {
			form.setAttribute("method", "GET");
		}
		form.setAttribute("action", url);
		document.body.appendChild(form);
		form.submit();
	}
	
	// 나의 반려 동물로 LNB 셋팅
	function showMyLnbList(lnbDispClsfNo) {
		$("li[id^=tab_category_]").hide();
		$("#b_tag_"+lnbDispClsfNo).click();
		$("#tab_category_"+lnbDispClsfNo).show();
	}
	
	function goLink(url) {
		var viewDispClsfNo = '<%=request.getAttribute("lnbDispClsfNo")%>';
		if(url.indexOf("?") > -1) {
			url += "&lnbDispClsfNo="+viewDispClsfNo;
		}else {
			url += "?lnbDispClsfNo="+viewDispClsfNo;
		}
		location.href = url;
	}
	
</script>
		<nav class="lnb shop" id="lnb">
			<div class="inr">
				<nav class="menushop">
					<button type="button" class="bt st">
						<span class="t"></span>
					</button>
					<div class="list">
						<ul class="menu">
							<li id="menu_tab_1" class="" data-dispClsfNo="1"><a
								class="bt" href="javascript:;"><b id="b_tag_1" class="t">강아지</b></a>
							</li>
							<li id="menu_tab_2" class="" data-dispClsfNo="2"><a
								class="bt" href="javascript:;"><b id="b_tag_2" class="t">고양이</b></a>
							</li>
						</ul>
					</div>
				</nav>
				<div class="shopCate">
					<ul class="menu">
						<!-- 				<li id="categoryStart"></li> -->
						<li id="shortCut3"><a class="bt" href="javascript:;"
							onclick="goLink('/AboutPet/Project/aboutPet/indexNewCategory.do?dispCornType=NEW')">
								<b class="t">신상품</b>
						</a></li>
						<li id="shortCut4"><a class="bt" href="javascript:;"
							onclick="goLink('/AboutPet/Project/aboutPet/indexBestGoodsList.do?dispCornType=BEST')">
								<!-- dispClsfNo=300000174 --> <b class="t">베스트</b>
						</a></li>
						<li class="open" id="tab_category_1"><a class="bt tog"
							href="javascript:;"><b class="t">카테고리</b></a>
							<ul class="sm">
								<c:forEach items="${ shopCategory }" var="dto">
									<li class=""><a class="bt"
										href="javascript:setCateList('${ dto.mcate_code }', '<%= request.getAttribute("lnbDispClsfNo") %>', 'N');"><b
											class="t">${ dto.mcate_name }</b></a></li>
								</c:forEach>
							</ul></li>

						<li class="open" id="tab_category_2"><a class="bt tog"
							href="javascript:;"><b class="t">카테고리</b></a>
							<ul class="sm">

								<c:forEach items="${ shopCategory }" var="dto">
									<li class=""><a class="bt"
										href="javascript:setCateList('${ dto.mcate_code }', '<%= request.getAttribute("lnbDispClsfNo") %>', 'N');"><b
											class="t">${ dto.mcate_name }</b></a></li>
								</c:forEach>

							</ul></li>

					</ul>
				</div>
				<div class="gdrecent">
					<a class="box" href="#"
						onclick="location.href='/mypage/indexRecentViews/'"
						data-content="" data-url="/mypage/indexRecentViews/"> <b
						class="t">최근본상품</b>
						<div class="thumb">
							<div
								style="display: flex; justify-content: center; width: 48px; height: 48px; background-color: #f2f5f9; border-radius: 100px; font-size: 25px">
								👀</div>
						</div>
					</a>
				</div>
			</div>
		</nav>
		<!-- e : LNB 영역 -->
		<!-- s : 검색 영역 -->
		<!-- e : 검색 영역 -->

		<!-- s : 본문영역 -->
		<!-- 베스트 -->
		<input type="hidden" id="dispCornType_best" value="BEST" /> <input
			type="hidden" id="dispClsfCornNo_best" value="" /> <input
			type="hidden" id="dispType_best" value="AUTO" />
		<main class="container lnb page shop dm bests" id="container">
			<div class="pageHeadPc lnb">
				<div class="inr">
					<div class="hdt">
						<h3 class="tit">베스트</h3>
					</div>
				</div>
			</div>
			<div class="inr">
				<!-- 본문 -->
				<div class="contents" id="contents">
					<nav class="smain_cate_sld">
						<div class="sld-nav">
							<button type="button" class="bt prev">이전</button>
							<button type="button" class="bt next">다음</button>
						</div>
						<div class="swiper-container slide">
							<ul class="uiTab f swiper-wrapper list">
								<li class="swiper-slide active">
									<button type="button" class="btn active" id="dispClsfNo_12564"
										data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b"
										data-dispClsfNo="0" data-filter="">전체</button>
								</li>
								<c:forEach items="${shopCategory }" var="dto" varStatus="c">
									<c:choose>
										<c:when test="${dto.lcate_code eq 1 }">
											<c:if test="${dto.mcate_code <=  8 && dto.mcate_code != 6 }">
												<li class="swiper-slide ">
													<button type="button" class="btn"
														id="dispClsfNo_${dto.mcate_code }"
														data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b"
														data-dispClsfNo="${dto.mcate_code }" data-filter="">${dto.mcate_name }</button>
												</li>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if
												test="${dto.mcate_code <= 21 && (dto.mcate_code != 18 && dto.mcate_code != 19)}">
												<li class="swiper-slide ">
													<button type="button" class="btn"
														id="dispClsfNo_${dto.mcate_code }"
														data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b"
														data-dispClsfNo="${dto.mcate_code }" data-filter="">${dto.mcate_name }</button>
												</li>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- <li class="swiper-slide">
														<button type="button" class="btn" id="dispClsfNo_12569" data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b" data-dispClsfNo="12569">사료</button>
													</li>
												<li class="swiper-slide">
														<button type="button" class="btn" id="dispClsfNo_12571" data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b" data-dispClsfNo="12571">간식</button>
													</li>
												<li class="swiper-slide">
														<button type="button" class="btn" id="dispClsfNo_12572" data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b" data-dispClsfNo="12572">건강관리</button>
													</li>
												<li class="swiper-slide">
														<button type="button" class="btn" id="dispClsfNo_12573" data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b" data-dispClsfNo="12573">장난감/훈련</button>
													</li>
												<li class="swiper-slide">
														<button type="button" class="btn" id="dispClsfNo_12575" data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b" data-dispClsfNo="12575">위생/배변</button>
													</li>
												<li class="swiper-slide">
														<button type="button" class="btn" id="dispClsfNo_12576" data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b" data-dispClsfNo="12576">미용/목욕</button>
													</li>
												<li class="swiper-slide">
														<button type="button" class="btn" id="dispClsfNo_12578" data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b" data-dispClsfNo="12578">하우스</button>
													</li> -->
							</ul>
						</div>
					</nav>
					<nav class="tab bests">
						<ul class="uiTab g tmenu">
							<li class="active" name="range" data-range="DAY"><a
								class="bt" data-ui-tab-btn="tab_bests_range" href="javascript:;"><span>일간</span></a>
							</li>
							<li name="range" data-range="WEEK"><a class="bt"
								data-ui-tab-btn="tab_bests_range" href="javascript:;"><span>주간</span></a>
							</li>
							<li name="range" data-range="MONTH"><a class="bt"
								data-ui-tab-btn="tab_bests_range" href="javascript:;"><span>월간</span></a>
							</li>
						</ul>
					</nav>
					<section class="sect dm bests">
						<div class="ranklist">
							<ul class="list" id="bestGoodsList">
							</ul>
						</div>
					</section>
				</div>
			</div>
		</main>
		<!-- TWC chatbot Scripts -->
		<script
			src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.plugin.js"></script>

		<script type="text/javascript">
	(function() {
	 Twc('init', {
	   brandKey: "OEV1nVeHcnzgQtklwEXksg",
	   channelType: "chat",
	   appId: "",
	   UserNo: "0",
	   buttonOption: {
	     showLauncher: false,
	     zIndex: 500,
	     bottom: $("#cartNavs").length > 0 ? 95 : 25
	    }
	  })
	})();
	
	function twcChatOpen() {
		if ("0" == "0") {
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{
			    ycb:function(){ // 확인 버튼 클릭
			        // 로그인 페이지로 이동 (로그인 후 returnUrl로 이동);
					/* location.href = "/indexLogin?returnUrl=/tv/home/"; */
					location.href = "/indexLogin?returnUrl=/shop/home/";
			    },
			    ncb:function(){ // 취소 버튼 클릭
			    	
			    },
			    ybt:'로그인',
			    nbt:'취소'
			});
		} else {
			Twc.Chat.open();	
			
			// adbrix 호출 추가 (앱)
			if ("false" == "true") {
				onAdbrixCustomEventData.eventName = 'petcare_click';
				toNativeAdbrix(onAdbrixCustomEventData);
			}
		}
	}
</script>

		<nav class="floatNav">
			<div class="inr">
				<div class="bts">
					<div class="pd tp">
						<button type="button" class="bt tops">페이지위로</button>
					</div>
					<div class="pd tk">
						<button type="button" class="bt talk" onclick="twcChatOpen();">상담톡</button>
						<div class="tpn">
							<div class="txt">
								<div class="tt">24시간 언제나</div>
								<div class="ss">궁금할땐 톡!</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<!-- location 영역 포함  -->
		<!-- e : 본문영역 -->

		<!-- s : layerPop 영역 -->
		<!-- e : layerPop 영역 -->

		<!-- s : menubar 영역 -->
		<script type="text/javascript">
	$(document).ready(function(){
		$("li[id^=liTag_]").one('click', function(){
			$(this).addClass("active");
	    });
		
	});
</script>

		<nav class="menubar">
			<div class="inr">
				<ul class="menu">
					<!--  펫로그 파트너사인 경우 메뉴가 비활성 -->
					<li id="liTag_20" class="tv "><a href="#"
						onclick="location.href='https://aboutpet.co.kr/tv/home/'"
						class="bt"><span>TV</span></a></li>
					<li id="liTag_30" class="log "><a href="#"
						onclick="location.href='https://aboutpet.co.kr/log/home/'"
						class="bt"><span>로그</span></a></li>
					<li id="liTag_10" class="shop active"><a href="#"
						onclick="location.href='https://aboutpet.co.kr/shop/home/'"
						class="bt"><span>샵</span></a></li>
					<li id="liTag_00" class="my "><a href="#"
						onclick="location.href='https://aboutpet.co.kr/mypage/indexMyPage/'"
						class="bt"><span>MY</span></a></li>
				</ul>
			</div>
		</nav>
		<!-- e : menubar 영역 -->

		<!-- s : footer 영역 -->
		<script type="text/javascript">
	/* 사업자정보 팝업 */
	function openLicensee(licensee) {
		var url = "http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no="+licensee;
		window.open(url, "communicationViewPopup", "width=750, height=700;");
	}
	
	/* Escrow */
	function openEscrow() {
		var options = {
			url : "/introduce/terms/indexEscrow",
			params : {},
			width : 640,
			height: 690,
			callBackFnc : "",
			modal : true
		};
		pop.open("escrow", options);
	}
	
	// 이용약관 pop
	function openTerms(termsCd , settingYn){
		if("false" == "true"){
			var url = "/introduce/terms/indexTermsApp?termsCd="+ termsCd +"&settingYn="+ settingYn;
			window.open(url, "termsContentPop");
		}else{
			var options = {
				url : "/introduce/terms/indexTerms"
				, data : {
					termsCd : termsCd
					, settingYn : settingYn
				}
				, dataType : "html"
				, done : function(html){
					$("#layers").html(html);
					ui.popLayer.open("termsContentPop");
				}
			}
			ajax.call(options);
		}
	}
	// 입점/제휴 문의 pop
	function openPartnershipInquiry(){
			var options = {
				url : "/customer/notice/indexPartnerNoticeList"
				, data : ''
				, dataType : "html"
				, done : function(html){
					$("#layers").html(html);
					ui.popLayer.open("popInqry");
				}
			}
			ajax.call(options);
		}
</script>

		<!-- footer -->
		<footer class="footer" id="footer">
			<div class="inr">
				<div class="link">
					<ul class="list">
						<li><a href="#"
							onclick="openTerms('2001' , 'Y'); return false;">서비스 이용약관</a></li>
						<li><a href="#"
							onclick="openTerms('2002' , 'Y'); return false;">개인정보 처리방침</a></li>
						<li><a href="#" onclick="openPartnershipInquiry()">입점/제휴
								문의</a></li>
					</ul>
				</div>
				<div class="info">
					<ul class="list">
						<li>(주)어바웃펫 대표 : 김경환, 나옥귀</li>
						<li>사업자 등록번호 : 120-87-90035</li>
						<li class="dn">통신판매업신고번호 : 제 2020-서울강남-03142호</li>
						<li>개인정보관리자 : 정명성 hello@aboutpet.co.kr</li>
						<li>TEL : 1644-9601</li>
					</ul>
					<p class="adr">서울특별시 강남구 테헤란로 151 (역삼하이츠빌딩) 지하2층</p>
				</div>
				<div class="copy">&copy; copyright (c) www.aboutpet.co.kr all
					rights reserved.</div>
			</div>
		</footer>
		<!--// footer -->

		<div id="layers"></div>
		<!-- e : footer 영역 -->
	</div>
</body>
</html>