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

<script type="text/javascript">
            var isApp = "PC" == "APP" || "PC" == "MO";
            var mp = parseInt("1");
            var mt = parseInt("1");
            var up = parseInt("1");
            var ut = parseInt("1");
            var isAsync = false;

            //시리얼 쿠폰 입력
            function fnInsertSerialCoupon(){
				$("body").append('<article id="cpnpop" class="popToast" style="bottom: 74px; z-index: 1000;"><div class="pbd"><div class="pct">쿠폰 번호를 다시 확인해주세요.</div></div></article>');
 		    	setTimeout(function() {
 		    		$("#cpnpop").addClass('on');
				}, 0);
 		    	setTimeout(function() {
 		    		$("#cpnpop").removeClass('on');
				}, 2000);
            	/*
                var isuSrlNo = $("[name='isuSrlNo']").val();
                if(isuSrlNo == ""){
                    ui.toast("쿠폰번호를 입력해주세요.");
                }else{
                    var option = {
                        url : "/mypage/info/registIsuSrlNo"
                        ,   data : { isuSrlNo : isuSrlNo}
                        ,   done : function(result){
                            if(result == "S"){
                                ui.toast("쿠폰이 등록되었어요.",{
                                    ccb : function(){
                                        window.location.reload();
                                    }
                                });
                            }else{
                                ui.toast(result);
                            }
                        }
                    };
                    ajax.call(option);
                }
                */
            }

            //화면 초기화
            function fnLoadDocument(){
                if(isApp){
                    $("#footer").remove();
                    $("#contents-ul").css("height","100%");
                }

                if($("#emptyImg").length > 0){
                    waiting.start();
                }

                $("#header_pc").removeClass("mode0");
                $("#header_pc").addClass("mode16");
                $("#header_pc").attr("data-header", "set22");
                $("#header_pc").addClass("noneAc");
                $(".mo-heade-tit .tit").html("내 쿠폰");

                fnRemoveBackSpace();

                //안내 팝업 동적 binding 위한 ui 이벤트 off
                $(".alert_pop").off();
                if($("#emptyImg").length > 0){
                    setTimeout(function(){
                        $("#emptyImg").show();
                        waiting.stop();
                    },1000);
                }
            }

            //모바일 일 때, 알림 팝업 문구 set
            function fnSetCpNotice(cpNo){
                var id = cpNo+"_notice";
                $("#default-mobile-notice").empty().append($("#"+id).html());
                $("#popCpnGud").addClass("on").css("display","block");
            }

            //이스케이프 문자 및 이용안내 공백 처리
            function fnRemoveBackSpace(){
                $(".cp-notice-list").each(function(idx){
                    var c = $(this).find("li").length;
                    if(c == 1){
                        var t = $(this).find("li").eq(0).text().replace(/\s*/gi,'');
                        if(t == ""){
                            $(this).closest(".alert_pop").remove();
                        }
                    }
                });
            }

            $(function(){
                fnLoadDocument();

                //쿠폰존 바로가기
                $(document).on("click","[name='cpZoneBtn'] , #goCouponZoneBtn-1 , #goCouponZoneBtn-2",function(){
                    var r = "/mypage/info/coupon";
                    var t = $(".uiTab").find(".active").attr("id");
                    window.location.href ="/mypage/service/coupon?r="+r+"?t="+t;
                });

                //쿠폰번호 입력 가이드
                $(document).on("focus","[name='isuSrlNo']",function(){
                    $(this).attr("placeholder","");
                    if( 0 < $(this).val().length){
                        $("#insertSerialCpBtn").removeClass("disabled");
                    }else{
                        if(!$("#insertSerialCpBtn").hasClass("disabled")){
                            $("#insertSerialCpBtn").addClass("disabled");
                        }
                    }
                }).on("blur","[name='isuSrlNo']",function(){
                    $(this).attr("placeholder","쿠폰번호 8~16자리 입력");
                    if( 0 < $(this).val().length){
                        $("#insertSerialCpBtn").removeClass("disabled");
                    }else{
                        if(!$("#insertSerialCpBtn").hasClass("disabled")){
                            $("#insertSerialCpBtn").addClass("disabled");
                        }
                    }
                }).on("input change paste","[name='isuSrlNo']",function(){
                    var maxLength = 16;
                    var inputVal = $(this).val();
                    $(this).val(inputVal.substr(0,maxLength));
                    if( 0 < $(this).val().length){
                        $("#insertSerialCpBtn").removeClass("disabled");
                    }else{
                        if(!$("#insertSerialCpBtn").hasClass("disabled")){
                            $("#insertSerialCpBtn").addClass("disabled");
                        }
                    }
                });

                //모바일 일 때, 쿠폰 이용 안내
                $(document).on("click",".alert_pop",function(e){
                    if(isApp){
                        var cpNo = $(this).prop("id");
                        fnSetCpNotice(cpNo);
                    }else{
                        var cl = ($(this).attr("data-pop") !== undefined) ? $(this).attr("data-pop") : false;
                        var $par = $(this).closest(".bubble_par");
                        e.stopPropagation();
                        $(".bubble_par").removeAttr("style");
                        $par.css("z-index",10);
                        $(".bubble_open").not($(this)).removeClass("bubble_open");
                        $(this).toggleClass("bubble_open");
                    }
                });

                //스크롤 페이징
                
                        $(window).scroll(function(){
                            var diff = 50;
                            var st = $(window).scrollTop();
                            var point = $(document).height() - window.innerHeight - 20 - ($("#footer").innerHeight() || 0);

                            var activeTab = $(".uiTab .active").prop("id");

                            var $target = $("#cp-list");
                            var url = "/mypage/info/paging/my-coupon";
                            var p = mp;
                            var t = mt;
                            if(activeTab == "uc"){
                                $target = $("#cp-used-list");
                                url = "/mypage/info/paging/my-use-coupon";
                                p = up;
                                t = ut;
                            }
                            if(p < t && st >= point && !isAsync){
                                waiting.start();
                                isAsync = true;
                                var scrollPaging = setInterval(function(){
                                    var option = {
                                        url : url
                                        ,   data : { page : p+1 , t : t}
                                        ,   type : "GET"
                                        ,   dataType : "HTML"
                                        ,   done : function(html){
                                            $target.append(html);
                                            $("#contents-ul").css("height","100%");
                                            st = $(window).scrollTop();
                                            point = $(document).height() - window.innerHeight - 20 - ($("#footer").innerHeight() || 0);
                                            isAsync = false;
                                            if(p<t){
                                                p = p+1;
                                                if(activeTab == "cc"){
                                                    mp = p;
                                                }else if(activeTab == "uc"){
                                                    up = p;
                                                }
                                            }
                                            fnRemoveBackSpace();
                                            waiting.stop();
                                            clearInterval(scrollPaging);
                                        }
                                    };
                                    ajax.call(option);
                                },2000);
                            }
                        })
                    

            })
        </script>

