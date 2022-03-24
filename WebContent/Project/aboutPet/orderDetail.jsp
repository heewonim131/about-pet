<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<link href="https://aboutpet.co.kr/_images/common/favicon.ico" rel="shrtcut icon">
<link href="https://aboutpet.co.kr/_images/common/favicon.png" rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/my.css">
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

	$(window).on('pageshow', function() { storageReferrer.set(); });
	
	// mw/pc 자동 로그아웃 30분 
	var checkActionTimeOut;
	if('951865' != '0' && 'PC' != 'APP'){
	    resetLoginTimeOut();
	    $(document).on('click keypress' , 'body' , function(){
	        resetLoginTimeOut();
	    });
	}
	function resetLoginTimeOut() {
		if('951865' != '0' && 'PC' != 'APP'){
		    window.clearTimeout(checkActionTimeOut);
		    checkActionTimeOut = setTimeout(function() {
		        location.href="/logout/";
		    }, 30 * 60 * 1000);
		}		   
	}

	
	// 설정 -> 앱 푸시 설정 토글시
	// 앱에서 호출하기 위해 공통으로 푸출
	function updateInfoRcyYn(checkYn) {
		if("sungsill150" != null && "sungsill150" != "") {
			var toastText = (checkYn == "Y") ? "설정" : "해제";
					
			var options = {
					url : "/updateInfoRcvYn"
					, data : { mbrNo : "951865", infoRcvYn : checkYn }
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
		-webkit-touch-callout:none;
		/* 텍스트나 이미지를 선택할 수 있게 하는 여부를 제어 */
		/*-webkit-user-select:none;*/
		/* 링크를 터치했을때 나오는 기본 영역의 색상을 제어 */
		/*-webkit-tap-highlight-color:transparent;*/
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
	goHistoryBack : function(url){
		var fullUrl = storageHist.cnvrtFullUrl(url);
		storageHist.clearUp(fullUrl);
		history.back();
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

// Native App에서 referrer 를 주지 않고 있어서 js로 처리함.
var storageReferrer = {
	set : function() {
		sessionStorage.setItem('storageReferrer', sessionStorage.getItem('storageCurrent'));
		sessionStorage.setItem('storageCurrent', window.location.href);
	},
	get : function() {
		return sessionStorage.getItem('storageReferrer');
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
</script><!-- Google Tag Manager -->
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

<script>
var digitalData = digitalData || {};
var ckLoginId = $.cookie("loginId");
digitalData.userInfo = {
  "loginStatus": (ckLoginId == '')? '' : "Logged In",
  "userId": ckLoginId  
};
</script>
<script type="text/javascript">
	/*  order에서 공통으로 사용되는 js 영역입니다. */	
	
var orderCommon = {
	DLVRC_STD_10 : "10"	//무료 배송
	,DLVRC_STD_20 : "20"	//배송비 추가
	,DLVRC_CDT_10 : "10"	//개당 부여
	,DLVRC_CDT_20 : "20"	//주문당 부여
	,DLVRC_CDT_STD_10 : "10"	//유료배송
	,DLVRC_CDT_STD_20 : "20"	//조건부 무료배송(구매가격)
	,DLVRC_CDT_STD_30 : "30"	//조건부 무료배송(구매수량)
};
	
var orderPopup = {
	
	
	
	loadLayer : function(targetTag, url, params, popId, callBackFnOpen, callBackFnClose ) {
		
		waiting.start(); 	
		
		if (params == null) {
			params = {};
		}
	 	
		$("."+ targetTag).load(
			url,
			params,
			function(response, status, xhr) {
				waiting.stop();		
				
				if (status === "error") {
					if (xhr.status === 460) {												
						$("."+ targetTag).empty();						
					}
	
					ajax.error(xhr.status, xhr.responseText);  
				}else{
					
					ui.popLayer.open(popId, {
						ocb:function(){
							if (callBackFnOpen != null && callBackFnOpen !== "" && callBackFnOpen !== undefined) {
								eval(callBackFnOpen + "()");
							}
						},
						ccb:function(){
							if (callBackFnClose != null && callBackFnClose !== "" && callBackFnClose !== undefined) {
								eval(callBackFnClose + "()");
							}
							$("."+ targetTag).empty();
						}
					});
					
				}				
		}); 		
	}		
}


/*constants*/
const NO_MEMBER_NO = 0;
const CLM_TP_20 = "20";

/*message*/
const FRONT_WEB_VIEW_MYPAGE_ORDER_DETAIL_STATCD_UPDATE_CONFIRM = "구매를 확정하시겠습니까?";
const FRONT_WEB_VIEW_MYPAGE_ORDER_DETAIL_STATCD_UPDATE_SUCCESS = "구매확정이 완료되었습니다.";
const FRONT_WEB_VIEW_CLAIM_REFUND_CLAIM_PSB = "반품이 불가능한 상품입니다.";
const FRONT_WEB_VIEW_CLAIM_CONFIRM_CLAIM_REFUND = "반품 접수를 철회하시겠습니까?";
const FRONT_WEB_VIEW_CLAIM_CONFIRM_CLAIM_EXCHANGE = "교환 접수를 철회하시겠습니까?";
const FRONT_WEB_VIEW_CLAIM_CLAIM_REFUND_SUCCESS = "반품 접수가 철회되었습니다.";
const FRONT_WEB_VIEW_CLAIM_CLAIM_EXCHANGE_SUCCESS = "주문 취소가 완료되었습니다.";
/*
 * 주문/배송 상세 버튼
 */
var orderDeliveryDetailBtn = {
	// 배송지 수정
	goAddressEdit : function(ordNo){
		var params = {
				ordNo : ordNo
			, callBackFnc : "orderDeliveryDetailBtn.reload"
		};

		pop.popupDeliveryAddressEdit(params);
	}
	
	, plgYn : "Y"
	, deviceGb : 'PC'
	, openGoodsComment : function(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, sGoodsEstmTP){
		
		if(sGoodsEstmNo == ""){
			if(orderDeliveryDetailBtn.deviceGb == 'APP' && orderDeliveryDetailBtn.plgYn == 'Y') {					
				$("#acSelect").remove();
				
				var layerCommentHtml = "";					
				layerCommentHtml += "<div class=\"acSelect t2\" id=\"acSelect\">";
				layerCommentHtml += "	<input type=\"text\" class=\"acSelInput\" readonly />";
				layerCommentHtml += "	<div class=\"head \">";
				layerCommentHtml += "		<div class=\"con\">";
				layerCommentHtml += "			<div class=\"tit\">후기작성</div>";
				layerCommentHtml += "			<a href=\"javascript:;\" class=\"close\" onClick=\"ui.selAc.close(this)\"></a>";
				layerCommentHtml += "		</div>";
				layerCommentHtml += "	</div>";
				layerCommentHtml += "	<div class=\"con\">";
				layerCommentHtml += "		<ul class=\"selReview\">";
				layerCommentHtml += "			<li onClick=\"orderDeliveryDetailBtn.openGoodsCommentNext('"+ sGoodsId +"', '"+ sOrdNo +"', '"+sOrdDtlSeq +"', '"+sGoodsEstmNo+"', 'NOR');\" name='norBtn'>";
				layerCommentHtml += "			<img src=\"../../_images/my/icon-review-normal@2x.png\">";
				layerCommentHtml += "			<span>일반 후기 작성</span>";
				layerCommentHtml += "			</li>";
				layerCommentHtml += "			<li onClick=\"orderDeliveryDetailBtn.openGoodsCommentNext('"+ sGoodsId +"', '"+ sOrdNo +"', '"+sOrdDtlSeq +"', '"+sGoodsEstmNo+"', 'PLG');\" name='plgBtn'>";
				layerCommentHtml += "			<img src=\"../../_images/my/icon-review-log@2x.png\">";
				layerCommentHtml += "			<span>펫로그 후기 작성</span>";
				layerCommentHtml += "			</li>";
				layerCommentHtml += "		</ul>";
				layerCommentHtml += "	</div>";
				layerCommentHtml += "</div>";
				
				$("#emptyLayers").append(layerCommentHtml);
				
				ui.selAc.open('#acSelect');
				
			}else{
				var norBtn = "NOR";
				orderDeliveryDetailBtn.openGoodsCommentNext(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, norBtn);
			}
		}else{			
			
			orderDeliveryDetailBtn.openGoodsCommentNext(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, sGoodsEstmTP);
		}	
			
	}
	, openGoodsCommentNext : function(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, sGoodsEstmTp){	
		
		//수정
		if(sGoodsEstmNo != ""){					
			if( sGoodsEstmTp == "PLG" && orderDeliveryDetailBtn.deviceGb != "APP"){					
				ui.alert('펫로그 후기는 <br>모바일 앱에서 수정 가능합니다.');
				return false;					
			}
			
		}
		
		var url = "/mypage/commentWriteView"
		var html = '';
		html += '<input type="hidden" name="goodsId" value="'+ sGoodsId +'">';
		html += '<input type="hidden" name="goodsEstmTp" value="'+ sGoodsEstmTp +'">';
		html += '<input type="hidden" name="ordNo" value="'+ sOrdNo +'">';
		html += '<input type="hidden" name="ordDtlSeq" value="'+ sOrdDtlSeq +'">';
		html += '<input type="hidden" name="goodsEstmNo" value="'+ sGoodsEstmNo +'">';
		var goform = $("<form>",
			{ method : "post",
			action : url,
			target : "_self",
			html : html
			}).appendTo("body");
		goform.submit();
	}

	// 재조회 */
	, reload : function(){
		location.reload();
	}
	// 옵션 변경 팝업
	, openOptionChange : function(ordNo, ordDtlSeq){
		var params = {
			ordNo : ordNo,
			ordDtlSeq : ordDtlSeq,
			mode : "order",
			callBackFnc : "orderDeliveryDetailBtn.cbOptionChange"
		};
		pop.orderOptionChange(params);
	}
	// 옵션 변경 CallBack
	, cbOptionChange : function(){
		location.reload();
	}
	// 구매확정
	/* , purchase : function(ordNo, ordDtlSeq){
		if(confirm(FRONT_WEB_VIEW_MYPAGE_ORDER_DETAIL_STATCD_UPDATE_CONFIRM)){
			var options = {
					   url : "mypage/order/purchaseProcess"
					, data : { ordNo : ordNo, ordDtlSeq : ordDtlSeq }
					, done : function(data){
						alert(FRONT_WEB_VIEW_MYPAGE_ORDER_DETAIL_STATCD_UPDATE_SUCCESS);
						orderDeliveryDetailBtn.reload();
					}
				};
			ajax.call(options);
		}
	} */
	, purchase : function(ordNo, ordDtlSeq, ordDtlStatCd){
		
		if(ordDtlStatCd == "150" ){
						
			ui.confirm('<div class="info-txt t3"><ul><li>구매확정 이후에는 반품/교환이 불가하므로 상품을 배송 받으신 후에 구매확정을 해주세요.</li><li>상품을 배송받지 않은 상태에서 구매확정을 하신 경우 상품 미수령에 대한 책임은 구매자에게 있습니다.</li></ul></div>',{ // 컨펌 창 띄우기	
				//tit:"상품이 아직 배송중입니다.<br>구매확정을 진행하시겠습니까?",
				tit:"아직 배송중인 상품이 있어요<br>구매를 확정할까요?",						
				ycb:function(){
					orderDeliveryDetailBtn.purchaseNext(ordNo, ordDtlSeq);
				},					
				ybt:'예',
				nbt:'아니요'	
			});
		}else{
			orderDeliveryDetailBtn.purchaseNext(ordNo, ordDtlSeq);
		}				
	}
	, purchaseNext : function(ordNo, ordDtlSeq){
		var action = "/mypage/order/indexPurchaseRequest";				
		
		$("#delivery_detail_ord_no").val(ordNo);
		$("#delivery_detail_ord_dtl_seq").val(ordDtlSeq);
		$("#claim_request_list_form").attr("target", "_self");
		$("#claim_request_list_form").attr("method", "post");
		$("#claim_request_list_form").attr("action", action);
		$("#claim_request_list_form").submit();
	}
	// 주문취소 신청
	, goCancelRequest : function(ordNo, ordDtlSeq){
		var action = "/mypage/order/indexCancelRequest";

		$("#delivery_detail_ord_no").val(ordNo);
		$("#delivery_detail_ord_dtl_seq").val(ordDtlSeq);
		$("#claim_request_list_form").attr("target", "_self");
		$("#claim_request_list_form").attr("method", "post");
		$("#claim_request_list_form").attr("action", action);
	
		$("#claim_request_list_form").submit();
	}
	// 주문취소 페이지 
	, goCancelAllRequest : function(ordNo){
		
		if(ordNo == null || ordNo == undefined || ordNo == ""){			
			ui.alert("주문번호 오류입니다.",{					
				ybt:'확인'	
			});
			return;
		}else{	
		
			var url = "/mypage/insertClaimCancelExchangeRefund";
			
			$("#delivery_detail_ord_no").val(ordNo);		
			$("#clm_tp_cd").val("10");
			$("#clm_rsn_cd").val("110");
			
			
			ui.confirm('<div class="info-txt t3"><ul><li>입금대기 중에는 <span>전체 취소만 할 수 있어요. </li><li>일부 상품만 구매를 원하시는 경우, 취소 후 다시 주문해주세요</li></ul></div>',{ // 컨펌 창 띄우기
				tit:"주문을 취소할까요?",
				ycb:function(){
					var options = {
						url : url
						, data : $("#claim_request_list_form").serializeArray()
						, done : function(data){					
							if(data != null){
								ui.toast('주문 취소가 완료되었어요.',{
									sec:3000,
									ccb:function(){  // 토스트 닫히면 실행할 함수
										location.href="/mypage/order/indexDeliveryList";
									}
								});
								
							}
						}
					};		
					
					ajax.call(options);
				},					
				ybt:'예',
				nbt:'아니요'	
			});	
		
		}			
		
	}	
	// 교환 신청
	, goExchangeRequest : function(ordNo ,ordDtlSeq, clmIngYn, rtnIngYn){
		
		if(clmIngYn === "Y"){
			if(rtnIngYn == "Y"){
				ui.alert("이미 반품 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
					ybt:'확인'
				});
			}else{
				ui.alert("이미 교환 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
					ybt:'확인'
				});
			}
			return;
		}
		
		var action = "/mypage/order/indexExchangeRequest";

		$("#delivery_detail_ord_no").val(ordNo);
		$("#delivery_detail_ord_dtl_seq").val(ordDtlSeq);
		$("#claim_request_list_form").attr("target", "_self");
		$("#claim_request_list_form").attr("method", "post");
		$("#claim_request_list_form").attr("action", action);
		$("#claim_request_list_form").submit();
	}
	// 반품 신청
	, goReturnRequest : function(ordNo, ordDtlSeq, clmIngYn, rtnIngYn, rtnPsbYn){
		if(clmIngYn === "Y"){
			if(rtnIngYn == "Y"){
				ui.alert("이미 반품 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
					ybt:'확인'
				});
			}else{
				ui.alert("이미 교환 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
					ybt:'확인'
				});
			}
			return;
		}

		if(rtnPsbYn !== "Y"){
			ui.alert(FRONT_WEB_VIEW_CLAIM_REFUND_CLAIM_PSB, {					
				ybt:'확인'
			});
			return;
		}

		var action = "/mypage/order/indexReturnRequest";

		$("#delivery_detail_ord_no").val(ordNo);
		$("#delivery_detail_ord_dtl_seq").val(ordDtlSeq);
		$("#claim_request_list_form").attr("target", "_self");
		$("#claim_request_list_form").attr("method", "post");
		$("#claim_request_list_form").attr("action", action);
		$("#claim_request_list_form").submit();
	}
	// 구매영수증 팝업
	, openPurchaseReceipt : function(ordNo){
		var params = {
				ordNo : ordNo
				}
		pop.purchaseReceipt(params);
	}
	// 현금영수증 팝업
	, openCashReceipt : function(ordNo){
		var params = {
				ordNo : ordNo
			}
		pop.cashReceipt(params);
	}
	// 신용카드 영수증
	, openCreditCard : function(tid){
		if("false"=="true") {
			/* var parameters = {
				"func" : "onOrderPage",
				"url" : "https://npg.nicepay.co.kr/issue/IssueLoader.do?TID="+tid+"&type=0",
				"title" : "카드영수증"
			};
			if("false"=="true") {
				// Android
				window.AppJSInterface.onOrderPage(JSON.stringify(parameters));
			} else {
				// iOS(Dictionary)
				window.webkit.messageHandlers.AppJSInterface.postMessage(parameters);
			} */
			toNativeData.func = "onTitleBarHidden";
			toNativeData.hidden = "N";
			toNativeData.title = "카드영수증";
			// 1. 팝업열기
			var status = "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=420,height=540";
			var url = "https://npg.nicepay.co.kr/issue/IssueLoader.do?TID="+tid+"&type=0";
			 //type 값 세팅 :: 매출전표: 0, 현금영수증: 1
			window.open(url,"popupIssue",status);
			
			toNative(toNativeData);
			
		} else {
			// 1. 팝업열기
			var status = "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=420,height=540";
			var url = "https://npg.nicepay.co.kr/issue/IssueLoader.do?TID="+tid+"&type=0";
			 //type 값 세팅 :: 매출전표: 0, 현금영수증: 1
			window.open(url,"popupIssue",status);
		}
	}
	, openClaimDetail : function(clmNo, clmDtlSeq){
		var params = { clmNo : clmNo
				, clmDtlSeq : clmDtlSeq
				, viewTitle : "상세정보"
		}
		pop.popupCancelRefundInfo(params);
	}
	, cancelClaim : function (clmNo, clmTpCd, memberNo){
		var url = "";
		if(memberNo !== NO_MEMBER_NO){
			url = "/mypage/refundExchangeCancelRequest";
		}else{
			url = "/mypage/noMemberRefundExchangeCancelRequest";
		}

		var confirmMsg = "";

		if(clmTpCd === CLM_TP_20){
			confirmMsg = FRONT_WEB_VIEW_CLAIM_CONFIRM_CLAIM_REFUND;
		}else{
			confirmMsg = FRONT_WEB_VIEW_CLAIM_CONFIRM_CLAIM_EXCHANGE;
		}

		if(confirm(confirmMsg)){
			var options = {
				   url : url
				, data : {clmNo : clmNo}
				, done : function(data){
					if(clmTpCd === CLM_TP_20){
						alert(FRONT_WEB_VIEW_CLAIM_CLAIM_REFUND_SUCCESS);
					}else{
						alert(FRONT_WEB_VIEW_CLAIM_CLAIM_EXCHANGE_SUCCESS);
					}
					orderDeliveryDetailBtn.reload();
				}
			};
			ajax.call(options);
		}
	}
	, openCashReceiptRequest: function(ordNo, payAmt, goodsNm){
		var popParam = {
			ordNo : ordNo,
			payAmt : payAmt,
			goodsNm : goodsNm
		}		
		var popUrl = "/mypage/order/popupCashReceiptRequest";
		
		orderPopup.loadLayer("layers", popUrl, popParam, "popReceipt");		
		
	}
	
	,goOrderClaimDetail : function(clmNo, clmTpCd){	
		if(clmNo == null || clmNo == undefined || clmNo == ""){			
			ui.alert("클레임번호 오류입니다.",{					
				ybt:'확인'	
			});
			return;
		}else{		
			
			var action = "/mypage/order/indexClaimDetail";				
			var inputs = "<input type=\"hidden\" name=\"clmNo\" value=\""+clmNo+"\"/>";
			if(clmTpCd != "" ){
				inputs += "<input type=\"hidden\" name=\"clmTpCd\" value=\""+clmTpCd+"\"/>";
			}				
			jQuery("<form action=\"/mypage/order/indexClaimDetail\" method=\"post\">"+inputs+"</form>").appendTo('body').submit();
		}
	}
};

</script><script type="text/javascript" 	src="/_script/cart/cart.js"></script>
<script type="text/javascript">
		/**
		 * 모바일 타이틀 수정 
		 */
		$(document).ready(function(){
			$("#header_pc").removeClass("mode0");
			$("#header_pc").addClass("mode16");
			$("#header_pc").attr("data-header", "set22");
			$("#header_pc").addClass("logHeaderAc");
			$(".mo-heade-tit .tit").html("주문/배송");			
			$(".mo-header-backNtn").removeAttr("onclick");
			$(".mo-header-backNtn").bind("click", function(){				
				if("" == ""){
					storageHist.goBack('/mypage/indexMyPage');
				}else if("" == "OL"){
					storageHist.goBack('/mypage/order/indexDeliveryList');
				}else{
					storageHist.goBack();
				}
				
				
			});
		}); // End Ready
	
		$(document).ready(function(){
			
			$("#delivery_start_dt").datepicker("option", "maxDate", "0");
			$("#delivery_start_dt").datepicker("option", "dateFormat", "yy.mm.dd");			
			$("#delivery_start_dt").on("propertychange change keyup paste input", function() {			    
				$("#delivery_end_dt").datepicker("option", "minDate", $(this).val());			 
			});
			
			$("#delivery_end_dt").datepicker("option", "dateFormat", "yy.mm.dd");
			var dateStartDt = $("#delivery_start_dt").val();
			$("#delivery_end_dt").datepicker("option", "minDate", dateStartDt);			
			$("#delivery_end_dt").datepicker("option", "maxDate", "0");
			
			
			$("#delivery_start_dt").val(  format.DateType($('input[name=ordAcptDtmStart]').val(), "."));	
			$("#delivery_end_dt").val(  format.DateType($('input[name=ordAcptDtmEnd]').val(), "."));
			
			
			$(window).on("scroll", function() {
				var scrollHeight = $(document).height();
				var scrollPosition = $(window).height() + $(window).scrollTop();		
				if (scrollPosition > scrollHeight - 200) {			
					orderDeliveryList.scrollPaging();		
				}
			});
			
			//전체주문보기 기본 감추기
			$(".btn-fixed-round").css("display","none");
			//결제완료시 전체주문번호 노출
			
			//orderStatusChangeFn();
			
		}); // End Ready
	
		$(function() {
			calendar.range("delivery_start_dt", "delivery_end_dt", {yearRange : 'c-10:c'});	
			
			if($(".step-list>ul").children("li").hasClass("on") == true){
				$("#btnAllDelivery").show();			
				$("#btnAllDelivery").click(function(){
					orderDeliveryList.reload();
				});	
			}else{
				$("#btnAllDelivery").hide();
			}

			$(document).off("click", '[data-target="order"][data-action="goodsflow"]')
				.on("click", '[data-target="order"][data-action="goodsflow"]', function(e) {
					e.stopPropagation();

					let $this = $(this);
					let url = $this.data("url");

					if("false"=="true") {
						var parameters = {
							"func" : "onOrderPage",
							"url" : url,
							"title" : "배송조회"
						};
						if("false"=="true") {
							// Android
							window.AppJSInterface.onOrderPage(JSON.stringify(parameters));
						} else {
							// iOS(Dictionary)
							window.webkit.messageHandlers.AppJSInterface.postMessage(parameters);
						}
					} else {
						window.open(url,"","width=498,height=640, scrollbars=yes,resizable=no");
					}
					e.preventDefault();
				});
		});
	
		
		/*
		 * 주문/배송 목록
		 */
		var orderDeliveryList = {
			// 재조회			
			reload : function(){			
				$("#delivery_list_form").attr("target", "_self");
				$("#delivery_list_form").attr("action", "/mypage/order/indexDeliveryList");
				$("#delivery_list_form").submit();
			}
			// 기간버튼 클릭 시
			, setPeriod : function(period){
				$("input[name=period]").val(period);			
				if(period == 0){
					/* $('#delivery_start_dt').val("");
					$('#delivery_end_dt').val(""); */
					calendar.autoRangeOrder("delivery_start_dt", "delivery_end_dt", 3);
					$(".dummy-gray-line").addClass("open");				
				}else{				
					$(".dummy-gray-line").removeClass("open");
					calendar.autoRangeOrder("delivery_start_dt", "delivery_end_dt", period);
					this.setSearchDate();	
				}			
				
			}
			// 조회 버튼
			, search : function(){
				//$("input[name=period]").val("");
				this.setSearchDate();
			}
			//상태카운트 클릭시
			,searchStauts : function(stus, clickId){
				var statusClass = "";
				$("input[name=arrOrdDtlStatCd]").remove();
				
				if($("#"+clickId).hasClass("on") == false){							
					var hidArrhtml = "";
					if(stus == "1230"){
						hidArrhtml += "<input type=\"hidden\" name=\"arrOrdDtlStatCd\"  value=\"120\" />";
						hidArrhtml += "<input type=\"hidden\" name=\"arrOrdDtlStatCd\"  value=\"130\" />";
						statusClass = "120";
					}else{
						hidArrhtml += "<input type=\"hidden\" name=\"arrOrdDtlStatCd\"  value="+ stus +" />";
						statusClass = stus;
					}
					
					$("#delivery_list_form").append(hidArrhtml);			
					$("#delivery_list_page").val("1");
				}else{
					$("input[name=period]").val("3");
					$('input[name=ordAcptDtmStart]').val("");
					$('input[name=ordAcptDtmEnd]').val("");
				}
				
				//this.reload();
				//20210621 페이지 새로고침에서 ajax로 변경
				var formData = $("#delivery_list_form").serialize();				
				var options = {
						url : "/mypage/order/ajaxDeliveryHtml"
						,data : formData	
						, dataType: 'html'
						,done : function(data) {
							$("#deliveryList form,.statusDeliveryList,.btn-fixed-round").remove();
							$("#deliveryList").append(data);
							orderStatusChangeFn(statusClass);
						} 
				};
				ajax.call(options);
			}
			// 페이지 클릭
			, setPage : function(page){
				$("#delivery_list_page").val(page);
				this.reload();
			}
			, setSearchDate  : function(){
				
				if($.trim($('#delivery_start_dt').val()) == "" ){				
					ui.alert("조회 기간을 입력해주세요.",{					
						ybt:'확인'	
					});				
					return false;
					
				}else if ($.trim($('#delivery_end_dt').val()) == ""){				
					ui.alert("조회 기간을 입력해주세요.",{					
						ybt:'확인'	
					});				
					return false;	
				}else{
				
					var startDt = new Date($('#delivery_start_dt').val());
					var endDt = new Date($('#delivery_end_dt').val());
					
					var diff = endDt.getTime() - startDt.getTime(); 
					
					if ( startDt > endDt ) {				
						ui.alert("조회 종료일은 시작일 보다 작을수 없습니다.",{					
							ybt:'확인'	
						});
						return false;
					}	
					
					if ( 365 < Math.floor(diff/(1000*60*60*24)) ) {				
						ui.alert("조회기간은 최대 12개월까지 설정가능 합니다.",{					
							ybt:'확인'	
						});
						return false;
					}
					
					//날짜 변환
					var formStartDt = $('#delivery_start_dt').val();
					var formEndDt = $('#delivery_end_dt').val();			
					$('input[name=ordAcptDtmStart]').val(formStartDt.replaceAll(".", "-"));
					$('input[name=ordAcptDtmEnd]').val(formEndDt.replaceAll(".", "-"));
					
					// 조회시 페이징관련 변수 초기화
					$("input[name=arrOrdDtlStatCd]").remove();
					$("#delivery_list_page").val("1");			
					//this.reload();
					var formData = $("#delivery_list_form").serialize();				
					var options = {
							url : "/mypage/order/ajaxDeliveryHtml"
							,data : formData	
							, dataType: 'html'
							,done : function(data) {
								$("#deliveryList form,.statusDeliveryList,.btn-fixed-round").remove();
								$("#deliveryList").append(data);
								orderStatusChangeFn();
								
								$("#delivery_start_dt").val(  format.DateType($('input[name=ordAcptDtmStart]').val(), "."));	
								$("#delivery_end_dt").val(  format.DateType($('input[name=ordAcptDtmEnd]').val(), "."));
							} 
					};
					ajax.call(options);
				}	 
			}
			,convertDate : function(str){	
				
				var y = str.substr(0,4),
				m = str.substr(4,2) - 1,
				d = str.substr(6,2)
				
				return new Date(y,m,d);		
				
			}		
			,convertBankDate : function(str){	
				
				var y = str.substr(0,4),
				m = str.substr(4,2) - 1,
				d = str.substr(6,2)
				hh = str.substr(8,2)
				mm = str.substr(10,2);
				
				return new Date(y,m,d,hh,mm);		
				
			} 
			, scrollPaging  : function() {			
				var endPage = $("#delivery_list_totalPage").val();
				var nowPage = $("#delivery_list_page").val();	
				
				var callAjaxdeliveryHtml = $("#callAjaxdeliveryHtml").val();
				
				if (callAjaxdeliveryHtml == 'N' && Number(nowPage) < Number(endPage) ){
					$("#callAjaxdeliveryHtml").val("Y");
					$("#delivery_list_page").val( Number(nowPage) + 1);				
					var formData = $("#delivery_list_form").serialize();				
					var options = {
							url : "/mypage/order/ajaxDeliveryListHtml"
							,data : formData	
							, dataType: 'html'
							,done : function(data) {
								var status = $("input[name=arrOrdDtlStatCd]").val();
								$("#deliveryList").append(data);
								$("#callAjaxdeliveryHtml").val("N");
								orderStatusChangeFn(status);
							} 
					};
					
					ajax.call(options);		
				}
			}
		}
	
		/*
		 * 주문/배송 목록 버튼
		 */
		var orderDeliveryListBtn = {
			// 상품 상세 이동
			goOrderDetail : function(ordNo){
				var inputs = "<input type=\"hidden\" name=\"ordNo\" value=\""+ordNo+"\"/><input type=\"hidden\" id=\"mngb\" name=\"mngb\" value=\"OL\" />";
				jQuery("<form action=\"/mypage/order/indexDeliveryDetail\" method=\"get\">"+inputs+"</form>").appendTo('body').submit();
			}
			,goOrderClaimDetail : function(clmNo, clmTpCd){	
				if(clmNo == null || clmNo == undefined || clmNo == ""){			
					ui.alert("클레임번호 오류입니다.",{					
						ybt:'확인'	
					});
					return;
				}else{		
					
					var action = "/mypage/order/indexClaimDetail";				
					var inputs = "<input type=\"hidden\" name=\"clmNo\" value=\""+clmNo+"\"/>";
					//if(clmTpCd != "10" ){
					//	inputs += "<input type=\"hidden\" name=\"clmDtlSeq\" value=\"1\"/>";
					//}				
					jQuery("<form action=\"/mypage/order/indexClaimDetail\" method=\"post\">"+inputs+"</form>").appendTo('body').submit();
				}
			}
			// 상품평 등록 팝업
			, plgYn : "Y"
			, deviceGb : 'PC'
			, petRegYn : "Y"
			, openGoodsComment : function(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, sGoodsEstmTP){
				
				if(sGoodsEstmNo == ""){
					if(orderDeliveryListBtn.deviceGb == 'APP' && orderDeliveryListBtn.plgYn == 'Y' && orderDeliveryListBtn.petRegYn == "Y") {
						$("#acSelect").remove();
						
						var layerCommentHtml = "";					
						layerCommentHtml += "<div class=\"acSelect t2 k0429\" id=\"acSelect\">";
						layerCommentHtml += "	<input type=\"text\" class=\"acSelInput\" readonly />";
						layerCommentHtml += "	<div class=\"head \">";
						layerCommentHtml += "		<div class=\"con\">";
						layerCommentHtml += "			<div class=\"tit\">후기작성</div>";
						layerCommentHtml += "			<a href=\"javascript:;\" class=\"close\" onClick=\"ui.selAc.close(this)\"></a>";
						layerCommentHtml += "		</div>";
						layerCommentHtml += "	</div>";
						layerCommentHtml += "	<div class=\"con\">";
						layerCommentHtml += "		<ul class=\"selReview\">";
						layerCommentHtml += "			<li onClick=\"orderDeliveryListBtn.openGoodsCommentNext('"+ sGoodsId +"', '"+ sOrdNo +"', '"+sOrdDtlSeq +"', '"+sGoodsEstmNo+"', 'NOR');\" name='norBtn'>";
						layerCommentHtml += "			<img src=\"../../_images/my/icon-review-normal@2x.png\">";
						layerCommentHtml += "			<span>일반 후기 작성</span>";
						layerCommentHtml += "			</li>";
						layerCommentHtml += "			<li onClick=\"orderDeliveryListBtn.openGoodsCommentNext('"+ sGoodsId +"', '"+ sOrdNo +"', '"+sOrdDtlSeq +"', '"+sGoodsEstmNo+"', 'PLG');\" name='plgBtn'>";
						layerCommentHtml += "			<img src=\"../../_images/my/icon-review-log@2x.png\">";
						layerCommentHtml += "			<span>펫로그 후기 작성</span>";
						layerCommentHtml += "			</li>";
						/* if( orderDeliveryListBtn.deviceGb != "PC"){						
							layerCommentHtml += "			<li></li>";
						} */					
						layerCommentHtml += "		</ul>";
						layerCommentHtml += "	</div>";
						layerCommentHtml += "</div>";
						
						$("#emptyLayers").append(layerCommentHtml);
						
						ui.selAc.open('#acSelect');
						
					}else{
						var norBtn = "NOR";

						orderDeliveryListBtn.openGoodsCommentNext(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, norBtn);
					}
				}else{
					var norBtn = sGoodsEstmTP ==  "" ? "NOR" : sGoodsEstmTP;
					orderDeliveryListBtn.openGoodsCommentNext(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, norBtn);
					//orderDeliveryListBtn.openGoodsCommentNext(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, sGoodsEstmTP);
				}	
					
			}
			, openGoodsCommentNext : function(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, sGoodsEstmTp){	
				
				//수정
				if(sGoodsEstmNo != ""){					
					if( sGoodsEstmTp == "PLG" && orderDeliveryListBtn.deviceGb != "APP"){					
						ui.alert('펫로그 후기는 <br>모바일 앱에서 수정 가능합니다.');
						return false;					
					}
					
				}
												
				var url = "/mypage/commentWriteView"
				var html = '';
				html += '<input type="hidden" name="goodsId" value="'+ sGoodsId +'">';
				html += '<input type="hidden" name="goodsEstmTp" value="'+ sGoodsEstmTp +'">';
				html += '<input type="hidden" name="ordNo" value="'+ sOrdNo +'">';
				html += '<input type="hidden" name="ordDtlSeq" value="'+ sOrdDtlSeq +'">';
				html += '<input type="hidden" name="goodsEstmNo" value="'+ sGoodsEstmNo +'">';
				
				if(sGoodsEstmTp != null && sGoodsEstmTp == "PLG"){
					
					//estmData.data('petLogNo') 값을 알아야함
					//html += '<input type="hidden" name="petLogNo" value="'+estmData.data('petLogNo')+'">';
					html += '<input type="hidden" name="petLogNo" value="">';
				}
				
				var goform = $("<form>",
					{ method : "post",
					action : url,
					target : "_self",
					html : html
					}).appendTo("body");
				goform.submit();
			}
			// 옵션 변경 팝업
			, openOptionChange : function(ordNo, ordDtlSeq){
				var params = {
					ordNo : ordNo,
					ordDtlSeq : ordDtlSeq,
					mode : "order",
					callBackFnc : "orderDeliveryListBtn.cbOptionChange"
				};
				pop.orderOptionChange(params);
			}
			// 옵션 변경 CallBack
			, cbOptionChange : function(){
				location.reload();
			}
			// 구매확정
			/* , purchase : function(ordNo, ordDtlSeq){
				if(confirm(' 구매를 확정하시겠습니까?')){ 
					var options = {
							   url : "/mypage/order/purchaseProcess"
							, data : { ordNo : ordNo, ordDtlSeq : ordDtlSeq }
							, done : function(data){
								alert('구매확정이 완료되었습니다.');	
								orderDeliveryList.reload();
							}
						}; 
					ajax.call(options);
				}
			} */
			, purchase : function(ordNo, ordDtlSeq, ordDtlStatCd){
				
				if(ordDtlStatCd == "150" ){
					
					ui.confirm('<div class="info-txt t3"><ul><li>구매확정 이후에는 반품/교환이 불가하므로 상품을 배송 받으신 후에 구매확정을 해주세요.</li><li>상품을 배송받지 않은 상태에서 구매확정을 하신 경우 상품 미수령에 대한 책임은 구매자에게 있습니다.</li></ul></div>',{ // 컨펌 창 띄우기
						//tit:"아직 배송중인 상품이 있습니다. <br>구매확정을 하시겠습니까?",
						tit:"아직 배송중인 상품이 있어요<br>구매를 확정할까요?",								
						ycb:function(){
							orderDeliveryListBtn.purchaseNext(ordNo, ordDtlSeq);
						},					
						ybt:'예',
						nbt:'아니요'	
					});
				}else{
					orderDeliveryListBtn.purchaseNext(ordNo, ordDtlSeq);
				}				
			}
			, purchaseNext : function(ordNo, ordDtlSeq){
				var action = "/mypage/order/indexPurchaseRequest";				
				
				$("#delivery_list_ord_no").val(ordNo);
				$("#delivery_list_ord_dtl_seq").val(ordDtlSeq);
				$("#claim_request_list_form").attr("target", "_self");
				$("#claim_request_list_form").attr("method", "post");
				$("#claim_request_list_form").attr("action", action);
				$("#claim_request_list_form").submit();
			}
			
			// 주문취소 페이지 
			, goCancelRequest : function(ordNo, ordDtlSeq){			
				
				var action = "/mypage/order/indexCancelRequest";
				
				$("#delivery_list_ord_no").val(ordNo);
				$("#delivery_list_ord_dtl_seq").val(ordDtlSeq);
				$("#claim_request_list_form").attr("target", "_self");
				$("#claim_request_list_form").attr("method", "post");
				$("#claim_request_list_form").attr("action", action);
				$("#claim_request_list_form").submit();
				
			}
			// 주문취소 페이지 
			, goCancelAllRequest : function(ordNo){
				
				if(ordNo == null || ordNo == undefined || ordNo == ""){			
					ui.alert("주문번호 오류입니다.",{					
						ybt:'확인'	
					});
					return;
				}else{	
				
					var url = "/mypage/insertClaimCancelExchangeRefund";
					
					$("#delivery_list_ord_no").val(ordNo);		
					$("#clmTpCd").val("10");
					$("#clmRsnCd").val("110");
					
					
					ui.confirm('<div class="info-txt t3"><ul><li>입금대기 취소는 <span>전체 취소만 가능</span>합니다. </li><li>일부 상품만 구매를 원하시는 경우, 취소 후 다시 주문해 주시기 바랍니다.</li></ul></div>',{ // 컨펌 창 띄우기
						tit:"주문을 취소할까요?",
						ycb:function(){
							var options = {
								url : url
								, data : $("#claim_request_list_form").serializeArray()
								, done : function(data){					
									if(data != null){
										ui.toast('주문 취소가 완료되었어요.',{
											sec:3000,
											ccb:function(){  // 토스트 닫히면 실행할 함수
												orderDeliveryList.reload();
											}
										});
									}
								}
							};		
							
							ajax.call(options);
						},					
						ybt:'예',
						nbt:'아니요'	
					});	
				
				}			
				
			}	
			// 교환 신청
			, goExchangeRequest : function(ordNo ,ordDtlSeq, clmIngYn, rtnIngYn){
				
				if(clmIngYn === "Y"){
					if(rtnIngYn == "Y"){
						ui.alert("이미 반품 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
							ybt:'확인'
						});
					}else{
						ui.alert("이미 교환 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
							ybt:'확인'
						});
					}
					return;
				}
				
				var action = "/mypage/order/indexExchangeRequest";
				
				$("#delivery_list_ord_no").val(ordNo);
				$("#delivery_list_ord_dtl_seq").val(ordDtlSeq);
				$("#claim_request_list_form").attr("target", "_self");
				$("#claim_request_list_form").attr("method", "post");
				$("#claim_request_list_form").attr("action", action);
				$("#claim_request_list_form").submit();			
			}
			// 반품 신청
			, goReturnRequest : function(ordNo, ordDtlSeq, clmIngYn, rtnIngYn, rtnPsbYn){
				
				if(clmIngYn === "Y"){
					if(rtnIngYn == "Y"){
						ui.alert("이미 반품 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
							ybt:'확인'
						});
					}else{
						ui.alert("이미 교환 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
							ybt:'확인'
						});
					}
					return;
				}
	
				if(rtnPsbYn != "Y"){				
					ui.alert("반품이 불가능한 상품입니다.",{					
						ybt:'확인'	
					});
					return;
				}
				
				var action = "/mypage/order/indexReturnRequest";
				
				$("#delivery_list_ord_no").val(ordNo);
				$("#delivery_list_ord_dtl_seq").val(ordDtlSeq);
				$("#claim_request_list_form").attr("target", "_self");
				$("#claim_request_list_form").attr("method", "post");
				$("#claim_request_list_form").attr("action", action);
				$("#claim_request_list_form").submit();			
			}
			,goOrderDelete : function(ordNo){
				
				ui.confirm("삭제된 주문내역은 복구되지 않습니다." + "<br>주문내역을 삭제할까요?",{ // 컨펌 창 띄우기
					ycb:function(){
						var options = {
							   url : "/mypage/order/ordDeleteProcess"
								, data : { ordNo : ordNo}
								, done : function(data){									
									orderDeliveryList.reload();
								}
							}; 
						ajax.call(options);
					},					
					ybt:'예',
					nbt:'아니요'
				});	
			}
		} 
		
		//전체주문보기
		function searchAllOrder(){
			$(".step-list li").each(function(){
				if($(this).hasClass('on')){
					$(this).find('a').click();
				}
			});									
		}

		function fnGoPetsbeOrderList(){
			var data = {
				migMemno : ""
			};

			createFormSubmit('indexPetsbeDeliveryListForm','/mypage/order/indexPetsbeDeliveryList',data);
		}
		
		//주문상태 변경
		function orderStatusChangeFn(statusClass) {
			//var statusClass = $("input[name=arrOrdDtlStatCd]").val();
			
			$(".step-list>ul").children("li").removeClass("on");
			$(".step-list>ul").children("li").find("p:eq(0)").removeClass("color");
			
		    switch (statusClass){
				case "110" :
					$("#stepOne").addClass("on");
					$("#stepOne").find("p:eq(0)").addClass("color");
					$(".btn-fixed-round").css("display","block");
					break;
				case "120" :
					$("#stepTwo").addClass("on");
					$("#stepTwo").find("p:eq(0)").addClass("color");
					$(".btn-fixed-round").css("display","block");
					break;
				case "140" :
					$("#stepThree").addClass("on");
					$("#stepThree").find("p:eq(0)").addClass("color");
					$(".btn-fixed-round").css("display","block");
					break;	     
				case "150" :
					$("#stepFour").addClass("on");
					$("#stepFour").find("p:eq(0)").addClass("color");
					$(".btn-fixed-round").css("display","block");
					break;
				case "160" :
					$("#stepFive").addClass("on");
					$("#stepFive").find("p:eq(0)").addClass("color");
					$(".btn-fixed-round").css("display","block");
					break;
				case "170" :
					$("#stepSix").addClass("on");
					$("#stepSix").find("p:eq(0)").addClass("color");
					$(".btn-fixed-round").css("display","block");
					break;
				default :
					$(".btn-fixed-round").css("display","none");
					break;
		    }
		}
		
