<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		
<!-- sidebar -->
<jsp:include page="sidebar.jsp" flush="false"/>

<!DOCTYPE html>
<html>

<head>
<title>aboutPet</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<meta name="theme-color" content="#ffffff">
<link rel="canonical" href="">
<meta name="author" content="">
<meta name="description" content="">
<meta name="keywords" content="">

<meta name="twitter:card" content="Summary">
<meta name="twitter:site" content="트위터 사이트">
<meta name="twitter:creator" content="트위터 계정">
<meta name="twitter:url" content="https://www.aboutpet.co.kr/">
<meta name="twitter:title" content="">
<meta name="twitter:description" content="">
<meta name="twitter:image" content="">

<meta property="og:type" content="website">
<meta property="og:site_name" content="">
<meta property="og:locale" content="ko">
<meta property="og:url" content="https://www.aboutpet.co.kr/">
<meta property="og:title" content="">
<meta property="og:description" content="">
<meta property="og:image" content="/_images/common/aboutpet_logo@2x.png">
<meta property="og:image:url" content="/_images/common/aboutpet_logo@2x.png">
<meta property="og:image:type" content="image/jpeg">
<meta property="og:image:width" content="300">
<meta property="og:image:height" content="300">

<link href="https://aboutpet.co.kr//_images/common/favicon.ico" rel="shrtcut icon">
<link href="https://aboutpet.co.kr//_images/common/favicon.png" rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css">
<!-- googole Analytics --> 

<script type="text/javascript" async="" src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.sdk.js?timestemp=1625749753220" charset="UTF-8"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=UA-187433715-1&amp;l=dataLayer&amp;cx=c"></script><script async="" src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript" src="../js/googleAnalytics.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', "G-NR86F31079");
</script>


<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="../js/jquery.blockUI.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.number.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.form.min.js"></script>
<script type="text/javascript" src="../js/jquery.countdown.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/swiper.min.js"></script>
<script type="text/javascript" src="../js/clipboard.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/popup.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript" src="../js/deviceChk.js"></script>	<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&amp;libraries=services"></script><script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/main/4.3.6/kakao.js"></script><script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
<script type="text/javascript" src="../js/kakao-map.js"></script>
<!-- app interface --> 
<script type="text/javascript" src="../js/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" src="../js/adbrix.js"></script>
<script type="text/javascript" src="../js/ui.mo.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&amp;submodules=geocoder"></script><script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
<script type="text/javascript">
//	const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
</script>
</head>

