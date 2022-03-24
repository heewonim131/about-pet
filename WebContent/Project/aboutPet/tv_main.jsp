<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
<%-- <%@include file="sidebar.jsp"%> --%>
<jsp:include page="sidebar.jsp" flush="true"/>


<html lang="ko"><head>
<title>aboutPet</title>
<meta charset="utf-8" pageEncoding="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="https://sgr.aboutpet.co.kr/dist/css/player_aboutpet_ui.css?v=2"><link rel="canonical" href="">
<meta name="author" content="">
<meta name="description" content="">
<meta name="keywords" content="">

<link rel = "stylesheet" href = "../css/com.css">
<link rel = "stylesheet" href = "../css/common.css">
<link rel = "stylesheet" href = "../css/disp.css">
<link rel = "stylesheet" href = "../css/layout.css">
<link rel = "stylesheet" href = "../css/style.css">
<link rel = "stylesheet" href = "../css/swiper.css">
<link rel = "stylesheet" href = "../css/tv.css">

<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/jquery/jquery-3.3.1.min.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/jquery/jquery.ui.datepicker-ko.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/jquery/jquery.blockUI.js" charset="utf-8"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/jquery/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/jquery/jquery.number.min.js" charset="utf-8"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/jquery/jquery.form.min.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/jquery/jquery.countdown.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/jquery/jquery.cookie.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/swiper.min.js"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/clipboard.min.js"></script>
<script type="text/javascript"  src="/scriptAll/common.js" ></script>
<script type="text/javascript"  src="/scriptAll/popup.js" ></script>
<script type="text/javascript" 	src="../scriptAll/ui.js"></script>
<script type="text/javascript" 	src="/scriptAll/deviceChk.js"></script>	<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&libraries=services"></script>
<script type="text/javascript" 	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/scriptAll/kakao-map.js"></script>
<!-- app interface --> 
<script type="text/javascript" 	src="/scriptAll/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" 	src="/scriptAll/adbrix.js"></script>
<script type="text/javascript" 	src="/scriptAll/ui.mo.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&submodules=geocoder"></script>
<script type="text/javascript">
//	const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
</script>

<link rel="stylesheet" type="text/css" href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css"> 