</script></head>

<body class="body">
<!-- Google Tag Manager (noscript) -->
<!-- For Analysis Container -->
<noscript>
<iframe src="//www.googletagmanager.com/ns.html?id=GTM-NKC9BFM"
height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>

<!-- For Campaign Container -->
<noscript>
<iframe src="//www.googletagmanager.com/ns.html?id=GTM-M82SBBJ"
height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->
<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData" value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">
		
<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
<!-- e : gnb 영역 -->			
					<!-- s : LNB 영역 -->
					<!-- e : LNB 영역 -->
				<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
				
		<!-- s : 본문영역 -->			
		<script type="text/javascript">
</script>
<nav class="lnb my" id="lnb">
	<div class="inr">
		<div class="myCate">
			<ul class="menu">
				<li class="open">
					<a class="bt " href="myPage.do" data-url="myPage.do" data-content="951865"><b class="t">내 활동</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="myPetList.do" data-url="myPetList.do" data-content="951865"><b class="t">마이펫 관리</b></a></li>
						<li class=""><a class="bt" href="myWishTv.do" data-url="myWishTv.do" data-content="951865"><b class="t">마이 찜리스트</b></a></li>
						<li class=""><a class="bt" href="myRecentTv.do" data-url="myRecentTv.do" data-content="951865"><b class="t">최근 본 영상</b></a></li>
						<li class=""><a class="bt" href="myRecentShop.do" data-url="myRecentShop.do" data-content="951865" ><b class="t">최근 본 상품</b></a></li>
					</ul>
				</li>
				<li class="open">
					<a class="bt " href="javascript:;"><b class="t">나의 쇼핑정보</b></a>
					<ul class="sm">
						<li class="active"><a class="bt" href="orderList.do" data-url="orderList.do" data-content="951865"><b class="t">주문/배송</b></a></li>
						<li class=""><a class="bt" href="/mypage/order/indexClaimList" data-url="/mypage/order/indexClaimList" data-content="951865"><b class="t">취소/반품/교환</b></a></li>
						<li class=""><a class="bt" href="myAlarmList.do" data-url="myAlarmList.do" data-content="951865"><b class="t">재입고 알림</b></a></li>
						<li class=""><a class="bt" href="myCouponList.do"  data-url="myCouponList.do" data-content="951865"><b class="t">내 쿠폰</b></a></li>
						<li class=""><a class="bt" href="/customer/inquiry/inquiryView" data-url="/customer/inquiry/inquiryView" data-content="951865"><b class="t">1:1 문의</b></a></li>
						<li class=""><a class="bt" href="/mypage/goodsCommentList" data-url="/mypage/goodsCommentList" data-content="951865"><b class="t">상품 후기</b></a></li>
						<li class=""><a class="bt" href="/mypage/service/indexAddressList" data-url="/mypage/service/indexAddressList" data-content="951865"><b class="t">배송지 관리</b></a></li>
						<li class=""><a class="bt" href="/mypage/order/indexBillingCardList" data-url="/mypage/order/indexBillingCardList" data-content="951865"><b class="t">결제 카드 관리</b></a></li>
					</ul>
				</li>
				<li class="open">
					<a class="bt " href="javascript:;"><b class="t">내 정보 관리</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="pswdUpdate.jsp" data-url="pswdUpdate.jsp" data-content="951865"><b class="t">비밀번호 설정</b></a></li>
						<li class=""><a class="bt" href="manageCheck.jsp"><b class="t" data-url="manageCheck.jsp" data-content="951865">회원정보 수정</b></a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav><script type="text/javascript">
	$(document).ready(function(){
		$("li[id^=liTag_]").one('click', function(){
			$(this).addClass("active");
	    });
		
	});
