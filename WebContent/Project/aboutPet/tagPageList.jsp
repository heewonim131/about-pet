<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript" src="../js/popup.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript" src="../js/deviceChk.js"></script>
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
</script>
<script type="text/javascript">
		$(document).ready(function(){
			$("#header_pc").addClass('noneAc');
			$(".mo-heade-tit .tit").html("#고양이");	
		});	
	</script>
<script type="text/javascript">
		$(window).bind("pageshow", function(event){
			if(event.originalEvent.persisted || window.performance && window.performance.navigation.type == 2){
				var state = window.history.state;
				if(state) {
					page = state.page;
					scrollPrevent = state.scrollPrevent;
					$("#contents").html(state.data);
				}else {
					window.history.replaceState(null, null, null);
				}
			}else{
				window.history.replaceState(null, null, null);
			}
		});
		
		//상품보기
		var filter = {
			detail : function(callback, order){
				page = 0;
				result = true;
				scrollPrevent = true;
				var filters = new Array();
			 	var filterNm = new Array();
				var bndNos = new Array();
				var tags = new Array();
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
				 	
				}else if(callback == "del"){
					$("span[name=selFilt]").each(function(){
						var filter = $(this).attr('id');
						filters.push(filter);
					});
				 	
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
				
				// 태그
		 		tags.push( $("#tags").val() );
				
				$ajax({
					url : "/AboutPet/Project/aboutPet/tagPageAjax.do"
					, type : "POST"
					, dataType : "html"
					, data : {
						tagName:<%=request.getAttribute("tagName")%>
					}
					,cache:false
					, success :	function(result){
						//ui.popLayer.close('popFilter');
						$("#tagGoodsList").empty();
						$("#tagGoodsList").append(result);
						/* var html = "<ul class='swiper-wrapper'>";
						if(dataAll.length > 0) {
					 		for(var i in dataAll){
					 			html+="<li class='swiper-slide'>";
								if(dataAll[i].name == "filName" || dataAll[i].name == "selFilt"){
									html += "<span class='fil' id="+dataAll[i].id+" name='selFilt'>";
								}else{
									html += "<span class='fil' id="+dataAll[i].id+" name='selBnd'>";
								}
								html += "<em class=tt>"+dataAll[i].text+"</em>";
								html += "<button class='del' onclick='filter.filterDel(\"" +dataAll[i].id+ "\");'>필터삭제</button>"
								html += "</span></li>"
					 		}
					 		html+= "</ul>";
					 		$("#uifiltbox").addClass("on");
					 		$(".sect.ct.tag > .list").addClass("hasFilter");
							$(".flist").append(html);
							ui.disp.sld.foneline.using();
							var len = $(".fil").length;
							$ ("button[name=countName]").addClass('on');
							$("#filCount").text("("+len+")");
						}else{
							$(".flist").parent().removeClass("on");
							$(".sect.ct.tag > .list").removeClass("hasFilter");
							$("button[name=countName]").removeClass('on');
						}
						//filter.pushUrl();
						//APETQA-5584
						var brSort = $("#sortId li[class=active]").children().attr("value");
						filter.brandSort = brSort; */
					}
				});
			},
			filterDel : function(id){
				$("#"+id).remove();
				filter.detail('del');
			},
			refresh : function(refresh){
				$(".flist").children().remove();
				var order = $("#order_DATE").children().val();
				filter.detail(refresh, order);
			},
			open : function(){
				var filters = new Array();
				var dataAll = new Array();
				
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
					
				
// 				var goodsIds = '[GI251024490, PI000013714, PI000001048, PI000002026, PI000002684, PI000003344, PI000003179, PI000003245, PI000013349, PI000003180, PI000004975, PI000003181, PI000005343, PI000002397, GP251020859, PI000003091, GS251022747, GP251020914, PI000003178, GP251025135]';
//              goodsIds = goodsIds.replace("[","").replace("]","");
                var options = {
                        url : "/shop/tagFilterPop"
                        , type : "POST"
                        , dataType : "html"
                        , data : {
                            filters : filters
                            ,bndNos : bndNos
//                             ,goodsIds : goodsIds
                        }
                        , done :    function(result){
                            $(".popFilter").remove();
                            $(".filterPop").append(result);
                            ui.toggleClassOn.init();
                            ui.order.filter.using();
                            ui.popLayer.open('popFilter');
                           
                            for(var i in dataAll){
                                var id = dataAll[i].id;
                                var name = dataAll[i].name;
                                var text = dataAll[i].text;
                                filtDetail.append(id, text, name);
                            }
                        }
                    };
					ajax.call(options);
			},
			pushUrl : function() {
				var params = new URLSearchParams(location.search);
				var searchParams = params.toString();
				var goUrl = window.location.pathname + "?"+searchParams;
				window.history.replaceState( {data : $("#contents").html(), page : page, scrollPrevent : scrollPrevent}, null, goUrl);
			},
			brandSort : "v_1"
		}
	</script>