<script src="https://sgr.aboutpet.co.kr/player/thumb_api/v1.js"></script>
<style>
	
	.hdts .hdt .more .t a{
    /* display: none; */
    font-size: 15rem;
    font-weight: 700;
	}
        /* 소리가 켜져있을때 아이콘 */
        .v_mutd_on{
            width:30px;
            height:30px;
            border-radius:100%;
            background-color:rgba(0,0,0,0.5);
            background-image:url(https://sgr.aboutpet.co.kr/dist/images/speaker-high-fill-white.svg);
            background-position:center;
            background-size:50%;
            background-repeat:no-repeat;
		/*  position:absolute; top:20px; right:20px; */
        }

        /* 음소거 상태의 아이콘 */
        .v_mutd_off{
            width:30px;
            height:30px;
            border-radius:100%;
            background-color:rgba(0,0,0,0.5);
            background-image:url(https://sgr.aboutpet.co.kr/dist/images/speaker-slash-fill-white.svg);
            background-position:center;
            background-size:50%;
            background-repeat:no-repeat;
		/*  position:absolute; top:20px; right:20px; */
        }
</style> 
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
</style>
    
<script>
			var swiperTag;

		  	$(document).ready(function(){
			  	$("[id^=tagVodListBtn]").eq(0).addClass('on');

			  	$("#tagLists").css("height", "234.97px");
			  	
            	/* Swiper 메인 */
				var swiperMain = null;
				var swiperMain = new Swiper('.main .swiper-container', {
					loop: true,
					speed: 600,
					slideToClickedSlide: true,
					slidesPerView: "auto",
					slidesPerGroup:1,
					freeMode: false,
					centeredSlides: true,
					pagination: {
						el: '.swiper-pagination',
					},
					navigation: {
						nextEl: '.main .swiper-button-next',
						prevEl: '.main .swiper-button-prev',
					},
					breakpoints: {
						1300: {
							slidesPerView: "auto"
						},
					}
				});
				
				// Swiper 펫스쿨
				var swiperSchool = new Swiper('.school .swiper-container', {
					slidesPerView: 5,
					spaceBetween: 50,
					navigation: {
						nextEl: '.school .swiper-button-next',
						prevEl: '.school .swiper-button-prev',
					}
				});
				
				// Swiper 독점
				var swiper3 = new Swiper('.alone .swiper-container', {
					slidesPerView: 3,
					spaceBetween: 18,
					centeredSlides: false,
					navigation: {
						nextEl: '.alone .swiper-button-next',
						prevEl: '.alone .swiper-button-prev',
					}
				});
				
				// Swiper 신규
				var swiperNew = null;
				$(".main .swiper-slide:eq("+(swiperMain.activeIndex)+")").prevAll().addClass("preve");
				swiperNew = new Swiper('.new .swiper-container', {
					slidesPerView: 3,
					spaceBetween: 18, 
					navigation: {
						nextEl: '.new .swiper-button-next',
						prevEl: '.new .swiper-button-prev',
					}
				});
				
				if($("#ulId li").length > 4) {
	            	$('.new .swiper-button-next').removeClass("swiper-button-disabled");
	            }
				
				// Swiper 맞춤
				var swiperFit = new Swiper('.fit .swiper-container', {
					slidesPerView: 4,
					spaceBetween: 16, 
					navigation: {
						nextEl: '.fit .swiper-button-next',
						prevEl: '.fit .swiper-button-prev',
					}
				});
				
				// Swiper 인기
				var swiperPopul = new Swiper('.popul .swiper-container', {
					slidesPerView: 4,
					spaceBetween: 16, 
					navigation: {
						nextEl: '.popul .swiper-button-next',
						prevEl: '.popul .swiper-button-prev',
					}
				});
				
				// Swiper 태그 관심
				swiperTag = new Swiper('.tag .swiper-container', {
					slidesPerView: 4,
					spaceBetween: 16, 
					navigation: {
						nextEl: '.tag .swiper-button-next',
						prevEl: '.tag .swiper-button-prev',
					}
				});
				
				// Swiper 최근
				var swiperRecent = new Swiper('.recent .swiper-container', {
					slidesPerView: "auto",
					spaceBetween: 22, 
					navigation: {
						nextEl: '.recent .swiper-button-next',
						prevEl: '.recent .swiper-button-prev',
					}
				});
				
				// progress
				var wTimer = null;
				//console.log($(".circlePie").length)
				if($(".circlePie").length && $(".recent").css("display") !== "none"){
					$(window).resize(function(){
						if(wTimer !== null) clearTimeout(wTimer);
						wTimer = setTimeout(function(){
							price = $(".circlePie").width();
							createPie();
							//console.log("price : " + price);
						},1000);
					});
					var price = $(".circlePie").width();
					createPie();
					function createPie(p){
						$(".circlePie").each(function(i,n){
							var can = document.createElement("canvas");
							var ctx = can.getContext("2d");
							var p = ($(n).data("p") !== undefined)?$(n).data("p"):80;
							//console.log("price : " + price);
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
								ctx.fillStyle="white";
								ctx.fill();
								ctx.closePath();
								ctx.textAlign = "center";
								ctx.fillStyle ="red";
								ctx.rotate(Math.PI * 0.5);
								if(n >= max){
									clearInterval(timer);
								};
							},50)
						};
					};
				};
				
				// Swiper TV 전시 - 시리즈 TAG, 동영상 TAG
				$(".exhibition").each(function(index, element){
					var $this = $(this);
					$this.addClass('list' + index);
					//$(this).find('.tit').append('list' + index); //화면 확인시 복제 확인용 개발페이지에는 적용 X 
					
					var seriesSwiper = new Swiper('.list' + index + ' .swiper-container', {
						slidesPerView : 4,
						spaceBetween: 16,
						navigation: {
							nextEl: $(".list" + index)
								.find(".remote-area ")
								.children(".swiper-button-next"),
							prevEl: $(".list" + index)
								.find(".remote-area ")
								.children(".swiper-button-prev"),
						}
					});
				});
			});

			//관심 태그 관련 영상 목록(PC)
			function vodTagList(tagNo, duplev_codes) {
				$("[id^=tagVodListBtn]").removeClass('on');
				$("#tagVodListBtn"+tagNo).addClass('on');

	          	$("#tagLists").empty();
	          	var options = {
          			url : "/tv/tvTagVodList"
          			, data : {
          				tagNo : tagNo
          				, duplev_codes : duplev_codes
          			}
          			, done : function(data) {
          				for(i in data.tagVodList) {
          					if(data.tagVodList[i].thumPath.indexOf('cdn.ntruss.com') != -1){
				              	thumPath = data.tagVodList[i].thumPath;
				          	}else{
				              	thumPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ data.tagVodList[i].thumPath +"?type=f&w=288&h=167&quality=100&align=4";
				          	}

						  	if(data.tagVodList[i].srisPrflImgPath.indexOf('cdn.ntruss.com') != -1){
				              	srisPrflImgPath = data.tagVodList[i].srisPrflImgPath;
				          	}else{
				              	srisPrflImgPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ data.tagVodList[i].srisPrflImgPath +"?type=f&w=72&h=72&quality=100&align=4";
				          	}

          					var html = '';
          					html += '<li class="swiper-slide">';
          					html += 	'<div class="thumb-box">';
           					html += 		'<a href="/tv/series/indexTvDetail?v_code='+data.tagVodList[i].v_code+'&sortCd=&listGb=HOME" class="thumb-img" style="background-image:url(' + thumPath + ');">';
       					 	html += 			'<div class="time-tag"><span>'+ data.tagVodList[i].totLnth +'</span></div>';
       					 	html += 		'</a>';
          					html += 		'<div class="thumb-info top">';
          					html += 			'<div class="round-img-pf" style="background-image:url(' + srisPrflImgPath + ');"></div>';
          					html += 			'<div class="info">';
          					html += 				'<div class="tlt">';
          					html += 					'<a href="/tv/series/indexTvDetail?v_code='+data.tagVodList[i].v_code+'&sortCd=&listGb=HOME">';
       					 	html += 						data.tagVodList[i].ttl;
       					 	html += 					'</a>';
          					html +=					'</div>';
          					html += 				'<div class="detail">';
          					/* html += 					'<span class="read play">' + data.tagVodList[i].hits + '</span>'; */
          					html += 					'<span class="read like">'+ data.tagVodList[i].likeCnt +'</span>';
          					html += 				'</div>';
          					html += 			'</div>';
          					html += 		'</div>';
          					html += 	'</div>';
          					html += '</li>';

          					$("#tagLists").append(html);
          				}

	          			var url = "/tv/hashTagList?tagNo="+tagNo+"";
						$("#hashTagVodList").attr("href", url);

						swiperTag.update();
						swiperTag.slideTo(0);
          			}
	          	};
	          	ajax.call(options);
	        }

			//링크이동 버튼
			function orderPageBtnClick(linkUrl, title){
				if("PC" == "APP"){ // APP인경우
					if (linkUrl.indexOf("http://") > -1 || linkUrl.indexOf("https://")  > -1 ) {
						// 데이터 세팅
						toNativeData.func = 'onOrderPage';
						toNativeData.url = linkUrl;
						toNativeData.title = title;
						// 호출
						toNative(toNativeData);
					}else {
						location.href=linkUrl;
					}
				}else{
					location.href=linkUrl;
				}
			}
		</script>
		
       	<script type="text/javascript">
		var mn = parseInt("0");
		if(window.opener != null && mn != 0 && $(opener.document).find("#sns-connecting").length>0){
			window.opener.adapter();
			window.opener.childWin = null;
			self.close();
		}
		
/* url 이동 */

		//시리즈 목록 이동
		function srisDetail(srisNo){
			url = "series_detail.do?s_code="+s_code+"&s_season="+s_season;
			location.href = url;
		}
		
		//펫스쿨 상세 이동
		function fncGoSchoolDetail(v_code){
			location.href="/tv/school/indexTvDetail?v_code="+v_code;
		}
		
		//시리즈 TAG 목록 화면
		function fncGoSeriesTagVodList(dispCornNo){
			location.href="/tv/seriesTagList?dispCornNo=" + dispCornNo;	
		}
		
		//동영상 TAG 목록 화면
		function fncGoTagVodList(dispCornNo){
			location.href="video_detail?do=v_code" + v_code;
		}
	</script>

<body class="body tv home isPc gnb_ac isTalk isFoot">
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
			mbrNo = "4A5CFAF109F08F6F496462B892771229";
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
		var url = "/tv/home/";
		if("/tv/home/" == "/event/indexSpecialExhibitionZone"){
			url = "/shop/home";
		}
		
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lnbDispClsfNo');
		hiddenField.setAttribute('value', lnbDispClsfNo);
		form.appendChild(hiddenField);
		
		if("/tv/home/" == "/shop/indexCategory"||
			"/tv/home/" == "/event/indexExhibitionZone") {
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "cateCdL");
			hiddenField.setAttribute("value", cateCdL);	// 12564
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/tv/home/" == "/shop/indexNewCategory" ||
				 "/tv/home/" == "/shop/indexBestGoodsList") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/tv/home/" == "/pet/event/petshopEventList" ||
			"/tv/home/" == "/shop/indexLive" ){				
			form.setAttribute("method", "GET");
		}else if("/tv/home/" == "/event/shop/main"){
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


</div>
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
</nav>

<body>

<div class="layers tv seriesHome" id="srisListPopup"></div>
<!-- e : gnb 영역 -->			
<!-- s : LNB 영역 -->
<!-- e : LNB 영역 -->
<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
				
<!-- s : 본문영역 -->			
<!-- 바디 - 여기위로 템플릿 -->
		<main class="container page tv home" id="container">
			<div class="inr" style="min-height: 491px;">
				<!-- 본문 -->
				<div class="contents" id="contents">
					<!-- 메인 슬라이드 -->
					
<%-- 검은배너  		
		<section class="main">
		<div class="swiper-div">
			<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
				<ul class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-4541.97px, 0px, 0px);">
					
				<c:set var="flag" value="false" />   	
				<c:forEach items="${ blist }" var="bitem" varStatus="status"> 
				<c:if test="${ not flag }">
					<li class="swiper-slide swiper-slide-duplicate preve <c:if test="${status.count eq 1}">swiper-slide-duplicate-active</c:if>
						<c:if test="${status.count eq 2}">swiper-slide-duplicate-next</c:if>
						<c:if test="${status.count eq 5}">swiper-slide-prev</c:if>" data-swiper-slide-index="${status.count-1 }">
	                          	<div class="thumb-box">
	                              	<div class="dummyImg">
	                              	  	<a href="#" onclick="" class="thumb-img" data-content="" data-url="" style="background-image:url(${bitem.s_img});"></a>
		                                  		</div>
	                              	<div class="thumb-info">
										<div class="info">
		                                  	<p class="sub">
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000000031'); return false;" class="sub">#말티즈</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000000424'); return false;" class="sub">#애교</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000002083'); return false;" class="sub">#왕크니까왕귀엽다왕티즈</a>
			                                  	</p>
											<a href="series_detail?s_code=${bitem.s_code}&s_season=${bitem.s_season}" onclick="" data-content="" data-url="">
			                                  				<div class="tlt">${bitem.s_name} </div></a>
													<a href="series_detail?s_code=${bitem.s_code}&s_season=${bitem.s_season}" onclick="" data-content="" data-url="">
			                                  		<div class="detail"><span>${bitem.s_desc}</span></div>
			                                  			</a></div>
			                       </div></div>
	                  </li>
	                  <c:if test="${ status.count ge 5 }">
					  <c:set var="flag" value="true" />
					 </c:if>
				</c:if>
				</c:forEach>
				
				
				<c:set var="flag" value="false" />   	
				<c:forEach items="${ blist }" var="bitem" varStatus="status"> 
				<c:if test="${ not flag }">
					<li class="swiper-slide <c:if test="${status.count eq 1}">swiper-slide-active</c:if>
											<c:if test="${status.count eq 2}">swiper-slide-next</c:if>
											<c:if test="${status.count eq 5}">swiper-slide-prev</c:if>" data-swiper-slide-index="${status.count-1 }">
									<div class="thumb-box">
	                              	<div class="dummyImg">
	                              	  	<a href="#" onclick="" class="thumb-img" data-content="" data-url="" style="background-image:url(${bitem.s_img});"></a>
		                                  		</div>
	                              	<div class="thumb-info">
										<div class="info">
		                                  	<p class="sub">
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000000031'); return false;" class="sub">#말티즈</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000000424'); return false;" class="sub">#애교</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000002083'); return false;" class="sub">#왕크니까왕귀엽다왕티즈</a>
			                                  	</p>
											<a href="series_detail?s_code=${bitem.s_code}&s_season=${bitem.s_season}" onclick="" data-content="" data-url="">
			                                  				<div class="tlt">${bitem.s_name} </div></a>
													<a href="series_detail?s_code=${bitem.s_code}&s_season=${bitem.s_season}" onclick="" data-content="" data-url="">
			                                  		<div class="detail"><span>${bitem.s_desc}</span></div>
			                                  			</a></div>
			                       </div></div>
	                      	</li>
						
						<li class="swiper-slide swiper-slide-duplicate-prev" data-swiper-slide-index="4">
	                          	<div class="thumb-box">
	                              	<div class="dummyImg">
	                              	  	<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=71&amp;returnUrl=/tv/home/'); return false;" class="thumb-img" data-content="463" data-url="https://aboutpet.co.kr/event/detail?eventNo=71" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/462/cafc6de7-4c02-4c5f-b80c-312cec0c1541.jpg?type=m&amp;w=408&amp;h=296&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
	                              					</div>
	                              	<div class="thumb-info">
										<div class="info">
		                                  	<p class="sub">
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000004336'); return false;" class="sub">#절미네민박</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000005097'); return false;" class="sub">#이벤트</a>
			                                  	</p>
											<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=71&amp;returnUrl=/tv/home/'); return false;" data-content="463" data-url="https://aboutpet.co.kr/event/detail?eventNo=71">
		                              							<div class="tlt">
			                              							주접 댓글 킹중킹은 누구? 당첨자를 발표합니다! </div>
		                              						</a>
		                              					<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=71&amp;returnUrl=/tv/home/'); return false;" data-content="463" data-url="https://aboutpet.co.kr/event/detail?eventNo=71">
		                              							<div class="detail"><span>핫한 주접댓글을 남겨주신 당첨자를 찾습니다👀 당첨 여부 확인 하고, 절미 키트 받아가요! </span></div>
		                              						</a>
		                              					</div>
	                              	</div>
	                          	</div>
	                      	</li>
						<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0">
	                          	<div class="thumb-box">
	                              	<div class="dummyImg">
	                              	  	<a href="#" onclick="fncGoUrl('/tv/series/indexTvDetail?vdId=N2021072003376&amp;sortCd=&amp;listGb=HOME'); return false;" class="thumb-img" data-content="N2021072003376" data-url="/tv/series/indexTvDetail?vdId=N2021072003376&amp;sortCd=&amp;listGb=HOME" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/display/822/0812375a-4585-41bc-9133-132e47d2b320.jpg?type=m&amp;w=408&amp;h=296&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
		                                  		</div>
	                              	<div class="thumb-info">
										<div class="info">
		                                  	<p class="sub">
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000000031'); return false;" class="sub">#말티즈</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000000424'); return false;" class="sub">#애교</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000002083'); return false;" class="sub">#왕크니까왕귀엽다왕티즈</a>
			                                  	</p>
											<a href="#" onclick="fncGoUrl('tv/series/indexTvDetail?vdId=N2021072003376&amp;sortCd=&amp;listGb=HOME'); return false;" data-content="N2021072003376" data-url="/tv/series/indexTvDetail?vdId=N2021072003376&amp;sortCd=&amp;listGb=HOME">
			                                  				<div class="tlt">
		                              							너 왕티즈가 귀엽단다 너희 집엔 솔이 없지? </div>
			                                  			</a>
			                                  		<a href="#" onclick="fncGoUrl(/tv/series/indexTvDetail?vdId=N2021072003376&amp;sortCd=&amp;listGb=HOME'); return false;" data-content="N2021072003376" data-url="/tv/series/indexTvDetail?vdId=N2021072003376&amp;sortCd=&amp;listGb=HOME">
			                                  				<div class="detail"><span>어바웃펫엔 솔이 있다🌸 왕 크니까 대왕 귀여운 왕티즈 솔이의 깜찍한 일상( ⁎ ᵕᴗᵕ ⁎ )</span></div>
			                                  			</a>
			                                  		</div>
	                              	</div>
	                          	</div>
	                      	</li>
	                      	<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="1">
	                          	<div class="thumb-box">
	                              	<div class="dummyImg">
	                              	  	<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/tv/series/indexTvDetail?vdId=N2021071603362&amp;sortCd=&amp;listGb=HOME'); return false;" class="thumb-img" data-content="401" data-url="https://aboutpet.co.kr/tv/series/indexTvDetail?vdId=N2021071603362&amp;sortCd=&amp;listGb=HOME" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/display/734/1fa2d485-2ad5-4442-8a7f-54ef21a55802.jpg?type=m&amp;w=408&amp;h=296&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
	                              					</div>
	                              	<div class="thumb-info">
										<div class="info">
		                                  	<p class="sub">
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000004330'); return false;" class="sub">#루루언니</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000005481'); return false;" class="sub">#망치와응팔</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000005482'); return false;" class="sub">#시루형아</a>
			                                  	</p>
											<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/tv/series/indexTvDetail?vdId=N2021071603362&amp;sortCd=&amp;listGb=HOME'); return false;" data-content="401" data-url="https://aboutpet.co.kr/tv/series/indexTvDetail?vdId=N2021071603362&amp;sortCd=&amp;listGb=HOME">
		                              						<div class="tlt">
		                              							펫분토론에 뉴페이스가? 루루언니도 함께!</div>
		                              						</a>
		                              					<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/tv/series/indexTvDetail?vdId=N2021071603362&amp;sortCd=&amp;listGb=HOME'); return false;" data-content="401" data-url="https://aboutpet.co.kr/tv/series/indexTvDetail?vdId=N2021071603362&amp;sortCd=&amp;listGb=HOME">
		                              							<div class="detail"><span>무논리 펫분토론에 뉴페이스의 등장이라..★ 재밌어지겠네 😎 루루 언니 등장 기념, 특별 3편 공개! </span></div>
		                              						</a>
		                              					</div>
	                              	</div>
	                          	</div>
	                      	</li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2">
	                          	<div class="thumb-box">
	                              	<div class="dummyImg">
	                              	  	<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=61&amp;returnUrl=/tv/home/'); return false;" class="thumb-img" data-content="407" data-url="https://aboutpet.co.kr/event/detail?eventNo=61" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/406/2398862d-3d43-414e-ad4f-859c5025114d.jpg?type=m&amp;w=408&amp;h=296&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
	                              					</div>
	                              	<div class="thumb-info">
										<div class="info">
		                                  	<p class="sub">
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000002911'); return false;" class="sub">#베이컨박스</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000004336'); return false;" class="sub">#절미네민박</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000005097'); return false;" class="sub">#이벤트</a>
			                                  	</p>
											<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=61&amp;returnUrl=/tv/home/'); return false;" data-content="407" data-url="https://aboutpet.co.kr/event/detail?eventNo=61">
		                              							<div class="tlt">
			                              							★절미 박스 출시★ 절미네 민박 보고,드라이룸 받자! </div>
		                              						</a>
		                              					<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=61&amp;returnUrl=/tv/home/'); return false;" data-content="407" data-url="https://aboutpet.co.kr/event/detail?eventNo=61">
		                              							<div class="detail"><span>[어바웃펫X베이컨박스] 절미 박스 출시! 60% 할인 + 얼리버드 구매 혜택 절미네 사과즙 선착순 깜짝 선물도 있어요🍎</span></div>
		                              						</a>
		                              					</div>
	                              	</div>
	                          	</div>
	                      	</li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3">
	                          	<div class="thumb-box">
	                              	<div class="dummyImg">
	                              	  	<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=68&amp;returnUrl=/tv/home/'); return false;" class="thumb-img" data-content="445" data-url="https://aboutpet.co.kr/event/detail?eventNo=68" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/444/4ed9533e-483d-4f21-bbbc-df36d69d1d28.jpg?type=m&amp;w=408&amp;h=296&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
	                              					</div>
	                              	<div class="thumb-info">
										<div class="info">
		                                  	<p class="sub">
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000002410'); return false;" class="sub">#펫로그</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000005734'); return false;" class="sub">#바른벤토모래</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000005890'); return false;" class="sub">#감자풍년</a>
			                                  	</p>
											<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=68&amp;returnUrl=/tv/home/'); return false;" data-content="445" data-url="https://aboutpet.co.kr/event/detail?eventNo=68">
		                              							<div class="tlt">
			                              							세계제일 감자대회 OPEN! 바른벤토 모래 100개 증정!</div>
		                              						</a>
		                              					<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=68&amp;returnUrl=/tv/home/'); return false;" data-content="445" data-url="https://aboutpet.co.kr/event/detail?eventNo=68">
		                              							<div class="detail"><span>토끼 감자🐰 하트 감자💛 못난이 감자🙈 모두 자랑하자! </span></div>
		                              						</a>
		                              					</div>
	                              	</div>
	                          	</div>
	                      	</li><li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4">
	                          	<div class="thumb-box">
	                              	<div class="dummyImg">
	                              	  	<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=71&amp;returnUrl=/tv/home/'); return false;" class="thumb-img" data-content="463" data-url="https://aboutpet.co.kr/event/detail?eventNo=71" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/462/cafc6de7-4c02-4c5f-b80c-312cec0c1541.jpg?type=m&amp;w=408&amp;h=296&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
	                              					</div>
	                              	<div class="thumb-info">
										<div class="info">
		                                  	<p class="sub">
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000004336'); return false;" class="sub">#절미네민박</a>
			                                  	<a href="#" onclick="fncGoUrl('/tv/collectTags?tagNo=T000005097'); return false;" class="sub">#이벤트</a>
			                                  	</p>
											<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=71&amp;returnUrl=/tv/home/'); return false;" data-content="463" data-url="https://aboutpet.co.kr/event/detail?eventNo=71">
		                              							<div class="tlt">
			                              							주접 댓글 킹중킹은 누구? 당첨자를 발표합니다! </div>
		                              						</a>
		                              					<a href="#" onclick="fncGoUrl('https://aboutpet.co.kr/event/detail?eventNo=71&amp;returnUrl=/tv/home/'); return false;" data-content="463" data-url="https://aboutpet.co.kr/event/detail?eventNo=71">
		                              							<div class="detail"><span>핫한 주접댓글을 남겨주신 당첨자를 찾습니다👀 당첨 여부 확인 하고, 절미 키트 받아가요! </span></div>
		                              						</a>
		                              					</div>
	                              	</div>
	                          	</div>
	                      	</li> 