<body class="body lnb my home isPc gnb_ac isTalk isFoot">
<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData" value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">
		
		<!-- s : header 영역 -->
					<script type="text/javascript">
	//개발자도구에서의 console.[log, debug] control	
	logger("prd");
	
	$(document).ready(function(){
		//IE 진입 시 edge로 연결
		if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
			
			document.body.innerHTML = '';
		
			function edgeAlert(){
				alert("어바웃펫은 Internet Explorer를 지원하지 않습니다. \n크롬, 엣지 브라우저에 최적화 되어있습니다.")
				location.href = "microsoft-edge:" + location.href;
			}
			function closeIE(){
				open("","_self").close();
			}
			setTimeout(edgeAlert);
	        setTimeout(closeIE,200);
		}
		
		if(document.cookie.indexOf("DEVICE_GB") == -1){
			ipadCheck();
		}
		chcekLoginTagInfo(); 
		checkURL();
		
		setCartCnt();
		
		
		// 검색창 문구
		getSearchInputAutoComplete();
		
		$("li[id^=liTag_]").one('click', function(){
			$("li[id^=liTag_]").removeClass("active");
			$(this).addClass("active");
	    });
		
		$(document).on("click" , "#alertBtn" , function(){
			getAlertList();
		});
	});
	
	function getAlertList(){
		var options = {
				url : "/alertList"
				, dataType : "html"
				, done : function(html){
					$("#alertBtn").removeClass("on");
					if("PC" == "PC"){
						$("#alertDiv").html(html);	
					}else{
						location.href="/alertList"	
					}
				}
		}
		ajax.call(options);
	}
	
	// ipad check logic
	function ipadCheck(){
		const iPad = (navigator.userAgent.match(/(iPad)/) /* iOS pre 13 */ ||  (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1) /* iPad OS 13 */);
		if(iPad){
			setCookie("DEVICE_GB", "MO" , 24 );
			window.location.reload();
		}
	}
	
	//회원 관심태그 등록 여부 체크
	function chcekLoginTagInfo(){
		if("Y" != "Y" && "954216" > 0 && "" == ""){
			location.href = "/join/indexTag?isPBHR=Y&returnUrl="+location.pathname+location.search;
		}
	}
	
	function setCookie( name, value, expirehours ) {
		var todayDate = new Date();
		todayDate.setHours( todayDate.getHours() + expirehours );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	// 하루동안 열지않기
	function todaycloseWin(pNo) {
		setCookie("#popDispClsfNo"+pNo, "done" , 24 );
	}
	
	$(function() {
		$('.category_wrap').on('show', function(e, param1) {
			if (param1 == "cate") {
				$('.right_btn_wrap').hide();
				
				var options = {
					url : "/brand/listStyleBrand",
					done : function(data) {
						var html = "";
						for (var i=0; i<data.brandStyleList.length; i++) {
							var brand = data.brandStyleList[i];
							html += '<li><a href="/brand/indexBrandDetail?bndNo=' + brand.bndNo + '">' + brand.bndNm + '</a></li>';
						}
						$('.dep_box.style ul').html(html);
					}
				};
				ajax.call(options);
			}
		});
		
		$('.category_wrap').on('hide', function(e, param1) {
			if (param1 == "cate")
				$('.right_btn_wrap').show();
		});
	});	
	
	// 검색
	function goSearch(dispClsfNo){
		
		var searchWord = $("#srchWord").val();
		var srchShopWord = $("#srchShopWord").val();
		if( srchShopWord != "" &&  srchShopWord != undefined){
			searchWord = srchShopWord;
		}
		var srchShopDispClsfNo = convertDispClsfNo((dispClsfNo == "" || dispClsfNo == undefined) ? "300000173" : dispClsfNo);
		// google Analytics 정보 전송
		search_data.search_term = searchWord;
		sendGtag('search');
		// 마지막 검색 페이지 진입 url 저장
		var lastUrl = window.location.href;
		if(lastUrl.indexOf("commonSearch") == -1){
			$.cookie("searchLastUrl", lastUrl, {path:'/'});
			$.cookie("searchLastFocus", "40", {path:'/'});
			location.href = "/commonSearch?focus=40"+((searchWord.trim() == "")? "":"&srchWord="+encodeURIComponent(searchWord.trim()))+"&cateCdL="+srchShopDispClsfNo;
		}else{
			var searchLastFocus = $.cookie("searchLastFocus");
			location.href = "/commonSearch?"+((searchLastFocus == "" || searchLastFocus == undefined )?"":"focus="+searchLastFocus)+((searchWord.trim() == "")? "":"&srchWord="+encodeURIComponent(searchWord.trim()))+"&cateCdL="+srchShopDispClsfNo;
		}
	}
	
	// 메뉴 활성화	
	function checkURL() {
		var pathname = location.pathname;
		
		//펫로그회원(bizNo이 있는 회원)이 펫로그가 아닌 다른 페이지에 접속하면 alert
		if(pathname.indexOf("/log/") < 0 && "" != "" && "" > 0 && pathname.indexOf("/my/pet/") < 0 && pathname.indexOf("/commonSearch") < 0){
			if(confirm("로그아웃 됩니다. 로그아웃 하시겠습니까?")){
				location.href="/logout";
			}else{
				history.back(-1);
			}
		}
		
		var menu = $('.top_area .nav').children("li");
		
		for (var i=0; i<menu.length; i++) {
			var url = $(menu[i]).find("a").attr("href");
			if (url == location.pathname)
				$(menu[i]).addClass("active");
		}
	}
	
	// 위시리스트 추가 - 상품상세제외
	function insertWish(obj, goodsId){
		if( $(".popToast").is(":visible") ) return;

		var options = {
			url : "/goods/insertWish",
			data : {goodsId : goodsId},
			done : function(data){
				if(data.actGubun =='login'){
					//비로그인 시 처리 기획 없음.
					document.location.href = '/indexLogin?returnUrl='+encodeUriComponent(document.location.href);
				}else if(data.actGubun =='add'){
					$(obj).addClass("on");
					let msg = '<div class="link"><p class="tt">찜리스트에 추가되었어요</p><a href="/mypage/shop/myWishList" class="lk" data-content="" data-url="/mypage/shop/myWishList">바로가기</a></div>';
					ui.toast(msg,{
						bot:77
					});
					//if (confirm("위시리스트에 담겼습니다.\n확인하시겠습니까?")) location.href = "/mypage/interest/indexWishList";
				}else if(data.actGubun =='remove'){
					$(obj).removeClass("on");
					ui.toast("찜리스트에서 삭제되었어요", {
						bot:77
					})
					//alert("위시리스트에서 삭제되었습니다.");
				}else{
					let act = $(obj).hasClass("on") ? "취소" : "추가";
					ui.toast("찜 "+act+" 요청을 실패하였습니다", {
						bot:77
					});
					//alert('위시리스트 등록 또는 삭제에 실패하였습니다.');
				}
			}
		};
		ajax.call(options);
	}
	
	function insertWishS(obj, goodsId, query) {
		var options = {
			url : "/goods/insertWish",
			data : {goodsId : goodsId, search : "Y", returnUrl : document.URL+"?searchQuery="+query },
			done : function(data) {
				$(obj).addClass("click");
			}
		};
		ajax.call(options);
	}

	function goEvent(){
		var id = $(".tmenu .list .active").prop("id");
		var url = "";
		var eventGb2Cd = "10";
		//펫샵
		if(id =="liTag_10"){
			eventGb2Cd = "40";
		}
		//펫tv
		else if(id =="liTag_20"){
			eventGb2Cd = "20";
		}
		//펫로그
		else if(id =="liTag_30"){
			eventGb2Cd = "30";
		}

		window.location.href = "/event/main";
	}
	
	$(function () {
		// 검색 메뉴
		$(".searchMenuContent").hide();
		$(".searchMenuContent:first").show();

		$("ul.searchMenu li").click(function () {
			$("ul.searchMenu li").removeClass("active");
			$(this).addClass("active");
			$(".searchMenuContent").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
		
		//검색 : 카테고리
		$(".categorySub").hide();
		$(".categorySub:first").show();

		$("ul.searchCate li").click(function () {
			$("ul.searchCate li").removeClass("active");
			$(this).addClass("active");
			$(".categorySub").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});

		//검색 : 브랜드
		$(".brandSub").hide();
		$(".brandSub:first").show();

		$("ul.searchBrand li").click(function () {
			$("ul.searchBrand li").removeClass("active");
			$(this).addClass("active");
			$(".brandSub").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});

		//검색어 : 최근/인기검색어
		$(".searchKindSub").hide();
		$(".searchKindSub:first").show();

		$("ul.searchKind li").click(function () {
			$("ul.searchKind li").removeClass("active");
			$(this).addClass("active");
			$(".searchKindSub").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
		
		// 검색 아이콘 클릭 시
		$(".btnSch").on("click", function(){
			goSearch();
		});
		// 검색 이벤트
		var thisUrl = window.location.href;
		if(thisUrl.indexOf("commonSearch") == -1){
			$("#srchWord, #srchShopWord").on("click", function(){
				goSearch();
			});
		}else{
			$(document).on("keypress","#srchWord, #srchShopWord",function(e){
				if ( event.keyCode == 13 ) {
					goSearch();
				}
			});
		}
	
		// 스크롤시 검색 포커스 해제
		$(window).scroll(function(){
			if(document.activeElement.name == 'srchWord'){
				$("#srchWord").blur();
			}
		});
		
		// 네이버 AI 데이터 관리
		let mbrNo, section, contentId, baseUrl, targetUrl, litd, lttd, agent = "";
		$("a, button").on("click", function(){
			// 회원번호
			mbrNo = "CB1A9462F55260603DB262E4564A0CBC";
			if("" != "954216"){
				mbrNo = "954216";
			}
			
			// 요청구분
			section = "40";
			if("10" == section){
				section = "shop";
			} else if("20" == section){
				section = "tv";
			} else if("30" == section){
				section = "log";
			} else {
				section = "member";
			}
			
			// 콘텐츠/상품 번호/회원번호/태그번호(data-content)
			contentId = $(this).data("content");
			
			// 현재 URL
			if("" != $(this)[0].baseURI){
				baseUrl = $(this)[0].baseURI;
			}
			
			// 타겟 URL
			if("" != $(this).data("url") && "undefined" != typeof  $(this).data("url")){
				targetUrl = $(this).data("url");
			} else if("" != $(this)[0].href && "#" != $(this)[0].href){
				targetUrl = $(this)[0].href;
			} else if("" != $(this)[0].onclick){
				targetUrl = $(this)[0].onclick;
			}
			
			// Device, Device OS, 위도, 경도 추가
			if("PC" == "APP"){
				agent = "APP_" + jscd.typeOs;
				
				// 위치정보 약관동의 여부
				var headerPstInfoAgrYn = "N";
				
					headerPstInfoAgrYn = "Y";
				
				
				// APP ibricks Interface
				var data = {
					      "mbr_no" : mbrNo
						, "section" : section
						, "content_id" : contentId
						, "action" : "etc"
						, "url" : baseUrl
						, "target_url" : targetUrl
						, "agent" : agent
						, "prclAddr" : ""
						, "roadAddr" : ""
						, "postNoNew" : ""
						, "timestamp" : ""
						, "pstInfoAgrYn" : headerPstInfoAgrYn
				};
				toNativeData.func = "onIbrixClick";
				toNativeData.parameters = JSON.stringify(data);
				toNative(toNativeData);
			} else {
				agent = "WEB_" + jscd.typeOs; 
		
				$.ajax({
					url : "/common/sendSearchEngineEvent"
					, data : {
						  "mbr_no" : mbrNo
						, "section" : section
						, "content_id" : contentId
						, "action" : "etc"
						, "url" : baseUrl
						, "targetUrl" : targetUrl
						, "agent" : agent
						, "prclAddr" : ""
						, "roadAddr" : ""
						, "postNoNew" : ""
						, "timestamp" : ""
					}
				});
			}
			// Device, Device OS, 위도, 경도 추가
		});
	});
	
	// APP용 ibricks Callback function
	function interfaceIbricksCallback(responseData){
		var response = $.parseJSON(responseData);
		$.ajax({
			url : "/common/sendSearchEngineEvent"
			, data :{
			      "mbr_no" : response.mbrNo
					, "section" : response.section
					, "content_id" : response.contentId
					, "action" : response.action
					, "url" : response.baseUrl
					, "target_url" : response.targetUrl
					, "agent" : response.agent
					, "litd" : response.litd
					, "lttd" : response.lttd
					, "prclAddr" : response.prclAddr
					, "roadAddr" : response.roadAddr
					, "postNoNew" : response.postNoNew
					, "timestamp" : ""
			}
		});
	}
	
	// APP용 Device, Device OS, 위도, 경도 추가
	function onCurrentLocCallBackIbricks(resultJson){
		var result = $.parseJSON(resultJson);
		agent = "APP_" + jscd.typeOs;
		if( result.authYn !== undefined && result.authYn == 'Y'){
			appLocAuthYn = "Y";
			lttd = result.latitude;
			litd = result.longitude;
			
			$.ajax({
				url : "/common/sendSearchEngineEvent"
				, data : {
					  "mbr_no" : mbrNo
					, "section" : section
					, "content_id" : contentId
					, "action" : "etc"
					, "url" : baseUrl
					, "target_url" : targetUrl
					, "litd" : litd
					, "lttd" : lttd
					, "agent" : agent
					, "timestamp" : ""
				}
			});
		}
	}
	// APP용 Device, Device OS, 위도, 경도 추가
	
	// 메인으로 가기
	function goPetShopMain() {
		var form = document.createElement("form");
		document.body.appendChild(form);
		var url = "/shop/home/";
		form.setAttribute("method", "POST");
		form.setAttribute("action", url);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "lnbDispClsfNo");
		hiddenField.setAttribute("value", '');
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
	
	// 분류번호 보내기
	function sendDispClsfNo(dispClsfNo){
		var lnbDispClsfNo = dispClsfNo
		var cateCdL = dispClsfNo
		cateCdL = convertDispClsfNo(dispClsfNo);
		
		var form = document.createElement("form");
		document.body.appendChild(form);
		var url = "/mypage/indexMyPage/";
		if("/mypage/indexMyPage/" == "/event/indexSpecialExhibitionZone"){
			url = "/shop/home";
		}
		
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lnbDispClsfNo');
		hiddenField.setAttribute('value', lnbDispClsfNo);
		form.appendChild(hiddenField);
		
		if("/mypage/indexMyPage/" == "/shop/indexCategory"||
			"/mypage/indexMyPage/" == "/event/indexExhibitionZone") {
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "cateCdL");
			hiddenField.setAttribute("value", cateCdL);	// 12564
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/mypage/indexMyPage/" == "/shop/indexNewCategory" ||
				 "/mypage/indexMyPage/" == "/shop/indexBestGoodsList") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/mypage/indexMyPage/" == "/pet/event/petshopEventList" ||
			"/mypage/indexMyPage/" == "/shop/indexLive" ){				
			form.setAttribute("method", "GET");
		}else if("/mypage/indexMyPage/" == "/event/shop/main"){
			form.setAttribute("method", "GET");
			form.removeChild(hiddenField);

			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispClsfNo");
			hiddenField.setAttribute("value", lnbDispClsfNo);
			form.appendChild(hiddenField);
		}
		else {
			form.setAttribute("method", "POST");
		}
		form.setAttribute("action", url);
		document.body.appendChild(form);
		form.submit();
	}
	
	function convertDispClsfNo(dispClsfNo) {
		var cateCdL = '12564';
		
		if('300000174' == dispClsfNo ) {	// 고양이
			cateCdL = '12565'
		} else if('300000175' == dispClsfNo ) {	// 관상어
			cateCdL = '14111'
		} else if('300000176' == dispClsfNo ) {	// 소동물
			cateCdL = '14196'
		}
		
		return cateCdL;	
	}
	
	function getSearchInputAutoComplete() { 
		$.post( "/shop/getSearchInputAutoComplete",	function( data ) {
			var srchText = "검색어를 입력해주세요.";
			if(data.searchBox != null && data.searchBox.bnrText != null && data.searchBox.bnrText != ''){
				srchText = data.searchBox.bnrText;
			}
			// 모바일 검색창
			$("#srchWordMO").text(srchText);
			// pc 검색창
			$("#srchWord").attr("placeholder", srchText);
			$("#srchShopWord").attr("placeholder", srchText);
		});
	}
	
	function clickLogin(){
		location.href = "/indexLogin?returnUrl="+location.pathname+location.search;
	}
	
	
	//장바구니 수 set, 캐시 이슈로 ajax 호출
	function setCartCnt(){
		$.ajax({
			url : "/order/getCartCnt"
			, dataType : "json"
			, type : "POST"
			, success : function(data){
				var $cartCntObj = $('.header .menu .cart').find('em');
				if($cartCntObj.length == 0){
					if(data.cartCnt != 0){
						var html = '<em class="n">'+data.cartCnt+'</em>';
						$('.header .menu .cart').html(html);
					}
				}else{
					if(data.cartCnt == 0){
						$cartCntObj.remove();
					}else{
						$cartCntObj.text(data.cartCnt);
					}
				}
			}
		});
	}

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
    
  	//등급 레이어팝업 스크립트 추가 2021.05.13
	var rankBox = function(){
		ui.popLayer.open('popLank',{
			ocb:function(){
				// console.log("popLank 열림");
			},
			ccb:function(){
				// console.log("popLank 닫힘");
			}
		});

		if("PC" == "PC") {
			$(".rank_pc").addClass("on");
		}else {										
			$(".rank_mo").addClass("on");
		}
	}
  	
</script>


<!--// header pc--><!-- e : header 영역 -->
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
		location.href = "https://aboutpet.co.kr/log/indexMyPetLog/279A25A5DF?mbrNo=954216";
	}
}


function checkLoginGnb(){
		if( "true" != "true" ){
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
		if( "31368" == null || "31368" == ""){
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

<div class="layers tv seriesHome" id="srisListPopup"></div>
<!-- e : gnb 영역 -->			
					<!-- s : LNB 영역 -->
					<script type="text/javascript">
</script>
<nav class="lnb my" id="lnb">
	<div class="inr" style="bottom: 40px;">
		<div class="myCate">
			<ul class="menu">
				<li class="open">
					<a class="bt " href="myPage.do" data-url="myPage.do" data-content="954216"><b class="t">내 활동</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="myPetList.do" data-url="myPetList.do" data-content="954216"><b class="t">마이펫 관리</b></a></li>
						<li class=""><a class="bt" href="myWishTv.do" data-url="myWishTv.do" data-content="954216"><b class="t">마이 찜리스트</b></a></li>
						<li class="active"><a class="bt" href="myRecentTv.do" data-url="myRecentTv.do" data-content="954216"><b class="t">최근 본 영상</b></a></li>
						<li class=""><a class="bt" href="myRecentShop.do" data-url="myRecentShop.do" data-content="954216"><b class="t">최근 본 상품</b></a></li>
					</ul>
				</li>
				<li class="open">
					<a class="bt " href="javascript:;"><b class="t">나의 쇼핑정보</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="orderList.do" data-url="orderList.do" data-content="954216"><b class="t">주문/배송</b></a></li>
						<li class=""><a class="bt" href="/mypage/order/indexClaimList" data-url="/mypage/order/indexClaimList" data-content="954216"><b class="t">취소/반품/교환</b></a></li>
						<li class=""><a class="bt" href="myAlarmList.do" data-url="myAlarmList.do" data-content="954216"><b class="t">재입고 알림</b></a></li>
						<li class=""><a class="bt" href="myCouponList.do" data-url="myCouponList.do" data-content="954216"><b class="t">내 쿠폰</b></a></li>
						<li class=""><a class="bt" href="/customer/inquiry/inquiryView" data-url="/customer/inquiry/inquiryView" data-content="954216"><b class="t">1:1 문의</b></a></li>
						<li class=""><a class="bt" href="/mypage/goodsCommentList" data-url="/mypage/goodsCommentList" data-content="954216"><b class="t">상품 후기</b></a></li>
						<li class=""><a class="bt" href="/mypage/service/indexAddressList" data-url="/mypage/service/indexAddressList" data-content="954216"><b class="t">배송지 관리</b></a></li>
						<li class=""><a class="bt" href="/mypage/order/indexBillingCardList" data-url="/mypage/order/indexBillingCardList" data-content="954216"><b class="t">결제 카드 관리</b></a></li>
					</ul>
				</li>
				<li class="open">
					<a class="bt " href="javascript:;"><b class="t">내 정보 관리</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="pswdUpdate.jsp" data-url="pswdUpdate.jsp" data-content="954216"><b class="t">비밀번호 설정</b></a></li>
						<li class=""><a class="bt" href="manageCheck.jsp"><b class="t" data-url="manageCheck.jsp" data-content="954216">회원정보 수정</b></a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav><!-- e : LNB 영역 -->
				<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
				
		<!-- s : 본문영역 -->	
		
		<script type="text/javascript">
		
			$(document).ready(function(){
				//$("#header_pc").removeClass("mode0");
				//$("#header_pc").addClass("mode16");
				//$("#header_pc").attr("data-header", "set16");
				
				$("#header_pc").addClass("noneAc");
				$(".mo-heade-tit .tit").html("최근 본 영상");
				
				/*var listGb = "MY";
				$(".mo-header-backNtn").bind("click", function(){
					if(listGb == "TV"){
						location.href="/tv/home"
					}else if(listGb == "MY"){
						location.href="/mypage/indexMyPage"
					}else{
						history.go(-1);
					}
				});*/
				
				$(".mo-header-backNtn").attr("onclick", "fncGoBack()");
			}); // End Ready
			
			//뒤로가기(<) 클릭 이벤트
			function fncGoBack(){
				/*var listGb = "MY";
				
				if(listGb == "TV"){
					location.href="/tv/home"
				}else if(listGb == "MY"){
					location.href="/mypage/indexMyPage"
				}else{
					history.go(-1);
				}*/
				
				storageHist.goBack();
			}
			
			//SGR 썸네일API 실행
			
			
			//펫TV 홈 이동
			function fncGoPetTvHome() {
				location.href='/tv/home';
			}
			
			//펫스쿨 상세화면 이동
			function fncGoPetSchoolDetail(vd_id) {
				/* APP에서 펫스쿨 상세 기존 onNewPage 호출 ==> 페이지 호출방식으로 변경 / 펫스쿨 상세는 pc, mo, app 모두 호출방식 동일함.
				if("false" == "true"){
					// 데이터 세팅
					toNativeData.func = "onNewPage";
					toNativeData.type = "TV";
					toNativeData.url = "https://aboutpet.co.kr/tv/school/indexTvDetail?vdId="+ vd_id;
					// APP 호출
					toNative(toNativeData);
				}else{*/
					//location.href = "/tv/school/indexTvDetail?vdId="+ vd_id;
					storageHist.goBack("/tv/school/indexTvDetail?vdId="+ vd_id);
				//}
			}
			
			//펫TV 상세화면 이동
			function fncGoPetTvDetail(vd_id) {
				if("false" == "true"){
					// 데이터 세팅
					toNativeData.func = "onNewPage";
					toNativeData.type = "TV";
					toNativeData.url = "https://aboutpet.co.kr/tv/series/indexTvDetail?vdId="+ vd_id +"&sortCd=&listGb=RECENT";
					// APP 호출
					toNative(toNativeData);
				}else{
					//location.href = "/tv/series/indexTvDetail?vdId="+ vd_id +"&sortCd=&listGb=RECENT";
					storageHist.goBack("/tv/series/indexTvDetail?vdId="+ vd_id +"&sortCd=&listGb=RECENT");
				}
			}
			
			//최근 본 영상 삭제
			function fncDelRecentVdo(vd_id){
				$.ajax({
					type: 'POST',
					url: '/tv/series/deleteRecentVdo',
					async: false,
					dataType: 'json',
					data : {
						vdId : vd_id //영상ID
					},
					success: function(data) {
						if(data.actGubun == "success"){
							$("#item_"+vd_id).remove();
							
							ui.toast("최근 본 영상이 삭제되었어요.", {
								bot:70
							});
						}else{
							ui.toast("최근 본 영상목록에서 삭제에 실패했어요.", {
								bot:70
							});
						}
						
						var itemLng = $(".watch-movie .item").length;
						if(itemLng == 0){
							$(".no_data").removeAttr("style");
							$(".watch-movie").css("display", "none");
						}
						
						userActionLog(vd_id, "delete"); //클릭 이벤트-최근 본 영상 삭제
					},
					error: function(request,status,error) {
						ui.alert("오류가 발생되었습니다. 다시 시도하여 주십시오.");
					}
				});
			}
			
		</script>
				
		<!-- 바디 - 여기위로 템플릿 -->
<main class="container lnb page my" id="container">
			
			<div class="inr" style="min-height: 401px;">
				<!-- 본문 -->
				<div class="contents" id="contents" style="min-height: 573px;">
					<!-- PC 타이틀 영역 -->
					<div class="pc-tit">
							<h2>최근 본 영상</h2>
						</div>
					<!-- PC 타이틀 영역 -->
					
					<!-- 컨텐츠가 없을 경우 style 제거 -->
					<c:if test="${ empty mtlist }">
						<section class="no_data i5">
							<div class="inr">
								<div class="msg">
									최근 본 영상이 없습니다.<br>
									반려동물과 함께하는 <strong>펫TV</strong>를 시청해보세요.
								</div>
								<div class="uimoreview">
									<a href="#" class="bt more" onclick="fncGoPetTvHome(); return false;" data-content="954216" data-url="/tv/home">펫TV 바로가기</a>
								</div>
							</div>
						</section>
					</c:if>
					<!-- 컨텐츠가 없을 경우 style 제거 -->
					
					<!-- 최근 시청한 영상  -->
					<c:if test="${ not empty mtlist }">
						<c:forEach items="${ mtlist }" var="mtDTO">
					<div class="watch-movie">
						<div class="item" id="item_N202104291111">
										<div class="movie">
											<a href="#" onclick="fncGoPetTvDetail('${ mtDTO.v_code }'); return false;" data-content="${ mtDTO.v_code }" data-url="/tv/series/indexTvDetail?vdId=N202104291111&amp;sortCd=&amp;listGb=RECENT">
												<img src="${ mtDTO.v_img }" alt="">
											</a>
											<!-- 시리즈 영상일 때만 영상시간 표시 -->
											<c:if test="${ mtDTO.v_type eq '시리즈' }">
												<div class="time">${ mtDTO.v_time }</div>
											</c:if>
											<!-- <p class="progressbar" style="width: 20%">동영상 진행 상태</p> -->
											</div>
										<div class="text-box">
											<p class="t1 singleline">${ mtDTO.s_name }</p>
											<p class="t2">
												<a href="#" onclick="fncGoPetTvDetail('${ mtDTO.v_code }'); return false;" data-content="N202104291111" data-url="/tv/series/indexTvDetail?vdId=N202104291111&amp;sortCd=&amp;listGb=RECENT">${ mtDTO.v_name }</a>
											</p>
											<a href="#" class="btn close" onclick="fncDelRecentVdo('${ mtDTO.v_code }'); return false;">삭제</a>
										</div>
									</div>
					</div>
						</c:forEach>
					</c:if>
					<!-- // 최근 시청한 영상  -->
				</div>
			</div>
		</main>
		
		<!-- 플로팅 영역 -->
		<!-- TWC chatbot Scripts -->
<script src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.plugin.js"></script>

<script type="text/javascript">
	(function() {
	 Twc('init', {
	   brandKey: "OEV1nVeHcnzgQtklwEXksg",
	   channelType: "chat",
	   appId: "",
	   UserNo: "954216",
	   buttonOption: {
	     showLauncher: false,
	     zIndex: 500,
	     bottom: $("#cartNavs").length > 0 ? 95 : 25
	    }
	  })
	})();
	
	function twcChatOpen() {
		if ("954216" == "0") {
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

<nav class="floatNav on">
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
</nav><script>

	// Swiper 최근
	var swiperRecent = new Swiper('.recent .swiper-container', {
	    slidesPerView: "auto",
	    spaceBetween: 18,  
	    navigation: {
	        nextEl: '.recent .swiper-button-next',
	        prevEl: '.recent .swiper-button-prev',
	    }
	});
	
		// Swiper 최근
	var swiperFit = new Swiper('.zzim .swiper-container', {
	    slidesPerView: "auto",
	    spaceBetween: 7, 
	    navigation: {
	        nextEl: '.zzim .swiper-button-next',
	        prevEl: '.zzim .swiper-button-prev',
	    }
	});
	
	// progress
	var wTimer = null;
	if($(".circlePie").length && $(".recent").css("display") !== "none"){
	    $(document).ready(function(){
	        if(wTimer !== null) clearTimeout(wTimer);
	        wTimer = setTimeout(function(){
	            price = $(".circlePie").width();
	            createPie();
	        },1000);
	    });
		var price = $(".circlePie").width();
		//createPie();   프로그레스바 두번 채워짐.
		function createPie(p){
			$(".circlePie").each(function(i,n){
				var can = document.createElement("canvas");
				var ctx = can.getContext("2d");
				var p = ($(n).data("p") !== undefined)?$(n).data("p"):100;
				can.width = price;
				can.height = price;
				ctx.beginPath();
				ctx.fillStyle = "black";
				ctx.moveTo((price / 2),(price / 2));
				ctx.translate((price / 2),(price / 2));
				ctx.arc(0,0,60,Math.PI * 0, Math.PI * 0.1,false);
				ctx.fill();
				ctx.font = 'bold 20px serif';
				$(n).html("").append(can);
				drowC(p,can,ctx);
			});
	
			function drowC(angle,can,ctx){
				var n = 0;
				var max = 30;
				var angle = (angle * 3.6) * (2 / 36);
				var add = (angle / max);
				var timer = setInterval(function(){
					n += add;
					if(n >= angle) n = angle;
					ctx.translate(-10,-10);
					ctx.clearRect(0,0,can.width,can.height);
					ctx.translate(10,10);
					ctx.rotate(Math.PI * -0.5);
					ctx.beginPath();
					ctx.fillStyle="#669aff";
					ctx.moveTo(0,0);
					ctx.arc(0,0,(price / 2),Math.PI*0,Math.PI*(n * 0.1),false);
					ctx.fill();
					ctx.closePath();
					ctx.beginPath();
					ctx.arc(0,0,((price / 2) - 4),0,Math.PI*2);
					ctx.fillStyle="#ffffff";
					ctx.fill();
					ctx.closePath();
					ctx.textAlign = "center";
					ctx.fillStyle ="#ffffff";
					ctx.rotate(Math.PI * 0.5);
					if(n >= max){
						clearInterval(timer);
					};
				},50)
			};
		};
	};
</script><!-- location 영역 포함  -->			
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
		<li id="liTag_20" class="tv ">
					<a href="/tv/home/" class="bt"><span>TV</span></a>
				</li>
				<li id="liTag_30" class="log ">
					<a href="/log/home/" class="bt"><span>로그</span></a>
				</li>
				<li id="liTag_10" class="shop ">
					<a href="/shop/home/" class="bt"><span>샵</span></a>
				</li>
				<li id="liTag_00" class="my active">
					<a href="myPage.do" class="bt"><span>MY</span></a>
				</li>
			</ul>
	</div>
</nav><!-- e : menubar 영역 -->
		
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

<!-- footer -->	
<jsp:include page="footer.jsp" flush="false"/>

<div id="layers">
</div><!-- e : footer 영역 -->
	</div>

<style type="text/css">
            #twc-chat-plugin #chat-icon {box-sizing: border-box;position:fixed;bottom:25px;right:25px; z-index:500;display:none;width:60px;height:60px;background: url(https://storage.googleapis.com/cloud-gate-cdn/image/icon_webchat_bg_v2.png) no-repeat top left;-webkit-transition: 0.3s cubic-bezier(0.25, 0.8, 0.5, 1);transition: 0.3s cubic-bezier(0.25, 0.8, 0.5, 1);border-radius:50%;overflow:hidden; }
            #twc-chat-plugin #chat-icon img { width:100%;-webkit-transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1);transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1); }
            #twc-chat-plugin #chat-frame-box { box-sizing: border-box; position:fixed;bottom:-150%;right:25px;z-index:510;border-radius: 10px;overflow:hidden;background-color:#fff;-webkit-transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1);transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1); box-shadow: 2px 2px 25px rgba(94, 94, 94, 0.5); }
            #twc-chat-plugin #chat-frame-box iframe{ width:410px;height:767px;border:0;vertical-align: top; }
            #twc-chat-plugin .loader, #twc-chat-plugin .loader:after {box-sizing: border-box;border-radius: 50%;width: 30px;height: 30px;}
            #twc-chat-plugin .loader {box-sizing: border-box;font-size: 10px;position:absolute; top:14px;left:14px;text-indent: -9999em;border-top: 4px solid rgba(255, 255, 255, 1);border-right: 4px solid rgba(255, 255, 255, 1);border-bottom: 4px solid rgba(255, 255, 255, 0);border-left: 4px solid #ffffff;-webkit-transform: translateZ(0);-ms-transform: translateZ(0);transform: translateZ(0);-webkit-animation: load8 1.1s infinite linear;animation: load8 1.1s infinite linear;display:none;}
            @-webkit-keyframes load8 { 0% {-webkit-transform: rotate(0deg);transform: rotate(0deg);} 100% {-webkit-transform: rotate(360deg);transform: rotate(360deg);}}
            @keyframes load8 { 0% {-webkit-transform: rotate(0deg);transform: rotate(0deg);} 100% {-webkit-transform: rotate(360deg);transform: rotate(360deg);}}
            #twc-chat-plugin.on img { -ms-transform: scale(0);-moz-transform: scale(0);-o-transform: scale(0);-webkit-transform: scale(0);transform: scale(0); }
            #twc-chat-plugin.on .loader {display:block;opacity:1;}
        </style><div id="twc-chat-plugin"><div id="chat-icon"><img src="https://storage.googleapis.com/cloud-gate-cdn/image/icon_webchat_v2.png"><div class="loader">Loading...</div></div><div id="chat-frame-box"><iframe id="chat-frame" style="height: 730px;"></iframe></div></div></body></html>