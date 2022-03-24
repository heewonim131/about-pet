<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>aboutPet</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<meta name="theme-color" content="#ffffff">
<link rel="canonical" href="">
<meta name="author" content="" />
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
<meta property="og:image" content="/_images/common/aboutpet_logo@2x.png" />
<meta property="og:image:url"
	content="/_images/common/aboutpet_logo@2x.png" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="300" />
<meta property="og:image:height" content="300" />

<link href="/_images/common/favicon.ico" rel="shrtcut icon">
<link href="/_images/common/favicon.png"
	rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css"
	href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css">

<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript" src="/_script/googleAnalytics.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', "G-NR86F31079");
</script>

<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.blockUI.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.inputmask.bundle.min.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.number.min.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.form.min.js"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.countdown.js"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.cookie.js"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/swiper.min.js"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/clipboard.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="/_script/popup.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript" src="/_script/deviceChk.js"></script>
<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- kakao map -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&libraries=services"></script>
<script type="text/javascript"
	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/kakao-map.js"></script>
<!-- app interface -->
<script type="text/javascript" src="/_script/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" src="/_script/adbrix.js"></script>
<script type="text/javascript" src="/_script/ui.mo.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&submodules=geocoder"></script>
<script type="text/javascript">
//	const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		/* 안드로이드 계열에서 저장되는 것 막음 / javascript Ready Function에 추가 */
		/*$(document).bind("contextmenu", function(e) {
		    return false;
		});*/
		
		document.addEventListener("contextmenu", e => { 
		    e.target.matches("img") && e.preventDefault()
		    e.target.matches("video") && e.preventDefault()
			e.target.className=="thumb-img" && e.preventDefault()
		})
	});

	// mw/pc 자동 로그아웃 30분 
	var checkActionTimeOut;
	if('0' != '0' && 'PC' != 'APP'){
	    resetLoginTimeOut();
	    $(document).on('click keypress' , 'body' , function(){
	        resetLoginTimeOut();
	    });
	}
	function resetLoginTimeOut() {
		if('0' != '0' && 'PC' != 'APP'){
		    window.clearTimeout(checkActionTimeOut);
		    checkActionTimeOut = setTimeout(function() {
		        location.href="/logout/";
		    }, 30 * 60 * 1000);
		}		   
	}

	
	// 설정 -> 앱 푸시 설정 토글시
	// 앱에서 호출하기 위해 공통으로 푸출
	function updateInfoRcyYn(checkYn) {
		if("" != null && "" != "") {
			var toastText = (checkYn == "Y") ? "설정" : "해제";
					
			var options = {
					url : "/updateInfoRcvYn"
					, data : { mbrNo : "0", infoRcvYn : checkYn }
					, done : function(result) {
						if(result == "S") {
							if(checkYn != "Y") {
								ui.toast("앱 푸시 알림이" +" "+toastText +"되었어요");	
							}	
						}
					}
			}
			ajax.call(options);
		}
	}

	// APP용 페이지 이동 Callback function
	function fnGoIndexOrderPayment(data){
		var obj = JSON.parse(data);
		createFormSubmit("indexOrderPaymentForm","/order/indexOrderPayment",obj);
	}
</script>
<style type="text/css">
/* 아이폰 계열에서 저장되는 것 막음 / css 에 추가 */
img, video {
	/* 화면을 길게 누르고 있을때 뜨는 팝업이나 액션시트를 제어 */
	-webkit-touch-callout: none;
	/* 텍스트나 이미지를 선택할 수 있게 하는 여부를 제어 */
	/*-webkit-user-select:none;*/
	/* 링크를 터치했을때 나오는 기본 영역의 색상을 제어 */
	/*-webkit-tap-highlight-color:transparent;*/
}

.loader{
    position: fixed;
    top:0;
    left:0;
    width: 100%;
    height:100%;
    background: rgba(255,255,255,0.9) url('../_images/common/icon_loading_76.gif') no-repeat 50% 50%;
    z-index: 1;
  }

</style>