<!-- -->
	                </ul>
					<div class="swiper-pagination swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span></div>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
				<!-- <div class="back-img" style="background-image:url(../../_images/tv/@temp03.jpg);"></div> -->
				<div class="back-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/display/822/0812375a-4585-41bc-9133-132e47d2b320.jpg?type=m&amp;w=408&amp;h=296&amp;quality=100&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>
					<div class="remote-area">
						<button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide"></button>
						<button class="swiper-button-prev" type="button" tabindex="0" role="button" aria-label="Previous slide"></button>
					</div>
			</div>
		</section>

 	 --%>	
		
<!-- 오늘 뭐 볼까? 시리츠 추천 -->		
	<!--  TV 전시 - 시리즈 TAG, 시리즈(미고정) -->
		<section class="exhibition series list0">
			<div class="hdts">
				<a class="hdt" onclick="fncGoSeriesTagVodList('1000'); return false;">
					<span class="tit">
					<a href="rcmd_total.do" style="font-size: 20px; font-weight: 600; line-height: 1.2;">오늘 뭐 볼까? 고민될 때! </a>
					</span>
					<span class="more"><b class="t"><a href="rcmd_total.do" style="font-size: 15rem; font-weight: 700; float:right">전체보기 > </a></b></span>
				</a>
			</div>
			
			<div class="swiper-div newDn petTvMb">
				<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
					<ul class="swiper-wrapper">
			<c:set var="flag" value="false" />         
                   <c:forEach items="${ rslist }" var="rsitem" varStatus="status"> 
                   <c:if test="${ not flag }">
						<li class="swiper-slide <c:if test="${status.count eq 1}">swiper-slide-active</c:if><c:if test="${status.count eq 2}">swiper-slide-next</c:if>" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="series_detail.do?s_code=${rsitem.s_code}&s_season=${rsitem.s_season}" class="thumb-img" style="background-image:url(${rsitem.s_img});"></a>
								</div>
							</li>
						
						<c:if test="${ status.count ge 10 }">
                        <c:set var="flag" value="true" />
                        </c:if>
                     </c:if>
                   </c:forEach>   
						<!-- 더보기 버튼 . 10개 이하 보여주지 않음-->
						<li class="swiper-slide btn-more" style="margin-right: 16px;">
					</li>
					</ul>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
				
				<div class="remote-area">
					<button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
					<button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
				</div>
			</div>
		</section>
		<!--  //TV 전시 - 시리즈 TAG -->
		
		