</head>

<body class="body lnb my home isPc gnb_ac isTalk isFoot">
<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData" value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">
		

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
						<li class=""><a class="bt" href="myAlarmList.do" data-url="myAlarmList.do" data-content="954216"><b class="t">재입고 알림</b></a></li>
						<li class="active"><a class="bt" href="myCouponList.do" data-url="myCouponList.do" data-content="954216"><b class="t">내 쿠폰</b></a></li>
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
<main class="container lnb page my" id="container">
                <div class="inr" style="min-height: 560px;">
                <!-- 본문 -->
                <div class="contents" id="contents" style="min-height: 558px;">
                    <!-- PC 타이틀 모바일에서 제거  -->
                    <div class="pc-tit">
                        <h2>내 쿠폰</h2>
                    </div>
                    <!-- // PC 타이틀 모바일에서 제거  -->

                    <div class="cupon-wrap petTabContent mode_fixed hmode_auto"><!-- 2021.03.15 : mode_fixed, hmode_auto 클래스 추가 -->
                        <ul class="uiTab a line">
                            <li class="active" id="cc">
                                <a class="bt" href="javascript:;"><span id="mCnt">사용가능한 쿠폰<c:if test="${ not_used ne 0 }"> ${ not_used }</c:if></span></a>
                            </li>
                            <li class="" id="uc">
                                <a class="bt" href="javascript:;"><span>사용/종료된 쿠폰<c:if test="${ used ne 0 }"> ${ used }</c:if></span></a>
                            </li>
                        </ul>
                        <!-- tab content -->
                        <!-- listMemberCouponSize -->
                        <div class="uiTab_content"><!-- 2021.03.15 : style 삭제 -->
                            <ul id="contents-ul" style="left: 0%;">
                                <li class="active">
                                    <!-- // 03.18 수정 -->
                                    <div class="my-cupon">
                                        <div class="input flex">
                                            <input type="text" name="isuSrlNo" placeholder="쿠폰번호 8~16자리 입력" style="padding-right: 29px;">
                                            <a href="javascript:fnInsertSerialCoupon();" class="btn md disabled" id="insertSerialCpBtn">쿠폰등록</a>
                                        </div>
                                        <c:if test="${ not_used eq 0 }">
                                        <section class="no_data i1 auto_h" style="height: 870px;">
                                            <div class="inr">
                                                <div class="msg">
                                                    사용가능한 쿠폰이 없습니다.
                                                </div>
                                                <div class="uimoreview">
                                                    <a href="javascript:;" class="bt more" id="goCouponZoneBtn-2">쿠폰존 바로가기</a>
                                                </div>
                                            </div>
                                        </section>
                                        </c:if>
                                        
                                 <c:if test="${ not_used ne 0 }">
                                        <!-- // 2021.03.25 : 수정 -->
                                        <ul class="cupon-list" id="cp-list">
                                        <c:forEach items="${ mclist }" var="mcDTO">
                                        <c:if test="${ mcDTO.mc_used eq 0 }">
							    	<li class="bubble_par"><!-- 2021.03.26 : "bubble_par" 클래스 추가 -->
							            <div class="sale">
							                ${ mcDTO.cp_rate }&nbsp;<c:if test="${ mcDTO.cp_type eq '할인율' }">%</c:if><c:if test="${ mcDTO.cp_type eq '할인금액' }">원</c:if> 할인
							                </div>
							            <p class="s-tit">${ mcDTO.cp_cate }쿠폰</p>
							            <p class="tit">${ mcDTO.cp_name }</p>
							            <div class="bottom-item">
							                <div class="txt">
							                    <p>${ mcDTO.cp_term } 원 이상 구매 시<c:if test="${ mcDTO.cp_max ne 0 }"> / 최대 ${mcDTO.cp_max} 원 할인</c:if></p>
							                            <p>${ mcDTO.sdate } ~ ${ mcDTO.edate }<span class="cupon">${ mcDTO.diffday }일 남음</span></p>
							                        </div>
							            </div>
							        </li>
							        </c:if>
							        </c:forEach>
							    </ul>
							    </c:if>
                                        </div>
                                <c:if test="${ not_used ne 0 }">
                                    <div class="uimoreview bottom">
                                            <button class="bt more" name="cpZoneBtn">쿠폰존 바로가기</button>
                                        </div>
                                        <!-- 여기까지 쿠폰있을때 -->
							    </c:if>
                                    </li>
                                <li style="height: 910px;" class="">
                                    <!-- 03.18 수정 -->
                                    <c:if test="${ used eq 0 }">
                                    <section class="no_data i1 auto_h">
                                            <div class="inr">
                                                <div class="msg">
                                                    사용/종료된 쿠폰이 없습니다.
                                                </div>
                                                <div class="uimoreview">
                                                    <a href="javascript:;" class="bt more" id="goCouponZoneBtn-2">쿠폰존 바로가기</a>
                                                </div>
                                            </div>
                                        </section>
                                    </c:if>
                                    <!-- // 03.18 수정 -->
                                    <div class="my-cupon">
                                        </div>
                                    </li>
                            </ul>
                        </div>
                    </div>
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