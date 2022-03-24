<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>aboutPet</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
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
<meta property="og:image:url" content="/_images/common/aboutpet_logo@2x.png" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="300" />
<meta property="og:image:height" content="300" />

<link href="/_images/common/favicon.ico" rel="shrtcut icon">
<link href="/_images/common/favicon.png" rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css">

<script async src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript" 	src="/_script/googleAnalytics.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', "G-NR86F31079");
</script>

<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery-3.3.1.min.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.ui.datepicker-ko.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.blockUI.js" charset="utf-8"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.number.min.js" charset="utf-8"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.form.min.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.countdown.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.cookie.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/swiper.min.js"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/clipboard.min.js"></script>
<script type="text/javascript"  src="../js/common.js" ></script>
<script type="text/javascript"  src="/_script/popup.js" ></script>
<script type="text/javascript" 	src="../js/ui.js"></script>
<script type="text/javascript" 	src="/_script/deviceChk.js"></script>	<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&libraries=services"></script>
<script type="text/javascript" 	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/kakao-map.js"></script>
<!-- app interface --> 
<script type="text/javascript" 	src="/_script/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" 	src="/_script/adbrix.js"></script>
<script type="text/javascript" 	src="/_script/ui.mo.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&submodules=geocoder"></script>
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
<!--라이브 앱과 연동을위한 JS -->
<script src="https://sgr.aboutpet.co.kr/web/runInit/v1.js"></script>
<script type="text/javascript">
	//검색API 클릭 이벤트(사용자 액션 로그 수집)
	function userActionLog(contId, action, url, targetUrl){	
		var mbrNo = "0";
		if (mbrNo != "0") {
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
		}
	}