<!-- 인기영상 -->	
        <section class="popul">
            <div class="hdts">
				<a class="hdt" >
					<span class="tit">
					<a href="popu_total.do" style="font-size: 20px; font-weight: 600; line-height: 1.2;">지금 뜨는 인기영상 </span>
					<span class="more"><b class="t"><a href="popu_total.do" style="font-size: 15rem; font-weight: 700; float:right">전체보기 > </a></b></span>   
				</a>
			</div>
           
            <div class="swiper-div newDn petTvMb">
                <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                    <ul class="swiper-wrapper" id="popVod" style="list-style:none">
                 <c:set var="flag" value="false" />         
                   <c:forEach items="${ plist }" var="pitem" varStatus="status"> 
                   <c:if test="${ not flag }">
                    	<li class="swiper-slide <c:if test="${status.count eq 1}">swiper-slide-active</c:if><c:if test="${status.count eq 2}">swiper-slide-next</c:if>" style="width: 288px; margin-right: 16px;">
	                            <div class="thumb-bowx">
	                            	<a href="video_detail.do?s_code=${pitem.s_code}&s_season=${pitem.s_season}&v_code=${pitem.v_code}" class="thumb-img" style="background-image:url(${pitem.v_img});" data-content="" data-url="video_detail.do?s_code=${pitem.s_code}&s_season=${pitem.s_season}&v_code=${pitem.v_code}">
		                                    	<strong class="ranking">${status.count}</strong>
		                                    	<div class="time-tag"><span>${pitem.v_time}</span></div>
		                                	</a>
		                                <div class="thumb-info top">
	                                	<div class="round-img-pf" onclick="srisDetail(160);" style="background-image:url(${pitem.c_img}); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="video_detail.do?s_code=${pitem.s_code}&s_season=${pitem.s_season}&v_code=${pitem.v_code}" data-content="" data-url="video_detail.do?s_code=${pitem.s_code}&s_season=${pitem.s_season}&v_code=${pitem.v_code}">
					                                    	${pitem.v_name}</a>
													</div>
	                                        <div class="detail">
	                                            <span class="read play">100</span>
	                                            <span class="read like">${pitem.v_like}</span>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                <c:if test="${ status.count ge 10 }">
                        <c:set var="flag" value="true" />
                        </c:if>
                     </c:if>
                   </c:forEach>         
        <!-- 더보기버튼 -->                
                        <li class="swiper-slide btn-more" style="margin-right: 16px;">
                        	<a href="popu_total.do">
                            	<button type="button">
                            		<i>더보기</i>
                            	</button>
                            </a>
                         </li>
                    </ul>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                
                <div class="remote-area">
                    <button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
                    <button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
                </div>
            </div>
        </section>

        
