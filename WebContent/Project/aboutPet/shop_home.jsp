<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="project.aboutPet.shop.model.ShopDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
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

<!--// header pc-->
<!-- e : header 영역 -->
<!-- s : gnb 영역 -->
<script type="text/javascript">
function setCateList(dispClsfNo, upDispClsfNo) {
	var dispClsfNo2 ='';	
	if('12564' == upDispClsfNo ) {			// 강아지
		dispClsfNo2 = '300000173'
	} else if('12565' == upDispClsfNo ) {	// 고양이
		dispClsfNo2 = '300000174'
	} else if('14111' == upDispClsfNo ) {	// 관상어
		dispClsfNo2 = '300000175'
	} else if('14196' == upDispClsfNo ) {	// 소동물
		dispClsfNo2 = '300000176'
	}
	
	location.href = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&dispClsfNo2="+dispClsfNo2+"&cateCdL="+upDispClsfNo+"&cateCdM="+dispClsfNo;
}

function goIndexLoginSettings() {
	location.href = "/indexLoginSettings?returnUrl=" + window.location.pathname;
}

//시리즈 팝업
function seriesOpen(){
	if("true" == "true"){
		var options = {
			url : "/tv/series/getSeriesList"
			, type : "POST"
			, dataType : "html"
			, data : { }
			, done : function(result){
				$("#srisListPopup").append(result);
				ui.popLayer.open('popSeriesList');
			}
		};
		ajax.call(options);
	}else{
		var url = "/tv/series/getSeriesListApp";
		window.open(url, "popSeriesList");
	}
}


function goMyPetLogGnb(){
	if( checkLoginGnb() && checkRegPetGnb() ){
		location.href = "https://aboutpet.co.kr/log/indexMyPetLog/?mbrNo=0";
	}
}


function checkLoginGnb(){
		if( "false" != "true" ){
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들
				ycb:function(){
					location.href = "https://aboutpet.co.kr/indexLogin";
				},
				ncb:function(){
					return false;
				},
				ybt:"로그인", // 기본값 "확인"
				nbt:"취소"  // 기본값 "취소"
			});			
		}else{
			return true;
		}	
}