</script><script type="text/javascript" 	src="/_script/file.js"></script>
		<script type="text/javascript">
			userActionLog('PI000005494', 'view', document.referrer);
			var timeDealArr = new Array();
			$(function(){
				// 최근 본 상품 ajax로 변경
				
					getRecentGoodsList();
				
				/**
				 * 상품상세 모바일 헤더 html 변경
				 */
				$("#header_pc").addClass('noneAc');
				
					//대표 이미지
					var imgPath = 'https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/20/12/51/2504480/2504480_detail_080.jpg?type=f&w=500&h=500&quality=90&align=4';
					$('#header_pc .mo-heade-tit img').attr('src',imgPath );
					
					$(".mo-header-backNtn").attr("onclick", "fncGoBack();");
				
						timeDealArr.push('388226_20_SOON');
					

				fnDealTime();
				
			});
			
			function fncGoBack(){
				if("" != ""){
					//App & 펫TV 영상상세 화면에서 호출일때만 callParam값이 있다.
					var callParam = "";
					var params = callParam.split(".");
					var url = "";
					if(params.length == 3){
						url = "https://aboutpet.co.kr/tv/series/indexTvDetail?vdId="+params[0]+"&sortCd=&listGb="+params[1]+"-"+params[2];
					}else{
						url = "https://aboutpet.co.kr/tv/series/indexTvDetail?vdId="+params[0]+"&sortCd="+params[1]+"&listGb="+params[2]+"-"+params[3];
					}
					
					// 데이터 세팅
					toNativeData.func = "onNewPage";
					toNativeData.type = "TV";
					toNativeData.url = url;
					// 호출
					toNative(toNativeData);
				}
				
				if("goodsId=PI000005494".indexOf('home=shop') > -1){
					storageHist.goBack('/shop/home/');
				}else{
					storageHist.goBack();
				}
			}
			
			function fnDealTime() {
				
				for(var i in timeDealArr) {
					var goodsPrcNo = timeDealArr[i].split('_')[0];
					var goodsAmtTpCd = timeDealArr[i].split('_')[1];
					var dealType = timeDealArr[i].split('_')[2];
					var dre = $("#goodsPrcNo_"+goodsPrcNo).val();
					var timeDeal = new Date(dre.replace(/\s/, 'T'));
					
					var curTime = "2021-07-21 01:14:07";
					var serverTime = new Date(curTime.replace(/\s/, 'T'));
					var now = new Date();
					var dateGap = serverTime.getTime() - now.getTime();
					var realTime = timeDeal - dateGap;

					
					$("#time_"+goodsPrcNo).countdown(realTime, function(event) {
						
						var resultTime = ( event.strftime('%D') != 0 ? event.strftime('%D') + '일  ' : '' ) + event.strftime('%H:%M:%S');
						
						if(goodsAmtTpCd == '20' && dealType == 'NOW') {
							document.getElementById("time_"+goodsPrcNo).innerHTML = '<em class="tt">타임딜</em> <em class="tm">⌛️ '+ resultTime + ' 남음</em>';
						} else if(goodsAmtTpCd == '20' && dealType == 'SOON' ) {
							document.getElementById("time_"+goodsPrcNo).innerHTML = '<em class="tt">타임딜 예정</em> <em class="tm">'+ resultTime + ' 남음</em>';
						}
					}).on('finish.countdown', function () {
						if(goodsAmtTpCd == '20' && dealType == 'NOW') {
							ui.alert('해당 상품 타임딜 시간이 마감되었어요',{
							    ycb:function(){
							    	location.href="/shop/home";
							    },
							    ybt:"확인"
							});
						}
				    });
				}
			}
			
			// 배송 시간 카운트
			function deliveryTime(targetId, targetTime){
				
				var curTime = "2021-07-21 01:14:07";
				var serverTime = new Date(curTime.replace(/\s/, 'T'));
				var now = new Date();
				var dateGap = serverTime.getTime() - now.getTime();
				var realTime = targetTime - dateGap;
				
				$("[name='"+targetId+"Hour']").countdown(realTime, function(event) {
					$("[name='"+targetId+"Hour']").text(event.strftime('%H'));
					$("[name='"+targetId+"Min']").text(event.strftime('%M'));
	            });   
			}

			/**
			 * 숫자 세자리 ,
			 */
			/* function numberWithCommas(num) {
				return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			} */
			
			// 금액 콤마 처리.
			function numberWithCommas(x) {
				x = String(x);
				var pattern = /(-?\d+)(\d{3})/;
				while (pattern.test(x))
					x = x.replace(pattern, "$1,$2");
				return x;
			}
			
			// 콤마 삭제
			function removeComma(str) {
				str = String(str);
				return str.replace(/[^0-9\.]+/g, '');
			}

			/**
			 * 기획전
			 */
			function fnGoExhibit(exhbtGbCd, exhbtNo, dispClsfNo) {
				
				var lnbDispClsfNo = dispClsfNo;
				
					
				if('12564' == dispClsfNo ) { // 강아지
					lnbDispClsfNo = '300000173'
				} else if('12565' == dispClsfNo ) { // 고양이
					lnbDispClsfNo = '300000174'
				} else if('14111' == dispClsfNo ) { // 관상어
					lnbDispClsfNo = '300000175'
				} else if('14196' == dispClsfNo ) { // 소동물
					lnbDispClsfNo = '300000176'
				}
				
				if(exhbtGbCd == '10') {
					// 특별 기획전
					location.href='/event/indexSpecialExhibitionZone?exhbtNo='+exhbtNo+'&dispClsfNo='+lnbDispClsfNo;
				} else {
					location.href='/event/indexExhibitionDetail?exhbtNo='+exhbtNo+'&dispClsfNo='+lnbDispClsfNo;
				}
			}

			/**
			 * 공유하기 버튼
			 */
			function fnShare() {
				var goodsId = 'PI000005494';

				$.ajax({
					type: "POST",
					url: "/goods/getGoodsShortUrl",
					data : {goodsId : goodsId},
					dataType: "json",
					success: function (shortUrl) {
						//app인 경우
						var deviceGb = "PC";
						var shareImg = 'https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/20/12/51/2504480/2504480_detail_080.jpg?type=f&w=500&h=500&quality=90&align=4';

						// APP인경우
						if("PC" == "APP"){
							// 데이터 세팅
							toNativeData.func = "onShare";
							toNativeData.image = "";
							toNativeData.subject = "포켄스 뉴트리션 트릿 피부&피모 480g";
							toNativeData.link = shortUrl;
							// 호출
							toNative(toNativeData);
						}else{
							//web인 경우
							copyToClipboard(shortUrl);
						}
						userActionLog(goodsId, 'share');
					},
					error: function (request, status, error) {
						ui.alert("공유하기 실패하였습니다.");
					}
				});
			}

			/**
			 * 초대코드 복사
			 * @param val
			 */
			function copyToClipboard(val){
				var textarea = document.createElement("textarea");
				document.body.appendChild(textarea);
				textarea.value = val;
				textarea.select();
				document.execCommand('copy');
				document.body.removeChild(textarea);

				// messager.toast({txt: "추천코드가 복사되었습니다."});
				fnGoodsUiToast("링크가 복사되었어요", "share");
			}

			/**
			 * toast
			 * @param text
			 * @param cls
			 */
			function fnGoodsUiToast(text, cls){
				console.log("fnGoodsUiToast text : " + text);
				ui.toast(text,{
					cls : cls ,
					bot: 74, //바닥에서 띄울 간격
					sec:  3000 //사라지는 시간
				});
			}

			
			function fnSetUiShopPdPicGalleryTop(){
				ui.shop.pdPic.galleryTop = new Swiper(".pdDtPicSld .swiper-container", {
					observer: true,
					observeParents: true,
					watchOverflow:true,
					simulateTouch:false,
					spaceBetween:20,
					zoom:{
						maxRatio: 5
					},
					navigation: {
						nextEl: '.pdDtPicSld .sld-nav .bt.next',
						prevEl: '.pdDtPicSld .sld-nav .bt.prev',
					}
				});
			}
			
			function  fnSetUiShopPdPicGalleryThumbs(){
				ui.shop.pdPic.galleryThumbs = new Swiper(".pdDtThmSld .swiper-container", {
					observer: true,
					observeParents: true,
					// watchOverflow:true,
					spaceBetween: 10,
					//slidesPerView: "auto",
					slidesPerView: 7,
					//slidesPerGroup:1,
					// freeMode: true,
					navigation: {
						nextEl: '.pdDtThmSld .sld-nav .bt.next',
						prevEl: '.pdDtThmSld .sld-nav .bt.prev',
					}
				});
				
			}
			
			//상품 상세 이미지 팝업
			function detailGoodsImgPop(clickImg){
				var options = {
					url : "/goods/includeGoodsCommentImgPop"
					, type : "POST"
					, dataType : "html"
					, data : {
							
					}
					, done : function(result){
						$("#goodsLayers").empty();
		 				$("#goodsLayers").html(result);
		 				
		 				var bigImgHtml = '';
						var thumbImgHtml = '';

						if("PC" != "PC"){
							fnSetUiShopPdPicGalleryTop();
							//fnSetUiShopPdPicGalleryThumbs();
						}else{
							fnSetUiShopPdPicGalleryTop();
							fnSetUiShopPdPicGalleryThumbs();
						}

						
							var img = "/goods/petsbe/20/12/51/2504480/2504480_detail_080.jpg";
							if(img != null && img.indexOf('cdn.ntruss.com') == -1){
								img = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ img +"?type=f&w=500&h=500&quality=90&align=4";
							}
						
							bigImgHtml += '<li class="swiper-slide">';
							bigImgHtml += '<div class="box swiper-zoom-container"><span class="pic"><img class="img" src="' + img + '" alt=""></span></div>';
							bigImgHtml += '</li>';
							
							thumbImgHtml += '<li class="swiper-slide">';
							thumbImgHtml += '<a href="javascript:" class="box"><span class="pic"><img class="img" src="'+ img + '" ></span></a>';
							thumbImgHtml += '</li>';
						

						var initSwipeGalleryTop = false;
						if($("#popPdImgView").prop("style")["cssText"] == ""){
							initSwipeGalleryTop = true;
						}
						
						ui.popLayer.open("popPdImgView");
						
						$("#bigImgArea").html(bigImgHtml);
						$("#thumbImgArea").html(thumbImgHtml);
						$("#pdPopFlag").val("PD");
						$("#imgViewTitle").text("상품 이미지 보기");
					
						var selectIndex = $(clickImg).parents('ul[name=detailImg]').find('img').index(clickImg);
						
						//ui.shop.pdPic.evt();
						$(document).on("click",".pdDtThmSld .slide>li .box",function(){
							var my_idx = $(this).closest("li").index();
							$(this).closest("li").addClass("active").siblings("li").removeClass("active");
							ui.shop.pdPic.galleryTop.slideTo(my_idx);
						});
						
						ui.shop.pdPic.galleryTop.on('slideChangeTransitionEnd', function(swiper) {
							// this.galleryThumbs.slideTo(2);
							var idx = this.realIndex + 1 ;
							$(".pdDtThmSld .slide>li:nth-child("+ idx +")").addClass("active").siblings("li").removeClass("active");
							ui.shop.pdPic.galleryThumbs.slideTo(this.realIndex-3 < 0 ? 0 : this.realIndex-3);
						});
						
						if("PC" != "PC"){
							$(".pdDtThmSld .slide>li .box").eq(selectIndex).click();
						}else{
							if(initSwipeGalleryTop && selectIndex == 0){
								$(".pdDtThmSld .slide>li").eq(selectIndex).addClass("active");
							}else{
								$(".pdDtThmSld .slide>li .box").eq(selectIndex).click();
							}
						}
						//ui.shop.pdPic.galleryTop.slideTo(selectIndex);
					}
				};
				ajax.call(options);
			}
			
			function fnClosePopPdImgView(){
				var flag = $("#pdPopFlag").val();
				if(flag == "PD"){
					var activeImgIndex = $("#bigImgArea>li.swiper-slide-active").index();
					$(".pdThumbSlide .slide>li .box").eq(activeImgIndex).click();
					ui.popLayer.close('popPdImgView');
				}
			}

			function openPopupCoupon() {
				var goodsId = 'PI000005494';
				var goodsCstrtTpCd = 'ITEM';
				//쿠폰 목록 조회
				var fnGetCoupons = function(goodsId, goodsCstrtTpCd) {
					//다른 팝업 레이어 닫기
					ui.popBot.close('popDelInfo');   //배송정보 레이어 닫기
					ui.popBot.close('popGiftsInfo');   //사은품 레이어 닫기
					ui.popLayer.close('popRvPicView');   //상품 상세 이미지 팝업
					//쿠폰 팝업 열기
					ui.popLayer.open('popCpnGet');
				}
				fnGetCoupons();
			}
			
			//최근 본 상품 
			function getRecentGoodsList(){
				var options = {
					url : "/goods/listGoodsRecomdDetail"
					, type : "POST"
					, dataType : "html"
					, data : {
							rows : "7"
							,goodsId : 'PI000005494'
							,goodsNm : "포켄스 뉴트리션 트릿 피부&피모 480g"
							,saleAmt : "28000"
							,orgSaleAmt : "36000"
							,dlgtImgPath : "/goods/petsbe/20/12/51/2504480/2504480_detail_080.jpg"
							,dlgtImgSeq : "1"
					}
					, done : function(result){
						$("#recentGoodsList").empty();
		 				$("#recentGoodsList").html(result);
		 				ui.shop.recent.using();
					}
				};
				ajax.call(options);
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
		
		<!-- s : header 영역 -->
					<script type="text/javascript">
	//개발자도구에서의 console.[log, debug] control	
	logger("prd");
	
	$(document).ready(function(){
		
		if("DEVICE_TYPE" != "DEVICE_TYPE"){
			if("PC" == "MO"){
				$("meta[name=viewport]").attr("content","width=device-width, initial-scale=1, maximum-scale=4, user-scalable=yes");
			}else if("PC" == "PC"){
 				$("meta[name=viewport]").attr("content","width=device-width, initial-scale=0, maximum-scale=6, user-scalable=yes");
 			}
		}

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
		if("" != "Y" && "0" > 0 && "" == ""){
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
			$.cookie("searchLastFocus", "10", {path:'/'});
			location.href = "/commonSearch?focus=10"+((searchWord.trim() == "")? "":"&srchWord="+encodeURIComponent(searchWord.trim()))+"&cateCdL="+srchShopDispClsfNo;
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
			mbrNo = "113DFCD5FF5B6FF746F0A6722D67B2F2";
			if("" != "0"){
				mbrNo = "0";
			}
			
			// 요청구분
			section = "10";
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
		var url = "/goods/indexGoodsDetail";
		if("/goods/indexGoodsDetail" == "/event/indexSpecialExhibitionZone"){
			url = "/shop/home";
		}
		
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lnbDispClsfNo');
		hiddenField.setAttribute('value', lnbDispClsfNo);
		form.appendChild(hiddenField);
		
		if("/goods/indexGoodsDetail" == "/shop/indexCategory"||
			"/goods/indexGoodsDetail" == "/event/indexExhibitionZone") {
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "cateCdL");
			hiddenField.setAttribute("value", cateCdL);	// 12564
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/goods/indexGoodsDetail" == "/shop/indexNewCategory" ||
				 "/goods/indexGoodsDetail" == "/shop/indexBestGoodsList") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/goods/indexGoodsDetail" == "/pet/event/petshopEventList" ||
			"/goods/indexGoodsDetail" == "/shop/indexLive" ){				
			form.setAttribute("method", "GET");
		}else if("/goods/indexGoodsDetail" == "/event/shop/main"){
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

<!-- header pc-->
<header class="header pc cu mode0" data-header="set0" id="header_pc">
	<input type="password" style="display:none;"/><!-- 크롬 패스워드 자동완성 방지 -->
	<div class="hdr">
		<div class="inr">
			<div class="tdt">
				<ul class="menu">					
					<li><a href="/join/indexTerms?header=Y" class="bt">회원가입</a></li>
		                <li><a href="javascript:clickLogin();" class="bt">로그인</a></li>
		                <!-- <li><a href="javascript:;" class="bt">로그인/회원가입</a></li> -->
					<li><a href="javascript:goEvent();" class="bt">이벤트</a></li>
						<li class="custo">
							<a href="javascript:;" class="bt">고객센터</a>
							<div class="sbm">
								<ul class="sm">
									<li><a href="/customer/faq/faqList" class="bt">FAQ</a></li>
									<li><a href="/customer/inquiry/inquiryView" class="bt">1:1문의</a></li>
									<li><a href="/customer/notice/indexNoticeList" data-url="/customer/notice/indexNoticeList" data-content="" class="bt">공지사항</a></li>
								</ul>
							</div>
						</li>
					</ul>
			</div>
			<div class="hdt">
				<!-- mobile -->
				<button class="mo-header-btnType02">취소</button><!-- on 클래스 추가 시 활성화 -->
				<!-- // mobile -->
				<button class="btnGnb" type="button">메뉴</button>
<!-- -->
				<h1 class="logo ">
					<a class="bt" href="/shop/home/">AboutPet</a>
				</h1>
				<nav class="menushop">
							<button type="button" class="bt st"></button>
							<div class="list">
								<ul class="menu">
									<li class=""><a class="bt" href="#" onclick="sendDispClsfNo(300000173)"><b class="t" id="b_tag_">강아지</b></a></li>
									<li class=""><a class="bt" href="#" onclick="sendDispClsfNo(300000174)"><b class="t" id="b_tag_">고양이</b></a></li>
									<li class=""><a class="bt" href="#" onclick="sendDispClsfNo(300000175)"><b class="t" id="b_tag_">관상어</b></a></li>
									<li class=""><a class="bt" href="#" onclick="sendDispClsfNo(300000176)"><b class="t" id="b_tag_">소동물</b></a></li>
								</ul>
							</div>
						</nav>
<!-- -->
				<!-- mobile -->
				<button class="mo-header-backNtn" onclick="storageHist.goBack();">뒤로</button>
					<div class="mo-heade-tit"  >
					<div class="pic hide"><img src="" alt=""></div>
						</div>
				<div class="mo-header-rightBtn">
						<button class="mo-header-btnType01">
							<span class="mo-header-icon"></span>
							</button>
					</div>
				<button class="mo-header-close"></button>
				<!-- // mobile -->
				<nav class="tmenu">
					<ul class="list">
				<li id="liTag_20" class=""><a href="/tv/home/" class="bt">펫TV</a></li>
						<li id="liTag_30" class=""><a href="/log/home/" class="bt">펫로그</a></li>
						<li id="liTag_10" class="active"><a href="/shop/home/" class="bt">펫샵</a></li>
						<li id="liTag_00" class=""><a href="/mypage/indexMyPage/" class="bt">MY</a></li>
					</ul>
				</nav>
			</div>
			<div class="cdt" >
						<div class="schs">
								<div class="form ">
									<div class="input del kwd"><input id="srchWord" name="srchWord" type="search" value="" autocomplete="off" ></div>
									<button type="button" class="btnSch" data-content="" data-url="/commonSearch">검색</button>
									<!-- 자동완성 드롭박스 -->
									<div class="key-word-list" id="key-word-list" style="display:none;"><ul></ul></div>
									<!-- 자동완성 드롭박스 -->
								</div>
							</div>
						<div class="menu">
							<button id="alertBtn" class="bt alim  " type="button">알림</button>
							<button class="bt cart" type="button" onclick="location.href='/order/indexCartList/'" >
									</button>
							<button id="srchClsBtn" class="bt close" type="button" style="display: none;" onclick="searchCommon.srchClsBtn();">닫기</button>
							<div class="alims" id ="alertDiv">
							</div>
						</div>
						</div>
</div>
	</div>
</header>

		
		<div class="layers">
			<!-- 레이어팝업 넣을 자리 -->
			<!-- 등급안내 팝업 추가 2021.05.13 -->
			<article class="popLayer a popLank " id="popLank">
				<div class="pbd">
					<div class="phd">
						<div class="in">
							<h1 class="tit"></h1>
							<button type="button" class="btnPopClose">닫기</button>
						</div>
					</div>
					<div class="pct">
						<main class="poptents">
							<div class="rankCont">
								<div class="rank_imgBox rank_pc">
											<img src="/_images/common/img-level-pc.png" alt="어바웃펫 패미리 등급별 혜택 이미지">
										</div>
									</div>
						</main>
					</div>
				</div>
			</article>
			<!-- //등급안내 팝업 추가 2021.05.13 -->
		</div>
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
	var options = {
		url : "/tv/series/getSeriesList"
		, type : "POST"
		, dataType : "html"
		, data : { }
		, done : function(result){
			$("#gnbSrisListPopup").empty();
			$("#gnbSrisListPopup").html(result);
			ui.gnb.using("close"); //시리즈 목록 레이어 팝업 실행시 gnb메뉴(전체메뉴) 닫기
			ui.popLayer.open('popSeriesList');
		}
	};
	ajax.call(options);
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
<nav class="gnb" id="gnb">
	<div class="inr">
		<div class="hdt">
			<div class="logo">aboutPet</div>
			<div class="bts"><button class="bt close">메뉴닫기</button></div>
		</div>
		<div class="cdt">
			<div class="menu">
				<ul class="list">
					<li class="tv ">
						<a class="bt" href="javascript:;">펫 TV</a>
						<div class="box">
							<ul class="sm">
								<li><a class="bt" href="/tv/petTvList?dispCornNo=567">신규영상</a></li>
								<li><a class="bt" href="/tv/petTvList?dispCornNo=568">인기영상</a></li>
								<li><a class="bt" href="/tv/petSchool">펫스쿨</a></li>
								<li><a class="bt" href="javascript:seriesOpen();">시리즈목록</a></li>
							</ul>
						</div>
					</li>
					<li class="log ">
						<a class="bt" href="javascript:;">펫로그</a>
						<div class="box">
							<ul class="sm">
								<li><a class="bt" href="javascript:goMyPetLogGnb();">MY 펫로그</a></li>
							</ul>
						</div>
					</li>
					<li class="shop active">
						<a class="bt" href="javascript:;">펫 샵</a>
					<div class="box">
							<div class="cate slideShop">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
									<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12564" href="javascript:;" class="bt">강아지</a></li>
												<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12565" href="javascript:;" class="bt">고양이</a></li>
												<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14111" href="javascript:;" class="bt">관상어</a></li>
												<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14196" href="javascript:;" class="bt">소동물</a></li>
												</ul>
								</div>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12564">
									<ul class="sm">
								<li><a class="bt"  href="javascript:setCateList('12569', '12564');">사료</a></li>
								<li><a class="bt"  href="javascript:setCateList('12571', '12564');">간식</a></li>
								<li><a class="bt"  href="javascript:setCateList('12572', '12564');">건강관리</a></li>
								<li><a class="bt"  href="javascript:setCateList('12573', '12564');">장난감/훈련</a></li>
								<li><a class="bt"  href="javascript:setCateList('12575', '12564');">위생/배변</a></li>
								<li><a class="bt"  href="javascript:setCateList('12576', '12564');">미용/목욕</a></li>
								<li><a class="bt"  href="javascript:setCateList('12577', '12564');">급식/급수기</a></li>
								<li><a class="bt"  href="javascript:setCateList('12578', '12564');">하우스</a></li>
								<li><a class="bt"  href="javascript:setCateList('12579', '12564');">패션/의류</a></li>
								<li><a class="bt"  href="javascript:setCateList('12581', '12564');">목줄/하네스</a></li>
								<li><a class="bt"  href="javascript:setCateList('13998', '12564');">이동장</a></li>
								<li><a class="bt"  href="javascript:setCateList('100000196', '12564');">반려인용품</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12565">
									<ul class="sm">
								<li><a class="bt"  href="javascript:setCateList('12673', '12565');">사료</a></li>
								<li><a class="bt"  href="javascript:setCateList('12675', '12565');">간식</a></li>
								<li><a class="bt"  href="javascript:setCateList('12676', '12565');">모래</a></li>
								<li><a class="bt"  href="javascript:setCateList('12677', '12565');">건강관리</a></li>
								<li><a class="bt"  href="javascript:setCateList('12678', '12565');">장난감/캣닢</a></li>
								<li><a class="bt"  href="javascript:setCateList('12679', '12565');">화장실/위생</a></li>
								<li><a class="bt"  href="javascript:setCateList('12680', '12565');">급식/급수기</a></li>
								<li><a class="bt"  href="javascript:setCateList('12682', '12565');">미용/목욕</a></li>
								<li><a class="bt"  href="javascript:setCateList('12683', '12565');">스크래쳐/캣타워</a></li>
								<li><a class="bt"  href="javascript:setCateList('12684', '12565');">하우스</a></li>
								<li><a class="bt"  href="javascript:setCateList('12685', '12565');">패션/의류</a></li>
								<li><a class="bt"  href="javascript:setCateList('14005', '12565');">이동장</a></li>
								<li><a class="bt"  href="javascript:setCateList('14006', '12565');">목줄/하네스</a></li>
								<li><a class="bt"  href="javascript:setCateList('100000198', '12565');">반려인용품</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14111">
									<ul class="sm">
								<li><a class="bt"  href="javascript:setCateList('14112', '14111');">사료</a></li>
								<li><a class="bt"  href="javascript:setCateList('14114', '14111');">어항</a></li>
								<li><a class="bt"  href="javascript:setCateList('14115', '14111');">모터</a></li>
								<li><a class="bt"  href="javascript:setCateList('14116', '14111');">에어용품</a></li>
								<li><a class="bt"  href="javascript:setCateList('14117', '14111');">여과용품</a></li>
								<li><a class="bt"  href="javascript:setCateList('14118', '14111');">바닥재</a></li>
								<li><a class="bt"  href="javascript:setCateList('14119', '14111');">장식</a></li>
								<li><a class="bt"  href="javascript:setCateList('14120', '14111');">조명</a></li>
								<li><a class="bt"  href="javascript:setCateList('14121', '14111');">컨디셔너</a></li>
								<li><a class="bt"  href="javascript:setCateList('14122', '14111');">히터</a></li>
								<li><a class="bt"  href="javascript:setCateList('14123', '14111');">기타용품</a></li>
								<li><a class="bt"  href="javascript:setCateList('14262', '14111');">수초</a></li>
								<li><a class="bt"  href="javascript:setCateList('100000199', '14111');">해수용품</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14196">
									<ul class="sm">
								<li><a class="bt"  href="javascript:setCateList('14197', '14196');">햄스터/저빌/래트</a></li>
								<li><a class="bt"  href="javascript:setCateList('14198', '14196');">토끼/기니피그/친칠라/데구</a></li>
								<li><a class="bt"  href="javascript:setCateList('14199', '14196');">고슴도치</a></li>
								<li><a class="bt"  href="javascript:setCateList('14200', '14196');">새</a></li>
								<li><a class="bt"  href="javascript:setCateList('14201', '14196');">곤충</a></li>
								<li><a class="bt"  href="javascript:setCateList('14202', '14196');">파충류</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12569">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12571">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12572">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12573">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12575">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12576">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12577">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12578">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12579">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12581">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_13998">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_100000196">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12673">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12675">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12676">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12677">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12678">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12679">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12680">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12682">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12683">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12684">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12685">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14005">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14006">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_100000198">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14112">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14114">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14115">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14116">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14117">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14118">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14119">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14120">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14121">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14122">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14123">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14262">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_100000199">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14197">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14198">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14199">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14200">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14201">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14202">
									<ul class="sm">
								</ul>
							</div>
							<!-- 							<div class="ctset" data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_6"> -->
<!-- 								플레이스 -->
<!-- 							</div> -->
						</div>
					</li>
					<li class="my ">
						<a class="bt" href="javascript:;">MY</a>
						<div class="box">
							<div class="cate slideShop">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
										<li class="swiper-slide active"><a data-ui-tab-btn="tab_my_cate" data-ui-tab-val="tab_my_cate_1" href="javascript:;" class="bt">내 활동</a></li>
										<li class="swiper-slide"><a data-ui-tab-btn="tab_my_cate" data-ui-tab-val="tab_my_cate_2" href="javascript:;" class="bt">내 쇼핑정보</a></li>
										<li class="swiper-slide"><a data-ui-tab-btn="tab_my_cate" data-ui-tab-val="tab_my_cate_3" href="javascript:;" class="bt">내 정보 관리</a></li>
									</ul>              
								</div>
							</div>
							<div class="ctset ctset1 active" data-ui-tab-ctn="tab_my_cate" data-ui-tab-val="tab_my_cate_1">
								<ul class="sm">
									<li><a class="bt" href="/my/pet/myPetListView" data-content="0" data-url="/my/pet/myPetListView">마이펫 관리</a></li>
									<li><a class="bt" href="/mypage/tv/myWishList">마이 찜리스트</a></li>
									<li><a class="bt" href="/tv/series/indexTvRecentVideo">최근 본 영상</a></li>
								</ul>
							</div>
							<div class="ctset ctset2" data-ui-tab-ctn="tab_my_cate" data-ui-tab-val="tab_my_cate_2">
								<ul class="sm">
									<li><a class="bt" href="/mypage/order/indexDeliveryList" data-url="/mypage/order/indexDeliveryList" data-content="0">주문/배송</a></li>
									<li><a class="bt" href="/customer/inquiry/inquiryView" data-url="/customer/inquiry/inquiryView" data-content="0">1:1 문의</a></li>
									<li><a class="bt" href="/mypage/order/indexClaimList" data-url="/mypage/order/indexClaimList" data-content="0">취소/반품/교환</a></li>
									<li><a class="bt" href="/mypage/goodsCommentList" data-url="/mypage/goodsCommentList" data-content="0">상품 후기</a></li>
									<li><a class="bt" href="/mypage/indexIoAlarmList" data-url="/mypage/indexIoAlarmList" data-content="0">재입고 알림</a></li>
									<li><a class="bt" href="/mypage/service/indexAddressList" data-url="/mypage/service/indexAddressList" data-content="0">배송지 관리</a></li>
									<li><a class="bt" href="/mypage/info/coupon" data-url="/mypage/info/coupon" data-content="0">내 쿠폰</a></li>
									<li><a class="bt" href="/mypage/order/indexBillingCardList" data-content="0">결제 카드관리</a></li>
								</ul>
							</div>
							<div class="ctset ctset3" data-ui-tab-ctn="tab_my_cate" data-ui-tab-val="tab_my_cate_3">
								<ul class="sm">
									<li><a class="bt" href="/mypage/info/indexPswdUpdate" data-content="0" data-url="/mypage/info/indexPswdUpdate" >비밀번호 설정</a></li>
									<li><a class="bt" href="/mypage/info/indexManageCheck" data-content="0" data-url="/mypage/info/indexManageCheck" >회원정보 수정</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="link">
				<ul class="list">
					<li><a href="/mypage/service/coupon" data-content="0" data-url="/mypage/service/coupon" class="bt">쿠폰존</a></li>
					<li><a href="/event/main" data-content="0" data-url="/event/main" class="bt">이벤트</a></li>
					<li><a href="/customer/faq/faqList" class="bt">FAQ</a></li>
					<li><a href="/customer/notice/indexNoticeList" class="bt">공지사항</a></li>
					<li><a href="/customer/notice/indexNoticeList" class="bt">입점ㆍ제휴문의</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>

<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
<!-- e : gnb 영역 -->			
					<!-- s : LNB 영역 -->
					<!-- e : LNB 영역 -->
				<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
				
		<!-- s : 본문영역 -->			
		<main class="container page shop view" id="container">
			<div class="inr">
				<div class="contents" id="contents">
					<!-- 카테고리 -->
					<script type="text/javascript">
//메인으로 가기
function goPetShopMain(dispClsfNo) {
	
	if('12564' == dispClsfNo ) {			// 강아지
		dispClsfNo = '300000173'
	} else if('12565' == dispClsfNo ) {	// 고양이
		dispClsfNo = '300000174'
	} else if('14111' == dispClsfNo ) {	// 관상어
		dispClsfNo = '300000175'
	} else if('14196' == dispClsfNo ) {	// 소동물
		dispClsfNo = '300000176'
	}
	
	var form = document.createElement("form");
	document.body.appendChild(form);
	var url = "/shop/home/";
	form.setAttribute("method", "POST");
	form.setAttribute("action", url);

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "lnbDispClsfNo");
	hiddenField.setAttribute("value", dispClsfNo);
	form.appendChild(hiddenField);
	document.body.appendChild(form);
	form.submit();
}
</script>

<nav class="location">
	<ul class="loc">
		<li>
			<a href="javascript:;" class="bt st">강아지</a>
			<ul class="menu">
				<li class="active">
						<a class="bt" href="javascript:goPetShopMain('12564');">강아지</a>
					</li>
				<li >
						<a class="bt" href="javascript:goPetShopMain('12565');">고양이</a>
					</li>
				<li >
						<a class="bt" href="javascript:goPetShopMain('14111');">관상어</a>
					</li>
				<li >
						<a class="bt" href="javascript:goPetShopMain('14196');">소동물</a>
					</li>
				</ul>
		</li>
		<li>
			<a href="javascript:;" class="bt st">간식</a>
			<ul class="menu">
				<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12569&cateCdL=12564&cateCdM=12569">사료</a>
						</li>
					<li class="active">
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12571&cateCdL=12564&cateCdM=12571">간식</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12572&cateCdL=12564&cateCdM=12572">건강관리</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12575&cateCdL=12564&cateCdM=12575">위생/배변</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12576&cateCdL=12564&cateCdM=12576">미용/목욕</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12577&cateCdL=12564&cateCdM=12577">급식/급수기</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12573&cateCdL=12564&cateCdM=12573">장난감/훈련</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12578&cateCdL=12564&cateCdM=12578">하우스</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=13998&cateCdL=12564&cateCdM=13998">이동장</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12579&cateCdL=12564&cateCdM=12579">패션/의류</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12581&cateCdL=12564&cateCdM=12581">목줄/하네스</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=100000196&cateCdL=12564&cateCdM=100000196">반려인용품</a>
						</li>
					</ul>
		</li>
		<li>
			<a href="javascript:;" class="bt st">저키/트릿</a>
			<ul class="menu">
				<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12595&cateCdL=12564&cateCdM=12571">캔/파우치</a>
						</li>
					<li class="active">
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12594&cateCdL=12564&cateCdM=12571">저키/트릿</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12596&cateCdL=12564&cateCdM=12571">비스킷/쿠키</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12592&cateCdL=12564&cateCdM=12571">덴탈껌</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12593&cateCdL=12564&cateCdM=12571">사사미</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12599&cateCdL=12564&cateCdM=12571">동결/건조간식</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12597&cateCdL=12564&cateCdM=12571">통살/소시지</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12591&cateCdL=12564&cateCdM=12571">수제간식</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=12600&cateCdL=12564&cateCdM=12571">파우더</a>
						</li>
					<li >
							<a class="bt" href="/shop/indexCategory?dispClsfNo=13992&cateCdL=12564&cateCdM=12571">음료</a>
						</li>
					</ul>
		</li>
	</ul>
</nav><div class="pdTops">

						<!-- 상품 이미지 영역 START -->
						<section class="pdPhoto">
							<!-- 이미지 왼쪽 상단 -->
							<div class="pdThumbSlide">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
										<li class="swiper-slide">
											<a href="javascript:" class="box"><span class="pic"><img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/20/12/51/2504480/2504480_detail_080.jpg?type=f&w=178&h=178&quality=90&align=4"  /></span></a>
										</li>
										</ul>
								</div>
							</div>

							<!-- 메인 이미지 영역 START -->
							<div class="pdPhotoSlide">
								<!-- 타임딜 / 재고임박 / 유통기한 임박 -->
								<div class="flags"> 
									<input type="hidden" id="goodsPrcNo_388226" value="2021-07-21 10:00:00.0"/>
												<div class="flg" id="time_388226"><em class="tt">타임딜 예정</em> <em class="tm">2021-07-21 10:00:00.0오픈</em> <em class="dc"><i class="p">20%</i><i class="t">할인</i></em> </div>
											</div>
								<!-- 메인 이미지 슬라이드 -->
								<div class="swiper-container">
									<div class="swiper-pagination"></div>
									<ul class="swiper-wrapper slide" name="detailImg">
										<li class="swiper-slide">
											<a href="javascript:" class="box">
												<span class="pic">
												<img class="img" onclick="detailGoodsImgPop(this)" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/20/12/51/2504480/2504480_detail_080.jpg?type=f&w=500&h=500&quality=90&align=4" >
												</span>
											</a>
										</li>
										</ul>
								</div>
							</div>
							<!-- 메인 이미지 영역 END -->
						</section>
						<!-- 상품 이미지 영역 END -->

						<section class="pdInfos p1">

							<!-- 공유하기 -->
							<div class="share"><a href="javascript:void(0)" onclick="fnShare();" class="bt shr">공유하기</a></div>

							<!-- 아이콘 -->
							<div class="flag">
								<em class="fg a">강아지</em>
								</div>

							<!-- 브랜드관 노출/비노출 영역 -->
							<div class="pstore">
								<a href="/brand/indexBrandDetail?bndNo=672" class="bt lk">포켄스</a>
							</div>
							<!-- 상품명 -->
							<div class="names" >포켄스 뉴트리션 트릿 피부&피모 480g</div>

							<!-- 후기 평점 -->
							<script type="text/javascript">
	$(function (){
		$('#pdRevCnt').text('1');
	})
</script>
<!-- 후기 -->
<div class="starpoint">
		<span class="stars sm p_3_5"></span>
		<span class="point">3.5</span>
		<span class="revew"><a href="javascript:;" class="lk" onclick="$('i[name=pdRevCnt]').trigger('click'); return false;" name="pdRevCnt">(1)</a></span>
	</div>
<!-- 가격 -->
							<div class="prices">
								<div class="price">
									<span class="disc">22%</span>
									<span class="prcs">28,000<i class="w">원</i></span>
									<span class="ogpc">36,000<i class="w">원</i></span>
									</div>

								<!-- 쿠폰받기 -->
								<div class="coupon" id="isCoupon" style="display: none">
									<a href="javascript:;" onclick="openPopupCoupon();" class="bt cpn">쿠폰받기</a>
								</div>
								<style>
	li.disabled button {
		cursor: default;
	}
</style>
<script type="text/javascript">
	//쿠폰 목록 세팅
	var cpNos = [];
	var couponList = [];
	var limit = 20;

	$(function(){
		fnGetCoupons('PI000005494', 'ITEM');
	});

	/**
	 * 쿠폰 목록 조회
	 */
	function fnGetCoupons(goodsId, goodsCstrtTpCd, goodsNm) {
		//묶음/옵션 상품 목록 클릭하였을 경우
		if(goodsNm) {
			//묶음/옵션 상품 목록 콤보 박스 닫기
			ui.popBot.close('popCouponOptPdSel');

			//묶음/옵션 상품 목록 선택 상품명 세팅
			$('#goodsNm').text(goodsNm);
		}

		//화면 초기화
		couponList = [];
		$('#couponUl').html('');

		// 쿠폰 템플릿
		var template = document.querySelector("#templateCouponli").innerHTML;

		var options = {
			url : '/goods/getGoodsCoupon'
			, data : {goodsId:goodsId, goodsCstrtTpCd:goodsCstrtTpCd}
			, done : function(result){
				if(result.goodsCoupon) {
					var list = result.goodsCoupon;

					//쿠폰 전체받기 버튼 비활성화 체크
					var isDisbled = true;

					$.each(list, function(i, v) {
						var disabled = (v.cpUseYn == 'Y') ? 'disabled':'';

						// 하나라도 다운로드 받을 쿠폰이 있다면 전체다운받기 활성화 시키기
						if((v.cpUseYn == 'N')) {
							isDisbled = false;
						}

						var aplVal = numberWithCommas(v.aplVal);
						var aplTxt = aplVal + (v.cpAplCd == '10' ? ' % 할인' : '원 할인');
						var vldPrdCd = v.vldPrdCd;
						//10	발급일
						//20	일자지정
						var vldPrdPeriod = '';
						if(vldPrdCd == '10') {
							var vldPrdDay = v.vldPrdDay;
							vldPrdPeriod = '발급일로부터 ' +vldPrdDay+ '일까지';
						} else if(vldPrdCd == '20') {
							vldPrdPeriod = new Date(v.vldPrdStrtDtm).dateFormat('yyyy.MM.dd HH:mm:ss') + ' ~ ' + new Date(v.vldPrdEndDtm).dateFormat('yyyy.MM.dd HH:mm:ss');
							//var aplPeriod = new Date(v.vldPrdStrtDtm).dateFormat('yyyy.MM.dd HH:mm:ss') + ' ~ ' + new Date(v.vldPrdEndDtm).dateFormat('yyyy.MM.dd HH:mm:ss');
						}


						var maxDcTxt = new Array();
						if(v.minBuyAmt && v.minBuyAmt > 0) {
							maxDcTxt.push(numberWithCommas(v.minBuyAmt) + '원 이상 구매 시');
						}
						if(v.maxDcAmt && v.maxDcAmt > 0) {
							maxDcTxt.push('최대' + numberWithCommas(v.maxDcAmt) + '원 할인');
						}

						var notice = '';
						var none = 'none';
						if(v.notice != null){
							v.notice = v.notice.replace(/[*<br>|*&nbsp;|*\s|*</br>|*<p>|*</p>]/gi,'');
							if(v.notice != '' && v.notice != null && v.notice) {
								notice = v.notice;
								none = 'block';
							}
						}

						var coupon = template
								.replace(/{{disabled}}/gi, disabled)
								.replace(/{{aplTxt}}/gi, aplTxt)
								.replace(/{{notice}}/gi, notice)
								.replace(/{{none}}/gi, none)
								.replace(/{{cpNo}}/gi, v.cpNo)
								.replace(/{{cpNm}}/gi, v.cpNm)
								.replace(/{{maxDcTxt}}/gi, maxDcTxt.join('/'))
								.replace(/{{vldPrdPeriod}}/gi, vldPrdPeriod);

						couponList.push(coupon);
						cpNos.push({cpNo : v.cpNo, cpUseYn:v.cpUseYn});
					});

					//전체 쿠폰 다운로드 버튼 비활성화
					$('#downloadAllBtn').prop('disabled', isDisbled);

					if(couponList.length > 0) {
						$('#isCoupon').show();
					} 
					fnCouponList();
				}
			}
		};
		ajax.call(options);
	}
	/**
	 * 쿠폰 목록 조회
	 */
	function fnCouponList(page) {
		//console.log('쿠폰 목록 조회:' + page);
		if(!page) {
			page = 0;
		}

		var pageStrt = page * limit;
		var pageEnd = pageStrt + limit;
		$.each(couponList, function(i, v){
			if(i >= pageStrt && i < pageEnd) {
				$('#couponUl').append(v);
			}
		});

		// 상품 상세 쿠폰받기 버튼 활성화
		/* if(page == 0) {
			$('#isCoupon').show();
		} */
	}

	function fnCheckLogin(cpNo, obj) {

		if('false' == 'true') {
			if(cpNo == null) {
				fnDownloadGoodsCouponAll();
			} else {
				fnDownloadGoodsCoupon(cpNo);
			}
		} else {
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들
				ycb:function(){
					var url = encodeURIComponent(document.location.href);
					//App일때 영상상세에서 다른화면으로 이동시 화면 닫고 이동해야함
					if("false" == "true" && document.location.href.indexOf("/tv/series/indexTvDetail") > -1){
						// 데이터 세팅
						toNativeData.func = "onCloseMovePage";
						toNativeData.moveUrl = "https://aboutpet.co.kr/indexLogin?returnUrl="+url;
						// APP 호출
						toNative(toNativeData);
					}else{
						document.location.href = '/indexLogin?returnUrl='+url;
					}
				},
				ncb:function(){
					return false;
				},
				ybt:"로그인", // 기본값 "확인"
				nbt:"취소"  // 기본값 "취소"
			});
		}
	}

	/**
	 * 쿠폰 다운로드
	 * @param cpNo
	 * @param obj
	 */
	async function fnDownloadGoodsCoupon(cpNo) {

		var option = {
			url : '/goods/downloadGoodsCoupon'
			,   data : { cpNo : cpNo }
			,   done : function(data){

				if(data.result > 0) {
					//성공한 쿠폰 다운로드 버튼 비활성화
					$('#li_'+ cpNo).addClass('disabled');
					ui.toast("쿠폰 다운로드가 완료되었어요.")
				} else {
					if(data.message) {
						ui.toast(data.message);
					}
				}
			}
		};
		await ajax.call(option);
	}

	/**
	 * 쿠폰 다운로드
	 * @param cpNo
	 * @param obj
	 */
	async function fnDownloadGoodsCouponAll() {

		if('false' == 'true') {

			var size = cpNos.length;
			var noCpNos = [];

			//다운로드 받지 않은 쿠폰 세팅
			$.each(cpNos, function(i,v) {
				if(v.cpUseYn == 'N') {
					noCpNos.push(v.cpNo);
				}
			});

			var option = {
				url : '/goods/downloadGoodsCouponAll'
				, data : JSON.stringify(noCpNos)
				, contentType : 'application/json'
				, done : function(data){

					if(data.result > 0) {
						var i = 1;
						//성공한 쿠폰 개별 다운로드 버튼 비활성화
						$.each(data.successList, function(index, value){
							//기존 쿠폰 array 에 cpUseYn 업데이트
							$.each(cpNos, function(i,v) {
								if(v.cpNo == value){
									v.cpUseYn = 'Y';
								}
							});
							$('#li_'+ value).addClass('disabled');
							i+=1;
						});

						//전체 다운받기 비활성화 - 모두 성공하였을 경우,
						$('#downloadAllBtn').prop('disabled', true);
						ui.toast("쿠폰 다운로드가 완료되었어요.");
					} else {
						ui.toast('쿠폰 다운로드가 실패되었습니다.');
					}
				}
			};
			await ajax.call(option);

		} else {
			if(confirm('로그인 후 다운로드 가능합니다. 로그인 하시겠습니까?')) {
				window.open("/indexLogin?returnUrl="+encodeURIComponent(document.location));
			}
		}
	}

	function openCouponNotic(cpNo) {
		/*if('10' == '10') {
			$('#popCpnGudNotice').html('');
			$('#popCpnGudNotice').html($('#notice_'+ cpNo).text());
			ui.popBot.open('popCpnGud');
		}*/
		$('#popCpnGudNotice').html('');
		$('#popCpnGudNotice').html($('#notice_'+ cpNo).text());
		//ui.popBot.open('popCpnGud');
		// 쿠폰이용안내 바텀시트가 iOS에서 가려지는 현상이 있어서 zIndex를 높임.
		ui.popBot.open('popCpnGud', {'zIndex':999999});
	}