<!-- 신규영상 -->
        <section class="new"> 
            <div class="hdts">
				<a class="hdt">
					<span class="tit"><a href="latest_total.do" 
					style="font-size: 20px; font-weight: 600; line-height: 1.2;">따끈따끈 신규 영상🔥 </a></span>
					<span class="more"><b class="t"><a href="latest_total.do" style="font-size: 15rem; font-weight: 700; float:right">전체보기 > </a></b></span>
				</a>
			</div>
            <!-- //변경후 마크업 APET-1103 -->
            
		<div class="swiper-div petTvMb">
             <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                    <ul class="swiper-wrapper" id="ulId" style="list-style:none">
             <c:set var="flag" value="false" />         
                   <c:forEach items="${ llist }" var="litem" varStatus="status"> 
                   <c:if test="${ not flag }">
                       
  						<li class="swiper-slide <c:if test="${status.count eq 1}">swiper-slide-active</c:if><c:if test="${status.count eq 2}">swiper-slide-next</c:if>" style="width: 388px; margin-right: 18px;" >
                            <div class="thumb-box">
                            
                            	<a href="video_detail.do?s_code=${litem.s_code}&s_season=${litem.s_season}&v_code=${litem.v_code}" class="thumb-img" style="background-image:url(${litem.v_img});" data-content="" data-url="video_detail.do?s_code=${litem.s_code}&s_season=${litem.s_season}$v_code=${litem.v_code}">
	                                <div class="time-tag"><span>${litem.v_time}</span></div>
	                            </a>
	                                <div class="thumb-info top">
                                	<div class="round-img-pf" onclick="srisDetail(95);" style="background-image:url(${litem.c_img}); cursor:pointer;"></div>
                                    	<div class="info">
                                    	<div class="tlt">
                                    		<a href="video_detail.do?s_code=${litem.s_code}&s_season=${litem.s_season}$v_code=${litem.v_code}" data-content="" data-url="video_detail.do?s_code=${litem.s_code}&s_season=${litem.s_season}$v_code=${litem.v_code}">
				                                    	${litem.v_name }</a>
		                                    	</div>
                                        <div class="detail">
                                            <span class="read play">1</span>
                                            <span class="read like">${litem.v_like}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                       <c:if test="${ status.count ge 5 }">
                        <c:set var="flag" value="true" />
                        </c:if>
                     </c:if>   
                   </c:forEach>      
     		<!-- 더보기 버튼 -->
                    <div class="swiper-div">
	                	<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
	               			<ul class="swiper-wrapper">
	                    	</ul>
	                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                    </div>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                <div class="remote-area">
                    <button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
                    <button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
                </div>
            </div>
            <!-- //Swiper -->
        </section>
        
        
        
	<!--  TV 전시 - 시리즈 TAG, 시리즈(미고정) -->
		<section class="exhibition series list1">
			<div class="hdts">
				<a class="hdt" href="#" onclick="fncGoSeriesTagVodList('1001'); return false;">
					<span class="tit">오늘도 양육지식 +1</span>
					<span class="more"><b class="t">전체보기</b></span>
				</a>
			</div>
			<div class="swiper-div newDn petTvMb">
				<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
					<ul class="swiper-wrapper">
						<li class="swiper-slide swiper-slide-active" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="series_detail.do?s_code=37&s_season=1" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/5/srisImg/ff4bd470-404d-4301-aa36-4309f8772c56.jpg?type=m&w=750&h=422&quality=90&bgcolor=FFFFFF&extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide swiper-slide-next" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="series_detail.do?s_code=48&s_season=1" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/95/ed587e72-f588-47f9-8c68-f3b8585a28c6.jpg?type=f&w=677&h=381&quality=100&align=4);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="series_detail.do?s_code=126&s_season=1" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/135/b4901e1b-9263-41b9-9942-98f7413e4856.jpg?type=f&w=677&h=381&quality=100&align=4);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(149);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/149/srisImg/a30cf8d1-34cf-4bcd-ba99-d4e3c070e233.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(164);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/164/srisImg/07ab6313-c451-423b-9252-ecdf76f002e1.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(159);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/159/srisImg/73b36cd9-bcb3-46ac-a06e-0e106e40b7da.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(160);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/160/srisImg/fb652856-0089-40aa-96a2-0bd960a026c4.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(158);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/158/srisImg/f7a62887-71c8-43a3-82b5-cd27a911b952.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(154);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/154/srisImg/b3573553-f827-4ea1-88e0-cee4849fad60.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<!-- 더보기 버튼 . 10개 이하 보여주지 않음-->
						<li class="swiper-slide btn-more" style="margin-right: 16px;">
							</li>
					</ul>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
				
				<div class="remote-area">
					<button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
					<button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
				</div>
			</div>
		</section>
		<!--  //TV 전시 - 시리즈 TAG -->
		<!--  TV 전시 - 동영상 TAG, 동영상(미고정) -->
		<section class="exhibition video list2">
			<div class="hdts">
				<a class="hdt" href="#" onclick="fncGoTagVodList('1019'); return false;">
					<span class="tit">아빠곰 엄마곰 애기곰 모아봤곰</span>
					<span class="more"><b class="t">전체보기</b></span>
				</a>
			</div>
			<div class="swiper-div newDn petTvMb">
				<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
					<ul class="swiper-wrapper">
						<li class="swiper-slide swiper-slide-active" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="video_detail.do?s_code=62&s_season=1&v_code=45" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508320001200916000.jpg?type=f&w=404&h=227&quality=100&align=4
									);" data-content="N202104291566" data-url="/tv/series/indexTvDetail?v_code=N202104291566&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>04:41</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="video_detail.do?s_code=62&s_season=1&v_code=45" >
		                                            		판다 러바오의 사랑은 이루어질까?</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">12</span>-->
												<span class="read like">1</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide swiper-slide-next" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="video_detail.do?s_code=62&s_season=1&v_code=46" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508320001200915984.jpg?type=f&w=404&h=227&quality=100&align=4
									);" data-content="N202104291559" data-url="/tv/series/indexTvDetail?v_code=N202104291559&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>04:11</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="video_detail.do?s_code=62&s_season=1&v_code=46">
		                                            		판다 러바오, 사랑에 빠지다.</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">8</span>-->
												<span class="read like">10</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="video_detail.do?s_code=62&s_season=1&v_code=47" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508200001200909093.jpg?type=f&w=404&h=227&quality=100&align=4);" data-content="N202104291552" data-url="/tv/series/indexTvDetail?v_code=N202104291552&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>01:04</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="video_detail.do?s_code=62&s_season=1&v_code=47" data-content="N202104291552" data-url="/tv/series/indexTvDetail?v_code=N202104291552&amp;sortCd=&amp;listGb=HOME">
		                                            		불곰 더위 탈출 시원한 여름나기</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">8</span>-->
												<span class="read like">5</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N202104291831&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508000001200905578.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N202104291831" data-url="/tv/series/indexTvDetail?v_code=N202104291831&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>04:33</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(67);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/67/srisProfile/9ac636ae-26e8-48f7-89ee-1a9d98a9d841.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N202104291831&amp;sortCd=&amp;listGb=HOME" data-content="N202104291831" data-url="/tv/series/indexTvDetail?v_code=N202104291831&amp;sortCd=&amp;listGb=HOME">
		                                            		아기곰의 용이의 세상 무서운 반항</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">18</span>-->
												<span class="read like">5</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N202104291833&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081507580001200913546.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N202104291833" data-url="/tv/series/indexTvDetail?v_code=N202104291833&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>03:37</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(67);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/67/srisProfile/9ac636ae-26e8-48f7-89ee-1a9d98a9d841.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N202104291833&amp;sortCd=&amp;listGb=HOME" data-content="N202104291833" data-url="/tv/series/indexTvDetail?v_code=N202104291833&amp;sortCd=&amp;listGb=HOME">
		                                            		산으로 사라진 꼬마곰</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">3</span>-->
												<span class="read like">0</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N202104291555&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508200001200909093.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N202104291555" data-url="/tv/series/indexTvDetail?v_code=N202104291555&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>01:04</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(38);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N202104291555&amp;sortCd=&amp;listGb=HOME" data-content="N202104291555" data-url="/tv/series/indexTvDetail?v_code=N202104291555&amp;sortCd=&amp;listGb=HOME">
		                                            		불곰 더위 탈출 시원한 여름나기</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">12</span>-->
												<span class="read like">0</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<!-- 더보기 버튼 . 10개 이하 보여주지 않음-->
						<li class="swiper-slide btn-more" style="margin-right: 16px;">
							</li>
					</ul>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
				
				<div class="remote-area">
					<button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
					<button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
				</div>
			</div>
			<!-- //Swiper -->
		</section>
		<!--  //TV 전시 - 동영상 TAG -->
		<!--  TV 전시 - 시리즈 TAG, 시리즈(미고정) -->
		<section class="exhibition series list3">
			<div class="hdts">
				<a class="hdt" href="#" onclick="fncGoSeriesTagVodList('1002'); return false;">
					<span class="tit">랜선 집사님들을 위해</span>
					<span class="more"><b class="t">전체보기</b></span>
				</a>
			</div>
			<div class="swiper-div newDn petTvMb">
				<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
					<ul class="swiper-wrapper">
						<li class="swiper-slide swiper-slide-active" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(83);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/83/srisImg/cbe314af-14bd-43e6-995a-4bbbf3a0f095.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide swiper-slide-next" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(64);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/64/srisImg/f2caab66-1087-488b-92df-90f8628ddd3d.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(43);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/43/srisImg/5f56d18c-e53b-43c5-9648-43ae7b8f1c09.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(22);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/22/srisImg/e085796e-cf4a-4c88-b5f1-606ecd623e39.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(156);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/156/srisImg/77a7040b-b5fc-4e73-af9c-87d5a891e8a9.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(65);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/65/srisImg/f9b08421-7c1b-4712-abeb-4356ce6da285.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(175);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/175/srisImg/c0ed32b2-819e-4309-84b3-9750d19b25d6.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(95);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/95/srisImg/213bf67b-7855-4c10-afa1-7d604c711567.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="javascript:srisDetail(49);" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/49/srisImg/e26516e2-85dc-4958-9834-470b3fd89da7.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);"></a>
								</div>
							</li>
						<!-- 더보기 버튼 . 10개 이하 보여주지 않음-->
						<li class="swiper-slide btn-more" style="margin-right: 16px;">
							</li>
					</ul>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
				
				<div class="remote-area">
					<button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
					<button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
				</div>
			</div>
		</section>
		<!--  //TV 전시 - 시리즈 TAG -->
		<!--  TV 전시 - 동영상 TAG, 동영상(미고정) -->
		<section class="exhibition video list4">
			<div class="hdts">
				<a class="hdt" href="#" onclick="fncGoTagVodList('1005'); return false;">
					<span class="tit">골라보는 견종백과</span>
					<span class="more"><b class="t">전체보기</b></span>
				</a>
			</div>
			<div class="swiper-div newDn petTvMb">
				<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
					<ul class="swiper-wrapper">
						<li class="swiper-slide swiper-slide-active" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021043003125&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021043003125/10/13f76e05-9b2e-4efe-b322-7391a2261b15.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021043003125" data-url="/tv/series/indexTvDetail?v_code=N2021043003125&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>05:53</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(160);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/160/srisProfile/8c3f1210-ee28-49d4-a22e-f38a73cff8e9.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021043003125&amp;sortCd=&amp;listGb=HOME" data-content="N2021043003125" data-url="/tv/series/indexTvDetail?v_code=N2021043003125&amp;sortCd=&amp;listGb=HOME">
		                                            		🎁EP01. 수의사들이 알려주는 말티즈에 대한 모든것! </a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">475</span>-->
												<span class="read like">20</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide swiper-slide-next" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="video_detail?s_code=148&s_season=1&v_code=48" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021071203351/10/88b2cfcf-423a-4807-881d-60a0296b46e4.png?type=f&w=404&h=227&quality=100&align=4);" data-content="N2021050703175" data-url="/tv/series/indexTvDetail?v_code=N2021050703175&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>00:59</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/169/srisProfile/bf34509c-033e-4f53-8ede-264e869f61d4.png?type=f&w=72&h=72&quality=100&align=4
										); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="video_detail?s_code=148&s_season=1&v_code=48">
		                                            		고양이 벽 짚기 챌린지? 1분 만에 알아보자!</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">63</span>-->
												<span class="read like">1</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="video_detail?s_code=148&s_season=1&v_code=50" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021051303196/10/5d75e53e-aee2-4a5c-866e-0324bea250d9.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021051303196" data-url="/tv/series/indexTvDetail?v_code=N2021051303196&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>01:47</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/169/srisProfile/bf34509c-033e-4f53-8ede-264e869f61d4.png?type=f&w=72&h=72&quality=100&align=4
										); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="video_detail?s_code=148&s_season=1&v_code=50" data-content="N2021051303196" data-url="/tv/series/indexTvDetail?v_code=N2021051303196&amp;sortCd=&amp;listGb=HOME">
		                                            		산책시 "광견병 미끼 예방약" 조심해주세요! </a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">44</span>-->
												<span class="read like">8</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="video_detail?s_code=148&s_season=1&v_code=49" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021052703239/10/eeb405dc-d9b9-4153-996e-f1dee72fd753.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021052703239" data-url="/tv/series/indexTvDetail?v_code=N2021052703239&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>01:00</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(169);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/169/srisProfile/bf34509c-033e-4f53-8ede-264e869f61d4.png?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="video_detail?s_code=148&s_season=1&v_code=49" data-content="N2021052703239" data-url="/tv/series/indexTvDetail?v_code=N2021052703239&amp;sortCd=&amp;listGb=HOME">
		                                            		[2021 KB Report] 한국의 반려동물 양육현황 </a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">60</span>-->
												<span class="read like">5</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021051303194&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021051303194/10/498baeac-7e05-4a13-a131-15c4eee904d0.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021051303194" data-url="/tv/series/indexTvDetail?v_code=N2021051303194&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>01:48</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(154);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/154/srisProfile/7e6294ff-c860-41ad-83e4-035952993bfa.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021051303194&amp;sortCd=&amp;listGb=HOME" data-content="N2021051303194" data-url="/tv/series/indexTvDetail?v_code=N2021051303194&amp;sortCd=&amp;listGb=HOME">
		                                            		Ep.9 강아지의 건강 상태 간단 체크리스트!</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">28</span>-->
												<span class="read like">1</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021051303193&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021051303193/10/1c3ef7bd-9444-4769-82b6-69273093f11a.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021051303193" data-url="/tv/series/indexTvDetail?v_code=N2021051303193&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>01:56</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(154);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/154/srisProfile/7e6294ff-c860-41ad-83e4-035952993bfa.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021051303193&amp;sortCd=&amp;listGb=HOME" data-content="N2021051303193" data-url="/tv/series/indexTvDetail?v_code=N2021051303193&amp;sortCd=&amp;listGb=HOME">
		                                            		Ep.8 유기견을 입양하는 방법은?</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">33</span>-->
												<span class="read like">2</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021050703177&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021050703177/10/224cca18-a40d-4ceb-89aa-0ee0a8408aa7.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021050703177" data-url="/tv/series/indexTvDetail?v_code=N2021050703177&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>01:50</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(154);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/154/srisProfile/7e6294ff-c860-41ad-83e4-035952993bfa.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021050703177&amp;sortCd=&amp;listGb=HOME" data-content="N2021050703177" data-url="/tv/series/indexTvDetail?v_code=N2021050703177&amp;sortCd=&amp;listGb=HOME">
		                                            		Ep.6 입양 전, 개털 알레르기 확인 방법은?</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">55</span>-->
												<span class="read like">3</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021051403205&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021051403205/10/6faa76d7-7e95-4c8a-9813-dfea98a4bf4d.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021051403205" data-url="/tv/series/indexTvDetail?v_code=N2021051403205&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>05:17</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(160);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/160/srisProfile/8c3f1210-ee28-49d4-a22e-f38a73cff8e9.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021051403205&amp;sortCd=&amp;listGb=HOME" data-content="N2021051403205" data-url="/tv/series/indexTvDetail?v_code=N2021051403205&amp;sortCd=&amp;listGb=HOME">
		                                            		EP06. 진돗개 보호자라면 꼭 해야 되는 필수 교육은? </a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">163</span>-->
												<span class="read like">6</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N202104291325&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104191158380001200905812.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N202104291325" data-url="/tv/series/indexTvDetail?v_code=N202104291325&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>05:28</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(1);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/1/srisProfile/5ff5cd86-82e7-4a95-a185-45e52c24caf3.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N202104291325&amp;sortCd=&amp;listGb=HOME" data-content="N202104291325" data-url="/tv/series/indexTvDetail?v_code=N202104291325&amp;sortCd=&amp;listGb=HOME">
		                                            		산책가는 척 버림받은 베들링턴테리더에게 새 가족이 생겼어요. EP2</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">20</span>-->
												<span class="read like">2</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021050703176&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021050703176/10/7f8e056c-329c-4831-bd24-61f8c78c4820.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021050703176" data-url="/tv/series/indexTvDetail?v_code=N2021050703176&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>01:55</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(154);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/154/srisProfile/7e6294ff-c860-41ad-83e4-035952993bfa.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021050703176&amp;sortCd=&amp;listGb=HOME" data-content="N2021050703176" data-url="/tv/series/indexTvDetail?v_code=N2021050703176&amp;sortCd=&amp;listGb=HOME">
		                                            		Ep.5 나와 맞는 강아지는?</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">85</span>-->
												<span class="read like">5</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<!-- 더보기 버튼 . 10개 이하 보여주지 않음-->
						<li class="swiper-slide btn-more" style="margin-right: 16px;">
							<button type="button" onclick="fncGoTagVodList('1005');">
								<i>더보기</i>
							</button>
							</li>
					</ul>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
				
				<div class="remote-area">
					<button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
					<button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
				</div>
			</div>
			<!-- //Swiper -->
		</section>
		<!--  //TV 전시 - 동영상 TAG -->
		<!--  TV 전시 - 동영상 TAG, 동영상(미고정) -->
		<section class="exhibition video list5">
			<div class="hdts">
				<a class="hdt" href="#" onclick="fncGoTagVodList('1014'); return false;">
					<span class="tit">가장 귀여운 떡은? 절미! </span>
					<span class="more"><b class="t">전체보기</b></span>
				</a>
			</div>
			<div class="swiper-div newDn petTvMb">
				<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
					<ul class="swiper-wrapper">
						<li class="swiper-slide swiper-slide-active" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021052103225&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021052103225/10/2c0cc93b-b6ed-494e-81a9-c25546d2e756.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021052103225" data-url="/tv/series/indexTvDetail?v_code=N2021052103225&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>02:54</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(139);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/139/srisProfile/ff8bee78-7427-4ae5-9569-f93728f4c4b5.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021052103225&amp;sortCd=&amp;listGb=HOME" data-content="N2021052103225" data-url="/tv/series/indexTvDetail?v_code=N2021052103225&amp;sortCd=&amp;listGb=HOME">
		                                            		EP1. 세계 최초! 짱절미를 만나다.</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">1671</span>-->
												<span class="read like">34</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide swiper-slide-next" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021052503233&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021052503233/10/78a8a7ce-e6fa-4a93-835f-24e2d1a56459.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021052503233" data-url="/tv/series/indexTvDetail?v_code=N2021052503233&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>06:05</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(139);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/139/srisProfile/ff8bee78-7427-4ae5-9569-f93728f4c4b5.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021052503233&amp;sortCd=&amp;listGb=HOME" data-content="N2021052503233" data-url="/tv/series/indexTvDetail?v_code=N2021052503233&amp;sortCd=&amp;listGb=HOME">
		                                            		EP1. 셀럽의 과거 파헤치기 (feat.친언니)</a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">302</span>-->
												<span class="read like">5</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021053103241&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021053103241/10/15398e25-411f-485c-b754-45e6888ebac3.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021053103241" data-url="/tv/series/indexTvDetail?v_code=N2021053103241&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>03:57</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(139);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/139/srisProfile/ff8bee78-7427-4ae5-9569-f93728f4c4b5.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021053103241&amp;sortCd=&amp;listGb=HOME" data-content="N2021053103241" data-url="/tv/series/indexTvDetail?v_code=N2021053103241&amp;sortCd=&amp;listGb=HOME">
		                                            		EP1. 첫 겨울을 맞는 절미의 자세 </a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">190</span>-->
												<span class="read like">4</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021053103246&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021053103246/10/1876e657-fbbd-460e-9585-47a7c8c05220.png?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021053103246" data-url="/tv/series/indexTvDetail?v_code=N2021053103246&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>01:44</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(139);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/139/srisProfile/ff8bee78-7427-4ae5-9569-f93728f4c4b5.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021053103246&amp;sortCd=&amp;listGb=HOME" data-content="N2021053103246" data-url="/tv/series/indexTvDetail?v_code=N2021053103246&amp;sortCd=&amp;listGb=HOME">
		                                            		EP1. 콩고물에게 한마디 </a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">156</span>-->
												<span class="read like">4</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<li class="swiper-slide" style="width: 288px; margin-right: 16px;">
								<div class="thumb-box">
									<a href="/tv/series/indexTvDetail?v_code=N2021060303257&amp;sortCd=&amp;listGb=HOME" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021060303257/10/405d2a92-5159-4b96-8224-ed74363af09b.jpg?type=m&amp;w=750&amp;h=422&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021060303257" data-url="/tv/series/indexTvDetail?v_code=N2021060303257&amp;sortCd=&amp;listGb=HOME">
												<div class="time-tag"><span>07:29</span></div>
											</a>
                                    	<div class="thumb-info top">
										<div class="round-img-pf" onclick="srisDetail(171);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/171/srisProfile/f976d3b4-fbf1-464e-a201-e5b3b51910cc.png?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4); cursor:pointer;"></div>
	                                    	<div class="info">
											<div class="tlt">
												<a href="/tv/series/indexTvDetail?v_code=N2021060303257&amp;sortCd=&amp;listGb=HOME" data-content="N2021060303257" data-url="/tv/series/indexTvDetail?v_code=N2021060303257&amp;sortCd=&amp;listGb=HOME">
		                                            		EP1. 절미와 마마무! 드디어 만났다! </a>
			                                    	</div>
											
											<div class="detail">
												<!--<span class="read play">20959</span>-->
												<span class="read like">782</span>
											</div>
										</div>
									</div>
								</div>
							</li>
						<!-- 더보기 버튼 . 10개 이하 보여주지 않음-->
						<li class="swiper-slide btn-more" style="margin-right: 16px;">
							</li>
					</ul>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
				
				<div class="remote-area">
					<button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
					<button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
				</div>
			</div>
			<!-- //Swiper -->
		</section>
		<!--  //TV 전시 - 동영상 TAG -->
		
		
		
		
		
		<!-- 펫스쿨 --> 
         <section class="school petTvMb">
        	<!-- 변경전 마크업 APET-1103 -->
			<!-- //변경전 마크업 APET-1103 -->
            <!-- 변경후 마크업 APET-1103 -->
            <div class="hdts">
            <!--  href="edu_main.do" -->
				<a class="hdt" a href="edu_main.do" >
					<span class="tit" style = "font-size: 20px; font-weight: 600; line-height: 1.2;">펫스쿨🎓</span>
					<p class="sub-tit">
		                    <em>‘기초교육’</em>부터 시작해볼까요?
		                </p>
		                <span class="more"><b class="t"><a href="edu_main.do" style="font-size: 15rem; font-weight: 700; float:right">전체보기 </a></b></span>
	                </a>
			</div>
			<!-- //변경후 마크업 APET-1103 -->
            <div class="swiper-div newDn">
                <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                    <ul class="swiper-wrapper">
                 <c:set var="flag" value="false" />   
                     <c:forEach items="${Edu_list}" var="eduitem">
                     <c:if test="${eduitem.edu_cate eq '기초교육'}" >
                     
              
                    	 <li class="swiper-slide <c:if test="${status.count eq 1}">swiper-slide-active</c:if><c:if test="${status.count eq 2}">swiper-slide-next</c:if>" style="width: 200px; margin-right: 50px;">
                            <div class="thumb-box" onclick="fncGoSchoolDetail('E2021042301044'); videoAllPauses();" style="cursor:pointer;" data-content="E2021042301044" data-url="/tv/school/indexTvDetail?v_code=E2021042301044">
                            <!-- /tv/school/indexTvDetail?v_code=E2021042301044 -->
										<a href="edu_sub.do?edu_title=${eduitem.edu_title}" onclick="return false;" class="thumb-img" style="background-image:url(${eduitem.v_img})">
											</a>
										<div class="thumb-info">
		                                    <div class="info">
		                                        <div class="tlt">
													 ${eduitem.edu_title} </div>
		                                    </div>
		                                </div>
									</div>
								
								</c:if>
							
								</c:forEach>
						<!-- 	
                        <c:forEach items="${Edu_list}" var="eduitem">
                     <c:if test="${eduitem.edu_cate eq '사회화 교육'}" >
                     
                        <li class="swiper-slide" style="width: 200px; margin-right: 50px;">
                            <div class="thumb-box" onclick="fncGoSchoolDetail('E2021042301057'); videoAllPauses();" style="cursor:pointer;" data-content="E2021042301057" data-url="/tv/school/indexTvDetail?v_code=E2021042301057">
										<a href="#" onclick="return false;" class="thumb-img" style="background-image:url(${eduitem.v_img});">
											</a>
										<div class="thumb-info">
		                                    <div class="info">
		                                        <div class="tlt">
													[사회화] ${eduitem.edu_title}</div>
		                                    </div>
		                                </div>
									</div>
								</li>
								</c:if>
								</c:forEach>
								-->
								<!--  
                        <li class="swiper-slide" style="width: 200px; margin-right: 50px;">
                            <div class="thumb-box" onclick="fncGoSchoolDetail('E2021042301058'); videoAllPauses();" style="cursor:pointer;" data-content="E2021042301058" data-url="/tv/school/indexTvDetail?v_code=E2021042301058">
										<a href="#" onclick="return false;" class="thumb-img" style="background-image:url(//cnlqblphcryy6381644.cdn.ntruss.com/vod/FYbW21757717/video.png);">
											</a>
										<div class="thumb-info">
		                                    <div class="info">
		                                        <div class="tlt">
													[사회화] 하우스 적응</div>
		                                    </div>
		                                </div>
									</div>
								</li>
                        <li class="swiper-slide" style="width: 200px; margin-right: 50px;">
                            <div class="thumb-box" onclick="fncGoSchoolDetail('E2021042301059'); videoAllPauses();" style="cursor:pointer;" data-content="E2021042301059" data-url="/tv/school/indexTvDetail?v_code=E2021042301059">
										<a href="#" onclick="return false;" class="thumb-img" style="background-image:url(//cnlqblphcryy6381644.cdn.ntruss.com/vod/flaf16039093/video.png);">
											</a>
										<div class="thumb-info">
		                                    <div class="info">
		                                        <div class="tlt">
													[사회화] 하우스 머무르기</div>
		                                    </div>
		                                </div>
									</div>
								</li>
								-->
                        <!-- 더보기 버튼 -->
                        <li class="swiper-slide btn-more" style="margin-right: 50px;">
		                        	<a href="edu_main.do">
		                            <button type="button">
		                                <i>더보기</i>
		                            </button>
		                            </a>
		                        </li>
                        	</ul>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                <div class="remote-area">
                    <button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
                    <button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
                </div>
            </div>
            <!-- //Swiper -->
        </section>




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
		<li id="liTag_20" class="tv active">
					<a href="/tv/home/" class="bt"><span>TV</span></a>
				</li>
				<li id="liTag_30" class="log ">
					<a href="/log/home/" class="bt"><span>로그</span></a>
				</li>
				<li id="liTag_10" class="shop ">
					<a href="/shop/home/" class="bt"><span>샵</span></a>
				</li>
				<li id="liTag_00" class="my ">
					<a href="/mypage/indexMyPage/" class="bt"><span>MY</span></a>
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

<div id="twc-chat-plugin">
<div id="chat-icon">
<img src="https://storage.googleapis.com/cloud-gate-cdn/image/icon_webchat_v2.png">
<div class="loader">Loading...</div>
</div><div id="chat-frame-box">
<iframe id="chat-frame" style="height: 730px;"></iframe>
</div>
</div>
</body>
</html>