function checkRegPetGnb(){	
		if( "" == null || "" == ""){
			ui.confirm('마이펫 등록 후 이용할 수 있어요<br/>펫정보를 등록할까요?',{ // 컨펌 창 옵션들
				ycb:function(){
					// 반려동물 등록 화면으로 이동.
					location.href = "https://aboutpet.co.kr/my/pet/petInsertView";
				},
				ncb:function(){
					//alert('취소');
					return false;
				},
				ybt:"예", // 기본값 "확인"
				nbt:"아니요"  // 기본값 "취소"
			});			
		}else{
			return true;
		}
}
</script>
<jsp:include page="./sidebar.jsp"></jsp:include>
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
		}else if(uri == "/AboutPet/Project/aboutPet/indexNewCategory" ||
				 uri == "/AboutPet/Project/aboutPet/indexBestGoodsList.do") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);	// NEW BEST?
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/Project/aboutPet/brandList.do"){
			var bndNo = $("input[id=bndNo]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "br_code");
			hiddenField.setAttribute("value", br_code);
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
		$("#b_tag_"+lnbDispClsfNo).click();
		$("li[id^=tab_category_]").hide();
		$("#tab_category_"+lnbDispClsfNo).show();
	}
	
	function goLink(url) {
		var viewDispClsfNo = '<%=request.getAttribute("lnbDispClsfNo")%>';
		if(url.indexOf("?") > -1) {
			url += "&dispClsfNo="+viewDispClsfNo;
		}else {
			url += "?dispClsfNo="+viewDispClsfNo;
		}
		location.href = url;
	}
	
	
	function clickAD() {
		alert("준비중..!");
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
					<li id="menu_tab_1" class="" data-dispClsfNo="1"><a class="bt"
						href="javascript:;"><b id="b_tag_1" class="t">강아지</b></a></li>
					<li id="menu_tab_2" class="" data-dispClsfNo="2"><a class="bt"
						href="javascript:;"><b id="b_tag_2" class="t">고양이</b></a></li>
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
				onclick="location.href='/mypage/indexRecentViews/'" data-content=""
				data-url="/mypage/indexRecentViews/"> <b class="t">최근본상품</b>
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
<main class="container lnb page shop hm main" id="container">
	<div class="mnschbox">
		<div class="inr">
			<div class="shop-search input">
				<input id="srchShopWord" name="srchWord" readonly="readonly"
					type="search" value="" autocomplete="off">
				<button type="button" class="btnSch" data-content=""
					data-url="/commonSearch">검색</button>
			</div>
		</div>
	</div>
	<div class="inr">
		<!-- 본문 -->
		<div class="contents" id="contents">
			<input type="hidden" id="dispClsfNo_" value="300000173" />
			<section class="sect mn visul">
				<div class="mn_visul_sld">
					<div class="pgnav">
						<span class="pagination"></span> <a
							href="/pet/event/petshopEventList?dispClsfNo=300000173"
							class="bt more">+</a>
					</div>
					<div class="swiper-container slide">
						<div class="sld-nav">
							<button type="button" class="bt prev">이전</button>
							<button type="button" class="bt next">다음</button>
						</div>
						<ul class="swiper-wrapper list">
							<li class="swiper-slide"><a href="javascript:clickAD();"
								class="box"> <img class="img mo"
									src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/384/2fe3a66b-1e01-4cc8-9a62-ae48dc29b69b.jpg?type=f&w=750&h=680&quality=100&align=4"
									alt="미음펫 보양식 30% 할인 (강아지)"> <img class="img pc"
									src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/384/842a9bb8-be80-49bf-8798-1a073b08d70c.jpg?type=m&w=1010&h=360&quality=90&bgcolor=FFFFFF&extopt=3"
									alt="미음펫 보양식 30% 할인 (강아지)">
							</a></li>
							<li class="swiper-slide"><a href="javascript:clickAD();"
								class="box"> <img class="img mo"
									src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/370/b1c08134-9e65-4418-bc2b-270e909b260c.jpg?type=f&w=750&h=680&quality=100&align=4"
									alt="버츠비 펫케어 런칭 이벤트"> <img class="img pc"
									src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/370/68f730aa-26dd-46d6-bfb5-c44e73527a9b.jpg?type=m&w=1010&h=360&quality=90&bgcolor=FFFFFF&extopt=3"
									alt="버츠비 펫케어 런칭 이벤트">
							</a></li>
							<li class="swiper-slide"><a href="javascript:clickAD();"
								class="box"> <img class="img mo"
									src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/382/f0288911-adf5-4c00-bc1b-715208c00f81.jpg?type=f&w=750&h=680&quality=100&align=4"
									alt="코코몰리 사은품 증정"> <img class="img pc"
									src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/382/9726893f-1401-458a-ad9d-bf564d0c5e3c.jpg?type=m&w=1010&h=360&quality=90&bgcolor=FFFFFF&extopt=3"
									alt="코코몰리 사은품 증정">
							</a></li>
						</ul>
					</div>
				</div>
			</section>


			<section class="sect mn gogos">
				<div class="mn_gogos_sld">
					<div class="swiper-container slide">
						<ul class="swiper-wrapper list"
							style="transform: translate3d(0px, 0px, 0px);">
							<li class="swiper-slide" style="width: 108.125px;"><a
								href="javascript:void(0);" class="box recent"
								onclick="goLink('/AboutPet/Project/aboutPet/indexNewCategory.do?dispCornType=NEW')">
									<div class="gds">
										<img
											src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/display/222/ac14bce0-0972-4679-8d35-edeae38b8078.jpg?type=f&amp;w=150&amp;h=150&amp;quality=90&amp;align=4"
											alt="신상품" class="img">
									</div>
									<div class="tt">신상품</div>
							</a></li>
							<li class="swiper-slide" style="width: 108.125px;"><a
								href="javascript:void(0);" class="box recent"
								onclick="goLink('/AboutPet/Project/aboutPet/indexBestGoodsList.do?dispCornType=BEST')">
									<div class="gds">
										<img
											src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/display/202/2dad6bee-18c2-450a-bd58-39e260ece2c7.jpg?type=f&amp;w=150&amp;h=150&amp;quality=90&amp;align=4"
											alt="베스트" class="img">
									</div>
									<div class="tt">베스트</div>
							</a></li>
							<li class="swiper-slide" style="width: 108.125px;"><a
								href="/AboutPet/Project/aboutPet/itemList.do?lnbDispClsfNo=${lnbDispClsfNo}" class="box recent">
									<div class="gds">
										<img
											src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/display/224/fe34316b-277d-427a-9bbb-0321416a7eeb.jpg?type=f&amp;w=150&amp;h=150&amp;quality=90&amp;align=4"
											alt="카테고리" class="img">
									</div>
									<div class="tt">카테고리</div>
							</a></li>
							<li class="swiper-slide" style="width: 108.125px;"><a
								class="box recent" href="javascript:void(0);"
								onclick="location.href='/mypage/indexRecentViews/'"
								data-content="" data-url="/mypage/indexRecentViews/">
									<div class="gds">
										
										<img
											src="https://aboutpet.co.kr/_images/common/img-rc-vw-gds.jpg"
											alt="" class="img">
									</div>
									<div class="tt">최근 본 상품</div>
							</a></li>
						</ul>
						<div class="swiper-pagination"></div>
					</div>
					<script>
			    var swiper = new Swiper('.mn_gogos_sld .swiper-container', {
			    	observer: true,
					observeParents: true,
					watchOverflow:true,
					simulateTouch:false,
					freeMode: false,
					slidesPerView: 8,
					slidesPerGroup:1,
					spaceBetween:34,						
					breakpoints: {
						1024: {
							spaceBetween:13,
							slidesPerView: "auto",
							slidesPerGroup:1,
							freeMode: true,
						}
					}
			    });
			</script>

				</div>
			</section>
			<input type="hidden" id="dispCornNo_rec" value="521" /> <input
				type="hidden" id="dispClsfCornNo_rec" value="605" /> <input
				type="hidden" id="petNo_rec" value="" />

			<c:if test='${ mem_code ne 0 }'>
				<c:if test="${ shopRecommendDTO ne null }">

					<section class="sect mn recom">
						<div class="hdts">
							<a class="hdt" href="#" id="goodsList_605"
								onclick="recList(300000174,521,605,31459);return false;"> <span
								class="tit"><em class="b" id="myPet">${ shopMemberDTO.pet_name }</em>&nbsp;맞춤
									추천상품&nbsp;</span>
							</a>
						</div>
						<div class="mn_recom_sld">
							<div class="sld-nav">
								<button type="button" class="bt prev">이전</button>
								<button type="button" class="bt next">다음</button>
							</div>
							<div class="swiper-container slide">
								<ul class="swiper-wrapper list k0425" id="otherPetGoodsList">

									<c:forEach items="${ shopRecommendDTO }" var="dto">
										<li class="swiper-slide">
											<div class="gdset recom" id="recom_PI000003405">
												<div class="thum">

													<a
														href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
														class="pic" data-content='PI000003405'
														data-url="/goods/indexGoodsDetail?goodsId=PI000003405">
														<img class="img" src="${ dto.item_img }"
														alt="${ dto.item_name }"
														onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
													</a>
													<c:set var="doneLoop" value="false"></c:set>
													<c:if test="${ zzim ne null }">
														<c:forEach items="${ zzim }" var="zzim" varStatus="status">
															<c:if test="${ not doneLoop }">
																<c:if test="${ zzim.item_code eq dto.item_code }">
																	<button type="button" class="bt zzim on"
																		id="btnZzim_${ dto.item_code }"
																		data-itemcode="${ dto.item_code }" value="Y">찜하기</button>
																	<c:set var="doneLoop" value="true"></c:set>
																</c:if>
																<c:if test="${ status.last }">
																	<c:if
																		test="${ status.current.item_code ne dto.item_code }">
																		<button type="button" class="bt zzim "
																			id="btnZzim_${ dto.item_code }"
																			data-itemcode="${ dto.item_code }" value="N">찜하기</button>
																		<c:set var="doneLoop" value="true"></c:set>
																	</c:if>
																</c:if>
															</c:if>
														</c:forEach>
													</c:if>
												</div>
												<div class="boxs">
													<div class="tit">
														<a
															href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
															class="lk" data-content='PI000003405'
															data-url="/goods/indexGoodsDetail?goodsId=PI000003405">${ dto.item_name }</a>
													</div>
													<a
														href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
														class="inf" data-content='PI000003405'
														data-url="/goods/indexGoodsDetail?goodsId=PI000003405">
														<span class="prc"> 
															<c:if
																test="${ dto.sale_rate ne 0 }">
																<em class="p"><fmt:formatNumber pattern="#,###"
																		value="${ dto.item_price * (1 - 0.01 * dto.sale_rate)  }"></fmt:formatNumber></em>
															</c:if> <c:if test="${ dto.sale_rate eq 0 }">
																<em class="p"><fmt:formatNumber pattern="#,###"
																		value="${ dto.item_price }"></fmt:formatNumber></em>
															</c:if>
													</span>
													</a>
													<div class="tag">
														<a
															href="/shop/indexPetShopTagGoods?tags=T000000002&tagNm=고양이"
															class="tg">#${ fn:split(dto.itag, ',')[0] }</a>
														<c:if test="${ fn:split(dto.itag, ',')[1] ne null}">
															<a
																href="/shop/indexPetShopTagGoods?tags=T000000005&tagNm=전연령"
																class="tg">#${ fn:split(dto.itag, ',')[1] }</a>
														</c:if>
														<c:if test="${ fn:split(dto.itag, ',')[2] ne null}">
															<a
																href="/shop/indexPetShopTagGoods?tags=T000000308&tagNm=다이어트"
																class="tg">#${ fn:split(dto.itag, ',')[2] }</a>
														</c:if>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>

									<li class="swiper-slide mbtn" id="viewmore-2"><a href="#"
										class="gotolist"
										onclick="recList(300000174,521,605,31459);return false;">더보기</a>
									</li>
								</ul>
							</div>
							<!-- 				<div class="bts bot"> -->
							<!-- 				</div> -->
						</div>
					</section>
				</c:if>

				<c:if test="${ shopRecommendDTO eq null }">
					<!-- 반려동물 등록 -->
					<section class="sect mn petsb">
						<div class="hdts">
							<div class="hdt">
								<span class="tit"><em class="b">반려동물과 </em>함께하고 계신가요?</span>
							</div>
						</div>
						<div class="bnbox dog">
							<div class="tit">
								펫 정보를 등록하시면 <br>딱 맞는 콘텐츠와 상품을 추천해드릴게요.
							</div>
							<div class="bts">
								<a href="#" class="bt reg" data-content=""
									onclick="location.href='/my/pet/petInsertView'"
									data-url="/my/pet/petInsertView">마이펫 등록하기</a>
							</div>
						</div>
					</section>
				</c:if>

			</c:if>


			<c:if test='${ mem_code eq 0 }'>
				<!-- 미로그인 배너 -->
				<section class="sect mn nlogn">
					<div class="hdts">
						<div class="hdt">
							<span class="tit"><em class="b">어바웃펫</em>이 처음이신가요?</span>
						</div>
					</div>
					<div class="bnbox">
						<div class="tit">회원가입하고 할인혜택을 받아보세요!</div>
						<div class="bts">
							<a href="/AboutPet/Project/aboutPet/sign_up.jsp" data-content=""
								data-url="/join/indexTerms" class="bt reg">회원가입하기</a>
						</div>
					</div>
				</section>
			</c:if>

			<script type="text/template" id="timeTemplate">
<li class="swiper-slide" id="liTag_{{goodsId}}">
	<div class="gdset tdeal">
		<div class="thum">
			<a href="/AboutPet/Project/aboutPet/itemDetail.do?item_code={{goodsId}}" class="pic" data-content='{{goodsId}}' data-url="/AboutPet/Project/aboutPet/itemDetail.do?goodsId={{goodsId}}">
				<img class="img" src="{{imgSrc}}" alt="{{goodsNm}}" onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
			</a>
			<input type="hidden" id="timeDeal_{{goodsId}}" value="{{saleEndDtm}}"/>
			<div class="time" id="time_{{goodsId}}">{{dealDate}}</div>
		</div>
		<div class="boxs">
			<div class="tit">
				<a href="/AboutPet/Project/aboutPet/itemDetail.do?item_code={{goodsId}}" class="lk" data-content='{{goodsId}}' data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code={{goodsId}}">{{goodsNm}}</a>
			</div>
			<a href="/AboutPet/Project/aboutPet/itemDetail.do??item_code={{goodsId}}" class="inf" data-content='{{goodsId}}' data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code={{goodsId}}">
				<span class="prc"><em class="p">{{foSaleAmt}}</em><i class="w">원</i></span>
				<span class="pct" {{rateStyle}}><em class="n">{{rate}}</em><i class="w">%</i></span>
			</a>
		</div>
	</div>
</li>
</script>


			<script type="text/javascript">
//타임딜
var timeDealList = [];
var timeDealSoonList = [];
var template = document.querySelector("#timeTemplate").innerHTML;
var html = '<li class="swiper-slide mbtn" id="viewmore-3"><a href="#" class="gotolist" onclick="timedealList(300000173,510,589,\'DEAL\');return false;">더보기</a></li>';

<%Date now = new Date();
String pattern = "yyyy-MM-dd";
Date tom = new Date();
int day = tom.getDate() + 1;
tom.setDate(day);
SimpleDateFormat sdf = new SimpleDateFormat(pattern);
String pattern2 = "MM월dd일";
SimpleDateFormat sdf2 = new SimpleDateFormat(pattern2);
String pattern3 = "yyyy-MM-dd kk:mm:ss";
SimpleDateFormat sdf3 = new SimpleDateFormat(pattern3);%>

<%ArrayList<ShopDTO> timeDeal = (ArrayList<ShopDTO>) request.getAttribute("timeDeal");

Iterator<ShopDTO> ir = timeDeal.iterator();

while (ir.hasNext()) {
	ShopDTO dto = ir.next();
	if (dto.getItem_code() >= 10 && dto.getItem_code() <= 15 || dto.getItem_code() >= 75 && dto.getItem_code() <= 85) {%>
	var dispType = 'NOW';
	var goodsId = '<%=dto.getItem_code()%>';
	var goodsNm = '<%=dto.getItem_name()%>';
	var imgSrc = '<%=dto.getItem_img()%>';
	var saleEndDtm = '<%=sdf.format(now)%> 22:00:59.0';
	var dealDate = "";
	if(dispType == 'SOON') {
		dealDate = '<%=sdf2.format(tom)%> 10:00';
	}
	var foSaleAmt = <%=dto.getItem_price()%>;
	var rate = <%=dto.getSale_rate()%>;
	var rateStyle = 'style="display:"';
	
	var timeDeal = template.replace(/{{goodsId}}/gi, goodsId)
		.replace(/{{goodsNm}}/gi, goodsNm)
		.replace(/{{imgSrc}}/gi, imgSrc)
		.replace(/{{saleEndDtm}}/gi, saleEndDtm)
		.replace(/{{dealDate}}/gi, dealDate)
		.replace(/{{foSaleAmt}}/gi, numberWithCommas(foSaleAmt))
		.replace(/{{rateStyle}}/gi, rateStyle)
		.replace(/{{rate}}/gi, rate)
	if(dispType == 'NOW') {
		timeDealList.push(timeDeal);
	}else if(dispType == 'SOON') {
		timeDealSoonList.push(timeDeal);
	}
	
	

<%} else if (dto.getItem_code() >= 16 && dto.getItem_code() <= 20
		|| dto.getItem_code() >= 86 && dto.getItem_code() <= 96) {%>
var dispType = 'SOON';
var goodsId = '<%=dto.getItem_code()%>';
var goodsNm = '<%=dto.getItem_name()%>';
var imgSrc = '<%=dto.getItem_img()%>';
var saleEndDtm = '<%=sdf.format(tom)%> '+'22:00:59.0';
var dealDate = "";
if(dispType == 'SOON') {
	dealDate = '<%=sdf2.format(tom)%> 10:00';
}
var foSaleAmt = <%=dto.getItem_price()%>;
var rate = <%=dto.getSale_rate()%>;
var rateStyle = 'style="display:"';

var timeDeal = template.replace(/{{goodsId}}/gi, goodsId)
	.replace(/{{goodsNm}}/gi, goodsNm)
	.replace(/{{imgSrc}}/gi, imgSrc)
	.replace(/{{saleEndDtm}}/gi, saleEndDtm)
	.replace(/{{dealDate}}/gi, dealDate)
	.replace(/{{foSaleAmt}}/gi, numberWithCommas(foSaleAmt))
	.replace(/{{rateStyle}}/gi, rateStyle)
	.replace(/{{rate}}/gi, rate)
if(dispType == 'NOW') {
	timeDealList.push(timeDeal);
}else if(dispType == 'SOON') {
	timeDealSoonList.push(timeDeal);
}


<%}
}%>			

timeDealList.push(html);

timeDealSoonList.push(html);

var goodsArr = new Array();
$(document).ready(function(){
	
$("#timeDealList").append(timeDealList);
$("#timeDealSoonList").append(timeDealSoonList);
	
	
<%Iterator<ShopDTO> it = timeDeal.iterator();
while (it.hasNext()) {
	ShopDTO dto = it.next();

	if ((dto.getItem_code() >= 10 && dto.getItem_code() <= 15) || (dto.getItem_code() >= 75 && dto.getItem_code() <= 85)) {%>

	goodsArr.push('<%=dto.getItem_code()%>');
	
		<%}
}%>
	
	timeBefore()
	$("li[id^=btn]:first-child").children().first().click();
});

// 타임딜 시간 셋팅	
 function timeBefore(){
			var today = new Date();
			today.toLocaleDateString();
	 		let hours = today.getHours(); // 시
	 		let minutes = today.getMinutes();  // 분
	 		let seconds = today.getSeconds();  // 초
	 		let milliseconds = today.getMilliseconds();
	 		
	 		var curTime = '<%=sdf3.format(now)%>';
	 		/* '"2021.07.26 11:00:00"; */
	 		var serverTime = new Date(curTime.replace(/\s/, 'T'));
		
	 		$("[id^='timeDeal_']").each(function(index) {
						var $this = $(this);
						var dre = $this.val();
						var timeDeal = new Date(dre.replace(/\s/, 'T'));
						
						var serverTime = new Date(curTime.replace(/\s/, 'T'));
						var now = new Date();
						var dateGap = serverTime.getTime() - now.getTime();
						var realTime = timeDeal - dateGap;
						
						$this.countdown(realTime, function(event) {
									var resultTime = ( event.strftime('%D') != 0 ? event.strftime('%D') + '일  ' : '' ) + event.strftime('%H:%M:%S');
									$("#time_"+goodsArr[index]).text( "⌛️ "+resultTime);
							}).on('finish.countdown', function () {
									var timeDealLength = $("ul[id=timeDealList] li[id^=liTag_]").length;
									if(timeDealLength > 1) {
									           $("#liTag_"+goodsArr[index]).hide();
									           ui.disp.sld.tdeal.using();
									}else {
									           $("section[class~=tdeal]").hide();
									} 
	                    });
			 });
 }

function timedealList(dispClsfNo, dispCornNo, dispClsfCornNo, dispType) {
	var timeDeal = $("li[id^=btn][class=active]").attr("id").replace("btn", "");
	loadCornerGoodsList(dispClsfNo, dispCornNo, dispClsfCornNo, dispType, timeDeal);
}
</script>






			<!-- 타임딜 -->
			<input type="hidden" id="dispCornNo_td" value="510" /> <input
				type="hidden" id="dispClsfCornNo_td" value="589" />
			<section class="sect mn tdeal">
				<div class="hdts">
					<a class="hdt" href="javascript:" id="goodsList_589"> <span
						class="tit"> 망설이면 마감! <br> 파격특가 <em class="b">타임딜​</em></span>
					</a>
				</div>
				<ul class="uiTab f tmenu">
					<li class="active" id="btnNOW">
						<button type="button" class="btn" data-ui-tab-btn="tab_deal"
							data-ui-tab-val="tab_deal_a">진행중</button>
					</li>
					<li id="btnSOON">
						<button type="button" class="btn" data-ui-tab-btn="tab_deal"
							data-ui-tab-val="tab_deal_b">다음 타임딜</button>
					</li>
				</ul>
				<div data-ui-tab-ctn="tab_deal" data-ui-tab-val="tab_deal_a"
					class="tbctn active">
					<div class="mn_tdeal_sld">
						<div class="sld-nav">
							<button type="button" class="bt prev">이전</button>
							<button type="button" class="bt next">다음</button>
						</div>
						<div class="swiper-container slide">
							<ul class="swiper-wrapper list" id="timeDealList">


							</ul>
						</div>
					</div>
				</div>
				<div data-ui-tab-ctn="tab_deal" data-ui-tab-val="tab_deal_b"
					class="tbctn">
					<div class="mn_tdeal_sld">
						<div class="sld-nav">
							<button type="button" class="bt prev">이전</button>
							<button type="button" class="bt next">다음</button>
						</div>
						<div class="swiper-container slide">
							<ul class="swiper-wrapper list" id="timeDealSoonList">
							</ul>
						</div>
					</div>
				</div>
			</section>
			<!-- 배너 -->
			<section class="sect mn bannr">
				<div class="uibanners">
					<div class="banner_slide">
						<div class="swiper-container slide">
							<ul class="swiper-wrapper list">
								<li class="swiper-slide"><a
									href="https://aboutpet.co.kr/event/detail?eventNo=53&returnUrl=/shop/home/"
									class="box"> <img class="img mo"
										src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/355/33787809-0812-4de2-963d-429628178409.png?type=f&w=750&h=176&quality=100&align=4"
										alt="7월 제휴처 혜택_국민카드데이"> <img class="img pc"
										src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/355/bc090efc-b447-41e8-9d75-db5cc5190617.png?type=m&amp;w=1010&amp;h=80&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3"
										alt="7월 제휴처 혜택_국민카드데이">
								</a></li>
								<li class="swiper-slide"><a
									href="https://aboutpet.co.kr/event/detail?eventNo=57&returnUrl=/shop/home/"
									class="box"> <img class="img mo"
										src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/368/a5596316-3832-4494-8e0a-0e187ac40710.jpg?type=f&w=750&h=176&quality=100&align=4"
										alt="돌아와요 어바웃펫"> <img class="img pc"
										src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/368/acf7dc1e-f8b1-4aa4-93fc-40371dda6b28.jpg?type=m&amp;w=1010&amp;h=80&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3"
										alt="돌아와요 어바웃펫">
								</a></li>
								<li class="swiper-slide"><a
									href="https://aboutpet.co.kr/event/detail?eventNo=7&returnUrl=/shop/home/"
									class="box"> <img class="img mo"
										src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/134/f507b751-13cc-4ce4-a98f-554698443594.jpg?type=f&w=750&h=176&quality=100&align=4"
										alt="두근두근 첫만남, 설레는 웰컴 기프트"> <img class="img pc"
										src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/134/c14b3d13-21d7-476e-bd80-d64d38418a73.jpg?type=m&amp;w=1010&amp;h=80&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3"
										alt="두근두근 첫만남, 설레는 웰컴 기프트">
								</a></li>
								<li class="swiper-slide"><a
									href="https://aboutpet.co.kr/event/detail?eventNo=1&returnUrl=/shop/home/"
									class="box"> <img class="img mo"
										src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/104/43f6b8ec-c96b-457a-8252-ba813e88fc87.jpg?type=f&w=750&h=176&quality=100&align=4"
										alt="알림ON 혜택 ON ! 마케팅 수신동의 혜택 &hearts;"> <img
										class="img pc"
										src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/105/d0f383fe-4b1c-486a-ba41-9dc0dfd2c3f9.png?type=m&amp;w=1010&amp;h=80&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3"
										alt="알림ON 혜택 ON ! 마케팅 수신동의 혜택 &hearts;">
								</a></li>
							</ul>
							<div class="swiper-pagination"></div>
							<div class="sld-nav">
								<button type="button" class="bt prev">이전</button>
								<button type="button" class="bt next">다음</button>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- MD추천 -->
			<input type="hidden" id="dispCornNo_md" value="513" /> <input
				type="hidden" id="dispClsfCornNo_md" value="595" />
			<section class="sect mn mdpic">
				<div class="hdts">
					<a class="hdt" href="javascript:" id="goodsList_595"> <span
						class="tit"> MD추천!<br> 이번주 <em class="b">MD 추천상품</em></span>
					</a>
				</div>
				<div class="mn_mdpic_sld">
					<div class="sld-nav">
						<button type="button" class="bt prev">이전</button>
						<button type="button" class="bt next">다음</button>
					</div>
					<div class="swiper-container slide">
						<ul class="swiper-wrapper list">

							<c:forEach items="${ shopMDDTO }" var="dto">
								<li class="swiper-slide">
									<div class="gdset mdpic">
										<div class="thum">
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
												class="pic" data-content='GI251023824'
												data-url="/goods/indexGoodsDetail?goodsId=GI251023824">
												<img class="img" src="${dto.item_img }" alt="두즈 핸즈프리 드라이기"
												onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
											</a>
											<c:set var="doneLoop" value="false"></c:set>
											<c:if test="${ zzim ne null }">
												<c:forEach items="${ zzim }" var="zzim" varStatus="status">
													<c:if test="${ not doneLoop }">
														<c:if test="${ zzim.item_code eq dto.item_code }">
															<button type="button" class="bt zzim on"
																id="btnZzim_${ dto.item_code }"
																data-itemcode="${ dto.item_code }" value="Y">찜하기</button>
															<c:set var="doneLoop" value="true"></c:set>
														</c:if>
														<c:if test="${ status.last }">
															<c:if
																test="${ status.current.item_code ne dto.item_code }">
																<button type="button" class="bt zzim "
																	id="btnZzim_${ dto.item_code }"
																	data-itemcode="${ dto.item_code }" value="N">찜하기</button>
																<c:set var="doneLoop" value="true"></c:set>
															</c:if>
														</c:if>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${ zzim eq null }">
												<button type="button" class="bt zzim "
													id="btnZzim_${ dto.item_code }"
													data-itemcode="${ dto.item_code }" value="N">찜하기</button>
											</c:if>
										</div>
										<div class="boxs">
											<div class="tit">
												<a href="${dto.item_url }" class="lk"
													data-content='GI251023824'
													data-url="/goods/indexGoodsDetail?goodsId=GI251023824">${dto.item_name }</a>
											</div>
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
												class="inf" data-content='GI251023824'
												data-url="/goods/indexGoodsDetail?goodsId=GI251023824">
												<span class="prc"><c:if
														test="${ dto.sale_rate ne 0 }">
														<em class="p"><fmt:formatNumber pattern="#,###"
																value="${ dto.item_price * (1 - 0.01 * dto.sale_rate)  }"></fmt:formatNumber></em>
														<span class="pct"><em class="n">${dto.sale_rate }</em><i
															class="w">%</i></span>
													</c:if> <c:if test="${ dto.sale_rate eq 0 }">
														<em class="p"><fmt:formatNumber pattern="#,###"
																value="${ dto.item_price }"></fmt:formatNumber></em>
													</c:if></span>
											</a>
											<div class="txt">${dto.rec_cmt }</div>
											<div class="bdg">
												<em class="bd ">NEW</em> <em class="bd ">업체배송</em>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>

							<li class="swiper-slide mbtn" id="viewmore-7"><a href="#"
								class="gotolist"
								onclick="loadCornerGoodsList(300000173,513,595,'MD');return false;">더보기</a>
							</li>
						</ul>
					</div>
				</div>
			</section>
			<!-- 할인상품 -->
			<input type="hidden" id="dispCornNo_st" value="512" /> <input
				type="hidden" id="dispClsfCornNo_st" value="652" />
			<section class="sect mn discn">
				<div class="hdts">
					<a class="hdt" href="javascript:" id="goodsList_652"> <span
						class="tit"> 오늘까지 딱! <br> 폭풍 <em class="b">할인상품 -
								재고 임박</em></span>
					</a>
				</div>
				<div class="mn_discn_sld">
					<div class="sld-nav">
						<button type="button" class="bt prev">이전</button>
						<button type="button" class="bt next">다음</button>
					</div>
					<div class="swiper-container slide">
						<ul class="swiper-wrapper list">
							<c:forEach items="${ shopDTO }" var="dto">
								<li class="swiper-slide">
									<div class="gdset discn">
										<div class="thum">
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto.item_code }"
												class="pic" data-content='PI000000468'
												data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto.item_code }">
												<img class="img" src="${ dto.item_img }" alt="하겐 정수기 6L"
												onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
											</a>
											<c:set var="doneLoop" value="false"></c:set>
											<c:if test="${ zzim ne null }">
												<c:forEach items="${ zzim }" var="zzim" varStatus="status">
													<c:if test="${ not doneLoop }">
														<c:if test="${ zzim.item_code eq dto.item_code }">
															<button type="button" class="bt zzim on"
																id="btnZzim_${ dto.item_code }"
																data-itemcode="${ dto.item_code }" value="Y">찜하기</button>
															<c:set var="doneLoop" value="true"></c:set>
														</c:if>
														<c:if test="${ status.last }">
															<c:if
																test="${ status.current.item_code ne dto.item_code }">
																<button type="button" class="bt zzim "
																	id="btnZzim_${ dto.item_code }"
																	data-itemcode="${ dto.item_code }" value="N">찜하기</button>
																<c:set var="doneLoop" value="true"></c:set>
															</c:if>
														</c:if>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${ zzim eq null }">
												<button type="button" class="bt zzim "
													id="btnZzim_${ dto.item_code }"
													data-itemcode="${ dto.item_code }" value="N">찜하기</button>
											</c:if>
										</div>
										<div class="boxs">
											<div class="tit">
												<a
													href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto.item_code }"
													class="lk" data-content='PI000000468'
													data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto.item_code }">${ dto.item_name }</a>
											</div>
											<a href="/AboutPet/Project/aboutPet/itemDetail.do?item_code="
												${dto.item_code }" class="inf" data-content='PI000000468'
												data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code="${dto.item_code }">
												<span class="prc"><c:if
														test="${ dto.sale_rate ne 0 }">
														<em class="p"><fmt:formatNumber pattern="#,###"
																value="${ dto.item_price * (1 - 0.01 * dto.sale_rate)  }"></fmt:formatNumber></em>
														<span class="pct"><em class="n">${dto.sale_rate }</em><i
															class="w">%</i></span>
													</c:if> <c:if test="${ dto.sale_rate eq 0 }">
														<em class="p"><fmt:formatNumber pattern="#,###"
																value="${ dto.item_price }"></fmt:formatNumber></em>
													</c:if></span>
												<div class="pds">
													<em class="tt">재고임박</em> <em class="ss">${ dto.opt_stock }개
														남음</em>
												</div>
											</a>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</section>
			<!-- 할인상품 -->
			<input type="hidden" id="dispCornNo_ex" value="584" /> <input
				type="hidden" id="dispClsfCornNo_ex" value="725" />
			<section class="sect mn discn">
				<div class="hdts">
					<a class="hdt" href="javascript:" id="goodsList_725"> <span
						class="tit"> 오늘까지 딱! <br> <em class="b">할인상품 -
								유통기한 임박</em></span>
					</a>
				</div>
				<div class="mn_discn_sld">
					<div class="sld-nav">
						<button type="button" class="bt prev">이전</button>
						<button type="button" class="bt next">다음</button>
					</div>
					<div class="swiper-container slide">
						<ul class="swiper-wrapper list">
							<c:forEach items="${shopShelfLifelDTO }" var="dto1">
								<li class="swiper-slide">
									<div class="gdset discn">
										<div class="thum">
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto1.item_code }"
												class="pic" data-content='GI251020258'
												data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto1.item_code }">
												<img class="img" src="${dto1.item_img }"
												alt="[유통기한] ${dto1.item_name } exp.${dto1.exp_date }"
												onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
											</a>
											<c:set var="doneLoop" value="false"></c:set>
											<c:if test="${ zzim ne null }">
												<c:forEach items="${ zzim }" var="zzim" varStatus="status">
													<c:if test="${ not doneLoop }">
														<c:if test="${ zzim.item_code eq dto1.item_code }">
															<button type="button" class="bt zzim on"
																id="btnZzim_${ dto1.item_code }"
																data-itemcode="${ dto1.item_code }" value="Y">찜하기</button>
															<c:set var="doneLoop" value="true"></c:set>
														</c:if>
														<c:if test="${ status.last }">
															<c:if
																test="${ status.current.item_code ne dto1.item_code }">
																<button type="button" class="bt zzim "
																	id="btnZzim_${ dto1.item_code }"
																	data-itemcode="${ dto1.item_code }" value="N">찜하기</button>
																<c:set var="doneLoop" value="true"></c:set>
															</c:if>
														</c:if>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${ zzim eq null }">
												<button type="button" class="bt zzim "
													id="btnZzim_${ dto1.item_code }"
													data-itemcode="${ dto1.item_code }" value="N">찜하기</button>
											</c:if>
										</div>
										<div class="boxs">
											<div class="tit">
												<a
													href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto1.item_code }"
													class="lk" data-content='GI251020258'
													data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto1.item_code }">[유통기한]
													${dto1.item_name } exp.${dto1.exp_date }</a>
											</div>
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto1.item_code }"
												class="inf" data-content='GI251020258'
												data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${dto1.item_code }">
												<span class="prc"><c:if
														test="${ dto1.sale_rate ne 0 }">
														<em class="p"><fmt:formatNumber pattern="#,###"
																value="${ dto1.item_price * (1 - 0.01 * dto1.sale_rate)  }"></fmt:formatNumber></em>
														<span class="pct"><em class="n">${dto1.sale_rate }</em><i
															class="w">%</i></span>
													</c:if> <c:if test="${ dto1.sale_rate eq 0 }">
														<em class="p"><fmt:formatNumber pattern="#,###"
																value="${ dto1.item_price }"></fmt:formatNumber></em>
													</c:if></span>
											</a>
										</div>
									</div>
								</li>
							</c:forEach>
							<li class="swiper-slide mbtn" id="viewmore-4"><a href="#"
								class="gotolist"
								onclick="loadCornerGoodsList(300000173,584,725, '40');return false;">더보기</a>
							</li>
						</ul>
					</div>
				</div>
			</section>
			<script type="text/javascript">
	//베스트 자동/수동 세팅
	var dispType = 'AUTO';

	$(document).ready(function(){
		// 베스트 상품 숨기기
		
		$("body").on("load", function(event) {
			getBestGoodsList();	
		});
	
		
		var step = 10;
		initView('bestGoodsList', step);
		$("button[id^=dispClsfNo_]").click(function(){
			var dispClsfNo = $(this).data("dispclsfno");
			getBestGoodsList(dispClsfNo);
		});
	});
	
	
	// 베스트 상품 초기 상품 셋팅
	 function initView(el_id, view_item_count, style) {
		var menu = document.getElementById(el_id);
		var menu_list = menu.getElementsByTagName('li');
		var menu_count = menu_list.length;
		style = (typeof(style) != 'undefined') ? style : 'block';
		if(view_item_count >= menu_count) {
			$("#bestGoodsMore").hide();
			$("#goBestGoodsList").show();
		}
		for(var i=0;i<menu_count;i++){
			if(i<view_item_count) menu_list[i].style.display = style;
			else menu_list[i].style.display = 'none';
		}
	} 
	
		
		var res = {
		          loader : $("<div />" , {"class":"loader"})
		          , container: $("body")
		    };
		
		function getBestGoodsList(lnbDispClsfNo) {
			 $.ajax({
		          url:"indexBestGoodsAjaxList.do",
		          dataType : "JSON",
		          type:"get",
		          data:{lnbDispClsfNo:lnbDispClsfNo},
		          cache : false,
		         success :function (data){ 
						 res.container.find(res.loader).remove();
		        	 	$("#bestGoodsList").empty();
		        	 	var item = data.jsonArray;
						var html = "";
		        	 	for (var i = 0; i < item.length; i++) {
		        	 		imgPath = item[i].item_img;
							html += "<li>";
							html += "<div class='gdset bests'>";
							html += "<div class='num'>";
							html += "<em class='b'>"+(i*1+1)+"</em>";
							
							html += "</div>";
							html += "<div class='thum'>";
							html += "<a href='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"' class='pic' data-content='"+item[i].item_code+" 'data-url='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"'>";
							html += "<img class='img' src='"+imgPath+"' alt='"+item[i].goodsNm+"'>";
							html += "</a>";		
							html += "</div>";
							html += "<div class='boxs'>";
							html += "<div class='tit'>";
							html += "<a href='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"' class='lk' data-content="+item[i].item_code+" data-url='/goods/indexGoodsDetail?goodsId="+item[i].item_code+"'>"+item[i].item_name+"</a>";
							html += "</div>";
							html += "<a href='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"' class='inf' data-content='"+item[i].item_code+"' data-url='/AboutPet/Project/aboutPet/itemDetail.do?item_code="+item[i].item_code+"'>";
							html += "<span class='prc'><em class='p'>"+AddComma(item[i].item_price)+"</em><i class='w'>원</i></span>";
							html += "</a></div></div></li>";
						}
		        	 	$("#bestGoodsList").append(html); 
				}
			 	});
		}
	
	
	
	function AddComma(num) { 
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
	var count =1;
	function bestGoodsMore(){
		var step = 10;
		count++
		
		initView('bestGoodsList', step*count);
		if(step*count == 20) {
			$("#bestGoodsMore").hide();
			$("#goBestGoodsList").show();
		}
	}
	
	 function goBestGoodsList(dispClsfNo, dispCornNo, dispClsfCornNo) {
		var dispType = $("#dispType_best").val();
		if(dispType == 'AUTO') {
			location.href="/AboutPet/Project/aboutPet/indexBestGoodsList.do?="+dispClsfNo+"&dispCornNo="+dispCornNo;
		}else {
			location.href="/AboutPet/Project/aboutPet/indexBestGoodsList.do?="+dispClsfNo+"&dispCornNo="+dispCornNo+"&dispClsfCornNo="+dispClsfCornNo;
		}
	} 
</script>


			<script type="text/javascript">

	$(document).ready(function() {
	function callback(){
	    if ( httpRequest.readyState == 4  ) {
	       if ( httpRequest.status == 200 ) { 
	    	   res.container.find(res.loader).remove();
	          $("#bestGoodsList").append( httpRequest.responseText );
	       } else {
	    	   
	          alert("> Ajax 요청 실패 : " + httpRequest.status );
	       }
	    }
	 }
		
	function getBestItem(mcate_code){
	    var url = "bestItem.do";
	    var params = mcate_code;
	    var method = "GET";
	    res.container.append( res.loader );
	    sendRequest(url, params, callback, method);
	 }
})
</script>
			<!-- 베스트 -->
			<input type="hidden" id="dispCornNo_best" value="514" /> <input
				type="hidden" id="dispClsfCornNo_best" value="" /> <input
				type="hidden" id="dispType_best" value="json" />
			<section class="sect mn bests">
				<div class="hdts">
					<a class="hdt" href="javascript:" id="goodsList_"> <span
						class="tit">베스트20​</span>
					</a>
				</div>
				<div class="mn_bests_sld">
					<div class="swiper-container slide">
						<ul class="uiTab f swiper-wrapper list">
							<c:forEach items="${shopCategory }" var="dto" varStatus="c">
								<c:choose>
									<c:when test="${dto.lcate_code eq 1 }">
										<c:if test="${dto.mcate_code <=  8 && dto.mcate_code != 6 }">
											<li class="swiper-slide ">
												<button type="button" class="btn"
													id="dispClsfNo_${dto.mcate_code }"
													data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b"
													data-dispClsfNo="${dto.mcate_code }" data-filter="")">${dto.mcate_name }</button>
											</li>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:if
											test="${dto.mcate_code <= 21 && (dto.mcate_code != 18 && dto.mcate_code != 19)}">
											<li class="swiper-slide ">
												<button type="button" class="btn" id="dispClsfNo_12564"
													data-ui-tab-btn="tab_best" data-ui-tab-val="tab_best_b"
													data-dispClsfNo="12564" data-filter="">${dto.mcate_name }</button>
											</li>
										</c:if>
									</c:otherwise>
								</c:choose>



							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="ranklist">
					<ul class="list" id="bestGoodsList">
					</ul>
					<div class="moreload" id="bestGoodsMoreBtn">
						<button type="button" class="bt more" id="bestGoodsMore"
							onclick="bestGoodsMore();">상품 더보기</button>
						<button type="button" class="bt more best" id="goBestGoodsList"
							style="display: none;"
							onclick="goBestGoodsList(300000173, 514, );">베스트 상품 전체보기</button>
					</div>
				</div>
			</section>
			<!-- 단독상품 -->
			<input type="hidden" id="dispCornNo_only" value="515" /> <input
				type="hidden" id="dispClsfCornNo_only" value="596" />
			<section class="sect mn exclu">
				<div class="hdts">
					<a class="hdt" href="javascript:" id="goodsList_596"> <span
						class="tit"> 여기밖에 없어요~<br> <em class="b">어바웃펫 단독
								상품</em></span>
					</a>
				</div>
				<div class="mn_exclu_sld">
					<div class="sld-nav">
						<button type="button" class="bt prev">이전</button>
						<button type="button" class="bt next">다음</button>
					</div>
					<div class="swiper-container slide">
						<ul class="swiper-wrapper list">
							<c:forEach items="${ shopOnlyItemDTO }" var="dto">
								<li class="swiper-slide">
									<div class="gdset exclu">
										<div class="thum">
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
												class="pic" data-content='GI251020329'
												data-url="/goods/indexGoodsDetail?goodsId=GI251020329">
												<img class="img" src="${dto.item_img }"
												alt="${dto.item_name }"
												onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
											</a>
											<c:set var="doneLoop" value="false"></c:set>
											<c:if test="${ zzim ne null }">
												<c:forEach items="${ zzim }" var="zzim" varStatus="status">
													<c:if test="${ not doneLoop }">
														<c:if test="${ zzim.item_code eq dto.item_code }">
															<button type="button" class="bt zzim on"
																id="btnZzim_${ dto.item_code }"
																data-itemcode="${ dto.item_code }" value="Y">찜하기</button>
															<c:set var="doneLoop" value="true"></c:set>
														</c:if>
														<c:if test="${ status.last }">
															<c:if
																test="${ status.current.item_code ne dto.item_code }">
																<button type="button" class="bt zzim "
																	id="btnZzim_${ dto.item_code }"
																	data-itemcode="${ dto.item_code }" value="N">찜하기</button>
																<c:set var="doneLoop" value="true"></c:set>
															</c:if>
														</c:if>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${ zzim eq null }">
												<button type="button" class="bt zzim "
													id="btnZzim_${ dto.item_code }"
													data-itemcode="${ dto.item_code }" value="N">찜하기</button>
											</c:if>
										</div>
										<div class="boxs">
											<div class="tit">
												<a
													href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
													class="lk" data-content='GI251020329'
													data-url="/goods/indexGoodsDetail?goodsId=GI251020329">${dto.item_name }</a>
											</div>
											<a href="/goods/indexGoodsDetail?goodsId=GI251020329"
												class="inf" data-content='GI251020329'
												data-url="/goods/indexGoodsDetail?goodsId=GI251020329">
												<span class="prc"><em class="p">${dto.item_price }</em><i
													class="w">원</i></span>
											</a>
											<div class="txt">${dto.rec_cmt }</div>
										</div>
									</div>
								</li>
							</c:forEach>

						</ul>
					</div>
					<div class="moreload">
						<a href="#" class="bt more" id="goodsList_596"
							onclick="loadCornerGoodsList(300000173,515,596,'PETSHOP');return false;">상품
							더보기</a>
					</div>
				</div>
			</section>
		</div>
	</div>