</script>
<article class="popLayer a popCpnGet" id="popCpnGet">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">쿠폰받기</h1>
				<button type="button" class="btnPopClose inpop">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<div class="btstop">
					<form id="command" name="couponForm" action="/goods/indexGoodsDetail?goodsId=PI000005494" method="post"></form></div>
				<div class="cupon-wrap">
					<div class="cupon-area t2 setAutoh" data-dh="60"><ul class="cupon-list" id="couponUl"></ul></div>
				</div>
			</main>
		</div>
		<div class="pbt">
			<div class="bts">
				<button type="button" id="downloadAllBtn" class="btn xl a btnGet" onclick="fnCheckLogin(null, this);">쿠폰 모두 받기</button>
			</div>
		</div>
	</div>
</article>

<!-- 쿠폰이용안내 -->
<article class="popBot popCpnGud k0427" id="popCpnGud">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">이용안내</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<ul class="tplist" id="popCpnGudNotice"></ul>
			</main>
		</div>
	</div>
</article>


<script type="text/template" id="templateCouponli">
	<li class="{{disabled}}" id="li_{{cpNo}}" >
		<div class="sale">
			{{aplTxt}}
			<div class="uitooltip" style="display: {{none}}">
				<button type="button" class="btn i btnTooltop" onclick="openCouponNotic('{{cpNo}}')">이용안내</button>
				<div class="toolctn">
					<div class="tptit">이용안내</div>
					<ul class="tplist" id="notice_{{cpNo}}">{{notice}}</ul>
				</div>
			</div>
		</div>
		<p class="tit">[상품쿠폰]{{cpNm}}</p>
		<div class="bottom-item">
			<div class="txt">
				<p>{{maxDcTxt}}</p>
				<p>{{vldPrdPeriod}}</p>
			</div>
		</div>
		<button type="button" class="btn-down" onclick="fnCheckLogin('{{cpNo}}', this);">쿠폰 다운로드</button>
	</li>
</script>

<script>
	var isScrBot = true ;
	var page = 1;
	$("#popCpnGet .pct").on("scroll resize",function(){
		var scTop = $(this).scrollTop();
		var scBox = $(this).outerHeight();
		var scCtn = $(this).prop("scrollHeight");
		if (scCtn <= scTop + scBox && isScrBot == true) {
			isScrBot = false;
			setTimeout(function(){
				fnCouponList(page ++);
				isScrBot = true;
			},500);
		}
	});
</script><!-- 쿠폰다운 -->
							</div>
							
							<!-- MD PICK 노출/비노출 -->
							<!-- 연관태그 -->
							<div class="tags relaTags">
								<div class="tit">연관태그</div>
								<div class="box">
									<ui class="tgs">
										<li><a href="/shop/indexPetShopTagGoods?tags=T000000001&tagNm=강아지" class="tg">#강아지</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000000006&tagNm=성년기" class="tg">#성년기</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000000332&tagNm=간식" class="tg">#간식</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001576&tagNm=져키" class="tg">#져키</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001630&tagNm=카놀라유" class="tg">#카놀라유</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001725&tagNm=포켄스" class="tg">#포켄스</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001745&tagNm=피모건강" class="tg">#피모건강</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001749&tagNm=피부건강" class="tg">#피부건강</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000003025&tagNm=아마씨분말" class="tg">#아마씨분말</a></li>
										</ui>
									<div class="more"><a href="javascript:;" class="bt">더보기</a></div>
									</div>
							</div>

							<hr class="hbar">

							<!-- 할인혜택 -->
							<div class="benefit">
								<div class="box">
									<div class="tit">할인혜택</div>
									<div class="ctn">
										<p>GS&POINT <em class="pt">28P</em> 적립</p>
									</div>
								</div>
							</div>

							<!-- 배송정보 -->
							<div class="deliys">
								<div class="box">
									<div class="tit">배송정보</div>
									<div class="ctn">
										<p><span class="dawn"><span name="dlvrAmt"></span></span></p>
										<p><span class="free"><span name="dlvrFree"></span></span></p>
									</div>
									<a href="javascript:;" class="bt more" onclick="ui.popBot.open('popDelInfo', {'pop':true});">더보기</a>
								</div>
								<!-- 배송 추가 정보 -->
								<script type="text/javascript">
	$(function(){
		// 배송 정보
		//goods.dlvrcPlcNo: 1
		//goods.dlgtSubDlvrcPlcNo: 
		getDeliveryInfo('912', '1');
	});

	/**
	 * 배송정보
	 * @param goodsId
	 * @param compPlcNo
	 */ //goods.freeDlvrYn: N
	function getDeliveryInfo(compNo, dlvrcPlcNo) {
		var options = {
			url: '/goods/getGoodsDeliveryInfo'
			, data: {compNo:compNo, dlvrcPlcNo: dlvrcPlcNo}
			, done: function (result) {
				// 배송 정보
				if(result.deliveryChargePolicy) {
					var deliveryChargePolicy = result.deliveryChargePolicy;
					var dlvrFree = '';


					if(deliveryChargePolicy.dlvrcCdtStdCd == '20') {
						dlvrFree = numberWithCommas(deliveryChargePolicy.buyPrc) + '원 이상 무료배송' ;
					} else if(deliveryChargePolicy.dlvrcCdtStdCd == '30') {
						dlvrFree = numberWithCommas(deliveryChargePolicy.buyQty) + '개 이상 무료배송' ;
					} else {
						
					}
					
					
					if(('ITEM' == 'ITEM' || 'ITEM' == 'SET') && 'N' == 'Y'){
						
						$('span[name=dlvrFree]').text("무료배송");
						$('span[name=dlvrFreePop]').text('무료배송');
						
					}else if(('ITEM' == 'ATTR' || 'ITEM' == 'PAK') && 'N' == 'Y'){
						
						$('span[name=dlvrFree]').text("무료배송");
						$('span[name=dlvrFreePop]').text('무료배송');
						
					}else{
						
						// 배송료
						if(deliveryChargePolicy.dlvrAmt>0 && 'N' != 'Y') {
							$('span[name=dlvrAmt]').text(numberWithCommas("배송비 "+deliveryChargePolicy.dlvrAmt)+"원");
						}else{
							dlvrFree = '무료배송';
						}
	
						if(dlvrFree) {
							$('span[name=dlvrFree]').text(dlvrFree);
							$('span[name=dlvrFreePop]').text(dlvrFree == '무료배송' ? dlvrFree : '('+dlvrFree+')');
						}
					}
					// 교환/환불 정책
					$('#rtnExcInfo').html(deliveryChargePolicy.rtnExcInfo);
				}
			}
		};

		ajax.call(options);
		// 배달 시간
		getDeliveryTime();
	}

	/**
	 * todo[상품, 이하정, 202010314] 연결 데이터 확인 후 작업 더 필요함
	 * 체크 결제 완료시 연결 데이터 체크
	 * 체크 업체 배송일 때 문구 확인
	 * @param
	 */
	function getDeliveryTime(){
		$.ajax({
			type: "POST",
			url: "/order/getDlvrPolicy",
			dataType: "json",
			success: function (data) {
				
				$.each(data.list, function(i, v){
					let ordDateTime = new Date(v.ordDateTime); // 배송완료 예상시간
					let dlvrPrcsTpCd = v.dlvrPrcsTpCd;
					
					if (dlvrPrcsTpCd == "20" || dlvrPrcsTpCd == "21") {  // 새벽배송/당일배송
						// 1. 마감시간 체크
						// 마감시간 가져오기
						let closeDate = new Date(v.targetCloseDtm);

						var onedayCloseTime = '11:30 배송마감';
						var dawnCloseTime = '21:00 배송마감';
						if(v.isHoliday) { // 휴무일
							if (dlvrPrcsTpCd == "20"){
								$('[data-delivery="day"]').hide();
								$('div[name=onedayText]').html('<em class="r">'+v.restTimeShowText+'</em>');
								$('[name=onedayText]').data('time', closeDate);
								deliveryTime('oneday', closeDate);
								onedayCloseTime = '';
								$('#popDelInfo [name="onedayText"]').closest(".dd").siblings(".dt").children(".tt").text(onedayCloseTime);
							} else if(dlvrPrcsTpCd == "21") {
								$('[data-delivery="dawn"]').hide();
								$('div[name=dawnText]').html('<em class="r">'+v.restTimeShowText+'</em>');
								deliveryTime('dawn', closeDate);
								dawnCloseTime = '';
								$('#popDelInfo [name="dawnText"]').closest(".dd").siblings(".dt").children(".tt").text(dawnCloseTime);
							}
						} else { // 정상상황
							if (dlvrPrcsTpCd == "20"){
								/**
								 * 당일배송
								 */
								$('span[name=onedayHour]').text(v.restTimeHour);
								$('span[name=onedayMin]').text(v.restTimeMinute);
								var ondayText = '<em class="b">' +v.dlvrTimeShowText.replace('도착', '')+ '</em> 도착';
								$('div[name=onedayText]').html(ondayText);
								deliveryTime('oneday', closeDate);
								$('#popDelInfo [name="onedayText"]').closest(".dd").siblings(".dt").children(".tt").text(onedayCloseTime);
							} else if(dlvrPrcsTpCd == "21") {
								/**
								 * 새벽배송
								 */
								$('span[name=dawnHour]').text(v.restTimeHour);
								$('span[name=dawnMin]').text(v.restTimeMinute);
								var dawnText = '<em class="b">' +v.dlvrTimeShowText.replace('도착', '')+ '</em> 도착';
								$('div[name=dawnText]').html(dawnText);
								deliveryTime('dawn', closeDate);
								$('#popDelInfo [name="dawnText"]').closest(".dd").siblings(".dt").children(".tt").text(dawnCloseTime);
							}
						}
					} else { // 일반배송
						$('span[name=dlvryHour]').text(v.restTimeHour);
						$('span[name=dlvryMin]').text(v.restTimeMinute);
						deliveryTime('dlvry', new Date(v.targetCloseDtm));
						//var dlvryText = '<em class="b">' +v.dlvrTimeShowText.replace('도착 예정', '')+ '</em> 도착 예정';
						//$('span[name=dlvryText]').text(dlvryText);
					}
				});
				
			},
			error: function(request,status,error) {
				alert("배송방식을 가져오는데 실패했습니다.");
			}
		});
	}
</script>
<div class="deliguides">
	<ul class="gdlist">
				<li class="dl2">
					<div class="ht">당일배송</div>
					<div class="dt">
						<div class="tt" name="onedayText"></div>
						<div class="ss" data-delivery="day">11시 30분 전 결제완료 시 (<span name="onedayHour">00</span>시 <span name="onedayMin">00</span>분 남음)</div>
</div>
				</li>

				<li class="dl1">
					<div class="ht">새벽배송</div>
					<div class="dt">
						<div class="tt" name="dawnText"></div>
						<div class="ss" id="dawn" data-delivery="dawn">21시 전 결제 완료시 (<span name="dawnHour">00</span>시 <span name="dawnMin">00</span>분 남음)</div>
</div>
				</li>

				<li class="dl3">
					<div class="ht">택배배송</div>
					<div class="dt">
						<div class="tt">1 ~ 2일 소요 예정</div>
						<div class="ss" data-delivery="parcel">16시 이전 주문 : 다음날 도착 (98%) (<span name="dlvryHour">00</span>시 <span name="dlvryMin">00</span>분 남음)<br>16시 이후 주문 : 2일 이내 도착</div>
						<!-- CSR-1309 건으로 주석 처리 20210622
						<div class="tt">당일 출고 예정(주말, 공휴일 제외)</div>
						<div class="ss" data-delivery="parcel">16시 전 결제 완료시 (<span name="dlvryHour">00</span>시 <span name="dlvryMin">00</span>분 남음)</div>
						-->
						<!-- 04-23 QA 요청 안보여도 되는 데이터 
						<div class="ss"><span name="dlvrAmt"></span> <span name="dlvrFreePop"></span></div>
						 -->
					</div>
					</li>
			</ul>
		</div>
<div class="layers">
	<article class="popBot popDelInfo" id="popDelInfo">
		<div class="pbd">
			<div class="phd">
				<div class="in">
					<h1 class="tit">배송/반품/교환</h1>
					<button type="button" class="btnPopClose">닫기</button>
				</div>
			</div>
			<div class="pct">
				<main class="poptents">
					<section class="sect">
						<div class="hdt"><span class="tit">배송안내</span></div>
						<div class="cdt">
							<ul class="gdlist">
							<li class="dl1">
										<div class="ht">당일배송</div>
										<div class="dt">
											<div class="tt">11:30 배송마감</div>
											<div class="ss" data-delivery="day"><span name="onedayHour">00</span>:<span name="onedayMin">00</span> 남음</div>
										</div>
										<div class="dd">
											<div class="tt" name="onedayText"></div>
											<div class="ss">
												<ul class="bls">
													<li>서울, 인천, 경기 일부 가능</li>
													<li>명절연휴(설날/추석 당일) 제외</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="dl2">
										<div class="ht">새벽배송</div>
										<div class="dt">
											<div class="tt">21:00 배송마감</div>
											<div class="ss" data-delivery="dawn"><span name="dawnHour">00</span>:<span name="dawnMin">00</span> 남음</div>
										</div>
										<div class="dd">
											<div class="tt" name="dawnText"></div>
											<div class="ss">
												<ul class="bls">
													<li>서울, 경기 일부 가능</li>
													<li>일요일, 명절연휴(설날/추석 당일) 제외</li>
												</ul>
											</div>
										</div>
									</li>
									<li class="dl3">
										<div class="ht">택배배송</div>
										<div class="dt">
											<div class="tt">16:00 배송마감</div>
											<div class="ss" data-delivery="parcel"><span name="dlvryHour">00</span>:<span name="dlvryMin">00</span> 남음</div>
										</div>
										<div class="dd">
											<div class="tt">1 ~ 2일 소요 예정</div>
											<div class="ss">
												<ul class="bls">
													<li>16시 이전 주문 : 다음날 도착 (98%) (<span name="dlvryHour">00</span>시 <span name="dlvryMin">00</span>분 남음)</li>
													<li>16시 이후 주문 : 2일 이내 도착</li>
													<li>토요일,일요일,공휴일 제외</li>
												</ul>
											</div>
										</div>
									</li>
								</ul>
						</div>
					</section>
					<section class="sect"><div class="cdt" id="rtnExcInfo"></div></section>
				</main>
			</div>
		</div>
	</article>
</div></div>

							<!-- 사은품 -->
							</section>
					</div>

					<!-- 상품 상세 텝 메뉴 -->
					<div class="pdCtns">
						<div class="tabMenu">
							<div class="inr">
								<ul class="uiTab a menu">
									<li data-btn-sid="pd-inf">
										<a class="bt"  href="javascript:;"><span class="tt">상품정보</span></a>
									</li>
									<li data-btn-sid="pd-mov" style="display:none;">
										<a class="bt"  href="javascript:;"><span class="tt">관련영상</span> <i class="nm" id="contentsTabCnt"></i></a>
									</li>
									<li data-btn-sid="pd-rev">
										<a class="bt"  href="javascript:;"><span class="tt"><span class="tt">후기</span> <i class="nm" name="pdRevCnt" id="pdRevCnt">0</i></a>
									</li>
									<li data-btn-sid="pd-qna">
										<a class="bt"  href="javascript:;"><span class="tt">Q&amp;A</span> <i class="nm" name="pdQnaCnt"></i></a>
									</li>
								</ul>
							</div>
						</div>

						<!-- 상품정보 -->
						<div class="tabCtns">
							<section class="sec inf" data-sid="pd-inf">
								<script type="text/javascript">
	var cstrtArr = new Array();
	
		var cstrt = {};
		cstrt.goodsId = 'PI000005494';
		cstrt.goodsNm = '포켄스 뉴트리션 트릿 피부&amp;피모 480g';
		cstrt.count = '1';

		cstrtArr.push(cstrt);
		

	$(function(){

		/**
		 * 상품 상세
		 */
		var options = {
			url : '/goods/getGoodsDesc'
			, data : {goodsId:'PI000005494'}
			, done : function(result){
				if(result.bannerContent) {
					$.each(result.bannerContent, function(i, v){
						$('#bannerPc').append($.parseHTML(v.bnrHtml));
						$('#bannerMobile').append($.parseHTML(v.bnrHtml));

						$('#bannerPc').not('img').addClass('template_area');
						//이미지에는 풀 css
						$('#bannerPc img').addClass('full_img_area');
					});
				}
				if(result.goodsDesc) {
					var goodsDesc = result.goodsDesc;

					$('#contentPc').prepend($.parseHTML(goodsDesc.contentPc));
					$('#contentMobile').prepend($.parseHTML(goodsDesc.contentMobile));

					$('#contentPc').not('img').addClass('template_area');
					//이미지에는 풀 css
					$('#contentPc img').addClass('full_img_area');
				}
			}
		};
		ajax.call(options);
	});

	/**
	 * [레이어] 자세히 열기
	 */
	function fnOpenPopPdDetView(goodsId, isOpen) {
		var goodsNm = '';
		var goodsCount = '';
		$.each(cstrtArr, function(i, v){
			if(v.goodsId == goodsId) {
				goodsNm = v.goodsNm;
				goodsCount = '상품'+v.count;
			}
		});
		$('#optPdNm').text(goodsNm);
		$('#optPdCount').text(goodsCount);

		var options = {
			url : '/goods/getGoodsDesc'
			, data : {goodsId:goodsId}
			, done : function(result){
				if(result.goodsDesc) {
					var goodsDesc = result.goodsDesc;
					var goodsNm = '';

					$('#cstrtPc').html($.parseHTML(goodsDesc.contentPc));
					$('#cstrtMobile').html($.parseHTML(goodsDesc.contentMobile));

					if(isOpen) {
						ui.popLayer.open('popPdDetView');
					}
				}
			}
		};
		ajax.call(options);
	}

	/**
	 * [레이어] 자세히 닫기
	 */
	function fnClosePopPdDetView() {
		$('#cstrtPc').html();
		$('#cstrtMobile').html('');

		ui.popBot.close('popOptPdSel');
		ui.popLayer.close('popPdDetView');
	}
</script>

<div class="cdts">

	<!-- 공통 상품 배너 정보
	<div class="html_editor mo" id="bannerMobile"></div>
	<div class="html_editor pc" id="bannerPc"></div>
	-->
	<!-- 묶음 상품 정보 -->
	<div class="html_editor mo" id="contentMobile">
		<script type="text/javascript">
	/* console.log("성분 정보 변동 여부 : " + goods.igdtInfoLnkYn); */
</script>

<div class="gdtblset"><!-- @@ 03.03 .gdtblset 영양정보,상세정보 감싸기 -->
<div class="gdtbl a"> <div class="gdthdt">영양정보</div>
		<table class="tblist a" cellpadding="0" cellspacing="0" summary="제품표기함량,수분제외함량 테이블">
			<caption>영양정보</caption>
			<colgroup>
				<col>
				<col>
				<col>
			</colgroup>
			<thead>
			<tr>
				<th></th>
				<th>제품표기함량</th>
				<th>수분제외함량</th>
			</tr>
			</thead>
			<tbody>
				<tr>
					<th>조단백질</th>
					<td>
						4%</td>
					<td>
						4.65%</td>
				</tr>

				<tr>
					<th>조지방</th>
					<td>
						5%</td>
					<td>
						5.81%</td>
				</tr>

				<tr>
					<th>조섬유질</th>
					<td>
						3%</td>
					<td>
						3.49%</td>
				</tr>

				<tr>
					<th>조회분</th>
					<td>
						4%</td>
					<td>
						4.65%</td>
				</tr>

				<tr>
					<th>칼슘</th>
					<td>
						0.01%</td>
					<td>
						0.01%</td>
				</tr>

				<tr>
					<th>인</th>
					<td>
						0.01%</td>
					<td>
						0.01%</td>
				</tr>

				<tr>
					<th>오메가3</th>
					<td>
						0%</td>
					<td>
						0%</td>
				</tr>

				<tr>
					<th>오메가6</th>
					<td>
						0%</td>
					<td>
						0%</td>
				</tr>

				<tr>
					<th>수분</th>
					<td>
						14%</td>
					<td></td>
				</tr>
				<tr>
					<th>탄수화물</th>
					<td></td>
					<td>
						81.4%</td>
				</tr>
				<tr>
					<th>기타성분</th>
					<td colspan="2" class="alg_l"></td>
				</tr>
			</tbody>
		</table>
	</div>