<script>
// 히스토리 관련 함수( 모바일 < 버튼을 위함 )
var storageHist = {
	histCnstn : "StorageHistory",		// storage 저장 상수
	isApp : ("PC" == "APP")? true : false,
	cnvrtFullUrl : function(url) { 
		var fullUrl = url;
		if(url.indexOf('aboutpet.co.kr') < 0 && url.indexOf('localhost')  < 0 ){
			fullUrl = "https://aboutpet.co.kr"+((url.indexOf("/") != 0)?"/":"")+url;
		}			
		return fullUrl;
	},
	sendApp : function(func, url) {		// 앱 정보 전달
		try {
			// 데이터 세팅
			toNativeData.func = func;
			if(url != null && url != undefined && url != ""){
				toNativeData.url = storageHist.cnvrtFullUrl(url);
			}else{
				toNativeData.url = null;
			}
			// 호출
			toNative(toNativeData);
		} catch(e) {
			
		}
	},
	getHist : function() { 	// sessionStorage에 저장된 history 목록 확인
		var hist = sessionStorage.getItem(storageHist.StorageHistory);
		return (hist == null)?new Array():JSON.parse(hist);
	},
	setHist : function() {	//sessionStorage에 history 저장
		/* var sessionStorageCnt = 30; */
		var thisHistory = {
				url : window.location.href,
				histLength : window.history.length
			}
		var sessionHistory = storageHist.getHist();
		if(sessionHistory == null || sessionHistory.length == 0){				// 처음 셋팅
			var histArray = new Array();
			histArray.push(thisHistory);
			if(storageHist.isApp) storageHist.sendApp("onAddHistory", thisHistory.url);
			sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(histArray));
		}else{ 									// 추가
			if(sessionHistory[sessionHistory.length-1].histLength >= thisHistory.histLength){	// 브라우저 뒤로가기 고려하여 히스토리 조정(뒤로가기시 해당 페이지까지 히스토리 삭제)
				var theUrlIdx;
				sessionHistory.forEach(function(item, index, array) {
					if(item.url == thisHistory.url){
						theUrlIdx = index;
					}
				});
				if(theUrlIdx != null && theUrlIdx != undefined){
					var removeCnt = sessionHistory.length - theUrlIdx;
					sessionHistory.splice(theUrlIdx, removeCnt);
					sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
				}
			}
			
			if(sessionHistory[sessionHistory.length-1].url != thisHistory.url){
				sessionHistory.push(thisHistory);
				if(storageHist.isApp) storageHist.sendApp("onAddHistory", thisHistory.url);
				sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
			}
		}
	},
	replaceHist : function(url) {		// sessionStorage의 hisory 목록 replace또는 remove
		var sessionHistory = storageHist.getHist();
		sessionHistory.pop();	// remove
		if(url){				// url 추가
			var thisHistory = {
				url : storageHist.cnvrtFullUrl(url),
				histLength : window.history.length
			}
			sessionHistory.push(thisHistory);
		}
		if(storageHist.isApp) storageHist.sendApp("onReplaceHistory", url);
		sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
		return (sessionHistory.length == 0)?"/":sessionHistory[sessionHistory.length-1].url;
	},
	goBack : function(url){ 		// 이전페이지 / 페이지 이동
// 		if(storageHist.isApp){
// 			storageHist.sendApp("onHistoryBack", url);
// 		}else 
		if(url){	// url로 이동(해당 url 이후 삭제)
			var fullUrl = storageHist.cnvrtFullUrl(url);
			storageHist.clearUp(fullUrl);
			location.href = fullUrl;
		}else{		// 이전페이지
			var lastUrl = storageHist.replaceHist();
			location.href = lastUrl;
		}
	},
	getOut : function(url, firstUrl) {		// 진입페이지로 이동(url을 포함하지 않는 최근 목록으로 이동, firstUrl이 true경우 url을 벗어난 가장 상위 url로 이동)
		var lastUrl = storageHist.clearUp(url, true, firstUrl);
		location.href = lastUrl;
	},
	clearUp : function(url, part, firstUrl) {					// 해당 url까지 히스토리 목록 삭제하기 (part가 true이면 해당 url포함 목록 삭제)
		var sessionHistory = storageHist.getHist();
		var theUrlIdx;
		var isFinding = true;
		if(part){		// url을 포함하고 있으면 삭제
			sessionHistory.forEach(function(item, index, array) {
				if(firstUrl){
					if(isFinding){
						if(item.url.indexOf(url) != -1 ){
							theUrlIdx = index;
							isFinding = false;
						}
					}
				}else{
					if(item.url.indexOf(url) == -1 ){
						theUrlIdx = index+1;
					}
				}
			});
		}else{			// 해당 url까지 삭제
			sessionHistory.forEach(function(item, index, array) {
				if(item.url == url){
					theUrlIdx = index+1;
				}
			});
		}
		
		if(theUrlIdx != null && theUrlIdx != undefined){
			var removeCnt = sessionHistory.length - theUrlIdx;
			sessionHistory.splice(theUrlIdx, removeCnt);
			sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
		}
		return (sessionHistory.length == 0)?"/":sessionHistory[sessionHistory.length-1].url;
	},
	clearHist : function() {			// history 전체 삭제
		sessionStorage.removeItem(storageHist.StorageHistory);
		if(storageHist.isApp) storageHist.sendApp("onClearHistory");
	}
}