</main>

<script>

	$(document).on("click", "button[id^=btnZzim_]",function() {
		<% 
		if(session.getAttribute("num")==null){
		%>
			alert("로그인 후 이용할 수 있습니다.")		
		<%
		} else{			
		%>
		
		/* alert(document.querySelector("#btnZzim").dataset.itemcode) */

		var item_code = $(this).data("itemcode")
		var zzimcheck = $(this).val()
		var mem_code = "<%= mem_code %>"
		
			$.ajax({
				url : "/AboutPet/Project/aboutPet/zzim.do"
					, type : "GET"
					, dataType : "text"
					, data : {
						item_code : item_code
						, zzimcheck : zzimcheck
						, mem_code : mem_code
					}
					,cache:false
	            	, success : function(data){
	            		
	            		if(data == 1){
							alert("찜 목록에 추가되었습니다.");
	            			location.reload();
							$(this).addClass("on");
							$(this).attr("value", "Y");
						}
						else if(data == 2){
							alert("찜 목록에서 삭제되었습니다.");
	            			location.reload();
							$(this).removeClass("on");
							$(this).attr("value", "N");
						} else {
							alert("찜 추가 실패!");
	            			location.reload();
						}
					}
			})

		<%
		}
		%>
		
	})
</script>
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
			<li id="liTag_20" class="tv "><a href="/tv/home/" class="bt"><span>TV</span></a>
			</li>
			<li id="liTag_30" class="log "><a href="/log/home/" class="bt"><span>로그</span></a>
			</li>
			<li id="liTag_10" class="shop active"><a href="/shop/home/"
				class="bt"><span>샵</span></a></li>
			<li id="liTag_00" class="my "><a href="/mypage/indexMyPage/"
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
</script>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>