<div class="gdtbl b">
		<div class="gdthdt">상세 정보</div>
		<table class="tblist b" cellpadding="0" cellspacing="0" summary="원료구성,포장상태,소포장 단위,사료 타임, 권장연령 테이블">
			<caption>상세 정보</caption>
			<colgroup>
				<col>
				<col>
			</colgroup>
			<tbody>
			<tr>
					<th>원료구성</th>
					<td>카놀라유,아마씨분말,타피오카,이소말토올리고당,효모추출물,젤라틴,글리세린,CMC-NA,글리세린모노스테아레이트,향료,색소</td>
				</tr>
			<tr>
					<th>포장상태</th>
					<td>소포장</td>
				</tr>
			<tr>
					<th>권장 연령</th>
					<td>생후 3개월 이상</td>
				</tr>
			</tbody>
		</table>
		<!-- @@ 03.08 문구변경 -->
		<div class="gdtinfo">
			* 브랜드사에서 제공한 정보로 모든 책임은 브랜드사에 있습니다. <br>
			* 해당 정보는 브랜드사 사정에 의해 일부 변경될 수 있습니다.
		</div>
</div>
</div>


<div class="gdtbl c">
	<div class="gdthdt">상품 필수 정보</div>
	<table class="tblist c" cellpadding="0" cellspacing="0" summary="품명 및 모델명, 제조사,제조국,A/S책임자,인증허가,안정인증여부 테이블">
		<caption>상품 필수 정보</caption>
		<colgroup>
			<col>
			<col>
		</colgroup>
		<tbody>
		<tr>
				<th>품명 및 모델명</th>
				<td>포켄스 뉴트리션 트릿 피부&amp;피모 480g</td>
			</tr>
		<tr>
				<th>법에 의한 인증,허가 등을 받았음을 확인할수 있는 경우 그에 대한 사항</th>
				<td>상세페이지 참조</td>
			</tr>
		<tr>
				<th>제조국 또는 원산지</th>
				<td>대한민국</td>
			</tr>
		<tr>
				<th>제조자,수입품의 경우 수입자를 함께 표기</th>
				<td>(주)포켄스//해당사항없음</td>
			</tr>
		<tr>
				<th>AS책임자와 전화번호 또는 소비자상담 관련 전화번호</th>
				<td>어바웃펫//1644-9601</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

	<div class="html_editor pc" id="contentPc">
		<script type="text/javascript">
	/* console.log("성분 정보 변동 여부 : " + goods.igdtInfoLnkYn); */
</script>

<div class="gdtblset"><!-- @@ 03.03 .gdtblset 영양정보,상세정보 감싸기 -->
<div class="gdtbl a"> <div class="gdthdt">영양정보</div>
		<table class="tblist a" cellpadding="0" cellspacing="0" summary="제품표기함량,수분제외함량 테이블">
			<caption>영양정보</caption>
			<colgroup>
				<col>
				<col>
				<col>
			</colgroup>
			<thead>
			<tr>
				<th></th>
				<th>제품표기함량</th>
				<th>수분제외함량</th>
			</tr>
			</thead>
			<tbody>
				<tr>
					<th>조단백질</th>
					<td>
						4%</td>
					<td>
						4.65%</td>
				</tr>

				<tr>
					<th>조지방</th>
					<td>
						5%</td>
					<td>
						5.81%</td>
				</tr>

				<tr>
					<th>조섬유질</th>
					<td>
						3%</td>
					<td>
						3.49%</td>
				</tr>

				<tr>
					<th>조회분</th>
					<td>
						4%</td>
					<td>
						4.65%</td>
				</tr>

				<tr>
					<th>칼슘</th>
					<td>
						0.01%</td>
					<td>
						0.01%</td>
				</tr>

				<tr>
					<th>인</th>
					<td>
						0.01%</td>
					<td>
						0.01%</td>
				</tr>

				<tr>
					<th>오메가3</th>
					<td>
						0%</td>
					<td>
						0%</td>
				</tr>

				<tr>
					<th>오메가6</th>
					<td>
						0%</td>
					<td>
						0%</td>
				</tr>

				<tr>
					<th>수분</th>
					<td>
						14%</td>
					<td></td>
				</tr>
				<tr>
					<th>탄수화물</th>
					<td></td>
					<td>
						81.4%</td>
				</tr>
				<tr>
					<th>기타성분</th>
					<td colspan="2" class="alg_l"></td>
				</tr>
			</tbody>
		</table>
	</div>
<div class="gdtbl b">
		<div class="gdthdt">상세 정보</div>
		<table class="tblist b" cellpadding="0" cellspacing="0" summary="원료구성,포장상태,소포장 단위,사료 타임, 권장연령 테이블">
			<caption>상세 정보</caption>
			<colgroup>
				<col>
				<col>
			</colgroup>
			<tbody>
			<tr>
					<th>원료구성</th>
					<td>카놀라유,아마씨분말,타피오카,이소말토올리고당,효모추출물,젤라틴,글리세린,CMC-NA,글리세린모노스테아레이트,향료,색소</td>
				</tr>
			<tr>
					<th>포장상태</th>
					<td>소포장</td>
				</tr>
			<tr>
					<th>권장 연령</th>
					<td>생후 3개월 이상</td>
				</tr>
			</tbody>
		</table>
		<!-- @@ 03.08 문구변경 -->
		<div class="gdtinfo">
			* 브랜드사에서 제공한 정보로 모든 책임은 브랜드사에 있습니다. <br>
			* 해당 정보는 브랜드사 사정에 의해 일부 변경될 수 있습니다.
		</div>
</div>
</div>


<div class="gdtbl c">
	<div class="gdthdt">상품 필수 정보</div>
	<table class="tblist c" cellpadding="0" cellspacing="0" summary="품명 및 모델명, 제조사,제조국,A/S책임자,인증허가,안정인증여부 테이블">
		<caption>상품 필수 정보</caption>
		<colgroup>
			<col>
			<col>
		</colgroup>
		<tbody>
		<tr>
				<th>품명 및 모델명</th>
				<td>포켄스 뉴트리션 트릿 피부&amp;피모 480g</td>
			</tr>
		<tr>
				<th>법에 의한 인증,허가 등을 받았음을 확인할수 있는 경우 그에 대한 사항</th>
				<td>상세페이지 참조</td>
			</tr>
		<tr>
				<th>제조국 또는 원산지</th>
				<td>대한민국</td>
			</tr>
		<tr>
				<th>제조자,수입품의 경우 수입자를 함께 표기</th>
				<td>(주)포켄스//해당사항없음</td>
			</tr>
		<tr>
				<th>AS책임자와 전화번호 또는 소비자상담 관련 전화번호</th>
				<td>어바웃펫//1644-9601</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

	<div class="btsmore">
		<button type="button" class="bt more" data-ui-btsmore="more"><em class="t">상품정보 더보기</em></button>
	</div>
</div>
</section>

							<!-- 관련영상 -->
							<section class="sec mov" data-sid="pd-mov" id="contentsMov">
								<script type="text/javascript">

$(document).ready(function(){
	
	listContnetsGoods(true);
	
	var fitMovDevSet = {
			observer: true,
			observeParents: true,
			watchOverflow:true,
			freeMode: false,
			slidesPerView: 4,
			slidesPerGroup:4,
			spaceBetween: 16,
			breakpoints: {
				1024: {
					spaceBetween: 8,
					slidesPerView: "auto",
					slidesPerGroup:1,
					freeMode: true,
				}
			},
	        navigation: {
				nextEl: '.ui_fitmove_slide .sld-nav .bt.next',
				prevEl: '.ui_fitmove_slide .sld-nav .bt.prev',
			}
	    };

	var fitmoveDev = new Swiper('.ui_fitmove_slide .swiper-container', fitMovDevSet);
	
	fitmoveDev.on('transitionEnd', function() {
		if(fitmoveDev.realIndex > 0 && ( parseInt($("#contentList").data('page')) < parseInt($("#contentList").data('totpage')))){
			listContnetsGoods(false);
//				  fitmoveDev.destroy();
			fitMovDevSet = $.extend({}, fitMovDevSet, {initialSlide: fitmoveDev.realIndex});
			fitmoveDev = new Swiper('.ui_fitmove_slide .swiper-container', fitMovDevSet);
		}
	});

})

//시리즈목록 이동
function fncGoSrisList(srisNo){
	location.href = "/tv/series/petTvSeriesList?srisNo="+srisNo+"&sesnNo=1";
}

function listContnetsGoods(firstFlag) {
	
	var options = {
		url : '/goods/listContentsGoods'
		, type : "POST"
		, data : { goodsId : "PI000005494", page : (parseInt($("#contentList").data('page'))+1) }
		, done : function(result){
			var html = '';
			
			if(firstFlag){
				if(result.contentsSO.totalCount < 1){
					$("#contentsMov").hide();
					$("#contentsTabCnt").closest('li').hide();
				}else{
					$("#contentsTabCnt").text(result.contentsSO.totalCount);
					$("#contentsTabCnt").closest('li').show();
				}
			}
			
			if(result.listGoodsContents.length > 0 ){
				
				var list = result.listGoodsContents;
				
				for(i in list){
					
					var srisPrflImgPath = list[i].srisPrflImgPath;
					var thumPath = list[i].thumPath;
					
					if(srisPrflImgPath != null && srisPrflImgPath.indexOf('cdn.ntruss.com') == -1){
						srisPrflImgPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ srisPrflImgPath +"?type=m&w=388&h=188&quality=90&bgcolor=FFFFFF&extopt=3";
					}
					
					if(thumPath != null && thumPath.indexOf('cdn.ntruss.com') == -1){
						thumPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ thumPath +"?type=m&w=388&h=188&quality=90&bgcolor=FFFFFF&extopt=3";
					}
					
					html += '<li class="swiper-slide">';
					html += '	<div class="fitMoveSet">';
					html += '		<div class="thum">';
					html += '			<a href="javascript:fnPetTvDetail(\''+list[i].vdId+'\');" data-content="'+list[i].vdId+'" data-url="/tv/series/indexTvDetail?vdId='+list[i].vdId+'&sortCd=&listGb=HOME" class="pic">';
					html += '				<img class="img" src="' + thumPath + '" alt="이미지">';
					html += '				<span class="tm"><i class="i">' + list[i].totLnth + '</i></span></a>';
					html += '		</div>';
					html += '		<div class="boxs">';
					html += '			<div class="spic">';
					html += '				<a href="javascript:fncGoSrisList(\''+ list[i].srisNo +'\');" class="pic"><img class="img" src="' + srisPrflImgPath + '" alt="이미지"></a>';
					html += '			</div>';
					html += '			<div class="desc">';
					html += '				<div class="tit"><a href="javascript:fnPetTvDetail(\''+list[i].vdId+'\');" data-content="'+list[i].vdId+'" data-url="/tv/series/indexTvDetail?vdId='+list[i].vdId+'&sortCd=&listGb=HOME" class="lk">' + xssCheck(list[i].ttl, 1) + '</a></div>';
					html += '				<div class="inf">';
					//html += '					<span class="pct"><i class="nm">' + list[i].rate + '%</i>일치</span>';//APETQA-3525 일치율 노출하지 않음.
					html += '					<span class="hit"><i class="nm">' + list[i].hits + '</i></span>';
					html += '					<span class="fav"><i class="nm">' + list[i].likeCnt + '</i></span>';
					html += '				</div>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</li>';
				}
				
				$("#contentList").append(html);
				$("#contentList").data('page', result.contentsSO.page);
				$("#contentList").data("totpage", result.contentsSO.totalPageCount);
				$("#contentsCnt").text(result.contentsSO.totalCount);
			}
			
// 			ui.shop.fitMov.using();
			
		}
	};
	
	ajax.call(options);
}

//펫TV 상세화면 이동
function fnPetTvDetail(vd_id) {
	if("false" == "true"){
		// 데이터 세팅
		toNativeData.func = "onNewPage";
		toNativeData.type = "TV";
		toNativeData.url = "https://aboutpet.co.kr/tv/series/indexTvDetail?vdId="+ vd_id +'&sortCd=&listGb=GOODS_PI000005494';
		// APP 호출
		toNative(toNativeData);
	}else{
		location.href = "/tv/series/indexTvDetail?vdId="+ vd_id +'&sortCd=&listGb=GOODS_PI000005494';
	}
}
</script>

<div class="hdts">
	<span class="tit"><em class="t">관련영상</em> <i class="i" id="contentsCnt">0</i></span>
</div>
<div class="cdts">
	<div class="ui_fitmove_slide">
		<div class="swiper-container slide">
			<ul class="swiper-wrapper list" id="contentList" data-page="0">
				
			</ul>
		</div>
		<div class="sld-nav">
			<button type="button" class="bt prev">이전</button>
			<button type="button" class="bt next">다음</button>
		</div>
	</div>