</script>

<main class="container lnb page shop order my" id="container">

	<form id="claim_request_list_form">
		<input type="hidden" id="delivery_detail_ord_no" name="ordNo" value="">
		<input type="hidden" id="delivery_detail_ord_dtl_seq" name="ordDtlSeq" value="">
		<input type="hidden" id="clm_tp_cd" name="clmTpCd" value="">
		<input type="hidden" id="clm_rsn_cd" name="clmRsnCd" value="">
		<input type="hidden" id="mngb" name="mngb" value="OD">
	</form>

		<div class="inr" style="min-height: 467px;">
			<!-- 본문 -->
			<div class="contents" id="contents" style="min-height: 639px;">
				<!-- PC 타이틀 모바일에서 제거  -->
				<div class="pc-tit">
					<h2>주문 상세</h2>
				</div>
				<!-- // PC 타이틀 모바일에서 제거  -->
				<!-- 주문 배송 -->

				<div class="delivery-oder-area">
				<div class="inr-box border-on">
					<div class="item-list">
						<div class="top">
							<div class="tit">
								<p class="data"><fmt:formatDate value="${ odto.ord_date }" pattern="yyyy.MM.dd"/></p>
								<span class="icon-left-gap">주문번호 ${ odto.ord_code }</span>
							</div>
							<a href="javascript:void(0);" class="btn sm ord-del-btn" data-content="${ odto.ord_code }" data-url="/mypage/order/orderDelete" onclick="orderDeliveryListBtn.goOrderDelete('${ odto.ord_code }');return false;">
							<c:choose>
								<c:when test="${ (odto.ord_status eq '결제완료') or (odto.ord_status eq '배송준비중') }">전체주문취소</c:when>
								<c:otherwise>주문내역삭제</c:otherwise>
							</c:choose>
							</a>
							</div>
					<!-- </div> -->
					<!-- 파랑 t3   결제완료 배송중 배송준비중   -->
					<!-- 빨강 t4  입금대기 반품신청  반품진행중  교환신청 교환진행중 -->
					<!-- 검정   구매확정 배송완료 반품완료 CLM_DTL_STAT 260 반품거부 250 교환완료 450 교환거부 350  -->
					<!-- 회색 t2 주문취소 110 120 -->
					<!-- <div class="item-list"> -->
							<div class="bottom">
								<div class="t-box">
									<p class="tit ">${ odto.ord_status }</p>
									<p class="icon-t icon-t">
										${ odto.dt_type }배송</p>
								</div>

								<div class="g-box">
								<p class="lt">
										<c:if test="${ (odto.ord_status ne '배송완료') and (odto.ord_status ne '구매확정') }">
											<c:choose>
												<c:when test="${ odto.dt_type eq '당일' }"><fmt:formatDate value="${ odto.ord_date }" pattern="MM월 dd일(E)"/> 도착 예정</c:when>
												<c:when test="${ odto.dt_type eq '새벽' }"><fmt:formatDate value="${ odto.ord_date }" pattern="MM월 dd일(E)"/> 도착 예정</c:when>
												<c:when test="${ odto.dt_type eq '택배' }">배송 평균 1~2일 소요 예정</c:when>
												<c:when test="${ odto.dt_type eq '업체' }">배송 평균 2~7일 소요 예정</c:when>
											</c:choose>
										</c:if>
										<c:if test="${ (odto.ord_status eq '배송완료') or (odto.ord_status eq '구매확정') }"><fmt:formatDate value="${ odto.d_time }" pattern="MM월 dd일(E)"/> 배송 완료</c:if>
								</p>
										</div>
								
								
							<c:forEach items="${ oilist }" var="oitem">
								<div class="float-bx">
										<div class="untcart"><!-- .disabled -->
											<div class="box">
												<div class="tops">
													<div class="pic">
														<a href="javascript:void(0);" data-content="${ oitem.ord_code }" data-url="/mypage/order/indexDeliveryDetail?ordNo=${ oitem.ord_code }" onclick="orderDeliveryListBtn.goOrderDetail('${ oitem.ord_code }');return false;">
														<img src="${ oitem.item_img }" alt="${ oitem.item_name }" class="img">
														</a>
													</div>
													<div class="name">
														<div class="tit k0421">
															<a href="javascript:void(0);" data-content="${ oitem.ord_code }" data-url="/mypage/order/indexDeliveryDetail?ordNo=${ oitem.ord_code }" onclick="orderDeliveryListBtn.goOrderDetail('${ oitem.ord_code }');return false;">${ oitem.item_name }</a>
														</div>
														<div class="stt">
															${ oitem.odd_cnt }개 <c:if test="${ oitem.opt_name ne null }">/ ${ oitem.opt_name }</c:if>
															</div>
														<div class="prcs">
															<span class="prc"><em class="p"><fmt:formatNumber value="${ oitem.item_price }"/></em><i class="w">원</i></span>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="btn-bx pc-t2">
										
										<c:choose>
											<c:when test="${ (odto.ord_status eq '결제완료') or (odto.ord_status eq '배송준비중') }">
													<div class="btnSet">
															<a href="/customer/inquiry/inquiryView?popupChk=popOpen" data-content="${ oitem.ord_code }" data-url="/customer/inquiry/inquiryView" class="btn c cs-btn">고객센터 문의</a>
													</div>
													<div class="btnSet">
															<a href="javascript:void(0);" data-content="${ oitem.ord_code }" data-url="/mypage/service/popupGoodsCommentReg" onclick="orderDeliveryListBtn.openGoodsComment('${ oitem.item_code }','${ oitem.ord_code }','1', '', '');return false;" class="btn c completeBtn">주문취소</a>
														</div>
											</c:when>
											<c:when test="${ odto.ord_status eq '주문취소' }">
													<div class="btnSet">
														<a href="javascript:void(0);" data-content="${ odto.ord_code }" data-url="/mypage/order/indexClaimDetail?clmNo=${ odto.ord_code }" 
															onclick="orderDeliveryListBtn.goOrderClaimDetail('${ odto.ord_code }','10' )" 
															class="btn c">
															취소 상세
														</a>
													</div>
											</c:when>
											<c:when test="${ odto.ord_status eq '상품교환' }">
													<div class="btnSet">
														<a href="javascript:void(0);" data-content="${ odto.ord_code }" data-url="/mypage/order/indexClaimDetail?clmNo=${ odto.ord_code }" 
															onclick="orderDeliveryListBtn.goOrderClaimDetail('${ odto.ord_code }','10' )" 
															class="btn c">
															교환 상세
														</a>
													</div>
											</c:when>
											<c:when test="${ odto.ord_status eq '상품반품' }">
													<div class="btnSet">
														<a href="javascript:void(0);" data-content="${ odto.ord_code }" data-url="/mypage/order/indexClaimDetail?clmNo=${ odto.ord_code }" 
															onclick="orderDeliveryListBtn.goOrderClaimDetail('${ odto.ord_code }','10' )" 
															class="btn c">
															반품 상세
														</a>
													</div>
											</c:when>
											<c:when test="${ (odto.ord_status eq '배송중') or (odto.ord_status eq '배송완료') }">
												<div class="btnSet">
													<a href="javascript:void(0);" onclick="cartGoods.insertCart('${ oitem.item_code }', '367898', '','','','N');" data-content="${ oitem.item_code }" data-url="https://aboutpet.co.kr/order/indexCartList/" class="btn c add-cart-btn">장바구니 담기</a>
														<a href="/customer/inquiry/inquiryView?popupChk=popOpen" data-content="${ oitem.ord_code }" data-url="/customer/inquiry/inquiryView" class="btn c cs-btn">고객센터 문의</a>
												</div>
												<div class="btnSet">
														<a href="javascript:void(0);" data-content="${ oitem.ord_code }" data-url="/mypage/service/popupGoodsCommentReg" onclick="orderDeliveryListBtn.openGoodsComment('${ oitem.item_code }','${ oitem.ord_code }','1', '', '');return false;" class="btn c completeBtn">구매확정</a>
															</div>
										</c:when>
											<c:when test="${ odto.ord_status eq '구매확정' }">
												<div class="btnSet">
													<a href="javascript:void(0);" onclick="cartGoods.insertCart('${ oitem.item_code }', '367898', '','','','N');" data-content="${ oitem.item_code }" data-url="https://aboutpet.co.kr/order/indexCartList/" class="btn c add-cart-btn">장바구니 담기</a>
														<a href="/customer/inquiry/inquiryView?popupChk=popOpen" data-content="${ oitem.ord_code }" data-url="/customer/inquiry/inquiryView" class="btn c cs-btn">고객센터 문의</a>
												</div>
												<div class="btnSet">
														<a href="javascript:void(0);" data-content="${ oitem.ord_code }" data-url="/mypage/service/popupGoodsCommentReg" onclick="orderDeliveryListBtn.openGoodsComment('${ oitem.item_code }','${ oitem.ord_code }','1', '', '');return false;" class="btn c completeBtn">후기작성</a>
															</div>
										</c:when>
										
										</c:choose>
										
										</div>
										
									</div>
								</c:forEach>
								
								
									</div>
						<!-- </div> -->
						</div>
					</div>
					
					<div class="ordersets pc-cut">
						<section class="sect addr">
							<div class="hdts"><span class="tit">배송지</span></div>
							<div class="cdts">
								<div class="adrset">
									<div class="name">
										<em class="t g">${ adto.adr_name }</em>
									</div>
									<div class="adrs">
										${ adto.adr_detail }</div>
									<div class="tels">${ adto.recipient }/ ${ adto.contact }</div>
								</div>
								<div class="adrreq">
								<!-- 배송요청사항 노출을 위해 주석 -->
								<div class="pwf">
										<em class="t">
											${ adto.dr_loc }</em>
										<em class="p">
											공동현관 비밀번호 입력&nbsp; 
											${ adto.dr_enter }</em>
										<div class="txt custom_ellipsis_dlvr">${ adto.requests }</div>
									</div>
								</div>
							</div>
						</section>
						<section class="sect bprc">
							<div class="hdts"><span class="tit">결제 정보</span></div>
							<div class="cdts">
								<ul class="prcset">

								<li>
										<div class="dt">상품금액</div>
										<div class="dd">
											<span class="prc"><em class="p"><fmt:formatNumber value="${ pdto.pm_price - fee }"/></em><i class="w">원</i></span>
										</div>
									</li>
									<li>
										<div class="dt">배송비</div>
										<div class="dd">
											<span class="prc"><em class="p"><fmt:formatNumber value="${ fee }"/></em><i class="w">원</i></span>
										</div>
									</li>
								</ul>

							<div class="tot">
									<div class="dt">최종 결제금액</div>
									<div class="dd">
										<span class="prc"><em class="p"><fmt:formatNumber value="${ pdto.pm_price }"/></em><i class="w">원</i></span>
									</div>
								</div>
							</div>
						</section>
						
						<section class="sect binf">
							<div class="hdts"><span class="tit">결제 수단</span></div>
							<div class="cdts">
								<div class="result">
									<div class="hd">
										<em class="b">${ pdto.pd_method }</em>
										<c:if test="${ pdto.pd_method eq '카드' }"><a href="#" data-content="C202106190038509" data-url="/mypage/order/popupCreditCardByOrderNo" onclick="orderDeliveryDetailBtn.openCreditCard('petsbepe3m01012106190326573610');return false;" class="btn sm">카드영수증</a></c:if>
										</div>
									<div class="dd">
										<c:if test="${ pdto.pd_method eq '카드' }">체크카드 (1234-****-****-5678) / 일시불</c:if>
									</div>
									</div>
							</div>
						</section>
						
						<section class="sect bprc">
							<div class="hdts"><span class="tit">포인트 적립/혜택</span></div>
							<div class="cdts">
								<ul class="prcset">
									<li>
										<div class="dt">구매 적립
											<span class="alert_pop" data-pop="popCpnGud">
												<span class="bubble_txtBox" style="width:267px;">
													<span class="tit">구매 적립</span>
													<span class="info-txt">
														<span>
															<span>
																결제 금액 기준 총 적립 포인트입니다.
															</span>
															<span>
																포인트는 구매확정 시 지급됩니다.
															</span>
															<span>
																적립 포인트 산정 시 쿠폰 할인 금액, 배송비, 취소/반품 상품 금액은 제외됩니다.
															</span>
														</span>
													</span>
												</span>
											</span>
										</div>
										<div class="dd">
											<span class="prc">
												<em class="p">
													${ point }</em>
												<i class="w">P</i>
											</span>
										</div>
									</li>
								</ul>
							</div>
							</section>
							<div class="my_btnWrap t2">
								<div class="btnSet">
									<a href="orderList.do" data-content="" data-url="orderList.do" class="btn lg d">주문/배송 목록</a>
									<a href="shop_home.do" class="btn lg b">계속 쇼핑하기</a>
								</div>
							</div>
						
					</div>
				</div>
				<!-- // 주문 배송 -->

			</div>
			
		</div>
	</main>


		<div class="layers" id="emptyLayers">
			<!-- 레이어팝업 넣을 자리 -->
		</div>
		
		<form id="claim_request_list_form"> 
			<input type="hidden" id="delivery_list_ord_no" name="ordNo" value="" /> 
			<input type="hidden" id="delivery_list_ord_dtl_seq" name="ordDtlSeq" value="" /> 
			<input type="hidden" id="clmTpCd" name="clmTpCd" value=""/>
			<input type="hidden" id="checkCode" name="checkCode" value="" />
			<input type="hidden" id="clmRsnCd" name="clmRsnCd" value="" />
			<input type="hidden" id="mngb" name="mngb" value="OL" />
		</form><!-- location 영역 포함  -->			
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
					<a href="#" onclick="location.href='https://aboutpet.co.kr/tv/home/'" class="bt"><span>TV</span></a>
				</li>
				<li id="liTag_30" class="log ">
					<a href="#" onclick="location.href='https://aboutpet.co.kr/log/home/'" class="bt"><span>로그</span></a>
				</li>
				<li id="liTag_10" class="shop ">
					<a href="#" onclick="location.href='https://aboutpet.co.kr/shop/home/'" class="bt"><span>샵</span></a>
				</li>
				<li id="liTag_00" class="my active">
					<a href="#" onclick="location.href='https://aboutpet.co.kr/mypage/indexMyPage/'" class="bt"><span>MY</span></a>
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
	function convertVerBtn(gb){
		if(gb == 'MO'){
			$.cookie("DEVICE_GB", "MO",  {path: '/'});
	 		window.location.reload();
		}else{
			$.cookie("DEVICE_GB", "PC",{path: '/'});
	 		window.location.reload();
		}		
	}