// sessionStorage 저장 호출 / 메인은 clear
var thisUrl = window.location.href;
if(thisUrl.indexOf('?returnUrl=') == -1 && thisUrl.indexOf('&returnUrl=') == -1 && (thisUrl.indexOf('/tv/home')>0 ||thisUrl.indexOf('/log/home')>0 || thisUrl.indexOf('/shop/home')>0 || thisUrl.indexOf('/mypage/indexMyPage')>0)){  // history clear
	storageHist.clearHist();
	storageHist.setHist();
}else{	// history 저장
	storageHist.setHist();
}
console.log("storageHist",storageHist.getHist());
</script>
<!-- Google Tag Manager -->
<!-- For Analysis Container -->
<script>
(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NKC9BFM');
</script>

<!-- For Campaign Container -->
<script>
(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-M82SBBJ');
</script>
<!-- End Google Tag Manager -->
<!--라이브 앱과 연동을위한 JS -->
<script src="https://sgr.aboutpet.co.kr/web/runInit/v1.js"></script>
<script type="text/javascript">
	//검색API 클릭 이벤트(사용자 액션 로그 수집)

	function userActionLog(contId, action, url, targetUrl){	
		var mbrNo = "0";
		if (mbrNo != "0") {
			/* 
			$.ajax({
				type: 'POST'
				, url : "/common/sendSearchEngineEvent"
				, async:false
				, dataType: 'json'
				, data : {
					"logGb" : "ACTION"
					, "mbr_no" : mbrNo
					, "section" : "shop" 
					, "content_id" : contId
					, "action" : action
					, "url" : (url != null && url) != '' ? url : document.location.href
					, "targetUrl" : (targetUrl != null && targetUrl != '') ? targetUrl : document.location.href
					, "litd" : ""
					, "lttd" : ""
					, "prclAddr" : ""
					, "roadAddr" : ""
					, "postNoNew" : ""
					, "timestamp" : ""
				}
			});
			 */
		}
	}

</script>
<script type="text/javascript">
		$(document).ready(function(){
			$(".mo-header-backNtn").attr("onClick", "goPetShopMain();");
			/* 탭이동 종료 후 이벤트 */
			var idx = $("li[id^=upDispClsfNo_][class~=active]").data("cateidx");
			if(idx != 'undefined') {
				ui.disp.subnav.elSwiper.el.slideTo(idx-1);
			};
		});	
		
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
			hiddenField.setAttribute("value", '300000173');
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			form.submit();
		}
	</script>
<script type="text/javascript">
		$(document).ready(function(){
			// 정렬
			$("li[id^=order_] button").click(function(){
				filter.detail('del', $(this).val());
			});
		});

		$(window).bind("pageshow", function(event){
			if(event.originalEvent.persisted || window.performance && window.performance.navigation.type == 2){
				var state = window.history.state;
				if(state) {
					$("#contents").html('');
					page = state.page;
					scrollPrevent = state.scrollPrevent;
					$("#contents").html(state.data);
					$("#order_"+state.order).click();
					ui.disp.sld.recmd.using();
					ui.disp.sld.cbanr.using();
					ui.disp.sld.foneline.using();
				}else {
					window.history.replaceState(null, null, null);
				}
			}else{
				window.history.replaceState(null, null, null);
			}
		});
		
		function setMCateList(dispClsfNo, upDispClsfNo, scateYN) {
			var dispClsfNo2 ='300000173';
			var url = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&dispClsfNo2="+dispClsfNo2+"&cateCdL="+upDispClsfNo+"&cateCdM="+dispClsfNo;
			var cateCdL = $("#cateCdL").val();
			var cateCdM = $("#cateCdM").val();
			if(scateYN == 'Y') {
				url = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&dispClsfNo2="+dispClsfNo2+"&cateCdL="+cateCdL+"&cateCdM="+cateCdM;
			}
			location.href = url;
		}
		
		
		

		//상품보기
		var filter = {
			detail : function(callback, order){
				page = 0;
				result = true;
				scrollPrevent = true;
				var dispClsfNo = $("li[class~=active][name^=dispClsfNo]").attr('id');
				var filters = new Array();
				var bndNos = new Array();
				var dataAll = new Array();
				
				if(order == undefined) {
					order = $("li[class=active][id^=order]").children().val();
				}
				
				if(callback != "refresh" && callback != "del"){

					$(".remove-tag[name=bndName]").each(function(){
			 			var bndNo = $(this).attr('id');
						bndNos.push(bndNo);
			 		});
				 	
				 	$(".remove-tag[name=filName]").each(function(){
				 		var filter = $(this).attr('id');
				 		filters.push(filter);
				 	})
				 	
				 	$(".remove-tag").each(function(){
				 		var dataObj = new Object();
				 		dataObj.name = $(this).attr('name');
				 		dataObj.id = $(this).attr('id');
				 		dataObj.text = $(this).text();
				 		dataAll.push(dataObj);
				 	})
				 
				//필터 삭제시
				}else if(callback == "del"){
					$("span[name=selFilt]").each(function(){
						var filter = $(this).attr('id');
						filters.push(filter);
					});
				 	
				 	//브랜드
				 	$("span[name=selBnd]").each(function(){
				 		var bndNo = $(this).attr('id');
				 		bndNos.push(bndNo);
				 	})
				 	
				 	
					$("span[class='fil']").each(function(){
				 		var dataObj = new Object();
				 		dataObj.name = $(this).attr('name');
				 		dataObj.id = $(this).attr('id');
				 		dataObj.text = $(this).children('em').text();
				 		dataAll.push(dataObj);
				 	})
				 	
				}
				
				var options = {
					url : "/shop/getScateGoodsList"
					, type : "POST"
					, dataType : "html"
					, data : {
						dispClsfNo : dispClsfNo,
						dispClsfNo2 :  $("input[id^=dispClsfNo_]").val(),
						cateCdL : $("#cateCdL").val(),
						cateCdM : $("#cateCdM").val(),
				 		filters : filters,
				 		bndNos: bndNos,
						order: order,
						page : page
					}
					, done :	function(result){
						ui.popLayer.close('popFilter');
						$("#order").val(order);
						$("#filters").val(filters);
						$("#bndNos").val(bndNos);
						$("#sCateGoodsList").empty();
						$("#sCateGoodsList").append(result);
						ui.disp.sld.recmd.using();
						
						var html = "<ul class='swiper-wrapper'>";
						if(dataAll.length > 0) {
					 		for(var i in dataAll){
					 			html+="<li class='swiper-slide'>";
								if(dataAll[i].name == "filName" || dataAll[i].name == "selFilt"){
									html += "<span class='fil' id="+dataAll[i].id+" name='selFilt'>";
								}else{
									html += "<span class='fil' id="+dataAll[i].id+" name='selBnd'>";
								}
								html += "<em class=tt>"+dataAll[i].text+"</em>";
								html += "<button class='del' onclick='filter.filterDel(\"" +dataAll[i].id+ "\");'>필터삭제</button>";
								html += "</span></li>";
					 		}
					 		html+= "</ul>";
							$("#uifiltbox").addClass("on");
					 		$(".flist").append(html);
					 		ui.disp.sld.foneline.using();
					 		var len = $(".fil").length;
							$("button[name=countName]").addClass('on');
							$("#filCount").text("("+len+")");
						}else{
							$(".flist").parent().removeClass("on");
							$("button[name=countName]").removeClass('on');
						}
						filter.pushUrl(dispClsfNo);
					}
				};
				ajax.call(options);
			},
			//필터삭제
			filterDel : function(id){
				$("span[id="+id+"]").remove();
				filter.detail('del');
			},
			//새로고침
			refresh : function(refresh){
				$(".flist").children().remove();
				var order = $("#order_SALE").children().val();
// 				$("#order_DATE").children().click();
				filter.detail(refresh, order);
			},
			reset : function(){
				$(".remove-tag").remove();
				$(".tag button").removeClass('active');
				$(".flist").parent().removeClass("on");
			},
			
			
			open : function(){
				var dispClsfNo = $("li[class~=active] #filterDispClsfNo").attr('value');
				var dataAll = new Array();
				
				if(dispClsfNo == undefined){
					dispClsfNo = $("#cateCdM").val()
				}
				
				var filters = new Array();
				$(".fil[name=selFilt]").each(function(){
					var filter = $(this).attr('id');
					filters.push(filter);
				});
				
				var bndNos = new Array();
				$(".fil[name=selBnd]").each(function(){
					var bndNo = $(this).attr('id');
					bndNos.push(bndNo);
				});

				$("span[class='fil']").each(function(){
					var dataObj = new Object();
					dataObj.name = $(this).attr('name');
					dataObj.id = $(this).attr('id');
					dataObj.text = $(this).children('em').text();
					dataAll.push(dataObj);
				})
					
				
				var options = {
						url : "/shop/categoryFilterPop"
						, type : "POST"
						, dataType : "html"
						, data : {
							dispClsfNo : dispClsfNo,
							filters : filters,
							bndNos : bndNos
						}
						, done :	function(html){
							$(".popFilter").remove();
							$(".filterPop").append(html);
							ui.toggleClassOn.init();
							ui.order.filter.using();
							ui.popLayer.open('popFilter');
							
							for(var i in dataAll){
								var id = dataAll[i].id;
								var name = dataAll[i].name;
								var text = dataAll[i].text;
								filtDetail.append(id, text, name);
							}
							filtDetail.count();
						}
					};
					ajax.call(options);
			}
			,
			pushUrl : function(dispClsfNo) {
				var params = new URLSearchParams(location.search);
				params.set('dispClsfNo', dispClsfNo);
				var searchParams = params.toString();
				var goUrl = window.location.pathname + "?"+searchParams;
				var order = $("li[class=active][id^=order]").children().val();
				window.history.replaceState( {data : $("#contents").html(), order : order, page : page, scrollPrevent : scrollPrevent}, null, goUrl);
			}
		}
		
		
	</script>
</head>

<body class="body">



<% 
int mem_code=0;
if(session.getAttribute("num")!=null){
	mem_code=(int)session.getAttribute("num");
}
%>
<c:set var="mem_code" value="<%=mem_code%>"></c:set> 
<c:if test='${ mem_code eq 0 }'>
<jsp:include page="./header.jsp"></jsp:include>
</c:if>
<c:if test='${ mem_code ne 0 }'>
<jsp:include page="./loginheader.jsp"></jsp:include>
</c:if> 


<script>
//소분류 상품 가져오기
function getScateGoodsList(dispClsfNo, upDispClsfNo, sCateYn) {
	

	page = 0;
	result = true;
	scrollPrevent = true;
	
	if(sCateYn == 'N') {
		dispClsfNo = 0;	// $("#cateCdL").val()
	}
	
	$.ajax({
		url : "/AboutPet/Project/aboutPet/getScateGoodsList.do"
			, type : "GET"
			, dataType : "html"
			, data : {
				dispClsfNo : dispClsfNo
				, dispClsfNo2 :  upDispClsfNo //$("input[id^=dispClsfNo_]").val()
				, mem_code : <%= mem_code%>
				//, cateCdL : $("#cateCdL").val()
				//, cateCdM : $("#cateCdM").val()
				//, order : $("li[class=active][id^=order]").children().val()
				//, page : page
			}
			,cache:false
        	, success : function(html){
				$("#sCateGoodsList").empty();
				$("#sCateGoodsList").append(html);
				//filter.pushUrl(dispClsfNo);
				//filter.reset();
				//ui.disp.sld.recmd.using();
			}
	})
	 
}

</script>

	<!-- Google Tag Manager (noscript) -->
	<!-- For Analysis Container -->
	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-NKC9BFM"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>

	<!-- For Campaign Container -->
	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-M82SBBJ"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->
	<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData"
			value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">


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
				 uri == "/shop/indexBestGoodsList") {
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
						<li id="shortCut3"><a class="bt" href="javascript:;"
							onclick="goLink('/AboutPet/Project/aboutPet/indexNewCategory.do?dispCornType=NEW')">
								<b class="t">신상품</b>
						</a></li>
						<li id="shortCut4"><a class="bt" href="javascript:;"
							onclick="goLink('/AboutPet/Project/aboutPet/indexBestGoodsList.do?dispCornType=BEST')">
							<!-- dispClsfNo=300000174 -->
								<b class="t">베스트</b>
						</a></li>

						<li class="open" id="tab_category_1"><a class="bt tog"
                     href="javascript:;"><b class="t">카테고리</b></a>
                     <ul class="sm">

                        <c:set value="${dispClsfNo }" var="disp"></c:set>
                        <c:forEach items="${ shopCategory }" var="dto">
                           <c:if test="${disp eq dto.mcate_code }">
                              <li class="active"><a class="bt"
                                 href="javascript:setCateList('${ dto.mcate_code }', '<%= request.getAttribute("lnbDispClsfNo") %>', 'N');"><b
                                    class="t">${ dto.mcate_name }</b></a></li>
                           </c:if>
                           <c:if test="${disp ne dto.mcate_code }">
                              <li class=""><a class="bt"
                                 href="javascript:setCateList('${ dto.mcate_code }', '<%= request.getAttribute("lnbDispClsfNo") %>', 'N');"><b
                                    class="t">${ dto.mcate_name }</b></a></li>
                           </c:if>
                        </c:forEach>

                     </ul></li>

                  <li class="open" id="tab_category_2"><a class="bt tog"
                     href="javascript:;"><b class="t">카테고리</b></a>
                     <ul class="sm">
                        <c:forEach items="${ shopCategory }" var="dto">
                           <c:if test="${disp eq dto.mcate_code }">
                              <li class="active"><a class="bt"
                                 href="javascript:setCateList('${ dto.mcate_code }', '<%= request.getAttribute("lnbDispClsfNo") %>', 'N');"><b
                                    class="t">${ dto.mcate_name }</b></a></li>
                           </c:if>
                           <c:if test="${disp ne dto.mcate_code }">
                              <li class=""><a class="bt"
                                 href="javascript:setCateList('${ dto.mcate_code }', '<%= request.getAttribute("lnbDispClsfNo") %>', 'N');"><b
                                    class="t">${ dto.mcate_name }</b></a></li>
                           </c:if>
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
		<main class="container lnb page shop ct cate" id="container">
			<form id="categoryListForm">
				<input type="hidden" name="cateCdL" id="cateCdL" value="12564" /> <input
					type="hidden" name="cateCdM" id="cateCdM" value="12569" />
			</form>
			<nav class="subtopnav">
				<div class="inr">
					<div class="swiper-container box">
						<ul class="swiper-wrapper menu">
							<c:forEach items="${ shopCategory }" var="dto">
								<li class=""><a class="bt"
									href="/AboutPet/Project/aboutPet/itemList.do?lcate_code=${ dto.lcate_code }&mcate_code=${ dto.mcate_code }"><b
										class="t">${ dto.mcate_name }</b></a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</nav>
			<div class="inr">
				<!-- 본문 -->
				<div class="contents" id="contents">
					<section class="sect ct ctabs">
						<ul class="uiTab h menu " id="sCateList">
							<li class="active" id="12569" name="dispClsfNo">
							<a href="javascript:getScateGoodsList('', <%= request.getParameter("dispClsfNo") %>, 'N');" class="bt"
								data-ui-tab-btn="tab_cate" data-ui-tab-val="tab_cate_1">전체</a></li>
							
							<c:forEach items="${ Scate }" var="dto" varStatus="status">
								<li class="swiper-slide " id="${ dto.scate_code }" name="dispClsfNo">
								<a href="javascript:getScateGoodsList(${ dto.scate_code }, ${ dto.mcate_code }, 'Y');"
									class="bt" data-ui-tab-btn="tab_cate"
									data-ui-tab-val="tab_cate_${ status.index + 2 }">${ dto.scate_name }</a> <input type="hidden"
									id="filterDispClsfNo" value="12583" /> <input type="hidden"
									name="dispClsfNmLength" value="false" />
								</li>						
							</c:forEach>	
							
						</ul>
					</section>
					
					<section id="sCateGoodsList">
						<section class="sect ct cates">
							<div class="sticky_filter">
								<div class="inr">
									<div class="uioptsorts cates">
										<div class="dx lt">
											<div class="tot">
												총 <em class="n">${ cnt }</em>개 상품
											</div>
										</div>
										<div class="dx rt">
										
											<!-- 										
											<nav class="filter">
												<button type="button" class="bt filt" id="btnFilter"
													onclick="filter.open();">
													필터<i class="n" id="filCount">()</i>
												</button>
											</nav>
											<nav class="uisort only_down">
												<button type="button" class="bt st" value=""></button>
												<div class="list">
													<ul class="menu">
														<li id="order_SALE"><button type="button" class="bt"
																value="SALE">판매인기순</button></li>
														<li id="order_LOW"><button type="button" class="bt"
																value="LOW">낮은가격순</button></li>
														<li id="order_HIGH"><button type="button" class="bt"
																value="HIGH">높은가격순</button></li>
														<li id="order_SCORE"><button type="button" class="bt"
																value="SCORE">상품평순</button></li>
														<li id="order_DATE"><button type="button" class="bt"
																value="DATE">등록일순</button></li>
													</ul>
												</div>
											</nav>
											 -->
											 
										</div>
									</div>
								</div>
							</div>
							
							

							<ul class="list" id="pagingGoods">
								
								 
								<c:forEach items="${ itemList }" var="dto">
									<li>
										<div class="gdset cates">
											<div class="thum">
												<a
													href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
													class="pic" data-content='PI000002700'
													data-url="/goods/indexGoodsDetail?goodsId=PI000002700">
													<img class="img" src="${ dto.item_img }"
													alt="${ dto.item_name }"
													onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
												</a>
												
												
												<%-- onclick="zzimclick(${ dto.item_code });" --%>
												<c:set var="doneLoop" value="false"></c:set>									
												<c:if test="${ zzim ne null }">
														<c:forEach items="${ zzim }" var="zzim" varStatus="status">
														<c:if test="${ not doneLoop }">
															<c:if test="${ zzim.item_code eq dto.item_code }">
																<button type="button" class="bt zzim on"
																id="btnZzim_${ dto.item_code }"
																data-itemcode="${ dto.item_code }"
																value="Y">찜하기</button>
																<c:set var="doneLoop" value="true"></c:set>
															</c:if>
															<c:if test="${ status.last }">
																<c:if test="${ status.current.item_code ne dto.item_code }">
																	<button type="button" class="bt zzim "
																	id="btnZzim_${ dto.item_code }"
																	data-itemcode="${ dto.item_code }"
																	value="N" >찜하기</button>
																<c:set var="doneLoop" value="true"></c:set>
																</c:if>
															</c:if>
														</c:if>
														</c:forEach>	
												</c:if>
												<c:if test="${ zzim eq null }">
													<button type="button" class="bt zzim "
													id="btnZzim_${ dto.item_code }"
													data-itemcode="${ dto.item_code }"
													value="N">찜하기</button>
												</c:if>	
													
													
											</div>
											<div class="boxs">
												<div class="tit">
													<a href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
														class="lk" data-content='PI000002700'
														data-url="/goods/indexGoodsDetail?goodsId=PI000002700">${ dto.item_name }</a>
												</div>
												<a href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
													class="inf" data-content='PI000002700'
													data-url="/goods/indexGoodsDetail?goodsId=PI000002700">
													<span class="prc"><em class="p">${ dto.item_price }</em><i
														class="w">원</i></span> <c:if test="${ dto.sale_rate ne 0 }">
														<span class="pct"><em class="n">${ dto.sale_rate }</em><i
															class="w">%</i></span>
													</c:if>

												</a>
											</div>
										</div>
									</li>
								</c:forEach>


							</ul>
						</section>		
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
	            		
	            		/* 
	            		if(html != ""){
							alert("찜 목록에 추가되었습니다.");
	            			location.reload();
							$("div[id=item_zzim_"+item_code+"]").empty();
							$("div[id=item_zzim_"+item_code+"]").append(html);
	            		} else {	            			
							alert("찜 추가 실패!");
	            		}
						 */
						
						
						 
					}
			})

		<%
		}
		%>
		
	})