</div>
</section>

							<!-- 후기 -->
							<section class="sec rev" data-sid="pd-rev">
								<script type="text/javascript">
	/*APET-1121  펫로그 후기만 있는 경우, 펫로그 후기가 선택되어 노출*/
	$(document).ready(function(){
   		if(false && false){
			$('.uirevtabs>.menu>li:nth-child(1)').removeClass('active');
			$('.uirevtabs>.menu>li:nth-child(2)').addClass('active');
			$('tabrev rev_a active').removeClass('active');
			$('tabrev rev_b active').addClass('active');
		}
	});
	
	$(function(){
		
		/* goodsComment.getGoodsCommentScore(); */
		goodsComment.getGoodsPhotoComment();
		goodsComment.getGoodsCommentList();
		
		petLogList.list();
		
		$("button[name=sortBtn]").on('click', function(){
			goodsComment.page = 1;
			var sidx;
			var sord;
			if($(this).val() == "v_1"){
				sidx = "SYS_REG_DTM";
				sord = "DESC";
			}else if($(this).val() == "v_2"){
				sidx = "ESTM_SCORE";
				sord = "DESC";
			}else if($(this).val() == "v_3"){
				sidx = "ESTM_SCORE";
				sord = "ASC";
			}
			goodsComment.sidx = sidx;
			goodsComment.sord = sord;
			goodsComment.getGoodsCommentList();
		});
		
		$("[name=morePhotoCommentBtn]").on('click', function(){
			getGoodsPhotoCommentPop();
			
		});

		$("#commentMore").on('click', function(){
			goodsComment.page = parseInt(goodsComment.page)+1;
			var param = {
				callback : goodsComment.getGoodsCommentListMore
			}
			goodsComment.getGoodsCommentList(param);
		});
		
		
		$("#commentListUl").on('click', '.pics img', function(){
			goodsComment.detailImgPop(this);
		})
		
		$("#goodsLayers").on('click', '.sld-nav>button', function(){
			var viewIndex = $(".popPhotoRv").find('[id^=photoCommentEstmNo_]').index($(".popPhotoRv").find('[id^=photoCommentEstmNo_].swiper-slide-active'));
			$("i[name=viewPoint]").text(viewIndex+1);
		});
		
		$("#optGoodsId").on('change', function(){
			goodsComment.page = 1;
			goodsComment.optGoodsId = $(this).val();
			
			goodsComment.getGoodsCommentList();
		})
		
		$("#imgListUl").on('click', 'a', function(){
			if($(this).attr('name') != 'morePhotoCommentBtn'){
				goodsComment.getAllGoodsCommentDetail($(this).data('goodsEstmNo'));
			}
		});
		
		$("#goodsLayers").on('click', '#popPhotoRv nav button.st, #popPhotoRv nav', function(){
			$($(this).parents('div.def').find('nav')).removeClass('bot');
		});

		$('#goodsLayers').on('click', '#popPhotoRv button[name=detailClose]', function(){
			ui.popLayer.close("popPhotoRv");
			
			if(!$('article#popRvPhoto').hasClass('on')){
				getGoodsPhotoCommentPop();
			}
		});
		
		$('#goodsLayers').on('click', '#popPhotoRv .btnPopClose', function(){
			ui.popLayer.close("popRvPhoto");
		});
	});
	
	//상품평
	var goodsComment = {
		goodsId : "PI000005494",
		goodsCstrtTpCd : "ITEM",
		totalPageCount : null,
		page : null,
		totalPageCount : null,
		sidx : null,
		sord : null,
		optGoodsId : null,
		selectTab : null,
		/* ajax -> 페이지 들어올때 실행하도록 수정 - ㅔcm 
		getGoodsCommentScore : function(){
			var options = {
				url : "/goods/getGoodsCommentScore.do"
				, type : "POST"
				, dataType : "html"
				, data : {
					goodsId : goodsComment.goodsId
					, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
				}
				, done : function(result){
					$('#estmArea').html(result);
				}
			};
			ajax.call(options);
		}, */
		getGoodsPhotoComment : function(newData){
			var defaultData = {
				url : "/goods/getGoodsPhotoComment.do"
				, dataType : "Json"
				, done : goodsComment.getgoodsPhotoCommentResult
			}
			$.extend(defaultData, newData);
			var options = {
				url : defaultData.url
				, type : "POST"
				, dataType : defaultData.dataType
				, data : {
						goodsId : goodsComment.goodsId
						, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
					}
				, done : defaultData.done
			};
			ajax.call(options);
		},
		getgoodsPhotoCommentResult : function(result){
			var data = result.imgList;
			if(data != null && data.length > 0){
				$("#photoTotalCnt").text(result.so.totalCount+'건');
				html = "";
				for(var i = 0; i < data.length; i++){
					html += "<li class=\"swiper-slide\">";
					html += "<div class=\"box\">";
					html += "<div class=\"thum\">";
					html += "<a href=\"javascript:;\" class=\"pic\" data-goods-estm-no=\""+data[i].goodsEstmNo+"\">";
					
					var imgPath = ""
					if(data[i].imgPath.indexOf('http') > -1){
						imgPath = data[i].imgPath;
					}else{
						imgPath = 'https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images'+ data[i].imgPath +'?type=f&w=720&h=720&quality=100&align=4';
					}
					
					html += "<img class=\"img\" src=\""+imgPath+"\" alt=\"이미지\">";
					if(data[i].imgCnt != null && data[i].imgCnt > 1 ){
						html += "<em class=\"n\" style=\"display:block\">"+data[i].imgCnt+"</em>";
					}
					html += "</a>";
					html += "</div></div></li>";
				}
				if(data.length>=10){
					//포토상품평 10개 이상 시 이미지 리스트 10개 출력 후 더보기 버튼 추가
					html += "<li class=\"swiper-slide more\"><div class=\"box\"><a href=\"javascript:;\" onclick=\"getGoodsPhotoCommentPop(); return false;\" class=\"link\" name=\"morePhotoCommentBtn\"><i class=\"t\">더보기</i></a></div></li>";
				}
	
				$("#imgListUl").append(html);
			}else{
				$("div[name^=photoCommentDiv_]").remove();
			}
		},
		getgoodsPhotoCommentPopResult : function(result){
			//$(".popRvPhoto").remove();
			//$("#goodsLayers").append(result);
			$("#goodsLayers").empty();
			$("#goodsLayers").html(result);
			ui.popLayer.open('popRvPhoto');
		},
		getGoodsCommentList : function(param){
			var _this = goodsComment;
			var data = {
				goodsId : _this.goodsId
				, goodsCstrtTpCd : _this.goodsCstrtTpCd
				, page : _this.page==null?1:_this.page
				, sidx : _this.sidx
				, sord : _this.sord
				, optGoodsId : _this.optGoodsId
			}
			
			var done = _this.getGoodsCommentListResult;
			
			if(param != null && param.callback != null){
				done = param.callback;
			}
			
			var options = {
				url : "/goods/getGoodsCommentList.do"
				, type : "POST"
				, dataType : "html"
				, data : data
				, done : done
			};
			ajax.call(options);
		},
		getGoodsCommentListResult : function(result){
			$('#commentListUl').html(result);
		},
		getGoodsCommentListMore : function(result){
			$('#commentListUl').append(result);
		},
		layerPopRemove : function(btn){
			var popId = $(btn).parents('article')[0].id;
			$("#"+popId).remove();
		},
		deleteGoodsComment : function(btn){
			var dataArea = $(btn).parents('div[name=estmDataArea]');
			ui.confirm('후기를 삭제할까요?',{ // 컨펌 창 옵션들
				ycb:function(){
					var options = {
						url : "/goods/deleteGoodsComment.do"
						, type : "POST"
						, data : {
							goodsId : goodsComment.goodsId
							, goodsEstmNo : $(dataArea).data('goodsEstmNo')
							, ordNo : $(dataArea).data('ordNo')
							, ordDtlSeq : $(dataArea).data('ordDtlSeq')
						}
						, done : function(result){
							var _this = goodsComment;
							_this.page = 1;
							_this.sidx = "SYS_REG_DTM";
							_this.sord = "DESC"
							
							var param = {
								callback : function(result){
									$('#commentListUl').html(result);
									ui.toast('후기가 삭제 되었어요');
								}
							}
							_this.getGoodsPhotoComment();
							_this.getGoodsCommentList(param);
							
						}
					};
					ajax.call(options);
				},
				ncb:function(){
					
				},
				ybt:"예",
				nbt:"아니오"
			});
			
		},
		reWriteGoodsComment : function(btn){
			var dataArea = $(btn).parents('div[name=estmDataArea]');
			var goodsEstmTp = "NOR";
			
			var url = "/mypage/commentWriteView"
			var html = '';
			html += '<input type="hidden" name="goodsId" value="'+ $(dataArea).data('goodsId') +'">';
			html += '<input type="hidden" name="goodsEstmTp" value="'+ goodsEstmTp +'">';
			html += '<input type="hidden" name="ordNo" value="'+$(dataArea).data('ordNo')+'">';
			html += '<input type="hidden" name="ordDtlSeq" value="'+$(dataArea).data('ordDtlSeq')+'">';
			html += '<input type="hidden" name="goodsEstmNo" value="'+ $(dataArea).data('goodsEstmNo') +'">';
			var goform = $("<form>",
				{ method : "post",
				action : url,
				target : "_self",
				html : html
				}).appendTo("body");
			goform.submit();
		},
		likeComment : function(btn){
			var loginYn = '0' != '0' ? 'Y' : 'N';
			if(loginYn == 'Y'){
				var dataArea = $(btn).parents('div[name=estmDataArea]');
				var options = {
					url : "/goods/likeComment.do"
					, type : "POST"
					, data : {goodsEstmNo : $(dataArea).data('goodsEstmNo')}
					, done : function(result){
						var count = result.count;
						var likeCnt = $(btn).children('.n').text();
						if(count == 0){
							$(btn).children('.n').text(parseInt(likeCnt)-1);
							if(likeCnt == '1'){
								$(btn).removeClass('on');
							}
						}else{
							$(btn).children('.n').text(parseInt(likeCnt)+1);
							$(btn).addClass('on');
						}
						$(btn).toggleClass('me');
					}
				}
				ajax.call(options);
			}else{
				ui.confirm('로그인 후 서비스를 이용할 수 있어요<br/>로그인 할까요?',{
					ycb: function () {
						document.location.href = '/indexLogin?returnUrl=' + encodeURIComponent(document.location.href);
					},
					ncb: function () {
						return false;
					},
					ybt: "로그인", // 기본값 "확인"
					nbt: "취소"  // 기본값 "취소"
				});
			}
			
		},
		commentReportPop : function(btn, anotherPop){
			var loginYn = '0' != 0 ? 'Y' : 'N';
			if(loginYn == 'Y'){
				var dataArea = $(btn).parents('div[name=estmDataArea]');
				var options = {
					url : "/goods/commentReportPop.do"
					, type : "POST"
					, data : {goodsEstmNo : $(dataArea).data('goodsEstmNo')}
					, type : "POST"
					, dataType : "html"
					, done : function(result){
						//$("#commentReportPop").remove();
						//$("#goodsLayers").append(result);
						$("#goodsLayers").empty();
						$("#goodsLayers").html(result);
						ui.popLayer.open('commentReportPop');
						if(anotherPop != null){
							//$("#"+anotherPop).css('z-index', $("#commentReportPop").css('z-index')-1);
							//APETQA-5573. 2021.06.02
							$("#commentReportPop").css('z-index', $("#"+anotherPop).css('z-index')+1);
						}
					}
				}
				ajax.call(options);
			}else{
				ui.confirm('로그인 후 서비스를 이용할 수 있어요<br/>로그인 할까요?',{
					ycb: function () {
						document.location.href = '/indexLogin?returnUrl=' + encodeURIComponent(document.location.href);
					},
					ncb: function () {
						return false;
					},
					ybt: "로그인", // 기본값 "확인"
					nbt: "취소"  // 기본값 "취소"
				});
			}
		},
		reportGoodsComment : function(){
			if($("input[name=rptpRsnCd]:checked").length != 0){
				var data = $.extend($("#rptpForm").serializeJson(), {rptpRsnContent : $("textarea[name=rptpRsnContent]").val()});
				
				var options = {
					url : "/goods/reportGoodsComment.do"
					, type : "POST"
					, data : data
					, done : function(result){
						ui.toast('신고가 완료되었어요');
						ui.popLayer.close("commentReportPop");
						$("#commentReportPop").remove();
					}
				}
				ajax.call(options);
			}else{
				ui.toast('신고사유를 선택해주세요');
			}
		},
		detailImgPop : function(clickImg){
			var clickImgPath = clickImg.src;
			var imgs = $(clickImg).parents('.pics').find('img');
			var selectIndex = imgs.index(clickImg);
			var bigHtml = '';
			var thumbHtml = '';
			for(var i = 0; i < imgs.length; i++){
				var imgPath = imgs[i].src;
				bigHtml += "<li class=\"swiper-slide\">"
				bigHtml += "<div class=\"box swiper-zoom-container\">"
				bigHtml += "<span class=\"pic\">"
				bigHtml += "<img class=\"img\" src=\""+imgPath+"\" alt=\"\">"
				bigHtml += "</span></div></li>"
				
				thumbHtml += "<li class=\"swiper-slide\">"
				thumbHtml += "<a href=\"javascript:;\" class=\"box\">"
				thumbHtml += "<span class=\"pic\">"
				thumbHtml += "<img class=\"img\" src=\""+imgPath+"\" alt=\"\">"
				thumbHtml += "</span></a></li>"
			}
			
			var options = {
				url : "/goods/includeGoodsCommentImgPop"
				, type : "POST"
				, dataType : "html"
				, data : {}
				, done : function(result){
					$("#goodsLayers").empty();
	 				$("#goodsLayers").html(result);
	 				
					ui.popLayer.open('popPdImgView');
					
					$("#bigImgArea").html(bigHtml);
					$("#thumbImgArea").html(thumbHtml);
					$("#pdPopFlag").val("COMMENT");
					$("#imgViewTitle").text("이미지 보기");

					ui.shop.pdPic.opt1 = {
						observer : true,
						observeParents : true,
						watchOverflow : true,
						simulateTouch : false,
						spaceBetween : 20,
						navigation : {
							nextEl : '.pdDtPicSld .sld-nav .bt.next',
							prevEl : '.pdDtPicSld .sld-nav .bt.prev',
						},
						initialSlide : selectIndex
					};

					ui.shop.pdPic.galleryTop = new Swiper(ui.shop.pdPic.els1, ui.shop.pdPic.opt1);
					ui.shop.pdPic.galleryThumbs = new Swiper(ui.shop.pdPic.els2, ui.shop.pdPic.opt2);
					
					$(document).on("click",".pdDtThmSld .slide>li .box",function(){
						var my_idx = $(this).closest("li").index();
						$(this).closest("li").addClass("active").siblings("li").removeClass("active");
						ui.shop.pdPic.galleryTop.slideTo(my_idx);
					});
					
					ui.shop.pdPic.galleryTop.on('slideChangeTransitionEnd', function(swiper) {
						// this.galleryThumbs.slideTo(2);
						var idx = this.realIndex + 1 ;
						$(".pdDtThmSld .slide>li:nth-child("+ idx +")").addClass("active").siblings("li").removeClass("active");
						ui.shop.pdPic.galleryThumbs.slideTo(this.realIndex-3 < 0 ? 0 : this.realIndex-3);
					});
					
					if("PC" != "PC"){
						$(".pdDtThmSld .slide>li .box").eq(selectIndex).click();
					}else{
						if(selectIndex == 0){
							$(".pdDtThmSld .slide>li").eq(selectIndex).addClass("active");
						}else{
							$(".pdDtThmSld .slide>li .box").eq(selectIndex).click();
						}
					}
					
				}
			};
			ajax.call(options);
		},
		getAllGoodsCommentDetail : function(goodsEstmNo){
			var options = {
				url : "/goods/getAllGoodsCommentDetail.do"
				, type : "POST"
				, dataType : "html"
				, data : {
						goodsId : goodsComment.goodsId
						, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
						, imgRegYn : "Y"
					}
				, done : function(result){
					//$(".popPhotoRv").remove();
					//$("#goodsLayers").append(result);
					$("#goodsLayers").empty();
					$("#goodsLayers").html(result);
					
					$(".popPhotoRv .phd .nm .s").text($(".photo_review_sld .swiper-container.slide.k0422 .revlists  > li").length)
					/* scroll 이벤트 추가 */
					if(ui.check_brw.mo()){
						$(".photo_review_sld .swiper-container.slide.k0422").scroll(function(){
							var $child = $(this).find(".revlists.swiper-wrapper > .swiper-slide");
							var max = $child.length;
							var position = new Array();
							var st =  $(this).scrollTop();
							var ind = 0;
							var maxPoint = ($(".photo_review_sld .swiper-container.slide.k0422 > .revlists").innerHeight() - $(".photo_review_sld .swiper-container.slide.k0422").innerHeight());
							$child.each(function(i,n){
								position[(max - i - 1)] = $(n).position().top;
							});
							for(var i=0; i<position.length; i++){
								if(st >= maxPoint){
									ind = max;
									break;
								}else if(st >= (position[i]) ){
									ind = max - i;
									break;
								}
							}
							$(".popPhotoRv .phd .nm .n").text(ind);
						})
					}
					
					var commentArea = $("#photoDetailList").children('li');
					var selectIndex = commentArea.index($("#photoCommentEstmNo_"+goodsEstmNo)[0]);
					if(true){
						var selectIndex = commentArea.index($("#photoCommentEstmNo_"+goodsEstmNo)[0]);
						$.extend(ui.shop.revPicSet.opt,
							{
								initialSlide : selectIndex,
								pagination: {
									el: '.goodsPhotoCommetListCount',
									type: 'custom',
									renderCustom : function(swiper , current , total){
										var html = '';
										html += '<i class="n" name="viewPoint">'+current+'</i>/<i class="s">'+total+'</i>';
										$(".goodsPhotoCommetListCount").html(html);
									}
								}
							}
						);
						$("i[name=viewPoint]").text(selectIndex+1);
						ui.shop.revPicSet.using();
					}
					ui.shop.revPic.using();
					
					ui.popLayer.open('popPhotoRv');
					$(".photo_review_sld .swiper-container.slide.k0422").scrollTop($("#photoCommentEstmNo_"+goodsEstmNo).position().top+2);
					
				}
			};
			ajax.call(options);
		}
	}
	
	
	
	var validateComment = {
		check : function(){
			var _this = validateComment;
			_this.scoreCheck();
			_this.qstCheck();
		},
		scoreCheck : function(){
			var score = $("#commentForm").find('li.f').length;
			if(score == 0){
				alert('별점을 선택해 주세요.');
				return false;
			}
		},
		qstCheck : function(){
			if($("div[name=goodsEstmQstArea]").length != 0){
				for(var i = 0; i < $("div[name=goodsEstmQstArea]").length; i++){
					var area = $("div[name=goodsEstmQstArea]")[i];
					if($(area).find("input[name^=estmQstNo_]:checked").length == 0){
						var msg = $(area).find(".tit").text();
						alert("\""+msg+"\" 항목을 평가 해주세요.");
						return false;
					}
				}
			}
		}
	}
	
	function removePop(btn){
		var popId = $(btn).parents('article')[0].id;
		ui.popLayer.close(popId);
		$("#"+popId).remove();
	}
	
	function getGoodsPhotoCommentPop(){
		var data = {
			url : "/goods/getGoodsPhotoCommentPop.do"
			, dataType : "html"
			, done : goodsComment.getgoodsPhotoCommentPopResult
		}
		goodsComment.getGoodsPhotoComment(data);
	}
	
	///////////////////////////////////////펫로그 후기
	var petLogList = {
			totalCount : null,
			totalPageCount : null,
			page : null,
			list : function(callback){
 				var done = petLogList.result;
				if(callback !=  null){
					done = callback;
				}
				var options = {
					url : "/goods/indexPetLogCommentList"
					, type : "POST"
					, dataType : "html"
					, data : {
							goodsId : goodsComment.goodsId
							, page : petLogList.page == null ? 1 : petLogList.page
							, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
						}
 					, done : done
			};
				ajax.call(options);
			},
			result : function(result){
 				$('#petLogList').html(result);
 				if(petLogList.totalCount > 0){
 					/* $("span[name=petLogTotal]").text("("+ petLogList.totalCount +"건)"); */
 	 				$("#petLogTotalCnt").text(petLogList.totalCount);	
 				}else{
 					$(".logPicMetric").text("등록된 후기가 없습니다.")
 					$(".logPicMetric").css("text-align" , "center")
 				}
 				
 			},
 			add : function(result){
 				$('#petLogList').append(result);
 			},
 			petLogMore : function(){
 				petLogList.page = petLogList.page*1 + 1;
 				petLogList.list(petLogList.add);
 			}
	}
	
	//펫로그 후기 상세
	function petlogReviewDetail(petLogNo , tag){
		var options = {
			url : "/goods/indexPetLogCommentDetailList"
			, type : "POST"
			, dataType : "html"
			, data : {
					index : $(tag).data("idx")
					, goodsId : goodsComment.goodsId
					, petDetailNo : petLogNo
					, totalCount : petLogList.totalCount
					, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
			}
			, done : function(result){
				//$(".popLogRv").remove();
 				//$("#goodsLayers").append(result);
				$("#goodsLayers").empty();
 				$("#goodsLayers").html(result);
 				var selectIndex = $("#petLogDetails").children('li[id^=petLogDetails_]').index($("#petLogDetails_"+ petLogNo));
				
				$.extend(ui.shop.revLogSet.opt, {
					initialSlide : selectIndex,
					pagination: {
						el: '.petLogCommentCount',
						type: 'custom',
						renderCustom : function(swiper , current , total){
							var html = '';
							current = current > 0 ? current : 1;
							html += '<i class="n" id="listIndex">'+current+'</i>/<i class="s">'+total+'</i>';
							$(".petLogCommentCount").html(html);
						}
					}
				})
 				setTimeout(function(){
	 				ui.shop.revLog.using();
	 				ui.shop.revLogSet.using();
					ui.popLayer.open('popLogRv');
 					move_scroll(selectIndex);
 				}, 50);
			}
		};
		ajax.call(options);
	}
</script>

<div class="hdts"> 
	<span class="tit"><em class="t">후기</em> <i class="i">1</i></span>
	<div class="bts">
		<!-- <a href="javascript:;" class="btn b btnRev" onclick="ui.popBot.open('popRevSel');">후기작성</a> -->
		<div style="display:none;">
			<form id="writePopDataForm">
				<input type="text" name="goodsId"/>
				<input type="text" name="goodsEstmTp"/>
			</form>
		</div>
	</div>
</div>
<div class="cdts">
	
	<!-- 구매만족도 -->
			<div class="uirevtabs">
				<ul class="menu">
					<li class="active">
						<button type="button" class="btn md" data-ui-tab-btn="tab_rvt" data-ui-tab-val="tab_rvt_a">일반 후기 1</button>
					</li>
					<li>
						<button type="button" class="btn md" data-ui-tab-btn="tab_rvt" data-ui-tab-val="tab_rvt_b">펫로그 후기 0</button>
					</li>
				</ul>
			</div>
		
			<!-- 일반후기 영역 -->
			<div data-ui-tab-ctn="tab_rvt" data-ui-tab-val="tab_rvt_a" class="tabrev rev_a active">
				<div class="uireviews">
					<div class="rvhdt phto" name="photoCommentDiv_1">
						<a href="javascript:;" class="rht">
						<span class="tit">포토후기</span>
						<span class="num" id="photoTotalCnt">0건</span>
						<em class="bt more" name="morePhotoCommentBtn">더보기</em>
						</a>
					</div>
					<div class="rvphotos"  name="photoCommentDiv_2">
						<div class="ui_rvphoto_slide">
							<div class="swiper-container slide">
								<ul class="swiper-wrapper list" id="imgListUl">
								<!-- 포토 후기 최대 10개 노출, 10개 이상 존재 시 더보기 버튼 노출 -->
								</ul>
							</div>
							<div class="sld-nav">
								<button type="button" class="bt prev">이전</button>
								<button type="button" class="bt next">다음</button>
							</div>
						</div>
					</div>
					<div class="rvhdt all">
						<div class="rht">
							<span class="tit">일반 후기</span><span class="num" name="commentAllCnt">1 건</span>
						</div>
						<div class="rdt">
							<nav class="uisort dsort">
								<button type="button" class="bt st" value="v_1">최신순</button>
								<div class="list"> 
									<ul class="menu">
										<li class="active"><button type="button" class="bt" name="sortBtn" value="v_1">최신순</button></li>
										<li><button type="button" class="bt" name="sortBtn" value="v_2">평점높은순</button></li>
										<li><button type="button" class="bt" name="sortBtn" value="v_3">평점낮은순</button></li>
									</ul>
								</div>
							</nav>
						</div>
					</div>
					<div class="revalls" name="commentArea">
						<div class="selopts" name="commentOptList">
							</div>
						<ul class="revlists" id="commentListUl">
							<!-- 상품평 리스트 영역 -->
						</ul>
						<div class="moreload">
							<button type="button" class="bt more" id="commentMore">일반후기 더보기</button>
						</div>
					</div>
				</div>
			</div>
			<div data-ui-tab-ctn="tab_rvt" data-ui-tab-val="tab_rvt_b" class="tabrev rev_b">
				<div class="uilogrevs">
					<div class="rvhdt">
						<a class="rht" href="javascript:;"><span class="tit">펫로그 후기</span><span class="num" name="petLogTotal">0건</span></a>
						<div class="rdt"> <div class="warning">펫로그 후기는 모바일앱에서 작성할 수 있습니다.</div></div>
					</div>
					<div class="logPicMetric on">
						<ul id="petLogList">
						</ul>
						<div class="moreload">
							<button type="button" class="bt more" id= "pegLogMoreBtn" onclick="petLogList.petLogMore();">펫로그 후기 더보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

<script>
	/* $(document).on("click",".uireviews .bt.hlp",function(){
		$(this).addClass("on"); // 숫자가 있으면 on
		$(this).addClass("me"); // 나가 추천하면 me
	}); */
	$(document).on("click",".logRvSet .contxt .bt.tog",function(e){
		$(this).closest(".rconbox").toggleClass("active");
	});
	$(document).on("click",".logRvSet .picture .bt.sound",function(e){
		$(this).toggleClass("on");
	});
