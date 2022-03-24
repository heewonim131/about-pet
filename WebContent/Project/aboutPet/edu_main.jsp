<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="header.jsp"%>
<%@include file="sidebar.jsp"%>



<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>aboutPet</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!--
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
-->
<!-- 
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', "G-NR86F31079");
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
-->
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
<script src="https://sgr.aboutpet.co.kr/player/thumb_api/v1.js"></script>
		<script>
			$(document).ready(function(){
				// Swiper main
				$(".main").each(function(idx){
	              varslide = [];
	              varslide[idx] = new Swiper($(this).find('.swiper-container'), {
	                  slidesPerView: 1,
					  slidesPerGroup:1,
	                  pagination: {
							el: '.main .swiper-pagination',
						},
						navigation: {
	                        nextEl: '.main .swiper-button-next',
	                        prevEl: '.main .swiper-button-prev',
	                        //disabledClass: 'disabled'
	                    },
	                    observer: true,
	                    freeMode: false,
						watchOverflow:true,
					    observeParents: true,
	              	});
	          	});
			
				var ctgCheck = $("li[name=ctgNm]").length;
				if(ctgCheck != null && ctgCheck > 0){
					for(var i = 0; i < ctgCheck; i++){
						var newCheck = $("section[name=ctgContList]")[i];
						if($(newCheck).find('i[name=newIcon]').length > 0){
							$($("li[name=ctgNm]")[i]).addClass('new');
						}
					}
				}
				
				/* 04.28 */
				$(document).on("scroll", onScroll);
				
				$('.uiTab li > a[href^="#"]').on('click', function() {

					$('.uiTab > li > a.active').each(function(){
						$(this).removeClass('active');
					});
					$(this).addClass('active');
					
					$(document).off("scroll");
					var t = $("#header_pc").height() || 0;
					var h = $(".pageHead").height() || $(".header > .hdr").height();
					var target = this.hash
					$target = $(target);
					var top = $target.offset().top - h - t;
					if(top < $(window).scrollTop()){
						top = top - 56;
					}
					$('html, body').stop().animate({scrollTop: top}, 500, 'swing', function () {
						window.location.hash = target;
						$(document).on("scroll", onScroll);
					});
				});
				
				function onScroll(){
					var scroll = $(this).scrollTop();
					$('.uiTab li > a').each(function() {

						var Link = $(this);
						var t = $("#header_pc").height();
						var h = $('.pageHead').height();
						var El = $(Link.attr('href')); 
						if (El.position().top - h - t < scroll && El.position().top - h - t + El.height() > scroll) {
							Link.addClass('active');
						}
						else{
							Link.removeClass('active');
						} 
					});
				}
			  
			  	//$(".uiTab li").eq(0).addClass('active');
			  
			  	var divSize = $(".deucation section").length;
			  
			  	for(var i = 0; i < divSize; i++) {
				  	var divId = $(".deucation section").eq(i).attr("id");
				  
				  	var liLength = $("#"+divId+" ul li").length;
				  	var progressLength = $("#"+divId+" ul li .progress-bar").length;
				  	$("#liSize" + i).text(liLength+"개");
				  	$("#listSizeOk" + i).text(progressLength+"개");
			  	}
			  
				/* 탭메뉴 */
				/* $('[data-btn-sid]').click(function(){
					var id = $(this).attr("data-btn-sid");
					var v = ($("#header_pc").css("display") == "block")?$("#header_pc").height()+20:20;
					var top = $('[data-sid = '+id+']').offset().top - $(".tab-menu").height() - v;
					$("html, body").stop().animate({scrollTop:top},300);
					$(this).addClass("active").siblings().removeClass("active")
				}); */
			
			  	if("" != null) {
				  	var obj = $(".uiTab span");
				  	for(var i = 0; i < obj.length; i++){
					 	if($(obj[i]).text() == "") {
					 		$(obj[i]).closest('a').click();
				  	 	}
				  	}
			  	}
				
			  	if("10" == "20"){// petGbCd:20(고양이)
				  	$(".menushop>button").text("고양이");
				  	$(".menushop .menu>li").removeClass("active");
				  	$(".menushop .menu>li").each(function(i, o){
					  	if(o.id == "selPetGb20"){
						  	$(this).addClass("active");
					  	}
				  	});
			  	}
			  
			  	//fnAjaxPetGb("10");
			});	
		  
		  	function fnPetGb(petGbCd){
			  	var renewURL = location.href;
			  	var urlParam = location.search;
			  	renewURL = renewURL.replace(urlParam,'');
			  	renewURL += '?pgCd='+petGbCd;
			  	history.replaceState("","",renewURL);
			  	fnAjaxPetGb(petGbCd);
			  	//location.href = "/tv/petSchool?pgCd="+petGbCd;
		  	}
		  
		  	//petGb 목록 ajax
			function fnAjaxPetGb(petGbCd) {
				var options = {
					url : "/tv/petSchoolGb"
					, data : {
						petGbCd : petGbCd
					}
					, done : function(result) {
						var html = '';
						if("PC" == "PC") {
							$("#mainBannerLi").empty();
							for(i in result.mainBanner) {
								if(result.mainBanner[i].bnrImgPathPc.indexOf('cdn.ntruss.com') != -1){
						              thumPath = result.mainBanner[i].bnrImgPathPc;
						          }else{
						              thumPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ result.mainBanner[i].bnrImgPathPc +"?type=m&w=1200&h=226&quality=90&bgcolor=FFFFFF&extopt=3";
						          }
								html += '<li class="swiper-slide">';
								html += '<div class="thumb-box">'
								html += '<a href="/tv/school/indexTvDetail?vdId='+result.mainBanner[i].vdId+'" class="thumb-img" style="background-image:url('+thumPath+');"></a>'
								html += '<div>'
								html += '</li>'
							}
							$("#mainBannerLi").append(html);
						} else if("PC" == "MO" && result.memberVO.petSchlYn == 'Y' || "PC" == "APP" && result.memberVO.petSchlYn == 'Y') {
							$("#mainBannerLi").empty();
							for(i in result.mainBanner) {
								if(result.mainBanner[i].bnrImgPathS.indexOf('cdn.ntruss.com') != -1){
						              thumPath = result.mainBanner[i].bnrImgPathS;
						          }else{
						              thumPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ result.mainBanner[i].bnrImgPathS +"?type=m&amp;w=750&amp;h=176&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3";
						          }
								html += '<li class="swiper-slide">';
								html += '<div class="thumb-box">'
								html += '<a href="/tv/school/indexTvDetail?vdId='+result.mainBanner[i].vdId+'" class="thumb-img" style="background-image:url('+thumPath+');"></a>'
								html += '<div>'
								html += '</li>'
							}
							$("#mainBannerLi").append(html);
						} else {
							$("#mainBannerLi").empty();
							for(i in result.mainBanner) {
								if(result.mainBanner[i].bnrImgPathL.indexOf('cdn.ntruss.com') != -1){
						              thumPath = result.mainBanner[i].bnrImgPathL;
						          }else{
						              thumPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ result.mainBanner[i].bnrImgPathL +"?type=f&w=375&h=211&quality=100&align=4";
						          }
								html += '<li class="swiper-slide">';
								html += '<div class="thumb-box">'
								html += '<a href="/tv/school/indexTvDetail?vdId='+result.mainBanner[i].vdId+'" class="thumb-img" style="background-image:url('+thumPath+');"></a>'
								html += '<div>'
								html += '</li>'
							}
							$("#mainBannerLi").append(html);
						}
						
						$(".deucation").empty();
						
						var html = '';
						for(var i = 0; i < result.listGb.length; i++) {
							html += '<section data-sid="edu0'+(i+1)+'" data-index="'+i+'" id="e'+(i+1)+'">';
							html += '	<div class="tit-area">';
							html += '		<h3>'+result.listGb[i]+'</h3>';
							html += '		<div class="level">';
							html += '			<div class="lv3">'
							html += '				<span>난이도1</span>';
							html += '			</div>';
							html += '			<strong>: 난이도</strong>';
							html += '		</div>';
							html += '	</div>';
							
							html += '	<p class="info-text">';
							html += '	반려동물과 보호자의 유대감을 쌓는 첫 걸음! 차근차근 함께 학습해 보아요.';
							html += '	</p>';

							html += '	<div class="edu-list">';
							html += '		<div class="list-total">총 <em class="baseCnt" id="liSize'+i+'">개</em> 중 <em class="nth" id="listSizeOk'+i+'">개</em> 학습완료</div>';
							html += '		<ul id="baseEduLi">';
							for(var j = 0; j < result.getList.length; j++) {
								if(result.getList[j].thumPath != null && result.getList[j].thumPath.indexOf('cdn.ntruss.com') != -1){
           				              thumPath = result.getList[j].thumPath;
           				            }else{
           				              thumPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ result.getList[j].thumPath +"?type=m&w=308&h=308&quality=100&bgcolor=FFFFFF&extopt=3";
           				            }
								
								var lodCd;
               					if(result.getList[j].lodCd == "10") {
               						lodCd = '1';
               					} else if(result.getList[j].lodCd == "20") {
               						lodCd = '2';
               					} else {
               						lodCd = '3';
               					}
								
								if(result.listGb[i] == result.getList[j].ctgMnm) {
									html += '	<li>'
									if(result.getList[j].newYn == 'Y') {
										html += '	<i class="icon-n">N</i>'
									}
									html += '		<div class="thumb-box" onclick="fncGoSchoolDetail(\''+ result.getList[j].vdId +'\')" style="cursor:pointer;" data-content="'+result.getList[j].vdId+'" data-url="/tv/school/indexTvDetail?vdId='+result.getList[j].vdId+'">';
									html += '			<a href="#" onclick="return false;" class="thumb-img" style="background-image:url('+thumPath+');">';
									if(result.getList[j].stepProgress != null && result.getList[j].stepProgress != '') {
										html += '			<div class="progress-bar" style="width:'+result.getList[j].stepProgress+';"></div>';
									}
									html += '			</a>';
									html += '			<div class="thumb-info gray">';
									html += '				<a href="#" onclick="return false;" class="tlt" style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display:block;">'+result.getList[j].ttl+'</a>';
									html += '				<span class="level lv'+lodCd+'">';
									html += '					<span>난이도1</span>';
									html += '					<span>난이도2</span>';
									html += '					<span>난이도3</span>';
									html += '				</span>'
									html += '			</div>';
									html += '		</div>';
									html += '	</li>';
								}
							}
							html += '		</ul>';
							html += '	</div>';
							html += '</section>';
						}
						$(".deucation").append(html);

						var divSize = $(".deucation section").length;
						for(var i = 0; i < divSize; i++) {
							var divId = $(".deucation section").eq(i).attr("id");
								  
							var liLength = $("#"+divId+" ul li").length;
							var progressLength = $("#"+divId+" ul li .progress-bar").length;
							$("#liSize" + i).text(liLength+"개");
							$("#listSizeOk" + i).text(progressLength+"개");
						}
							  
						$(".tab-menu ul").empty();
							 
						var menuHtml ='';
						for(var i = 0; i < divSize; i++) {
						 	menuHtml += '<li data-btn-sid="edu0'+(i+1)+'">'
						 	menuHtml +=	'<a class="bt" href="#e'+(i+1)+'"><span>'+result.listGb[i]+'</span></a>'
						 	menuHtml += '</li>'
						}
						$(".tab-menu ul").append(menuHtml);
						
						//$(".tab-menu ul li").eq(0).addClass('active');
						
						/* 04.28 */
						$(document).on("scroll", onScroll);
						$('.uiTab li > a[href^="#"]').on('click', function() {

							$('.uiTab > li > a.active').each(function(){
								$(this).removeClass('active');
							});
							$(this).addClass('active');
					
							$(document).off("scroll");
							var t = $("#header_pc").height() || 0;
							var h = $(".pageHead").height() || $(".header > .hdr").height();
							var target = this.hash
							$target = $(target);
							var top = $target.offset().top - h - t;
							if(top < $(window).scrollTop()){
								top = top - 56;
							}
							$('html, body').stop().animate({scrollTop: top}, 500, 'swing', function () {
								window.location.hash = target;
								$(document).on("scroll", onScroll);
							});

						});
								
						function onScroll(){
							var scroll = $(this).scrollTop();
							$('.uiTab li > a').each(function() {
	
								var Link = $(this);
								var t = $("#header_pc").height();
								var h = $('.pageHead').height();
								var El = $(Link.attr('href')); 
								if (El.position().top - h - t < scroll && El.position().top - h - t + El.height() > scroll) {
									Link.addClass('active');
								}
								else{
									Link.removeClass('active');
								} 
							});
						}
					}
				};
				ajax.call(options);
			}
			
			function onThumbAPIReady() {
			    thumbApi.ready();
			};
			
			//APP일 경우 영상 상세 이동 URL 페이지 호출
			function goUrl(funcNm, type, url) {
				toNativeData.func = funcNm;
				toNativeData.type = type;
				toNativeData.url = url;
				
				toNative(toNativeData);
			}
			
			//앱에서 뒤로가기
			function backHistory() {
				/*if(document.referrer.indexOf("tv/home") > -1){
					location.href = document.referrer;
				} else {
					history.go(-1);
				}*/
				
				location.href = "/tv/home";
			}
			
			//펫스쿨 상세 이동
			function fncGoSchoolDetail(vdId){
				//location.href="/tv/school/indexTvDetail?vdId="+vdId;
				storageHist.goBack("/tv/school/indexTvDetail?vdId="+vdId);
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
		
		<!-- s : header 영역--> 
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
			$.cookie("searchLastFocus", "20", {path:'/'});
			location.href = "/commonSearch?focus=20"+((searchWord.trim() == "")? "":"&srchWord="+encodeURIComponent(searchWord.trim()))+"&cateCdL="+srchShopDispClsfNo;
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
			mbrNo = "9AED76EAB15E2024AF3513CF16BA930A";
			if("" != "0"){
				mbrNo = "0";
			}
			
			// 요청구분
			section = "20";
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
		var url = "/tv/petSchool";
		if("/tv/petSchool" == "/event/indexSpecialExhibitionZone"){
			url = "/shop/home";
		}
		
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lnbDispClsfNo');
		hiddenField.setAttribute('value', lnbDispClsfNo);
		form.appendChild(hiddenField);
		
		if("/tv/petSchool" == "/shop/indexCategory"||
			"/tv/petSchool" == "/event/indexExhibitionZone") {
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "cateCdL");
			hiddenField.setAttribute("value", cateCdL);	// 12564
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/tv/petSchool" == "/shop/indexNewCategory" ||
				 "/tv/petSchool" == "/shop/indexBestGoodsList") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/tv/petSchool" == "/pet/event/petshopEventList" ||
			"/tv/petSchool" == "/shop/indexLive" ){				
			form.setAttribute("method", "GET");
		}else if("/tv/petSchool" == "/event/shop/main"){
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

<!--header pc
<header class="header pc cu mode0" data-header="set0" id="header_pc">
	<input type="password" style="display:none;"/>
	<div class="hdr">
		<div class="inr">
			<div class="tdt">
				<ul class="menu">					
					<li><a href="/join/indexTerms?header=Y" class="bt">회원가입</a></li>
		                <li><a href="javascript:clickLogin();" class="bt">로그인</a></li>
		                <!-- <li><a href="javascript:;" class="bt">로그인/회원가입</a></li> 
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
-->
<!--	
			<div class="hdt">
				
				<button class="mo-header-btnType02">취소</button>
				
				<button class="btnGnb" type="button">메뉴</button>

				<h1 class="logo tv">
					<a class="bt" href="/shop/home/">AboutPet</a>
				</h1>
				
				
				<button class="mo-header-backNtn" onclick="storageHist.goBack();">뒤로</button>
					<div class="mo-heade-tit"  >
					<span class="tit"></span>
								</div>
				<div class="mo-header-rightBtn">
						<button class="mo-header-btnType01">
							<span class="mo-header-icon"></span>
							</button>
					</div>
				<button class="mo-header-close"></button>
				
				<nav class="tmenu">
					<ul class="list">
				<li id="liTag_20" class="active"><a href="/tv/home/" class="bt">펫TV</a></li>
						<li id="liTag_30" class=""><a href="/log/home/" class="bt">펫로그</a></li>
						<li id="liTag_10" class=""><a href="/shop/home/" class="bt">펫샵</a></li>
						<li id="liTag_00" class=""><a href="/mypage/indexMyPage/" class="bt">MY</a></li>
					</ul>
				</nav>
			</div>
			<div class="cdt" >
						<div class="schs">
								<div class="form ">
									<div class="input del kwd"><input id="srchWord" name="srchWord" type="search" value="" autocomplete="off" ></div>
									<button type="button" class="btnSch" data-content="" data-url="/commonSearch">검색</button>
									
									<div class="key-word-list" id="key-word-list" style="display:none;"><ul></ul></div>
									
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
-->
		
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
					<li class="tv active">
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
					<li class="shop ">
						<a class="bt" href="javascript:;">펫 샵</a>
					<div class="box">
							<div class="cate slideShop">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
									<li class="swiper-slide active"><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12564" href="javascript:;" class="bt">강아지</a></li>
												<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12565" href="javascript:;" class="bt">고양이</a></li>
												<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14111" href="javascript:;" class="bt">관상어</a></li>
												<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14196" href="javascript:;" class="bt">소동물</a></li>
												</ul>
								</div>
							</div>
							<div class="ctset active" data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12564">
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
		<!-- 바디 - 여기위로 템플릿 -->
		<main class="container page tv schoolHome" id="container">
			<div class="inr">			
				<!-- 본문 -->
				<div class="contents" id="contents">
                    <div class="inner-wrap">

						<!-- 모바일 서브헤드 -->
<div class="pageHead" style="height:0px; display:none;">
							<div class="inr">
								<div class="hdt">
									<button class="back" type="button" onclick="backHistory();">뒤로가기</button>
									<h2 class="subtit">펫스쿨</h2>
									<nav class="menushop" id="topMenu">
										<button type="button" class="bt st">강아지</button>
										<div class="list">
											<ul class="menu">
												<li id="selPetGb10"><a class="bt" href="javascript:fnPetGb('10');"><b class="t">강아지</b></a></li>
												<li id="selPetGb20"><a class="bt" href="javascript:fnPetGb('20');"><b class="t">고양이</b></a></li>
												</ul>
										</div>
									</nav>
								</div>
								<div class="mdt">
									<button class="bt schs" type="button">검색</button>
									<button class="bt gnbs btnGnb" type="button">메뉴</button>
									
								</div>
							</div>
						</div>
                        
						<div class="pc-subtit">
							<h2>펫스쿨</h2>
							<nav class="menushop" id="topMenu">
								<button type="button" class="bt st"></button>
								<div class="list">
									<ul class="menu">
										<li id="selPetGb10"><a class="bt" href="javascript:fnPetGb('10');">강아지</a></li>
										<li id="selPetGb20"><a class="bt" href="javascript:fnPetGb('20');">고양이</a></li>
										</ul>
								</div>
							</nav>
							</div>
						<!-- //pc-subtit -->
						
						<section class="main">
							<div class="swiper-div h-div" id="mainBanner">
								<div class="swiper-container space">
									<ul class="swiper-wrapper" id="mainBannerLi">
										<li class="swiper-slide">
											<div class="thumb-box">
												<a href="/tv/school/indexTvDetail?vdId=E2021042601091" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/E2021042601091/80/9e732640-9e0a-4105-9d0c-16029b9eca5d.png?type=m&w=1200&h=226&quality=90&bgcolor=FFFFFF&extopt=3);"></a>
											</div>
										</li>
										<li class="swiper-slide">
											<div class="thumb-box">
												<a href="/tv/school/indexTvDetail?vdId=E2021042701096" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/E2021042701096/80/4b76c216-218f-4eab-b548-e234c8473d39.png?type=m&w=1200&h=226&quality=90&bgcolor=FFFFFF&extopt=3);"></a>
											</div>
										</li>
										</ul>
									<div class="swiper-pagination"></div>
								</div>
								<div class="remote-area">
									<button type="button" class="swiper-button-prev"></button>
									<button type="button" class="swiper-button-next"></button>
								</div><!-- 03.30 추가 -->
							</div>
							<!-- //Swiper -->
						</section>
						<section class="tab-menu">
							<div class="inner">
								<ul class="uiTab a">
								<li data-btn-sid="edu01" class="" name="ctgNm">
										<a class="bt" href="#e1"><span>기초교육</span></a>
									</li>
								<li data-btn-sid="edu02" class="" name="ctgNm">
										<a class="bt" href="#e2"><span>사회화 교육</span></a>
									</li>
								<li data-btn-sid="edu03" class="" name="ctgNm">
										<a class="bt" href="#e3"><span>실내놀이</span></a>
									</li>
								<li data-btn-sid="edu04" class="" name="ctgNm">
										<a class="bt" href="#e4"><span>케어</span></a>
									</li>
								</ul>
							</div>
						</section>
						
						
						<div class="deucation tab-cont">
						<section data-sid="edu01" data-index="0" id="e1" name="ctgContList">
								<div class="tit-area">
									<h3>기초교육</h3>
									<div class="level">
										<div class="lv3"><!-- 난이도별 class lv1, lv2, lv3 -->
											<span>난이도${eduitem.edu_diff }</span>
										</div>
										<strong>: 난이도</strong>
									</div>
								</div>
								
								<p class="info-text">
									반려동물과 보호자의 유대감을 쌓는 첫 걸음! 차근차근 함께 학습해 보아요.
								</p>
                                 
								<div class="edu-list" id="baseEdu">
								
								
									<div class="list-total">총 <em class="baseCnt" id="liSize0">${cnt1}개</em> 중 <em class="nth" id="listSizeOk0">${mlist1}개</em> 학습완료</div>
									<ul id="baseEduLi">
									
									<!--Edu_list : 배열,  eduitem : 한 행 -->
									<c:forEach items="${Edu_list}" var="eduitem" > 
									<c:if test="${eduitem.edu_cate eq '기초교육'}" >
									
									
									<li>
										<!-- 	<div class="thumb-box" onclick="fncGoSchoolDetail('E2021042301050');"  style="cursor:pointer;" data-content="E2021042301050" data-url=""> -->
											<div class="thumb-box" onclick="location.href='edu_sub.do?edu_title=${eduitem.edu_title}'"  style="cursor:pointer;" data-content="E2021042301050" data-url="">
												<a href="edu_sub.do?edu_title=${eduitem.edu_title}" onclick="return false;" class="thumb-img" style="background-image:url(${eduitem.v_img});"> <!-- 이게 하나의 영상 : eduitem -> img넣는 것 -->
													</a>
												<div class="thumb-info gray">
													<a href="edu_sub.do?edu_title=${eduitem.edu_title} " onclick="return false;" class="tlt" style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display:block;">
													${eduitem.edu_title} </a>
													<span class="level lv${eduitem.edu_diff }"><!-- 난이도별 class lv1, lv2, lv3 -->
														<span>난이도1 </span>
														<span>난이도2</span>
														<span>난이도3</span>
													</span>
												</div>
											</div>
										</li>
										</c:if>
										</c:forEach>
										
										
										</ul>
								</div>
							</section>
							
							<section data-sid="edu02" data-index="1" id="e2" name="ctgContList">
								<div class="tit-area">
									<h3>사회화 교육</h3>
									<div class="level">
										<div class="lv2"><!-- 난이도별 class lv1, lv2, lv3 -->
											<span>난이도${eduitem.edu_diff }</span>
										</div>
										<strong>: 난이도</strong>
									</div>
								</div>
								
								<p class="info-text">
									반려동물과 보호자의 유대감을 쌓는 첫 걸음! 차근차근 함께 학습해 보아요.
								</p>

								<div class="edu-list" id="baseEdu">
									<div class="list-total">총 <em class="baseCnt" id="liSize1">${cnt2}개</em> 중 <em class="nth" id="listSizeOk1">${mlist2}개</em> 학습완료</div>
									<ul id="baseEduLi">
									
									<c:forEach items="${Edu_list}" var="eduitem">
									<c:if test="${eduitem.edu_cate eq '사회화교육'}" >
									<li>
											<div class="thumb-box" onclick="location.href='edu_sub.do?edu_title=${eduitem.edu_title}'" style="cursor:pointer;" data-content="E2021042601073" data-url="/tv/school/indexTvDetail?vdId=E2021042601073">
												<a href="edu_sub.do?edu_title=${eduitem.edu_title}" onclick="return false;" class="thumb-img" style="background-image:url(${eduitem.v_img});">
													</a>
												<div class="thumb-info gray">
													<a href="edu_sub.do?edu_title=${eduitem.edu_title}" onclick="return false;" class="tlt" style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display:block;">
						 							${eduitem.edu_title} </a>
													<span class="level lv${eduitem.edu_diff} "><!-- 난이도별 class lv1, lv2, lv3 -->
														<span>난이도1</span>
														<span>난이도2</span>
														<span>난이도3</span>
													</span>
												</div>
											</div>
										</li>
										</c:if>
										</c:forEach>
										</ul>
								</div>
								</section>
										
							<section data-sid="edu03" data-index="2" id="e3" name="ctgContList">
								<div class="tit-area">
									<h3>실내놀이</h3>
									<div class="level">
										<div class="lv3"><!-- 난이도별 class lv1, lv2, lv3 -->
											<span>난이도${eduitem.edu_diff }</span>
										</div>
										<strong>: 난이도</strong>
									</div>
								</div>
								
								<p class="info-text">
									반려동물과 보호자의 유대감을 쌓는 첫 걸음! 차근차근 함께 학습해 보아요.
								</p>

								<div class="edu-list" id="baseEdu">
									<div class="list-total">총 <em class="baseCnt" id="liSize2">${cnt3}개</em> 중 <em class="nth" id="listSizeOk2">${mlist3}개</em> 학습완료</div>
									<ul id="baseEduLi">
									
									<c:forEach items="${Edu_list}" var="eduitem">
									<c:if test="${eduitem.edu_cate eq '실내놀이'}" >
									<li>
											<div class="thumb-box" onclick="location.href='edu_sub.do?edu_title=${eduitem.edu_title}'" style="cursor:pointer;" data-content="E2021042601090" data-url="/tv/school/indexTvDetail?vdId=E2021042601090">
												<a href="edu_sub.do?edu_title=${eduitem.edu_title}" onclick="return false;" class="thumb-img" style="background-image:url(${eduitem.v_img});">
													</a>
												<div class="thumb-info gray">
													<a href="edu_sub.do?edu_title=${eduitem.edu_title}" onclick="return false;" class="tlt" style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display:block;">
													${eduitem.edu_title} </a>
													<span class="level lv${eduitem.edu_diff}"><!-- 난이도별 class lv1, lv2, lv3 -->
														<span>난이도1</span>
														<span>난이도2</span>
														<span>난이도3</span>
													</span>
												</div>
											</div>
										</li>
										</c:if>
										</c:forEach>
									</ul>
									</div>
								</section>
										
							<section data-sid="edu04" data-index="3" id="e4" name="ctgContList">
								<div class="tit-area">
									<h3>케어</h3>
									<div class="level">
										<div class="lv3"><!-- 난이도별 class lv1, lv2, lv3 -->
											<span>난이도${eduitem.edu_diff }</span>
										</div>
										<strong>: 난이도</strong>
									</div>
								</div>
								
								<p class="info-text">
									반려동물과 보호자의 유대감을 쌓는 첫 걸음! 차근차근 함께 학습해 보아요.
								</p>

								<div class="edu-list" id="baseEdu">
									<div class="list-total">총 <em class="baseCnt" id="liSize3">${cnt4}개</em> 중 <em class="nth" id="listSizeOk3">${mlist4}개</em> 학습완료</div>
									<ul id="baseEduLi">
									<c:forEach items="${Edu_list}" var="eduitem">
									<c:if test="${eduitem.edu_cate eq '케어'}" >
									<li>
											<div class="thumb-box" onclick="location.href='edu_sub.do?edu_title=${eduitem.edu_title}'" style="cursor:pointer;" data-content="E2021042301056" data-url="/tv/school/indexTvDetail?vdId=E2021042301056">
												<a href="edu_sub.do?edu_title=${eduitem.edu_title}" onclick="return false;" class="thumb-img" style="background-image:url(${eduitem.v_img});">
													</a>
												<div class="thumb-info gray">
													<a href="edu_sub.do?edu_title=${eduitem.edu_title}" onclick="return false;" class="tlt" style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display:block;">${eduitem.edu_title}</a>
													<span class="level lv${eduitem.edu_diff }"><!-- 난이도별 class lv1, lv2, lv3 -->
														<span>난이도1</span>
														<span>난이도2</span>
														<span>난이도3</span>
													</span>
												</div>
											</div>	
										
										</li>
										</c:if>
										</c:forEach>
									</ul>
									</div>
								
								</section>
										
								</div>
						</div>
					</div>		
                    </div>
                    </main>
				</div>
       
        
        <!-- 플로팅 버튼 -->
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
</nav><!-- location 영역 포함  -->			
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
		<li id="liTag_20" class="tv active">
					<a href="#" onclick="location.href='https://aboutpet.co.kr/tv/home/'" class="bt"><span>TV</span></a>
				</li>
				<li id="liTag_30" class="log ">
					<a href="#" onclick="location.href='https://aboutpet.co.kr/log/home/'" class="bt"><span>로그</span></a>
				</li>
				<li id="liTag_10" class="shop ">
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
</script>
<%@include file="footer.jsp"%>

</body>
</html>