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
<script>
			$(document).ready(function(e) {
				
				//상단 뒤로가기 버튼 클릭시 마이페이지로
				$(".mo-header-backNtn").removeAttr("onclick");
				$(".mo-header-backNtn").bind("click", function(){
					history.replaceState("","","/mypage/indexMyPage/");
					location.href="/mypage/indexMyPage/";
				});
				
				$(function(){
					$(".re-position-txt").height($(".re-position-txt").children(0).innerHeight());
				})

				$(document).on("click", '[data-target="goods"][data-action="ioAlarmCancel"]', function(e) {
					let $btn = $(this);
					let goodsId = $btn.data("goods-id") || $btn.data("content");
					var options = {
						url : "/mypage/deleteIoAlarm",
						data : {goodsId : goodsId, almYn : "N"},
						done : function(data) {
							// console.log("data : " + JSON.stringify(data));
							// 알림신청시 기존에 등록에 대한 처리는 없음.
							if(data.message == "login") {
								//document.location.href = '/indexLogin?returnUrl='+encodeURIComponent(document.location.href);
							}else if(data.message == "deleted"){
								ui.toast("재입고 알림이 삭제되었어요.",{
									cls : "added" ,
									bot: 74, //바닥에서 띄울 간격
									sec:  3000 //사라지는 시간
								});
								$btn.closest("li").remove();
							}else if(data.message == "noData") {
								//재입고 알림 데이터 없음?
							}else if(data.message == "fail") {
								//실패? ㅜㅜ
							}

						}
					};
					ajax.call(options);

				}).on("click", "#ioAlarmMoreLoad", function(e) {
					let $ioAlarmList = $("#ioAlarmList");
					let page = $ioAlarmList.data("page") || 1;
					page = $.isNumeric(page) ? parseInt(page) : 1;
					var options = {
						url : "/mypage/loadIoAlarmList",
						data : {page: (page+1)},
						dataType: "html",
						done : function(data) {
							$("#ioAlarmList").append(data);
						}
					};
					ajax.call(options);

				});
				
				$("#header_pc").removeClass("mode0");
				$("#header_pc").addClass("mode16");
				$("#header_pc").attr("data-header", "set22");
				$("#header_pc").addClass("noneAc");
				$(".mo-heade-tit .tit").html("재입고 알림");
				
				// footer 없는화면 (재입고 알림 footer PC노출/MO미노출 20210518 수정)
				if ("false" == "true") {
					$("#footer").remove();
				}
				
				$("div[name=contentArea]").on('click', 'img, div.tit, em, div.soldouts', function(){
					var goodsId = $(this).parents('div[name=contentArea]').data('goodsId');
					location.href="itemDetail.do?item_code="+goodsId;
				})
			});
		</script>
</head>

<body class="body lnb my home isPc gnb_ac isTalk isFoot">
<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData" value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">
		
		<!-- s : header 영역 -->


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
						<li class=""><a class="bt" href="myRecentTv.do" data-url="myRecentTv.do" data-content="954216"><b class="t">최근 본 영상</b></a></li>
						<li class=""><a class="bt" href="myRecentShop.do" data-url="myRecentShop.do" data-content="954216"><b class="t">최근 본 상품</b></a></li>
					</ul>
				</li>
				<li class="open">
					<a class="bt " href="javascript:;"><b class="t">나의 쇼핑정보</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="orderList.do" data-url="orderList.do" data-content="954216"><b class="t">주문/배송</b></a></li>
						<li class=""><a class="bt" href="/mypage/order/indexClaimList" data-url="/mypage/order/indexClaimList" data-content="954216"><b class="t">취소/반품/교환</b></a></li>
						<li class="active"><a class="bt" href="myAlarmList.do" data-url="myAlarmList.do" data-content="954216"><b class="t">재입고 알림</b></a></li>
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
		<!-- 바디 - 여기위로 템플릿 -->
	<main class="container lnb page shop my" id="container">
			<div class="inr" style="min-height: 577px;">
				<!-- 본문 -->
				<div class="contents" id="contents" style="min-height: 567px;">
					<div class="pc-tit">
						<h2>재입고 알림</h2>
					</div>
					
					<c:if test="${ empty malist }">
					<div class="noData" style="height: 561px;">
								<section class="no_data i1 auto_h" style="height: calc(100% - 351px);">
									<div class="inr">
										<div class="msg">재입고 알림 신청내역이 없습니다.</div>
									</div>
								</section>
								<div class="re-position-txt pc-c1" style="height: 121px;">
									<div class="info-txt t2 ">
										<p class="tit">유의사항 </p>
										<ul>
											<li>알림 신청한 상품이 재입고 될 경우 알림을 드립니다.</li>
											<li>알림은 어바웃펫 앱 푸시로 발송됩니다. 푸시 수신거부 시 알림이 발송되지 않으니 꼭 수신여부를 확인해주세요.</li>
											<li>재입고알림 발송 후 3개월이 지난 내역은 자동 삭제 됩니다. </li>
										</ul>
									</div>
								</div>
							</div>
					</c:if>
					
					<c:if test="${ not empty malist }">
					<div class="exchange-area pc-padding-top10">
								<div class="item-box pc-reposition t3">
									<div class="oder-cancel line-type s4015">
										<!-- page: 1
										totalPage: 1
										totalCount: 3
										-->
										<ul id="ioAlarmList" data-page="1">
	<c:forEach items="${ malist }" var="maDTO">
	<li>
		<div class="untcart cancel">
			<div class="box">
				<div class="tops set-po1" name="contentArea" data-goods-id="${ maDTO.item_code }">
					<div class="pic">
					<div class="soldouts">
								<em class="ts">입고예정</em>
							</div>
						<img src="${ maDTO.item_img }" alt="${ maDTO.item_name }" class="img">
					</div>
					<div class="name">
						<div class="tit re-po-mb0">${ maDTO.item_name }</div>
							<div class="stt">
								<c:if test="${ not empty maDTO.opt_name }">
									${ maDTO.opt_name }
								</c:if>
							</div>
						<div class="state c4">입고예정</div>
							</div>
					<!-- 2021.03.09 : 수정 -->
					<div class="right-area-pcver">
						<div class="gray-box-round">
							<div>
								${ maDTO.in_date }<br>알림 신청</div>
						</div>
						<button type="button" class="btn d close" data-target="goods" data-action="ioAlarmCancel" data-content="GS251017843:GP251021103" data-goodsid="GS251017843:GP251021103">삭제</button>
					</div>
					<!-- // 2021.03.09 : 수정 -->
				</div>
			</div>
		</div>
	</li>
	</c:forEach>

<script>
//			$(document).ready(function(e) {
				$("#ioAlarmMoreLoad").parent().hide();
//			});
		</script>
	<!--
page: 1
totalPage: 1
totalCount: 3
-->
</ul>
									</div>
								</div>
								<div class="re-position-txt pc-c1" style="height: 121px;">
									<div class="info-txt t2 ">
										<p class="tit">유의사항 </p>
										<ul>
											<li>알림 신청한 상품이 재입고 될 경우 알림을 드립니다.</li>
											<li>알림은 어바웃펫 앱 푸시로 발송됩니다. 푸시 수신거부 시 알림이 발송되지 않으니 꼭 수신여부를 확인해주세요.</li>
											<li>재입고알림 발송 후 3개월이 지난 내역은 자동 삭제 됩니다. </li>
										</ul>
									</div>
								</div>
							</div>
							</c:if>
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