</script>
		
		<!-- 필터 팝업 인클루드  -->
		<section class="filterPop"></section>
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
		
		<script>

		
		
	
// 	$(function(){
// 		$(window).on("scroll touchmove" , function(){
// 			if($(window).scrollTop() >= $(document).height() - $(window).height()){
// 				if(result && scrollPrevent){
// 					var liLength = $("ul[id=pagingGoods]").children("li").length;
// 					if((liLength != goodsCount) && (liLength >= 20)){
// 						if(page == 1) {
// 							page = 1*rows
// 						} else {
// 							page = ((page/rows)+1) * rows
// 						}
// 						scrollPrevent = false;
// 						pagingCategoryList(page);
// 					}
// 				}
// 			}					
// 		});



// 페이지를 넘겨서 범위를 주는 방법
// 토탈 카운트를 세서 페이지 x 뿌릴 상품수

var res = {
        loader : $("<div />" , {"class":"loader"})
        , container: $("body")
};


	var page = 1
	var rows = '16';
	var result = true;
	var scrollPrevent = true;
	var deviceGb = "PC"
	var goodsCount = ${ cnt };
		
		$(function(){
			$(window).scroll(function(){
				var scrollTop = $(this).scrollTop();
				var both = $(document).innerHeight() - window.innerHeight - ($("#footer").innerHeight() || 0);
				if (both <= (scrollTop +3)) {
					if(result && scrollPrevent){
						var liLength = $("ul[id=pagingGoods]").children("li").length;
						if((liLength != goodsCount) && (liLength >= 16)){
							page = ((page/rows)+1) * rows
							
							scrollPrevent = false;
							pagingCategoryList(page);
						}
					}
				};
			});
		});