</script></section>

							<!-- Qna -->
							<section class="sec qna" data-sid="pd-qna">
								<script type="text/javascript">
	$(function(){
		goodsQna.getGoodsInquiryList();
		//비밀 글 제외
		$("#hiddenCheck").on('click', function(){
			if(this.checked){
				goodsQna.hiddenYn = "N";
			}else{
				goodsQna.hiddenYn = "Y";
			}
			goodsQna.page = null;
			goodsQna.getGoodsInquiryList();
		});
		
		//문의 더보기
		$("#qnaMore").on('click', function(){
			goodsQna.page = parseInt(goodsQna.page) + 1;
			goodsQna.getGoodsInquiryList(goodsQna.addGoodsInquiry);
		});

		$("#goodsLayers").on('click', 'button[name=delImg]', function(){
			delImage(this);
		})
		
		//작성하기 :: PC - 팝업, MO - 페이지
		$("#writeQna").on('click', function(){
			if(goodsQna.mbrNo == 0){
				ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{
					ycb: function () {
						document.location.href = '/indexLogin?returnUrl=' + encodeURIComponent(document.location.href);
					},
					ncb: function () {
						return false;
					},
					ybt: "확인", // 기본값 "확인"
					nbt: "취소"  // 기본값 "취소"
				});
			}else{
				/* if(goodsQna.device == "PC"){ */
					var options = {
						url : "/goods/openGoodsQnaWritePop.do"
						, type : "POST"
						, dataType : "html"
						, done : function(result){
							//$("#popQnaMod").remove();
							//$("#goodsLayers").append(result);
							$("#goodsLayers").empty();
							$("#goodsLayers").html(result);
							ui.popLayer.open('popQnaMod');
						}
					};
					ajax.call(options);
				/* }else{
					location.href = "/goods/indexGoodsQna?goodsId=" + goodsQna.goodsId;
				} */
			}
			
		});
		
		//이미지 추가 버튼
		/* $("#goodsLayers").on('click', '#imgAddBtn-qna', function(){
			$("#goodsLayers").find('#imgAdd-qna').click();
		}); */
		
		//상품 문의 등록/수정
		$("#goodsLayers").on('click', '#insertQna', function(){
			if($("#qnaForm").find("input[name=goodsIqrNo]").val() != null && $("#qnaForm").find("input[name=goodsIqrNo]").val() != ''){
				goodsQna.updateGoodsQna();
			}else{
				goodsQna.insertGoodsQna();
			}
		});
		
		//이미지 삭제
		$("#goodsLayers").on('click', 'button[name=delImg]', function(){
			if($(this).parent().data('imgSeq') != null){
				var html = "<input type=\"hidden\" name=\"delImgSeqs\" value=\""+$(this).parent().data('imgSeq')+"\">";
				$("#qnaImgArea").append(html);
			}
			
			$(this).parents('li').remove();
			qnaImgCheck();
		});
		
		//작성하기 - 비밀글 여부 선택
		$("#goodsLayers").on('click', 'input[name=hiddenYnChck]', function(){
			if(this.checked){
				$("input[name=hiddenYn]").val("Y");
			}else{
				$("input[name=hiddenYn]").val("N");
			}
		});
		
		//작성하기 - 답변 알림 여부 선택
		$("#goodsLayers").on('click', 'input[name=rplAlmRcvYnChck]', function(){
			if(this.checked){
				$("input[name=rplAlmRcvYn]").val("Y");
			}else{
				$("input[name=rplAlmRcvYn]").val("N");
			}
		});
		
		//문의 글 등록버튼 제한 - 10자 이상 시 활성화
		$("#goodsLayers").on('propertychange keyup input change paste ', 'textarea[name=iqrContent]', function(){
			if($(this).val().length < 5){
				$("#insertQna").addClass('disabled');
				/* $("#insertQna").attr('disabled', 'disabled'); */
			}else{
				$("#insertQna").removeClass('disabled');
				/* $("#insertQna").removeAttr('disabled'); */
			}
			
			if($(this).val().length > 100){
				$(this).val($(this).val().substring(0,100));
				ui.toast("100자까지 입력 가능합니다");
			}
		});
		
		$(".layers").on('click', '#popQnaMod .btnPopClose', function(){
			ui.confirm('상품문의 작성을 취소할까요?',{ // 컨펌 창 옵션들
				ycb:function(){
					ui.popLayer.close('popQnaMod');
					$("#popQnaMod").remove();

					$(document).on("click", ".popLayer:not(.win, .popQnaMod) .btnPopClose:not(.none, [name=notClose])", function() {
						var id = $(this).closest(".popLayer").attr("id");
						ui.popLayer.close(id);
					});
				},
				ncb:function(){
					return false;
				},
				ybt:'예',
				nbt:'아니요'
			});
			
		})
		
	});
	var goodsQna = {
		goodsId : "PI000005494",
		hiddenYn : "Y",
		page : null,
		mbrNo : '0',
		totalPageCount : null,
		device : 'PC',
		getGoodsInquiryList : function(callback){
			var done = goodsQna.getGoodsInquiryResult;
			if(callback != undefined && callback != null){
				done = callback;
			}
			var options = {
				url : "/goods/getGoodsInquiryList.do"
				, type : "POST"
				, dataType : "html"
				, data : {
						goodsId : goodsQna.goodsId
						, hiddenYn : goodsQna.hiddenYn
						, page : goodsQna.page==null?1:goodsQna.page
					}
				, done : done
			};
			ajax.call(options);
		},
		getGoodsInquiryResult : function(result){
			$("#qnaListScript").remove();
			$('#qnaList').html(result);
		},
		addGoodsInquiry : function(result){
			$("#qnaListScript").remove();
			$('#qnaList').append(result);
		},
		insertGoodsQna : function(){
			var imgRegYn = $("#qnaImgArea").children('li').length != 0?'Y':'N';

			if($("textarea[name=iqrContent]").val().length == 0){
				ui.toast('작성된 내용이 없습니다.');
				return false;
			}else if($("textarea[name=iqrContent]").val().length < 5){
				ui.alert('내용을 5자 이상 입력해주세요');
				return false;
			}else if($("#insertQna").hasClass('disabled')){
				return false;
			}else{
				var addData = {
					goodsId : goodsQna.goodsId
					, iqrContent : $("textarea[name=iqrContent]").val()
				}
				var data = $.extend($("#qnaForm").serializeJson(), addData);
				
				if(goodsQna.device == 'APP'){
					data.imgPaths = null;
				}
				
				var options = {
					url : "/goods/insertGoodsQna.do"
					, type : "POST"
					, data : data
					, done : function(result){
						if("PC" == "APP" && imgRegYn == 'Y') {
							$("input[name=goodsIqrNo]").val(result.goodsIqrNo);
							onFileUpload(result.goodsIqrNo);
						}else{
							ui.popLayer.close('popQnaMod');
							goodsQna.hiddenYn = "Y";
							goodsQna.page = null;
							ui.toast('문의내용이 등록되었어요');
							goodsQna.getGoodsInquiryList();
							$("#qnaHidden").show();
	
							$(document).on("click", ".popLayer:not(.win, .popQnaMod) .btnPopClose:not(.none, [name=notClose])", function() {
								var id = $(this).closest(".popLayer").attr("id");
								ui.popLayer.close(id);
							});
						}
					}
				};
				ajax.call(options);
				
			}
		},
		reWriteQna : function(goodsIqrNo){
			location.href = "/goods/indexGoodsQna?goodsId=" + goodsQna.goodsId + "&&goodsIqrNo=" + goodsIqrNo;
		},
		updateGoodsQna : function(){
			if($("textarea[name=iqrContent]").val().length == 0){
				ui.toast('작성된 내용이 없습니다.');
				return false;
			}else if($("textarea[name=iqrContent]").val().length < 5){
				ui.alert('내용을 5자 이상 입력해주세요');
				return false;
			}else if($("#insertQna").hasClass('disabled')){
				return false;
			}else{
			
				var imgRegYn = $("#qnaImgArea").find('img[name=goodsQnaImg]').length != 0?'Y':'N';
				
				var addData = {
					goodsId : goodsQna.goodsId
					, iqrContent : $("textarea[name=iqrContent]").val()
				}
				var data = $.extend($("#qnaForm").serializeJson(), addData);
				
				if(goodsQna.device == 'APP'){
					data.imgPaths = null;
				}
				
				var options = {
					url : "/goods/updateGoodsQna.do"
					, type : "POST"
					, data : data
					, done : function(result){
						if("PC" == "APP" && imgRegYn == 'Y') {
							$("input[name=goodsIqrNo]").val(result.goodsIqrNo);
							onFileUpload(result.goodsIqrNo);
						}else{
							ui.popLayer.close('popQnaMod');
							goodsQna.hiddenYn = "Y";
							goodsQna.page = null;
							goodsQna.getGoodsInquiryList();
						}
					}
				};
				ajax.call(options);
			}
		},
		deleteQna : function(goodsIqrNo){
			var options = {
				url : "/goods/deleteGoodsInquiry.do"
				, type : "POST"
				, data : {goodsIqrNo : goodsIqrNo}
				, done : function(result){
					ui.toast('문의하신 글이 삭제되었어요');
					goodsQna.hiddenYn = "Y";
					goodsQna.page = null;
					goodsQna.getGoodsInquiryList();
				}
			};
			ajax.call(options);
		},
		imageUpload : function(){
			if ($('li[id^="qnaImgArea_"]').length >= 5) {
				alert("파일 첨부는 최대 5개까지 가능합니다");
				return false;
			}
			// 파일 추가
			/* fileUpload.inquiry(goodsQna.resultImage); */
			fileUpload.callBack = goodsQna.resultImage;
			$("#fileUploadForm").remove();
			var html = [];
			html.push("<form name=\"fileUploadForm\" id=\"fileUploadForm\" method=\"post\" enctype=\"multipart/form-data\">");
			html.push("	<div style=\"display:none;\">");
			html.push("		<input type=\"file\" name=\"uploadFile\" id=\"uploadFile\"  accept=\"image/*\"/>");
			html.push("		<input type=\"hidden\" name=\"uploadType\" value=\"inquiry\">");
			html.push("	</div>");
			html.push("</form>");
			$("body").append(html.join(''));
			$("#uploadFile").click();
		},
		resultImage : function(file){
			var area = "";
			var count = "1";
			area = $("li[id^=qnaImgArea_]").length!=0?$("li[id^=qnaImgArea_]").last()[0]:null;
			if(area != null && area != ""){
				count = parseInt(area.id.split('_')[1])+1;
			}
			
			var html = "";
			html += "<li id=\"qnaImgArea_"+ count +"\">";
			html += "<input type=\"hidden\" name=\"imgPaths\" value=\""+file.filePath+"\"/>";
			html += "<span class=\"pic\" >";
			html += "<img class=\"img\" src=\"/common/imageView.do?filePath="+file.filePath+"\" alt=\"사진\">";
			html += "<button type=\"button\" class=\"bt del\" name=\"delImg\">삭제</button>";
			html += "</span>";
			html += "</li>";
			$("#qnaImgArea").append(html);
			
			qnaImgCheck();
		},
		appResultImage : function(result){
			imageResult = JSON.parse(result);
			var area = "";
			var count = "1";
			area = $("li[id^=qnaImgArea_]").length!=0?$("li[id^=qnaImgArea_]").last()[0]:null;
			if(area != null && area != ""){
				count = parseInt(area.id.split('_')[1])+1;
			}
			
			var html = "";
			html += "<li id=\"qnaImgArea_" + count + "\">";
			html += "<input type=\"hidden\" name=\"imgPaths\" value=\"" + imageResult.imageToBase64 + "\"/>";
			html += "<span class=\"pic\" >";
			html += "<img class=\"img\" name=\"goodsQnaImg\" id=\""+ imageResult.fileId + "\"src=\"" + imageResult.imageToBase64 + "\" alt=\""+imageResult.mediaType +"\">";
			html += "<button type=\"button\" class=\"bt del\" onclick=\"callAppFunc(\"onDeleteImage\",this);\" name=\"delImg\">삭제</button>";
			html += "</span>";
			html += "</li>";
			$("#qnaImgArea").append(html);
			
			qnaImgCheck();
		},
		appDeleteResultImage : function(result){
			var imageResult = $.parseJSON(result);
			$("#"+imageResult.fileId).parents("li").remove();

			qnaImgCheck();
		}
	}

	function delImage(btn){
		var html = '';
		if($(btn).parent().data('imgSeq') != null){
			html += "<input type=\"hidden\" name=\"delImgSeq\" value=\""+$(btn).parent().data('imgSeq')+"\">";
			$("#commentImgArea").append(html);
		}
		
		$(btn).parents('li').remove();
		
		qnaImgCheck();
	}
	
	function qnaMenu(btn){
		var dataLi = $(btn).parents('li[name=qnaListLi]');
		var goodsIqrNo = dataLi.data('goodsIqrNo');
		var btnGb = $(btn).attr('name');
		if(btnGb == 'reWriteBtn'){
			/* if(goodsQna.device == "PC"){ */
				var imgPaths = new Array();
				var imgSeqs = new Array();
				
				//$("#qnaForm input[name=goodsIqrNo]").val(goodsIqrNo);
				/* qnaImgArea
				 */ 
				if($(dataLi).find('ul[name=qnaPics] li').length > 0){
					for(var i = 0; i < $(dataLi).find('ul[name=qnaPics] li').length; i++){
						var qnaImg = $(dataLi).find('ul[name=qnaPics] li').find('img');
						imgPaths.push(qnaImg[i].src);
						imgSeqs.push($(qnaImg[i]).data('imgSeq'));
					}
				}

				var data = {
					goodsIqrNo : goodsIqrNo
					, imgPaths : imgPaths
					, imgSeqs : imgSeqs
					, iqrContent : $(dataLi).children('div').children('div[name=qnaTit]').text()
					, hiddenYn : dataLi.data('hiddenYn')
					, rplAlmRcvYn : dataLi.data('rplAlmRcvYn')
				}
				
				var options = {
					url : "/goods/openGoodsQnaWritePop.do"
					, type : "POST"
					, dataType : "html"
					, data : data
					, done : function(result){
						//$("#popQnaMod").remove();
						//$("#goodsLayers").append(result);
						$("#goodsLayers").empty();
						$("#goodsLayers").html(result);
						ui.popLayer.open('popQnaMod');
						
						$(document).off("click" , ".popLayer:not(.win) .btnPopClose:not(.none)");
					}
				};
				ajax.call(options);
					
			/* }else{
				//모바일ver
				goodsQna.reWriteQna(goodsIqrNo);
			} */
			
		}else if(btnGb == 'deleteQnaBtn'){
			ui.confirm('문의하신 글을 삭제할까요?',{ // 컨펌 창 옵션들
			    ycb:function(){
					goodsQna.deleteQna(goodsIqrNo);
			    },
			    ncb:function(){
					
			    },
			    ybt:"예", // 기본값 "확인"
			    nbt:"아니요"  // 기본값 "취소"
			});
			
			
		}
	}

	function onFileUpload(estmNo){
		callAppFunc('onFileUpload', estmNo);
	}

	function callAppFunc(funcNm, obj) {
		toNativeData.func = funcNm;
		if(funcNm == 'onOpenGallery'){ // 갤러리 열기
			// 데이터 세팅
			toNativeData.useCamera = "P";
			toNativeData.usePhotoEdit = "N";
			toNativeData.galleryType = "P"
			//미리보기 영역에 선택된 이미지가 있을 경우.------------//
			let fileIds = new Array();
			let fileIdDivs = $("img[name=goodsQnaImg]");
			fileIdDivs.each(function(i, v) {
				fileIds[i] = $(this).attr("id");
			})
			toNativeData.fileIds = fileIds;
			//---------------------------------------//
			orgImgCnt = $("span[name=orgImg]").length;
			toNativeData.maxCount = (5 - orgImgCnt) + "";
			toNativeData.callback = "goodsQna.appResultImage";
			toNativeData.callbackDelete = "goodsQna.appDeleteResultImage";
		}else if(funcNm == 'onDeleteImage'){ // 미리보기 썸네일 삭제
			// 데이터 세팅
			var fileId = $(obj).parent().find("img").attr("id");
			// 화면에서 이미지 삭제
			/* if($(obj).parent().data('imgSeq') != null){
				html += "<input type=\"hidden\" name=\"delImgSeq\" value=\""+$(obj).parent().data('imgSeq')+"\">";
				$("#qnaImgArea").append(html);
			} */
			
			$(obj).parents('li').remove();
			
			// 데이터 세팅
			toNativeData.func = "onDeleteImage";
			toNativeData.fileId = fileId;
			toNativeData.callback = "qnaImgCheck";

		}else if(funcNm == 'onFileUpload'){ // 파일 업로드
			// 데이터 세팅
			toNativeData.func = funcNm;
			toNativeData.prefixPath = "/goodsInquiry/"+obj;
			toNativeData.callback = "onFileUploadCallBack";

		}else if(funcNm == 'onClose'){ // 화면 닫기
			// 데이터 세팅
			toNativeData.func = funcNm;
		}
		// 호출
		toNative(toNativeData);
	}	

	function onFileUploadCallBack(result) {
		var file = JSON.parse(result);
		var goodsIqrNo = $("input[name=goodsIqrNo]").val();
		var imgPaths = new Array();
		/* file.images[0].filePath */
		if(file.images.length != 0){
			for(var i = 0; i < file.images.length; i++){
				imgPaths.push(file.images[i].filePath);
			}
		}
		
		var options = {
			url : "/goods/appInquiryImageUpdate"
			, data : { goodsIqrNo : goodsIqrNo, imgPaths : imgPaths }
			, done : function(result) {
				ui.popLayer.close('popQnaMod');
				goodsQna.hiddenYn = "Y";
				goodsQna.page = null;
				ui.toast('문의 내용이 등록되었습니다.');
				goodsQna.getGoodsInquiryList();
			}
		}
		ajax.call(options);
	}
	
	
	//이미지 갯수 체크
	function qnaImgCheck(){
		if($("#qnaImgArea").children('li').length >= 5){
			$("#imgAddBtn-qna").attr('disabled', 'disabled');
			$("#imgAddBtn-qna").css('opacity', '0.5');
			$("#imgAddBtn-qna").addClass('disabled');
		}else{
			$("#imgAddBtn-qna").removeAttr('disabled');
			$("#imgAddBtn-qna").css('opacity', '');
			$("#imgAddBtn-qna").removeClass('disabled');
		}
	};
	
	/* function onDeletePreviewProfileImage */
</script>

<div class="hdts">
	<span class="tit"><em class="t">Q&amp;A</em> <i class="i" name="pdQnaCnt"></i></span>
	<div class="bts"><a href="javascript:;" class="btn b btnQna" id="writeQna">문의하기</a></div>
</div>
<div class="cdts">
	<div class="uiqnalist">
		<div class="secret" id="qnaHidden"><label class="checkbox"><input type="checkbox" id="hiddenCheck"><span class="txt"><em class="tt">비밀글 제외</em></span></label></div>
		<ul id="qnaList" class="uiAccd qalist" data-accd="tog">
		</ul>
		<div class="moreload" >
			<button type="button" class="bt more" id="qnaMore">Q&A 더보기</button>
		</div>
	</div>
</div></section>

							<!-- 함께 많이 보는 상품 -->
							<script type="text/javascript">

</script>
<!-- 사용자 맞춤 추천상품 -->
							<script type="text/javascript">

</script>
<section class="sec custm">
<div class="hdts">
	<span class="tit"><em class="t">함께 비교하면 좋을 상품</em></span>
</div>
<div class="cdts">
	<div class="ui_custm_slide">
		<!-- ui.shop.custm.using(); -->
		<div class="swiper-container slide">
			<ul class="swiper-wrapper list">
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=PI000000379" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/14/07/14/3697/3697_detail_080.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="PI000000379" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=PI000000379" class="lk">인 피모영양제 680g</a></div>
								<div class="inf">
									<span class="prc"><em class="p">27,000</em><i class="w">원</i></span>
									<span class="pct"><em class="n">29</em><i class="w">%</i></span>
									</div>
							</div>
						</div>
					</li>
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=PI000003661" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/PI000003661/PI000003661_1.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="PI000003661" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=PI000003661" class="lk">아침애 수제사료 피부개선 1.8kg</a></div>
								<div class="inf">
									<span class="prc"><em class="p">18,000</em><i class="w">원</i></span>
									<span class="pct"><em class="n">42</em><i class="w">%</i></span>
									</div>
							</div>
						</div>
					</li>
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=PI000001683" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/18/07/31/2495409/2495409_detail_046.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="PI000001683" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=PI000001683" class="lk">식탐 오리점보버거 200g</a></div>
								<div class="inf">
									<span class="prc"><em class="p">1,100</em><i class="w">원</i></span>
									<span class="pct"><em class="n">45</em><i class="w">%</i></span>
									</div>
							</div>
						</div>
					</li>
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=PI000003665" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/19/06/24/2497340/2497340_detail_012.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="PI000003665" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=PI000003665" class="lk">아침애 수제사료 피부개선 3kg</a></div>
								<div class="inf">
									<span class="prc"><em class="p">30,000</em><i class="w">원</i></span>
									<span class="pct"><em class="n">41</em><i class="w">%</i></span>
									</div>
							</div>
						</div>
					</li>
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=PI000002329" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/19/12/52/2499585/2499585_detail_086.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="PI000002329" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=PI000002329" class="lk">로얄캐닌 독 미니 코트 케어 파우치 85g</a></div>
								<div class="inf">
									<span class="prc"><em class="p">1,350</em><i class="w">원</i></span>
									<span class="pct"><em class="n">32</em><i class="w">%</i></span>
									</div>
							</div>
						</div>
					</li>
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=PI000003426" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/20/07/31/2502154/2502154_detail_016.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="PI000003426" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=PI000003426" class="lk">벨버드 져키킹 S 1kg</a></div>
								<div class="inf">
									<span class="prc"><em class="p">9,900</em><i class="w">원</i></span>
									<span class="pct"><em class="n">21</em><i class="w">%</i></span>
									</div>
							</div>
						</div>
					</li>
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=PI000004075" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/20/09/38/2503009/2503009_detail_031.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="PI000004075" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=PI000004075" class="lk">나인케어 피부&피모 1.2kg</a></div>
								<div class="inf">
									<span class="prc"><em class="p">13,500</em><i class="w">원</i></span>
									<span class="pct"><em class="n">10</em><i class="w">%</i></span>
									</div>
							</div>
						</div>
					</li>
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=PI000005085" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/20/12/49/2504210/2504210_detail_032.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="PI000005085" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=PI000005085" class="lk">퓨리나 원 피부건강 3.4kg</a></div>
								<div class="inf">
									<span class="prc"><em class="p">26,000</em><i class="w">원</i></span>
									<span class="pct"><em class="n">21</em><i class="w">%</i></span>
									</div>
							</div>
						</div>
					</li>
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=PI000005430" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/PI000005430/PI000005430_1.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="PI000005430" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=PI000005430" class="lk">하림펫푸드 더리얼 저키 돼지귀 60g</a></div>
								<div class="inf">
									<span class="prc"><em class="p">6,000</em><i class="w">원</i></span>
									</div>
							</div>
						</div>
					</li>
				<li class="swiper-slide">
						<div class="gdset custm">
							<div class="thum">
								<a href="/goods/indexGoodsDetail?goodsId=GS251024927" class="pic">
									<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
									<img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/GS251024927/27869781-c17f-4cc1-83cc-ff728e8e91b6.jpg?type=f&w=259&h=259&quality=90&align=4" alt="" />									
								</a>
								<button type="button" class="bt zzim " data-content="GS251024927" data-target="goods" data-action="interest">찜하기</button>
							</div>
							<div class="boxs">
								<div class="cate"></div>
								<div class="tit"><a href="/goods/indexGoodsDetail?goodsId=GS251024927" class="lk">[1+1] 메디코펫 데일리 덴탈바 스킨코트&이어 14개입</a></div>
								<div class="inf">
									<span class="prc"><em class="p">16,000</em><i class="w">원</i></span>
									<span class="pct"><em class="n">50</em><i class="w">%</i></span>
									</div>
							</div>
						</div>
					</li>
				</ul>
		</div>
		<div class="sld-nav">
			<button type="button" class="bt prev">이전</button>
			<button type="button" class="bt next">다음</button>
		</div>
	</div>