</head>



<body class="body">
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



			<!-- //등급안내 팝업 추가 2021.05.13 -->
		</div>
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
		<c:import url="./sidebar.jsp"></c:import>
		<script type="text/javascript">
	$(document).ready(function() {
		// 정렬
		$("li[id^=order_] button").click(function() {
			filter.detail('del', $(this).val());
		});

		goodsCount = $
		{
			count
		}
		;
	});
</script>

		<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
		<!-- e : gnb 영역 -->
		<!-- s : LNB 영역 -->
		<!-- e : LNB 영역 -->
		<!-- s : 검색 영역 -->
		<!-- e : 검색 영역 -->

		<!-- s : 본문영역 -->
		<main class="container page shop ct tag" id="container">
			<input type="hidden" id="tags" value="${tagName }" />
			<div class="inr">
				<!-- 본문 -->
				<div class="contents" id="contents">
					<div class="pc-tit">
						<h2>#${tagName }</h2>
					</div>
					<section class="sect ct tag" id="tagGoodsList">
						<div class="sticky_filter_top">
							<div class="inr">
								<div class="uioptsorts tag">
									<div class="dx lt">
										<div class="tot">
											펫샵 상품 <em class="n">${count } 개</em>
										</div>
									</div>
									<div class="dx rt">
										<nav class="filter">
											<button type="button" class="bt filt" id="btnFilter"
												onclick="filter.open();">
												필터<i class="n" id="filCount">()</i>
											</button>
										</nav>
										<nav class="uisort">
											<button type="button" class="bt st" value=""></button>
											<div class="list">
												<ul class="menu">
													<li id="order_SALE"><button type="button" class="bt"
															value="SALE" onclick="filter.detail('del',this.value);">판매인기순</button></li>
													<li id="order_LOW"><button type="button" class="bt"
															value="LOW" onclick="filter.detail('del',this.value);">낮은가격순</button></li>
													<li id="order_HIGH"><button type="button" class="bt"
															value="HIGH" onclick="filter.detail('del',this.value);">높은가격순</button></li>
													<li id="order_SCORE"><button type="button" class="bt"
															value="SCORE" onclick="filter.detail('del',this.value);">상품평순</button></li>
													<li id="order_DATE"><button type="button" class="bt"
															value="DATE" onclick="filter.detail('del',this.value);">등록일순</button></li>
												</ul>
											</div>
										</nav>
									</div>
								</div>
							</div>
						</div>
						<ul class="list" id="pagingGoods">
							<c:forEach items="${list }" var="list">
								<li>
									<div class="gdset cates">
										<div class="thum">
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }"
												class="pic" data-content='${list.item_code }'
												data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }">
												<img class="img" src="${list.item_img }"
												alt="${list.item_name }">
											</a>
											
											<c:set var="doneLoop" value="false"></c:set>                           
		                                    <c:if test="${ zzim ne null }">
		                                          <c:forEach items="${ zzim }" var="zzim" varStatus="status">
		                                          <c:if test="${ not doneLoop }">
		                                             <c:if test="${ zzim.item_code eq list.item_code }">
		                                                <button type="button" class="bt zzim on"
		                                                id="btnZzim_${ list.item_code }"
		                                                data-itemcode="${ list.item_code }"
		                                                value="Y">찜하기</button>
		                                                <c:set var="doneLoop" value="true"></c:set>
		                                             </c:if>
		                                             <c:if test="${ status.last }">
		                                                <c:if test="${ status.current.item_code ne list.item_code }">
		                                                   <button type="button" class="bt zzim "
		                                                   id="btnZzim_${ list.item_code }"
		                                                   data-itemcode="${ list.item_code }"
		                                                   value="N" >찜하기</button>
		                                                <c:set var="doneLoop" value="true"></c:set>
		                                                </c:if>
		                                             </c:if>
		                                          </c:if>
		                                          </c:forEach>   
		                                    </c:if>
		                                    <c:if test="${ zzim eq null }">
		                                       <button type="button" class="bt zzim "
		                                       id="btnZzim_${ list.item_code }"
		                                       data-itemcode="${ list.item_code }"
		                                       value="N">찜하기</button>
		                                    </c:if>
									
										</div>
										<div class="boxs">
											<div class="tit">
												<a
													href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }"
													class="lk" data-content='${list.item_code }'
													data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }">${list.item_name }</a>
											</div>
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }"
												class="inf" data-content='${list.item_code }'
												data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }">

												<c:if test="${ list.sale_rate ne 0 }">
													<span class="prc"><em class="p"><fmt:formatNumber
																pattern="#,###"
																value="${ list.item_price * (1 - 0.01 * list.sale_rate)  }"></fmt:formatNumber></em></span>
													<span class="pct"><em class="n">${list.sale_rate }</em><i
														class="w">%</i></span>
												</c:if> <c:if test="${ list.sale_rate eq 0 }">
													<span class="prc"><em class="p"><fmt:formatNumber
																pattern="#,###" value="${ list.item_price }"></fmt:formatNumber></em></span>
												</c:if>
											</a>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
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
	var page = 1
	var rows = '20';
	var result = true;
	var scrollPrevent = true;
	var deviceGb = "PC"
	var goodsCount ='2699';
	
	$(function(){
		$(window).scroll(function(){
			var scrollTop = $(this).scrollTop();
			var both = $(document).innerHeight() - window.innerHeight - ($("#footer").innerHeight() || 0);
			if (both <= (scrollTop +3)) {
				if(result && scrollPrevent){
					var liLength = $("ul[id=pagingGoods]").children("li").length;
					if((liLength != goodsCount) && (liLength >= 20)){
						if(page == 1) {
							page = 1*rows
						} else {
							page = ((page/rows)+1) * rows
						}
						scrollPrevent = false;
						pagingCategoryList(page);
					}
				}
			};
		});
	});
	
	function pagingCategoryList(){
		$.ajax({
			url : "/AboutPet/Project/aboutPet/tagPageAjax.do"
			, type : "get"
			, dataType : "html"
			, data : {
				tagName : <%=request.getAttribute("tagName")%>
			}
			,cache:false
			, success : function(html){
				alert("성공");
 				$("#pagingGoods").append(html);
				/* if( $("#pagingGoods li").length % 20 != 0 || $("#pagingGoods li").length == goodsCount){
					result = false;					
				}else {
					scrollPrevent = true;
				} */
				//filter.pushUrl();
			} 
			,error: function() {
				alert("error");
			}
		});
	}
	</script>
		<script type="text/javascript">
	$(document).ready(function(){
		pagingCategoryList();
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
		<c:import url="./footer.jsp"></c:import>
		<!--// footer -->

		<div id="layers"></div>
		<!-- e : footer 영역 -->
	</div>
</body>
</html>