</script>

<!-- footer -->	
<footer class="footer" id="footer">
	<div class="inr">
		<div class="link">
			<ul class="list">
				<li><a href="#" onclick ="openTerms('2001' , 'Y'); return false;">서비스 이용약관</a></li>
				<li><a href="#" onclick ="openTerms('2002' , 'Y'); return false;">개인정보 처리방침</a></li>
				<li><a href="#" onclick ="openPartnershipInquiry()">입점/제휴 문의</a></li>
				<!-- 무조건 모바일웹으로 들어간 1경우에만 나타나게 만들기 -->
				</div>
		<div class="info">
			<ul class="list">
				<li>(주)어바웃펫 대표 : 김경환, 나옥귀</li>
				<li>사업자 등록번호 : 120-87-90035</li>
				<li class="dn">통신판매업신고번호 : 제 2020-서울강남-03142호</li>
				<li>개인정보관리자 : 정명성  hello@aboutpet.co.kr</li>
				<li>TEL : 1644-9601</li>
			</ul>
			<p class="adr">서울특별시 강남구 테헤란로 151 (역삼하이츠빌딩) 지하2층</p>
		</div>
		<div class="copy">&copy; copyright (c) www.aboutpet.co.kr all rights reserved.</div>
	</div>
</footer>
<!--// footer -->

<div id ="layers">
</div><!-- e : footer 영역 -->
	</div>
</body>
</html>