</div>
</section>
<!-- 최근 본 상품 ajax로 변경-->
<section class="sec recent" id="recentGoodsList">
							</section>
						</div>
					</div>
				</div>
			</div>
		</main>

		<article class="uiPdOrdPan" id="uiPdOrdPan">
			<input type="hidden" name="goodsItemTotalAmt" id="goodsItemTotalAmt" value="28000" />
			<button type="button" class="btDrag">열기/닫기</button>
			<div class="hdts">
				<div class="inr">
					<div class="bts"><button type="button" class="bt close">닫기</button></div>
					<span class="tit">상품선택</span>
				</div>
			</div>
			<script type="text/javascript">
	var indexOrdpan = 1;
	$(document).ready(function(){

		var goodsCstrtTpCd = "ITEM";

		// 수량 직접 변경시 가격 및 총수량 계산
		if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET") {

			$(document).off("click", ".uispiner .bt");
			$(document).off("click", ".uispiner .plus");
			$(document).on("click",".uispiner .plus",function(e) {
				e.preventDefault();
				var $qtyObj = $(this).siblings(".amt");
				console.log('includeGoodsOrdpanDetail click plus ' + parseInt($qtyObj.val()))
				var maxOrdQty = $qtyObj.data("maxOrdQty") ? $qtyObj.data("maxOrdQty") : 999;
				var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";

				if (!maxOrdQty || parseInt($qtyObj.val()) < maxOrdQty) {
					var cartQty = parseInt($qtyObj.val()) + 1;
					//var cartQty = parseInt($qtyObj.val());
					var itemNo = $qtyObj.data("itemNo");
					//$("#buyQty" + itemNo).attr("value", cartQty);
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty);
					var goodsCstrtTpCd = "ITEM";
					//console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", itemNo : " + itemNo + ", cartQty : " + cartQty);
					if(ordmkiYn == "Y"){	// 각인여부
						indexOrdpan++;
						if(!document.getElementById('spanOrdmki_'+ itemNo + '_' + cartQty)){
							var spanText = "";
							var n2Class = "";
							if(9 < cartQty){
								n2Class = "n2";
							}
							spanText += "<span class='input nms "+n2Class+"' id='spanOrdmki_"+itemNo+"_"+cartQty+"'>";
							spanText += "	<i class='n'>"+cartQty+".</i><input type='text' name='inputOrdmki' id='inputOrdmki_"+itemNo+"_"+cartQty+"' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onkeydown='javascript:fnCheckOrdmkiTextLength(this);' >";
							spanText += "</span>";
							//$("#divOrdmki_"+cartQty-1).html($("#divOrdmki_"+cartQty).html() + spanText);
							var gudText = "<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>";
							$("#divOrdmki_"+itemNo + " .gud").remove();
							$("#divOrdmki_"+itemNo).append(spanText + gudText);
						}
					}

					if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
						fnClickItemTotalCnt(itemNo, cartQty);
					}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
						var originSaleAmt = $qtyObj.data("saleAmt");
						fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
					}
				}else{
					var cartQty = parseInt($qtyObj.val());
					if(cartQty == maxOrdQty) {
					} else {
						cartQty = parseInt($qtyObj.val()) -1;
					}
					var itemNo = $qtyObj.data("itemNo");
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty);
					fnGoodsUiToast("최대 " + maxOrdQty + "개까지 구매할 수 있어요", "maxOrdQty");
				}
			});

			$(document).off("click", ".uispiner .bt");
			$(document).off("click", ".uispiner .minus");
			$(".uispiner .minus").prop("disabled", "");
			$(document).on("click",".uispiner .minus",function(e){
				e.preventDefault();
				var $qtyObj = $(this).siblings(".amt");
				console.log('includeGoodsOrdpanDetail click minus ' + parseInt($qtyObj.val()))
				var minOrdQty = $qtyObj.data("minOrdQty") ? $qtyObj.data("minOrdQty") : 1;
				var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";
				if (parseInt($qtyObj.val()) > minOrdQty) {
					var cartQty = parseInt($qtyObj.val()) - 1;
					//var cartQty = parseInt($qtyObj.val())
					var itemNo = $qtyObj.data("itemNo");
					//$("#buyQty" + itemNo).attr("value",cartQty);
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty);
					if(indexOrdpan <= 0){
						indexOrdpan = 1;
					}else{
						indexOrdpan--;
					}

					var goodsCstrtTpCd = "ITEM";
					console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", itemNo : " + itemNo + ", cartQty : " + cartQty);

					if(ordmkiYn == "Y"){
						$("[id^=spanOrdmki_" + itemNo + "_]").each(function(index){
							var idx = index + 1;
							if(cartQty < idx){
								$(this).remove();
							}
						});
					}

					if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
						fnClickItemTotalCnt(itemNo, cartQty);

					}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
						var originSaleAmt = $qtyObj.data("saleAmt");
						console.log("originSaleAmt : " + originSaleAmt);
						fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
					}
				}else{
					var cartQty = parseInt($qtyObj.val());
					if(cartQty == minOrdQty){
						cartQty = parseInt($qtyObj.val());
					} else if(parseInt($qtyObj.val()) - 1 == 0) {
						cartQty = parseInt($qtyObj.val());
					} else {
						cartQty = parseInt($qtyObj.val()) - 1;
					}
					var itemNo = $qtyObj.data("itemNo");
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty);
					fnGoodsUiToast("최소" + minOrdQty + "개이상 구매할 수 있어요", "maxOrdQty");
				}
			});
		}
	});


	// ITEM, SET
	function fnClickItemTotalCnt(itemNo, cartQty){
		var priceCnt = Number(cartQty);
		var originPrice = Number("28000");
		var priceAmt = valid.numberWithCommas(originPrice * priceCnt);
		//console.log("priceCnt : " + priceCnt + ", originPrice : " + originPrice + ", priceAmt : " + priceAmt);
		$("#emPriceTotalCnt").html(priceCnt);
		$("#emPriceTotalAmtItem").html(priceAmt);
		$("#emPriceTotalAmt").html(priceAmt);
	}

	// PAK, ATTR
	function fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt){

		var totalPriceAmt = 0;
		var toalCartQtyCnt = 0;
		$("[id^=selected_itemNo_]").each(function(index){
			var itemNoSelected = $("[id^=selected_itemNo_]").eq(index).val();
			var cartQtyNumber = Number($("#buyQty"+itemNoSelected).val());
			//console.log("cartPriceNumber : " + Number(originSaleAmt) + ", cartQtyNumber : " + cartQtyNumber);
			if(itemNoSelected == itemNo){
				cartQtyNumber = Number(cartQty);
				var priceAmt = valid.numberWithCommas(Number(originSaleAmt * Number(cartQty)));
				$("#buyPriceRight"+itemNoSelected).html(priceAmt);
				$("#inputBuyPriceRight"+itemNoSelected).val(priceAmt);
			}
			//totalPriceAmt = (totalPriceAmt + (Number(originSaleAmt * cartQtyNumber)));
			totalPriceAmt += Number(removeComma($("#inputBuyPriceRight"+itemNoSelected).val()));
			toalCartQtyCnt = (toalCartQtyCnt + cartQtyNumber);
			//console.log("cartPriceNumber : " + Number(originSaleAmt) + ", cartQtyNumber : " + cartQtyNumber);
		});

		//console.log("totalPriceAmt : " + totalPriceAmt + ", toalCartQtyCnt : " + toalCartQtyCnt);
		$("#emPriceTotalCnt").html(toalCartQtyCnt);
		//$("#emPriceTotalAmtItem").html(valid.numberWithCommas(totalPriceAmt * toalCartQtyCnt));
		//console.log("buyQty itemNo : " + $("#buyQty"+itemNo).val());
		$("#emPriceTotalAmt").html(valid.numberWithCommas(totalPriceAmt));

	}

	function fnChangebuyQty(obj){
		var $qtyObj = $("#"+obj.id);
		var itemNo = $qtyObj.data("itemNo");
		var minOrdQty = $qtyObj.data("minOrdQty") ? $qtyObj.data("minOrdQty") : 1;
		var maxOrdQty = $qtyObj.data("maxOrdQty") ? $qtyObj.data("maxOrdQty") : 999;
		var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";

		console.log("$qtyObj : "+ $qtyObj + " minOrdQty : "+minOrdQty + " maxOrdQty : "+maxOrdQty + " ordmkiYn: "+ ordmkiYn );

		var cartQty = $qtyObj.val();
		cartQty = cartQty.replace(/[^0-9]/g, '');

		// MIN 구매수량 제한
		if(cartQty < minOrdQty){
			fnGoodsUiToast("최소 " + minOrdQty + "개이상 구매할 수 있어요", "minOrdQty");
			//$qtyObj.val(minOrdQty);
			cartQty = minOrdQty;
		}

		// MAX 구매수량 제한
		if(cartQty > maxOrdQty){
			fnGoodsUiToast("최대 " + maxOrdQty + "개까지 구매할 수 있어요", "maxOrdQty");
			//$qtyObj.val(maxOrdQty);
			cartQty = maxOrdQty;
		}

		$qtyObj.val(cartQty).attr("value",cartQty);


		var goodsCstrtTpCd = "ITEM";

		// 수량 직접 변경시 가격 및 총수량 계산
		if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
			fnClickItemTotalCnt(itemNo, cartQty);

		}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
			var originSaleAmt = $qtyObj.data("saleAmt");
			fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
		}

		// 제작상품 시 입력폼 수정
		if(ordmkiYn == "Y"){
			var inputOrmkiLen = $("[id^=inputOrdmki_"+itemNo+"_]").length;

			if(inputOrmkiLen < cartQty){	// 변경된 값이 기존값 보다 클때 ( + 기능 )


				var spanText = "";
				$("#divOrdmki_"+itemNo + " .gud").remove();
				//$("[id^=inputOrdmki_"+itemNo+"_]").remove();
				for(var i = 1; i <= cartQty; i++){
					if(!document.getElementById('spanOrdmki_'+ itemNo + '_' + i)){
						spanText += "<span class='input nms' id='spanOrdmki_"+itemNo+"_"+i+"'>";
						spanText += "	<i class='n'>"+i+".</i><input type='text' name='inputOrdmki' id='inputOrdmki_"+itemNo+"_"+i+"' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onkeydown='javascript:fnCheckOrdmkiTextLength(this);'>";
						spanText += "</span>";
					}
				}
				var gudText = "<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>";
				$("#divOrdmki_"+itemNo).append(spanText + gudText);

			}else {	// 변경된 값이 기존값 작을 때 ( - 기능 )
				for(var i = 1; i <= inputOrmkiLen; i++){
					if(cartQty < i){
						$("#divOrdmki_"+itemNo + " #spanOrdmki_" + itemNo + "_" + i).remove();	// 항목 삭제
					}
				}
			}
		}
	}

	function fnCartItems(nowBuyYn){
		var isLogin = "false";
		// 요약정보에서 호출시 check
		var uiPdOrdPanClass = $("#uiPdOrdPan").attr("class");
		var productOptionClass = $("#productOption").attr("class");

		var setCartItemsCheck = false;
		// 비로그인 상태에서 장바구니기능이 가능하도록 처리.21.03.05
		console.log("uiPdOrdPanClass : " + uiPdOrdPanClass + ", isLogin : " + isLogin);

		if(uiPdOrdPanClass == undefined){
			// 상품 요약일때
			if(productOptionClass.indexOf("none") > -1){
				setCartItemsCheck = true;
			}
		}else{
			// 상품 상세일때
			if(uiPdOrdPanClass.indexOf("open") > -1){
				setCartItemsCheck = true;
			}
		}

		//if(uiPdOrdPanClass.indexOf("open") > -1){	
		if(setCartItemsCheck){
			var goodsCstrtTpCd = 'ITEM';
			var goodsId = 'PI000005494';
			var itemNo = '353934';
			var totalCnt = $("#emPriceTotalCnt").html().trim();
			console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", itemNo : " + itemNo + ", goodsId : " + goodsId + ", totalCnt : " + totalCnt);


			if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){

				if(totalCnt < 1){
					ui.alert("상품 수량을 선택해주세요.");
					return;
				}

				if("" === "SOON"){

					var reservationStrtDtm = "";
					var reservationDate = new Date(reservationStrtDtm).dateFormat('MM월dd일');
					/* var reservationDay = reservationDate.getDate() < 10 ? "0" + reservationDate.getDate() : reservationDate.getDate(); */
					fnGoodsUiToast("사전예약 상품은 "+ reservationDate +"부터 구매할 수 있어요", "reservation");
					return;
				}

				var ordmkiYn = "N";
				var inputOrdmki = "";
				if(ordmkiYn == "Y" && goodsCstrtTpCd == "ITEM"){

					var inputOrmkiLen = $("[id^=inputOrdmki_"+itemNo+"_]").length;

					for(var i=1; i <= inputOrmkiLen; i++){
						var tempText = $("#inputOrdmki_"+itemNo+"_"+i).val().trim();
						if(tempText == ""){
							ui.alert("각인문구를 입력해주세요");
							$("#inputOrdmki_"+itemNo+"_"+i).val("");
							$("#inputOrdmki_"+itemNo+"_"+i).focus();
							return;
						}else{
							console.log("inputOrdmki : " + tempText);
							if(i == 1){
								//inputOrdmki = btoa(unescape(encodeURIComponent(tempText)));
								inputOrdmki = tempText;
							}else{
								inputOrdmki = inputOrdmki + "|" + tempText;
							}
						}
					}
				}

				console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", nowBuyYn : " + nowBuyYn + ", inputOrdmki : " + inputOrdmki);
				// new TextEncoder('base64').encode('A')
				// 장바구니 이동
				if(nowBuyYn == "N" || isLogin == "true"){
					console.log("로그인 화면이동.");
					fnAddCart(goodsId, itemNo, totalCnt, nowBuyYn, '', inputOrdmki);
				}else{
					ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?', { // 컨펌 창 옵션들
						ycb: function () {
							var url = encodeURIComponent(document.location.href);
							if("false" == "true" && document.location.href.indexOf("/tv/series/indexTvDetail") > -1){
								fncAppCloseMoveLogin(url);
							}else{
								document.location.href = '/indexLogin?returnUrl=' + url;
							}
						},
						ncb: function () {
							return false;
						},
						ybt: "로그인", // 기본값 "확인"
						nbt: "취소"  // 기본값 "취소"
					});
				}
			}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
				if(nowBuyYn == "N" || isLogin == "true"){
					console.log("로그인 화면이동.");
					fnAddPaksCart(nowBuyYn);
				}else{
					ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?', { // 컨펌 창 옵션들
						ycb: function () {
							var url = encodeURIComponent(document.location.href);
							if("false" == "true" && document.location.href.indexOf("/tv/series/indexTvDetail") > -1){
								fncAppCloseMoveLogin(url);
							}else{
								document.location.href = '/indexLogin?returnUrl=' + url;
							}
						},
						ncb: function () {
							return false;
						},
						ybt: "로그인", // 기본값 "확인"
						nbt: "취소"  // 기본값 "취소"
					});
				}
			}
		}
	}

	//App일때 영상상세에서 로그인 화면으로 화면 닫고 이동해야해서 추가된 함수
	function fncAppCloseMoveLogin(url){
		//데이터 세팅
		toNativeData.func = "onCloseMovePage";
		toNativeData.moveUrl = "https://aboutpet.co.kr/indexLogin?returnUrl="+url;
		//APP 호출
		toNative(toNativeData);

		//toNativeData.func = "onClosePassingData";
		//var data = "https://aboutpet.co.kr/indexLogin?returnUrl="+url;
		//toNativeData.parameters = JSON.stringify(data);
		//toNativeData.callback = "fnOnClosePassingData";
		//toNative(toNativeData);
	}

	// 텍스트 인코딩
	function fnTextEncode(str){
		if (window.TextEncoder) {
			return new TextEncoder('utf-8').encode(str);
		}
		var utf8 = unescape(encodeURIComponent(str));
		var result = new Uint8Array(utf8.length);
		for (var i = 0; i < utf8.length; i++) {
			result[i] = utf8.charCodeAt(i);
		}
		return result;
	}

	// 비로그인 함수처리.
	function fnIsLogin(){
		ui.confirm("로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?",{
			ycb : function(){
				console.log("로그인 화면이동.");
				location.href = "/indexLogin";
			}
		});
	}
	/*
	 * 단품, 세트 - commonFunc.insertCart(‘GI000054458:302610:’, 1, ‘N’); or commonFunc.insertCart(‘GI000054458:302610:::’, ‘N’);
	 * 옵션 - commonFunc.insertCart(‘GI000054458:302610:GS000012345’, 1, ‘N’); or commonFunc.insertCart(‘GI000054458:302610:GS000012345::’, ‘N’);
	 * 묶음상품 - commonFunc.insertCart([‘GI000054458:302610:GP000012345’,'GI000054458:302610:GP000012345’], [1,2], ‘N’);
	 * commonFunc.insertCart
	* */
	function fnAddAttrsCart(){
		var listPaks = [];
		var listQtys = [];
		var goodsId = "PI000005494";
		$("[id^=selected_attrNo_]").each(function(index){
			var attrNo = $("[id^=selected_attrNo_]").eq(index).val();
			var subGoodsId = $("#selected_subGoodsId_"+attrNo).val();
			var cartQtyNumber = Number($("#buyQty"+attrNo).val());
			var goodsIdStr = subGoodsId + ":" + attrNo + ":" + (goodsId ? goodsId : "");
			console.log("goodsIdStr : " + goodsIdStr);
			// listPaks.push(goodsIdStr);
			// listQtys.push(cartQtyNumber);
		});
		// console.log("listPaks : " + JSON.stringify(listPaks) + ", listQtys : " + JSON.stringify(listQtys));
		// fnGoodsInsertCart(listPaks, listQtys, 'N');
	}

	function fnAddPaksCart(nowBuyYn){
		console.log("fnAddPaksCart");
		var listPaks = [];
		var listQtys = [];
		var pakGoodsId = "PI000005494";

		var mkiGoodsContChk = false;

		$("[id^=selected_itemNo_]").each(function(index){

			var itemNo = $("[id^=selected_itemNo_]").eq(index).val();
			var $qtyObj = $("#buyQty"+itemNo);
			var mkiGoodsYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";	//  주문제작 여부
			var inputOrdmki = "";

			if(mkiGoodsYn == "Y"){
				$("[id^=inputOrdmki_"+itemNo+"_]").each(function(ordmkiIdx){

					var idx = Number(ordmkiIdx)+1;
					var tempText = $("#inputOrdmki_"+itemNo+"_"+idx).val().trim();

					if(tempText == ""){
						ui.alert("각인문구를 입력해주세요");
						$("#inputOrdmki_"+itemNo+"_"+idx).val("");
						$("#inputOrdmki_"+itemNo+"_"+idx).focus();
						mkiGoodsContChk = true;
					}else{
						console.log("inputOrdmki : " + tempText);
						if(idx == 1){
							//inputOrdmki = btoa(unescape(encodeURIComponent(tempText)));
							inputOrdmki = tempText;
						}else{
							//inputOrdmki = inputOrdmki + "|" + btoa(unescape(encodeURIComponent(tempText)));
							inputOrdmki = inputOrdmki + "|" + tempText;
						}
					}
				});
			}

			var subGoodsId = $("#selected_subGoodsId_"+itemNo).val();
			var cartQtyNumber = Number($("#buyQty"+itemNo).val());
			var goodsIdStr = subGoodsId + ":" + itemNo + ":" + (pakGoodsId ? pakGoodsId : "") + ":" + (mkiGoodsYn ? mkiGoodsYn : "") + ":" + (inputOrdmki ? inputOrdmki : "");

			listPaks.push(goodsIdStr);
			listQtys.push(cartQtyNumber);
		});

		// 제작 내용 체크.
		if(mkiGoodsContChk){
			return;
		}


		// 상품 미선택시
		if(listPaks.length < 1){ // 상품 미선택시
			ui.toast("상품을 선택해주세요");
			return;
		}else{
			for(var i = 0; i < listQtys.length; i++){
				if(Number(listQtys[i]) < 1){
					ui.alert("상품 수량을 선택해주세요.");
					return;
				}
			}
		}

		var salePsbCdLen = $("[id^=selected_salePsbCd_]").length;

		if(nowBuyYn == "Y"){
			for(var i = 0; i < salePsbCdLen; i++){
				var salePsbCd = $("[id^=selected_salePsbCd_]").eq(i).val();
				if(salePsbCd == "10"){ // 판매중지
					ui.alert("판매 중지되어 구매하실 수 없는 상품이에요");
					return;
				}else if(salePsbCd == "20"){ // 판매종료
					ui.alert("판매 종료되어 구매할 수 없는 상품이에요");
					return;
				}else if(salePsbCd == "30"){ // 품절
					ui.alert("품절되어 구매하실 수 없는 상품이에요");
					return;
				}
			}
		}

		console.log("listPaks : " + JSON.stringify(listPaks) + ", listQtys : " + JSON.stringify(listQtys));
		fnGoodsInsertCart(listPaks, listQtys, nowBuyYn);
	}

	function fnAddAttrCart(nowBuyYn){
		console.log("fnAddAttrCart");
		// var listPaks = [];
		// var listQtys = [];
		var goodsId = "PI000005494";
		$("[id^=selected_attrNo_]").each(function(index){
			var attrNo = $("[id^=selected_attrNo_]").eq(index).val();
			var attrGoodsId = $("#selected_subGoodsId_"+attrNo).val();
			var cartQtyNumber = Number($("#buyQty"+attrNo).val());
			var goodsIdStr = attrGoodsId + ":" + attrNo + ":" + (goodsId ? goodsId : "");
			console.log("goodsIdStr : " + goodsIdStr);
			// listPaks.push(goodsIdStr);
			// listQtys.push(cartQtyNumber);
		});
		// console.log("listPaks : " + JSON.stringify(listPaks) + ", listQtys : " + JSON.stringify(listQtys));
		// fnGoodsInsertCart(listPaks, listQtys, nowBuyYn);
	}


	function fnAddCart(goodsId, itemNo, cartQty, nowBuyYn, pakGoodsId, mkiGoodsOptContent){

		var mkiGoodsYn = "N";	// 제작 여부
		var goodsIdStr = goodsId + ":" + itemNo + ":" + (pakGoodsId ? pakGoodsId : "") + ":"+(mkiGoodsYn ? mkiGoodsYn : "")+":"+(mkiGoodsOptContent ? mkiGoodsOptContent : "");

		console.log("fnAddCart = goodsIdStr : " + goodsIdStr + ", cartQty : " + cartQty + ", nowBuyYn : " + nowBuyYn);

		fnGoodsInsertCart(goodsIdStr, cartQty, nowBuyYn);
	}

	function fnGoodsInsertCart(goodsIdStr, cartQty, nowBuyYn){
		commonFunc.insertCart(goodsIdStr, cartQty, nowBuyYn, function(data){
			// FRONT_WEB_VIEW_ORDER_CART_MSG_INSERT_CART_SUCCESS
			if(nowBuyYn == 'N'){
				fnGoodsUiToast("장바구니에 상품이 담겼습니다.", "nowbuy");
				// ui.confirm("장바구니에 담았습니다. 이동하시겠습니까?",{
				// 	ycb : function(){
				// 		console.log("insertCart response");
				// 		location.href = "/order/indexCartList";
				// 	}
				// });
			}else{
				console.log("insertCart response");
				//location.reload();
			}
		});
	}

	function fnAddGoodsWish(obj, goodsId){
		var isLogin = "false";
		console.log("fnAddGoodsWish isLogin : " + isLogin);
		if(isLogin == "true"){
			var options = {
				url : "/goods/insertWish",
				data : {goodsId : goodsId, search : "", returnUrl : document.URL+"?searchQuery=" },
				done : function(data) {
					console.log("data : " + JSON.stringify(data));
					var action = '';
					if(data != null) {
						if(data.actGubun == 'add'){
							$(obj).addClass("on");
							fnGoodsUiToast("찜리스트에 추가되었어요", "wish");
							action = 'interest';
						}else if(data.actGubun == 'remove'){
							$(obj).removeClass("on");
							fnGoodsUiToast("찜리스트에서 삭제되었어요", "wished");
							action = 'interest_d';
						}
						userActionLog(goodsId, action);
					}
				}
			};
			ajax.call(options);
		}else{
			fnGoodsUiToast("로그인이 필요합니다.", "login");
		}

		// insertWishS(obj, goodsId, searchGoodsId);
	}

	// 입고 알림
	function fnAlimItems(obj){
		var isLogin = "false";
		if(isLogin == "true"){
			var options = {
				url : "/goods/addIoAlarm",
				data : {goodsId : "PI000005494", almYn : "N"},
				done : function(data) {
					// console.log("data : " + JSON.stringify(data));
					// 알림신청시 기존에 등록에 대한 처리는 없음.
					if(data.message == "add"){
						fnGoodsUiToast("재입고 알림이 신청되었어요", "add");
					}else if(data.message == "added"){
						fnGoodsUiToast("이미 재입고 알림을 신청했어요", "added");
					}
				}
			};
			ajax.call(options);
		}else{
			fnIsLogin();
		}
		// insertWishS(obj, goodsId, searchGoodsId);
	}
	function fnRegAlim(e, obj){
		e.stopPropagation();//입고알람 상위 a태그의 이벤트가 실행되어 e.stopPropagation() 실행
		var $btn = $(obj);
		var goodsId = $btn.data("goods-id") || $btn.data("content");
		var options = {
			url : "/goods/addIoAlarm",
			data : {goodsId : goodsId, almYn : "N"},
			done : function(data) {
				if(data.message == "login") {
					ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?', { // 컨펌 창 옵션들
						ycb: function () {
							document.location.href = '/indexLogin?returnUrl=' + encodeURIComponent(document.location.href);
						},
						ncb: function () {
							return false;
						},
						ybt: "로그인", // 기본값 "확인"
						nbt: "취소"  // 기본값 "취소"
					});
				}else if(data.message == "changed") {
					ui.toast("상품정보가 변경되어 입고알림을 신청할 수 없어요",{
						bot: 74, //바닥에서 띄울 간격
						sec:  3000 //사라지는 시간
					});
				}else if(data.message == "add"){
					ui.toast("재입고 알림이 신청되었어요");
				}else if(data.message == "added"){
					ui.toast("이미 재입고 알림을 신청했어요",{
						cls : "added" ,
						bot: 74, //바닥에서 띄울 간격
						sec:  3000 //사라지는 시간
					});
				}
			}
		};
		ajax.call(options);


	}

	//$(document).bind("keydown change","[id^=inputOrdmki_]",function(e){

	function fnCheckOrdmkiTextLength(obj){
		var curValue = obj.value;

		if(curValue.indexOf("|") > -1){
			curValue = curValue.substr(0, curValue.indexOf("|"));
		}

		if( 40 < curValue.length ){
			curValue = curValue.substr(0, 40);
		}

		$("#"+obj.id).val(curValue) ;
	}
	//})

</script>