// 	});
	
	function pagingCategoryList(page){
		var dispClsfNo = $("li[class~=active][name^=dispClsfNo]").attr('id');
		var order = $("li[class=active][id^=order]").children().val();
		var filters = new Array();
		var bndNos = new Array();

		$("span[name=selFilt]").each(function(){
			var filter = $(this).attr('id');
			filters.push(filter);
		});
	 	
	 	//브랜드
	 	$("span[name=selBnd]").each(function(){
	 		var bndNo = $(this).attr('id');
	 		bndNos.push(bndNo);
	 	});
	 	
	 	if (page != 20) {
	 		res.container.append( res.loader );
		 	$.ajax({
		 		url: "/AboutPet/Project/aboutPet/getItemPagingList.do"
		 		, type : "GET"
		 		, dataType : "html"
		 		, data : {
		 			page : page
		 			, lcate_code : <%= request.getParameter("lnbDispClsfNo") %>
		 			, mcate_code : <%= request.getParameter("dispClsfNo") %> 
		 			, mem_code : <%= mem_code %>
		 		}
			 	, cache:false
		    	, success : function(html){
		    		res.container.find(res.loader).remove();
					$("ul[id=pagingGoods]").append(html);
				}
		 	})
		}
	 	
	 	
	 	/* 
	 	var options = {
			url : "/shop/getGoodsPagingList"
			, type : "POST"
			, dataType : "html"
			, data : {
				dispClsfNo : dispClsfNo,
				dispClsfNo2 :  $("input[id^=dispClsfNo_]").val(),
				cateCdL : $("#cateCdL").val(),
				cateCdM : $("#cateCdM").val(),
		 		filters : filters,
		 		bndNos: bndNos,
				order: order,
				page : page
			}
			, done :	function(html){
					$("#pagingGoods").append(html);
					if($("#pagingGoods li").length % 20 != 0 || $("#pagingGoods li").length == goodsCount){
						result = false;					
					}else {
						scrollPrevent = true;
					}
					filter.pushUrl(dispClsfNo);
			}
		};
		ajax.call(options);
		 */
	}
	</script>
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
						<li><a href="/customer/notice/indexNoticeList">입점/제휴 문의</a></li>
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