<div class="optpan" >
	<div class="inr" id="artUiPdOrdPan">

		<div class="cdtwrap">
			<!-- 묶음/옵션 상품 -->
			<script type="text/javascript">
	$(document).ready(function(){
		console.log("goodsId : PI000005494, goodsCstrtTp : ITEM");
		
		var goodsCstrtTpCd = "ITEM";

		if(goodsCstrtTpCd == "PAK"){
			fnSelectPakGoodsList("N");
		}
		
	});

	var fnOption = {
		choose : function (attrNo, obj, attrVal, itemNo){
			var attrValNo = $(obj).val();

			$("#selected_attrValNo_"+attrNo).val(attrValNo);
			$("#selected_attrVal_"+attrNo).val(attrVal);

		},
		check : function (){
			var addFlag = true;

			// 옵션이 모두 선택되었는지 확인
			$("[id^=selected_attrValNo_]").each(function(index){
				if($(this).val() == ""){
					addFlag = false;
					ui.alert("옵션을 선택하세요.");

				}
			});

			if(addFlag){
				if ("" == "order") {
					fnOption.update();
				} else {
					fnOption.exChange();
				}
			}
		}
		, exPaksAdd : function (type, rownum, itemNo, saleAmt, imgPath, cstrtShowNm, subGoodsId, minOrdQty, maxOrdQty, ordmkiYn, cnt, salePsbCd, openFlag, ioAlmYn, orgSaleAmt, detailSelAttrVals){
			
			
			
			var optionSelAttrVals = $("#optionSelAttrVals").val();
			
			// 상세에서 상품선택시.
			if(openFlag == "DETAILSEL"){
				$("#uiPdOrdPan").addClass("open");
				$("#cartNavs").addClass("open");
				
				optionSelAttrVals = detailSelAttrVals;
			}

			var addType = type;
			if(type == 'btn'){
				var btnPakSelected = $("#btnPakSelected"+itemNo).hasClass("a sm");
				if(btnPakSelected === true) {
					addType = "remove"; // 버튼 2번 클릭시 삭제 처리.
				}else{
					addType = "add";
				}
			}else{
				if(salePsbCd != "00" && addType == "add"){	// 판매가능상품 일때만 장바구니 담기
					ui.alert("판매가능상품이 아닙니다.");
					return;
				}
			}
			var dataObj = {};
			dataObj.rownum 			= rownum;
			dataObj.itemNo 			= itemNo;
			dataObj.imgPath 		= imgPath;
			dataObj.cstrtShowNm 	= cstrtShowNm;
			dataObj.subGoodsId 		= subGoodsId;
			dataObj.saleAmt 		= saleAmt;
			dataObj.orgSaleAmt		= orgSaleAmt;
			dataObj.minOrdQty 		= minOrdQty ? minOrdQty : 1;
			dataObj.maxOrdQty 		= maxOrdQty ? maxOrdQty : 999;
			//dataObj.unit 			= $("#uispinerUnitLeft" + itemNo).val(); // 개수
			dataObj.unit 			= 1; // 개수
			dataObj.ordmkiYn		= ordmkiYn;
			dataObj.salePsbCd		= salePsbCd;
			dataObj.ioAlmYn			= ioAlmYn;
			dataObj.goodsCstrtTpCd	= "ITEM";
			dataObj.optionSelAttrVals = optionSelAttrVals;
			//dataObj.ordmkiContent	= $("#inputOrdmki_"+cnt).val(); 
			// console.log("itemNo : " + itemNo + ", dataObj : " + JSON.stringify(dataObj));
			fnPaksRight(dataObj, addType);
			
			// 선택옵션 text 초기화
			$("#optionSelAttrVals").val("");
			
			$(document).off("click", ".uispiner .bt");
			$(document).off("click", ".uispiner .plus");
			$(document).on("click",".uispiner .plus",function(e){
				e.preventDefault();

				var $qtyObj = $(this).siblings(".amt");
				var maxOrdQty = $qtyObj.data("maxOrdQty") ? $qtyObj.data("maxOrdQty") : 999;
				
				var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";

				if (!maxOrdQty || parseInt($qtyObj.val()) < maxOrdQty) {
					var cartQty = parseInt($qtyObj.val()) + 1;
					//var cartQty = parseInt($qtyObj.val());
					var itemNo = $qtyObj.data("itemNo");
		 			//$("#buyQty" + itemNo).attr("value", cartQty);
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty); // 사용하지말것.
					var goodsCstrtTpCd = "ITEM";
					//console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", itemNo : " + itemNo + ", cartQty : " + cartQty);
					if(ordmkiYn == "Y"){	// 각인여부
						indexOrdpan++;
						if(!document.getElementById('spanOrdmki_'+ itemNo + '_' + cartQty)){
							var spanText = "";
							var n2Class = "";
							if(9 < cartQty){
								n2Class = "n2";
							}
							spanText += "<span class='input nms"+n2Class+"' id='spanOrdmki_"+itemNo+"_"+cartQty+"'>";
							spanText += "	<i class='n'>"+cartQty+".</i><input type='text' name='inputOrdmki' id='inputOrdmki_"+itemNo+"_"+cartQty+"' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onkeydown='javascript:fnCheckOrdmkiTextLength(this);'>";
							spanText += "</span>";
							//$("#divOrdmki_"+cartQty-1).html($("#divOrdmki_"+cartQty).html() + spanText);
							var gudText = "<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>";
							$("#divOrdmki_"+itemNo + " .gud").remove();
							$("#divOrdmki_"+itemNo).append(spanText + gudText);
						}
					}
					
					if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
						fnClickItemTotalCnt(itemNo, cartQty);
					}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
						var originSaleAmt = $qtyObj.data("saleAmt");
						fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
					}
				}else{
					fnGoodsUiToast("최대 " + maxOrdQty + "개까지 구매할 수 있어요", "maxOrdQty");
					return;
				}
			});
			
			$(document).off("click", ".uispiner .bt");
			$(document).off("click", ".uispiner .minus");
			$(document).on("click",".uispiner .minus",function(e){
				e.preventDefault();

				var $qtyObj = $(this).siblings(".amt");
				var minOrdQty = $qtyObj.data("minOrdQty") ? $qtyObj.data("minOrdQty") : 1;
				var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";
				if (parseInt($qtyObj.val()) > minOrdQty) {
					var cartQty = parseInt($qtyObj.val()) - 1;
					//var cartQty = parseInt($qtyObj.val());
					var itemNo = $qtyObj.data("itemNo");
		 			//$("#buyQty" + itemNo).attr("value",cartQty);
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty); // 사용하지말것.
					if(indexOrdpan <= 0){
						indexOrdpan = 1;
					}else{
						indexOrdpan--;
					}

					var goodsCstrtTpCd = "ITEM";
					//console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", itemNo : " + itemNo + ", cartQty : " + cartQty);

					if(ordmkiYn == "Y"){
						$("[id^=spanOrdmki_" + itemNo + "_]").each(function(index){
							var idx = index + 1;
							if(cartQty < idx){
								$(this).remove();
							}
						});
					}
					
					if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
						fnClickItemTotalCnt(itemNo, cartQty);
						
					}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
						var originSaleAmt = $qtyObj.data("saleAmt");
						fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
					}
				}else{
					fnGoodsUiToast("최소 " + minOrdQty + "개 이상 구매할 수 있어요", "maxOrdQty");
				}
			});
			
		}
		, exChange : function (itemNo, type){

			var data = [];
			$("[id^=selected_attrValNo_]").each(function(index){

				var dataObj = {};
				console.log("index : " + index + ", listPaks obj ; " + JSON.stringify(obj));
				dataObj.attrNo 		= $("[id^=selected_attrNo_]").eq(index).val();
				dataObj.attrValNo 	= $(this).val();
				dataObj.attrVal 	= $("[id^=selected_attrVal_]").eq(index).val();
				dataObj.itemNo 		= itemNo;
				dataObj.unit 		= 1;
				dataObj.obj 		= obj;
				data.push(dataObj);
			});

		}
	};
	
	function fnCheckSoldOutYn(obj){

		var goodsCstrtTpCd = "ITEM";
		var soldOutExceptYn = "N";
		
		if(obj.checked){
			soldOutExceptYn = "Y";
		}
		
		if(goodsCstrtTpCd == "PAK"){
			fnSelectPakGoodsList(soldOutExceptYn);
		}else if(goodsCstrtTpCd == "ATTR"){
			var optionCnt = $("#optionCnt").val();
			
			$("#soldOutExceptYn").val(soldOutExceptYn);
			// 옵션목록 초기화.
			$("#attrNo").val($("#attr1No").val());
			$("#attrIdx").val("");
			
			for(var i=1; i <= optionCnt; i++){
				
				$("#attr"+i+"ValNo").val("");
				
				// 옵션상품은 '옵션을 선택해주세요'가 아닌 옵션명을 셋팅한다. 
				$("#optsetsVal"+i).text( $("#cstrTpAttrNm"+i).val());
				
				if(i == 1 ){
					$("#divOptsets"+i).addClass("open");
				}else{
					$("#divOptsets"+i).removeClass("open");
					$("#optionSetList"+i).empty();
				}
			}
			ajax.load("optionSetList1", "/goods/getOptionSetList", $("#optionGoodsForm").serializeJson());
		}
	}
	
	function fnOptionselect(attrNo, attrValNo, attrVal, subGoodsId){
		
		$("#subGoodsId").val(subGoodsId);
		
		var idx = $("#listAttrsCount"+attrNo).val();
		var soldOutExceptYn = "N";
		
		if($("#chkSoldOutExceptYn").is(":checked")){
			soldOutExceptYn = "Y";
		}
		
		$("#soldOutExceptYn").val(soldOutExceptYn);
		var optionCnt = $("#optionCnt").val();
		var nextidx = Number(idx) + 1;
		
		if(attrValNo != "" && idx != ""){
			$("#attrNo").val($("#attr"+nextidx+"No").val());
			$("#attr"+idx+"ValNo").val(attrValNo);
			$("#optsetsVal"+idx).text(attrVal);
			$("#attrIdx").val(idx);
		}

		var resultCallCheck = true;
		var optionSelAttrVals = "";
		
		var goodsCstrtTpCd = "ITEM";
		
		for(var i = 1; i <= optionCnt; i++){
			// 옵션값이 다 설정 되지 않으면 조회 하지 않음.
			if($("#attr"+i+"ValNo").val() == ""){
				resultCallCheck = false;
			}
			
			if(idx < i){
				$("#attr"+i+"ValNo").val("");
			
				if( goodsCstrtTpCd == "ATTR") {
					// 옵션상품은 '옵션을 선택해주세요'가 아닌 옵션명을 셋팅한다. 
				    $("#optsetsVal"+i).text( $("#cstrTpAttrNm"+i).val());
				} else {
					$("#optsetsVal"+i).text("옵션을 선택해 주세요");
				}
			}
			
			if(i != 1){
				optionSelAttrVals += " / "; 
			}
			optionSelAttrVals += $("#optsetsVal"+i).text();
		}

		if(idx < optionCnt){
			ajax.load("optionSetList"+nextidx, "/goods/getOptionSetList", $("#optionGoodsForm").serializeJson());	
			// next 옵션목록 자동 open
			$("#divOptsets"+nextidx).addClass("open");
		}	
		
			
		if(resultCallCheck){
			$("#optionSelAttrVals").val(optionSelAttrVals);
			fnOptionSelectResult(optionCnt);
		}
	}
	
	function fnOptionSelectResult(optionCnt){

		ajax.load("optionGoodsList", "/goods/getOptionGoodsList", $("#optionGoodsForm").serializeJson());
		
		var goodsCstrtTpCd = "ITEM";
		
		// 옵션값으로 조회후 초기화.
		for(var i = 1; i <= optionCnt; i++){
			$("#attr"+i+"ValNo").val("");
			 
			if( goodsCstrtTpCd == "ATTR") {
				// 옵션상품은 '옵션을 선택해주세요'가 아닌 옵션명을 셋팅한다. 
			    $("#optsetsVal"+i).text( $("#cstrTpAttrNm"+i).val());
			} else {
				$("#optsetsVal"+i).text("옵션을 선택해 주세요");
			}
			
			$("#divOptsets"+i).removeClass("open");
			if(i != 1){
				$("#optionSetList"+i).empty();
			}
		}
	}; 
	
	function fnSelectPakGoodsList(soldOutExceptYn){
		$("#soldOutExceptYn").val(soldOutExceptYn);
		ajax.load("cstrtPakGoodsList", "/goods/getPakGoodsList", $("#pakGoodsForm").serializeJson());
	}

</script>

<!-- 단품/세트 상품 -->
	<div class="cdt cdt_l">
		<div class="optresul" style="min-width: 50%">
			<ul class="list">
				<li>
					<div class="unitRes">
						<a href="javascript:" class="box">
							<!-- <button type="button" class="bt del">삭제</button> -->
							<div class="infs">
								<span class="lk wb_bAll_k0426">포켄스 뉴트리션 트릿 피부&피모 480g</span>
							</div>	
						</a>
						<div class="cots">
							<div class="uispiner" >
						<input type="text" value="1" class="amt"
									   id="buyQty353934" name="buyQty" onblur="fnChangebuyQty(this)"
									   onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" 
									   data-item-no="353934"
									   data-min-ord-qty="1"
									   data-max-ord-qty="99999"
									   data-ordmki-yn="N">
						<button type="button" class="bt minus" >수량빼기</button>
								<button type="button" class="bt plus" >수량더하기</button>
							</div>
							<div class="price">
								<em class="p" id="emPriceTotalAmtItem">28,000</em><i class="w">원</i>
							</div>
						</div>
						</div>
				</li>
			</ul>
		</div>
	</div>
	
<!-- 묶음/옵션 상품 Right -->
			<script type="text/javascript">
	$(document).ready(function(){
	});

	// 묶음, 옵션 처리.
	function fnPaksRight(data, type){
		console.log("fnPaksRight obj : " + JSON.stringify(data));
		var artUiPdOrdPanRight = $("#artUiPdOrdPanRight").html();
		var buyQtyRight = data.minOrdQty;
		if(type == "add"){
			if(!document.getElementById('selected_itemNo_'+data.itemNo)){
				$("#artUiPdOrdPanRight").html(artUiPdOrdPanRight + fnOrdpanRight(data));
				$("#btnPakSelected"+data.itemNo).removeClass("c sm");
				$("#btnPakSelected"+data.itemNo).addClass("a sm");
			}else{  // 동일한 상품인 경우 +1 처리.
				
				if(data.maxOrdQty == $("#buyQty" + data.itemNo).val()){
					fnGoodsUiToast("최대 " + data.maxOrdQty + "개까지 구매할 수 있어요", "maxOrdQty");
					return;
				}
				
				buyQtyRight = Number($("#buyQty" + data.itemNo).val()) + 1;
				$("#buyQty" + data.itemNo).val(buyQtyRight).attr("value",buyQtyRight);
				
				if(data.ordmkiYn == "Y"){

					var spanText = "";
					$("#divOrdmki_" + data.itemNo + " .gud").remove();
					//$("[id^=inputOrdmki_"+itemNo+"_]").remove();
					for(var i = 1; i <= buyQtyRight; i++){
						if(!document.getElementById('spanOrdmki_'+ data.itemNo + '_' + i)){
							var n2Class = "";
							if(9 < i ){
								n2Class = "n2";
							}
							spanText += "<span class='input nms "+n2Class+"' id='spanOrdmki_" + data.itemNo + "_"+i+"'>";
							spanText += "	<i class='n'>" + i + ".</i><input type='text' name='inputOrdmki' id='inputOrdmki_" + data.itemNo + "_" + i + "' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onchange='javascript:fnCheckOrdmkiTextLength(this);'>";
							spanText += "</span>";
						}
					}
					var gudText = "<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>";
					$("#divOrdmki_"+data.itemNo).append(spanText + gudText);
				}
			}

			// 전체 동기화.
			console.log("itemNo : " + data.itemNo + ", buyQtyRight : " + buyQtyRight + ", saleAmt : " + data.saleAmt);
			fnClickPaksTotalCnt(data.itemNo, buyQtyRight, data.saleAmt);
		}else{
			$("#liOrdpanRight" + data.itemNo).remove();
			$("#btnPakSelected"+data.itemNo).removeClass("a sm");
			$("#btnPakSelected"+data.itemNo).addClass("c sm");
			fnClickPaksTotalCnt(data.itemNo, 1, data.saleAmt);
		}
	}
	
	function comma(num){
	    var len, point, str; 
	       
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    } 
	     
	    return str;
	 
	}

	function fnOrdpanRight(data){
		
		var rn = $("#artUiPdOrdPanRight li").length + 1;
		
		var dataImgPath = data.imgPath;
		// 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500
		var imgPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images" + dataImgPath + "?type=f&w=259&h=259&quality=90&align=4";
		var noImgPath = "/_images/mall/common/default_image.jpg";
		var imgClass = "";
		if(data.goodsCstrtTpCd == "PAK"){
			imgClass = "gpic";	
		}
		
		var diffAmt = "";
		var saleAmt = Number(data.saleAmt);
		var orgSaleAmt = Number(data.orgSaleAmt);
		if(saleAmt > orgSaleAmt){
			diffAmt = "(+" + comma(saleAmt-orgSaleAmt) + "원)";
		}else if(saleAmt < orgSaleAmt){
			diffAmt = "(-" + comma(orgSaleAmt-saleAmt) + "원)";
		}
		
		var text = "";
		text += "<li id='liOrdpanRight"+data.itemNo+"'>                                                                		";
		text += "<input type='hidden' id='selected_itemNo_"+data.itemNo+"' name='itemNos' value='"+data.itemNo+"' />  		";
		text += "<input type='hidden' id='selected_subGoodsId_"+data.itemNo+"' name='goodsIds' value='"+data.subGoodsId+"' />";
		text += "	<div class='unitRes "+imgClass+"'>                                                                       ";
		text += "		<div class='box'>                                                                                	";
		text += "			<button type='button' class='bt del' onclick='fnOption.exPaksAdd(\"remove\", \""+data.rownum+"\", \""+data.itemNo+"\",\""+data.saleAmt+"\")'>삭제</button>	";
		if(data.goodsCstrtTpCd == "PAK"){
			text += "			<div class='thum'>                                                                           	";
			text += "				<div class='pic'><img class='img' src='"+imgPath+"' onerror='this.src=\""+noImgPath+"\"' alt='상품'></div>  						";
			text += "			</div>                                                                                        	";
		}
		text += "			<div class='infs'>                                                                           	";
		text += "				<div class='cate'>상품"+rn+"</div>                                                 	";
		if(data.goodsCstrtTpCd == "PAK"){
			text += "				<a href='javascript:;' class='lk'>"+data.cstrtShowNm + diffAmt+"</a> 									";
		} else {
			text += "				<a href='javascript:;' class='lk'>" + data.optionSelAttrVals + diffAmt + "</a> 									";
		}	
		text += "			</div>                                                                                       	";
		text += "		</div>                                                                                           	";
		text += "		<div class='cots'>                                                                               	";
		text += "			<div class='uispiner'>                                                                          ";
		/* text += "				<input type='text' value='1' name='buyQty' id='buyQty"+data.itemNo+"' class='amt'  disabled='disabled' onchange='javascript:fnChangebuyQty(this);'"; */
		text += "				<input type='text' value='"+data.minOrdQty+"' name='buyQty' id='buyQty"+data.itemNo+"' class='amt' onblur='fnChangebuyQty(this)'";
		text += " 					onkeyup='this.value=this.value.replace(/[^0-9]/g, \"\");'";
		text += "					   data-item-no='"+data.itemNo+"' 							";
		text += "					   data-min-ord-qty='"+data.minOrdQty+"' data-max-ord-qty='"+data.maxOrdQty+"'         	";
		text += "					   data-sale-amt='"+data.saleAmt+"' data-ordmki-yn='"+data.ordmkiYn+"'>         							";
		text += "				<button type='button' class='bt minus'>수량더하기</button>                                  	";
		text += "				<button type='button' class='bt plus'>수량빼기</button>                                     	";
		text += "			</div>                                                                                       	";
		text += "			<div class='price'>                                                                          	";

		if(data.salePsbCd == "00"){
			text += "				<em class='p' id='buyPriceRight"+data.itemNo+"'>"+data.saleAmt+"</em><i class='w'>원</i>	";	
		}
		if(data.salePsbCd == "10"){
			text += "<span class='bt sold'>판매중지</span>";
		}
		if(data.salePsbCd == "20"){
			text += "<span class='bt sold'>판매종료</span>";
		}
		if(data.salePsbCd == "30"){
			if(data.ioAlmYn == "Y"){
				text += "<button type='button' class='bt alim'>입고알림</button>";
			}else{
				text += "<span class='bt sold'>입고예정</span>";
			}
		}
		text += "				<input type='hidden' id='inputBuyPriceRight"+data.itemNo+"' name='itemNos' value='"+data.saleAmt+"' />  		";
		text += "			</div>                                                                                       	";
		text += "		</div>                                                                                           	";
		if(data.ordmkiYn == "Y"){
			text += "		<div class='msgs' id='divOrdmki_"+data.itemNo+"'>                                                                               	";
			for(var i = 1; i<= data.minOrdQty; i++){
				var n2Class = "";
				if(9 < i ){
					n2Class = "n2";
				}
				text += "			<span class='input nms "+n2Class+"' id='spanOrdmki_"+data.itemNo+"_" + i + "'><i class='n'>" + i + ".</i><input type='text' name='inputOrdmki' id='inputOrdmki_"+data.itemNo+"_" + i + "' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onkeydown='javascript:fnCheckOrdmkiTextLength(this);'></span>";
				if(i == data.minOrdQty){
					text += "			<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>                          	";	
				}
			}

			text += "		</div>                                                                                           	";
		}
		text += "	</div>                                                                                               	";
		text += "</li>";

		return text;
	}
</script>
</div>

		<div class="tots">
			<div class="inr">
				<div class="amts">
					<i class="t">총 수량</i>
					<em class="amt"><i class="i" id="emPriceTotalCnt">
						1</i><i class="s">개</i>
					</em>
				</div>
				<div class="price">
					<i class="t">합계</i>
					<em class="prc"><i class="i" id="emPriceTotalAmt">28,000</i><i class="s">원</i></em>
				</div>
			</div>
		</div>
	</div>
</div>
</article>
		<script type="text/javascript">
</script>
<nav class="cartNavs" id="cartNavs">
	<div class="inr">
		<div class="pdinfo">
			<div class="box">
<!-- 				직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_210 >>>> frontConstants.IMG_OPT_QRY_756 -->
				<span class="pic"><img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/20/12/51/2504480/2504480_detail_080.jpg?type=f&w=500&h=500&quality=90&align=4" onerror="this.src='/_images/mall/common/default_image.jpg'" alt=""></span>
				<div class="disc">
					<div class="names">포켄스 뉴트리션 트릿 피부&피모 480g</div>
					<div class="price">
						<em class="p">28,000</em><i class="w">원</i>
					</div>
				</div>
			</div>
		</div>

		<div class="btns">
			<div class="zims">
				<button type="button" class="bt btZZim " id="goodsWish"
					data-content='PI000005494' data-url="/goods/insertWish?goodsId=PI000005494" data-action="interest" data-yn="N" data-goods-id="PI000005494" data-target="goods" ><span class="t">찜하기</span></button><!-- .on class명 있으면 찜한 상태임 -->
			</div>
			<!-- soldOutYn 품절 여부 0보다 크면 Y -->
			<div class="obts">
				<button type="button" class="bt btCart" onclick="fnCartItems('N')"><span class="t" >장바구니</span></button>
						<!-- 판매가능 -->
							<!-- 판매가능 -->
									<button type="button" class="bt btOrde" onclick="fnCartItems('Y')" ><span class="t" >구매하기</span></button>
								</div>
		</div>
	</div>
</nav>
<!-- TWC chatbot Scripts -->
<script src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.plugin.js"></script>

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
</nav><!-- popup 내용 부분입니다. -->
		<div class="layers" id="goodsLayers">
		</div><!-- location 영역 포함  -->			
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
				<li id="liTag_10" class="shop active">
					<a href="#" onclick="location.href='https://aboutpet.co.kr/shop/home/'" class="bt"><span>샵</span></a>
				</li>
				<li id="liTag_00" class="my ">
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

<div id ="layers">
</div><!-- e : footer 영역 -->
	</div>
</body>
</html>