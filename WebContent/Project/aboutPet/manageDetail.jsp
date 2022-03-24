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

<link href="https://aboutpet.co.kr/_images/common/favicon.ico" rel="shrtcut icon">
<link href="https://aboutpet.co.kr/_images/common/favicon.png" rel="apple-touch-icon-precomposed">

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

<body class="body login srch isPc gnb_ac">
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
						<li class="active"><a class="bt" href="manageCheck.jsp"><b class="t" data-url="manageCheck.jsp" data-content="954216">회원정보 수정</b></a></li>
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
			var orgMemberTags = [];
			var memberTags = [];
			var isMobile = "PC" == "APP" || "PC" == "MO";
			var isNative = "PC" == "APP";
			var scrollTop = 0;
			var timer = null;
			var imageResult = null;
			var mobileWeb = "PC" == "MO";

			// 태그 컨트롤 객체
			var tag = {
				init : function(){
					//회원 태그
					var jsonStr = "${memDTO.mtag}";

					if(jsonStr != ""){
						jsonArr = jsonStr.split("/")
						for (var i=0; i< jsonArr.length; i++) {
							if (jsonArr[i]=='강아지') jsonArr[i]="T000000001";
							if (jsonArr[i]=='재미') jsonArr[i]="T000000106";
							if (jsonArr[i]=='귀여움') jsonArr[i]="T000000172";
							if (jsonArr[i]=='고양이') jsonArr[i]="T000000002";
							if (jsonArr[i]=='다이어트') jsonArr[i]="T000000308";
							if (jsonArr[i]=='힐링') jsonArr[i]="T000000153";
							if (jsonArr[i]=='행동교정') jsonArr[i]="T000000179";
							if (jsonArr[i]=='감동') jsonArr[i]="T000000174";
							if (jsonArr[i]=='구조') jsonArr[i]="T000000176";
							if (jsonArr[i]=='훈련') jsonArr[i]="T000000252";
							if (jsonArr[i]=='케어') jsonArr[i]="T000000226";
						}
						jsonArr.splice(jsonArr.indexOf(""), jsonArr.indexOf("")==-1? 0: 1);	// 마지막 슬래시 뒤 "" 공백 요소 제거
						// console.log(jsonArr);
						memberTags = jsonArr;
						orgMemberTags = jsonArr;
					}
					tag.setTagOnView(memberTags);
				}
				// 내 정보 관리 - 보여지고 있는 태그 리스트 가져오기
				,	getSelectedTag : function(){
					var arr = [];
					$("#tag-li span").not($("#tag-li span").not(":visible")).each(function(idx){
						arr.push(this.id);
					});
					return arr;
				}
				//관심 태그 변경 팝업 초기화
				,	initLayerPop : function(){
					var arr = tag.getSelectedTag();
					$("#int-tag-list button").each(function(idx){
						if(arr.indexOf($("#int-tag-list button").eq(idx).data("id")) > -1){
							$("#int-tag-list button").eq(idx).addClass("active");
						}else{
							$("#int-tag-list button").eq(idx).removeClass("active");
						}
					});
				}
				//관심 태그 변경 팝업 open
 				,	openLayer : function(){
					scrollTop = $("html").scrollTop();
					tag.initLayerPop();
					ui.popLayer.open("interestTagPop");
				}
				// 관심 태그 변경 팝업 - 태그 선택 이벤트
				//2021.04.01 기준 - 모바일일 때,웹일 때 관심 태그 변경 선택자는 동일, but -> toggle 퍼포먼스 소스 다름. 담당 퍼블리셔- 김 도 선
				,	onClick : function(btn){
					var cls = "active";
					if(isMobile){
						var r = $(btn).hasClass(cls);
						$("#int-tag-list .active").length > 1 && r ? $(btn).removeClass(cls) : $(btn).addClass(cls);
					}else{
						if($("#int-tag-list .active").length == 1 && $(btn).hasClass(cls)){
							$(btn).removeClass(cls);
						}
					}
					var tagId = $(btn).data("id");

					//클릭 시, 리스트에 담을 지 뺄지
					var isPush = $(btn).hasClass(cls);
					if(!isMobile) isPush = !isPush;

					if(isPush){
						if(memberTags.indexOf(tagId) == -1){
							memberTags.push(tagId);
						}
					}else{
						memberTags.splice(memberTags.indexOf(tagId),1);
					}
				}
				,	setTagOnView :  function(tagList,callback){
					if(tagList == [] || tagList == ""){
						$("#tag-li .tag").hide();
					}else{
						var selector = tagList.join(", #");
						var $show = $("#"+selector);
						$("#tag-li .tag").not($show).hide();
						$($show).show();
					}

					if(callback){
						callback();
					}
				}
			};

			//소셜 로그인 연동
			var sns = {
					connect : function(snsLnkCd){
						var snsData = {
								snsLnkCd : snsLnkCd
							, 	checkCode : "86c510eb806b1374e2101b62bce7c207"
						};
						var options = {
							url : "/snsLogin",
							data : snsData ,
							done : function(data){
								if(isNative &&  !(snsLnkCd == 40 && 'DEVICE_TYPE' == '10') ){
									toNativeData.func = "onSnsLogin";
									if(snsLnkCd == "10") toNativeData.loginType ="N"; //N : 네이버, K : 카카오톡 , G: 구글
									if(snsLnkCd == "20") toNativeData.loginType ="K";
									if(snsLnkCd == "30") toNativeData.loginType ="G";
									if(snsLnkCd == "40") toNativeData.loginType ="A";
									toNative(toNativeData);
								}else{
									window.location.href = data.goUrl;
								}
							}
						};
						ajax.call(options);
				}
				,	disconnect : function(snsUuid,snsLnkCd){
						var snsNm = "네이버";
						if(snsLnkCd =="10"){
							snsNm = "네이버";
						}
						if(snsLnkCd =="20"){
							snsNm = "카카오";
						}
						if(snsLnkCd =="30"){
							snsNm = "구글";
						}
						if(snsLnkCd =="40"){
							snsNm = "애플";
						}

						var config = {
								txt : snsNm +" 로그인 설정을 해제하시겠습니까?"
							,	ycb : function(){
									var options = {
										url : "/mypage/info/disconnect"
										,	data : { snsUuid : snsUuid ,snsLnkCd : snsLnkCd }
										,	done : function(result){
											var currentLoginLnkCd = "50";

											if(result == "S"){
												messager.alert({
													txt : "SNS 연결이 해제 되었습니다."
													,	ycb : function(){
														if(currentLoginLnkCd == snsLnkCd) window.location.href="/logout";
														sns.reload();
													}
												});
											}else{
												messager.alert({
													txt:"잠시 후, 다시 시도해주세요."
													,	ycb : function(){
														sns.reload();
													}
												});
											}
										}
									};
									ajax.call(options);
							}
						};
						messager.confirm(config);
				}
				,	reload : function(){
						var options = {
								url : "/mypage/info/sns-connect"
							,	type : "GET"
							,	dataType : "HTML"
							,	done : function(html){
									$("#sns-connect-list").empty().append(html);
							}
						};
						ajax.call(options);
				}
			}
			
			
			
			
			

			//유효성 메세지
			//닉네임
			var validateMsg = {
				emptyNickNm : function(){
					var html ="<p class='validation-check' id='nickNm-format-error'>닉네임을 입력해주세요.</p>";
					$("#nickNm-format-error").remove();
					if($("#nickNm-format-error").length == -0){
						$("#nickNm").parent().after(html)
					}
				},
				banWordNickNm : function(){
					var html ="<p class='validation-check' id='nickNm-format-error'>금지어가 포함된 내용은 입력할 수 없어요.</p>";
					$("#nickNm-format-error").remove();
					if($("#nickNm-format-error").length == -0){
						$("#nickNm").parent().after(html)
					}
				},
				//이메일
				emptyEmail : function(){
					$("#email-format-error").remove();
					var msg = "메일 주소를 입력해주세요.";
					var html ="<p class='validation-check' id='email-format-error'>"+ msg + "</p>";
					$("#email").parent().after(html)
				},
				notEmailFormat : function(){
					$("#email-format-error").remove();
					var msg = "메일 주소를 다시 확인해주세요.";
					var html ="<p class='validation-check' id='email-format-error'>"+ msg + "</p>";
						$("#email").parent().after(html)
				},
				defaultErrorMsg : function(selector,msg){
					var id = $(selector).prop("id") == null || $(selector).prop("id") == "" ? selector.replace(/name/g,'').replace(/[^a-zA-Z]/g,'') : $(selector).prop("id");
					var errorMsgId = id + "-format-error";
					var html ="<p class='validation-check' id='"+errorMsgId+"'>"+ msg + "</p>";
					if($("#"+errorMsgId).length == 0){
						$(selector).parent().after(html)
					}
					$('.btnDel').click(function(){
						$('#'+errorMsgId).html("");
					});
				}
			}
			//2021.06.21 김준형 추가
			//다시 입력 시 validation Msg 제거
			$(document).on("keydown input paste",".valChkRequired", function(){
				$(this).parent().next().remove();
			
			})

			//GSR 포인트 인증
			function fnGetGsrPoint(){
				if($("#tm").is(":visible")){
					mobileCert.cancel();
				}

				var ciCtfVal = $("[name='ciCtfVal']").val();
				var config = {
					//ci 값 있을 때
					callBack : function(){
							var option = {
									url :  "/gsr/getGsrMemberPoint"
								,	done : function(result){
										var separateNotiMsg = result.separateNotiMsg;
										//분리보관 해제 시
										if(separateNotiMsg && separateNotiMsg != ''){
											//분리보관 해제 noti
											ui.alert("<div id='alertContentDiv'>"+separateNotiMsg+"</div>",{
												ycb:function(){
													var gsrPoint = result.totRestPt === '' || result.totRestPt == null ? '0' : result.totRestPt;
													gsrPoint = fnComma(gsrPoint);
													$del = $("#gs-btn-div , #gs-cert-noti");
													$del.remove();
													$("#gs-point").text(gsrPoint);
													$("#gs-point-notice").css("color","#669aff").show();
													$(".popAlert").remove();
												}
												,   ybt:"확인"
											});
										}else{
											var gsrPoint = result.totRestPt === '' || result.totRestPt == null ? '0' : result.totRestPt;
											gsrPoint = fnComma(gsrPoint);
											$del = $("#gs-btn-div , #gs-cert-noti");
											$del.remove();
											$("#gs-point").text(gsrPoint);
											$("#gs-point-notice").css("color","#669aff").show();
										}
								}
							};
							ajax.call(option);
					}
					//ci값 없을 때
					,	okCertCallBack : function(data){
							var option = {
									url :  "/gsr/getGsrMemberPoint"
								,	data : data
								,	done : function(result){
										var gsrPoint = result.totRestPt === '' || result.totRestPt == null ? '0' : result.totRestPt;
										gsrPoint = fnComma(gsrPoint);
										$del = $("#gs-btn-div , #gs-cert-noti");
										$del.remove();
										$("#gs-point").text(gsrPoint);
										$("#gs-point-notice").css("color","#669aff").show();

									//	fnActiveSaveBtn();
								}
							};
							ajax.call(option);
					}
				};
				gk.open(config);
			}
		
			//화면 초기화
			function fnLoadDocument(){
				//모바일일 경우, 푸터 숨기기
				if(isMobile){
					$(".menubar").hide();
					$(".footer").hide();
					$(".filter-item .tag button").off();
				}

				//태그 초기화
				tag.init();

				//버튼 활성화
				//fnActiveSaveBtn();

				//가이드 문구
				if($("#email").val() == ""){
					$("#email").css("-webkit-text-fill-color","#9a9a9a");
				}
				if($("#nickNm").val() == ""){
					$("#nickNm").css("-webkit-text-fill-color","#9a9a9a");
				}

				//sns 연동 시
				if("" != ""){
					$("html").scrollTop(1293.6000289916992);
					var config = {
							txt : "SNS 연결이 설정 되었습니다."
						,	ycb : function(){
								sns.reload();
						}
					};
					messager.alert(config);
				}
			}

			//클립 보드 복사 하기
			function copyToClipboard(val) {
				var t = document.createElement("textarea");
				document.body.appendChild(t);
				t.value = val;
				t.select();
				document.execCommand('copy');
				document.body.removeChild(t);

				$("body").append('<article id="urlpop" class="popToast abcd" style="bottom: 74px; z-index: 1000;"><div class="pbd"><div class="pct">추천코드가 복사되었어요.</div></div></article>');
 		    	setTimeout(function() {
 		    		$("#urlpop").addClass('on');
				}, 0);
 		    	setTimeout(function() {
 		    		$("#urlpop").removeClass('on');
				}, 2000);
			}

			//회원 탈퇴
			function fnLeaveMember(){
				var form = document.createElement("form");
				form.setAttribute("action","/mypage/info/indexLeaveGuide");
				form.setAttribute("method","POST");

				var input = document.createElement("input");
				input.setAttribute("name","checkCode");
				input.setAttribute("value","86c510eb806b1374e2101b62bce7c207");
				input.setAttribute("type","text");
				form.appendChild(input);

				document.body.appendChild(form);
				form.submit();
			}
					
	//이메일 한글입력 모바일 
	$(document).ready(function(){
		validateTxtLength(this, 40);
		 $("input:text[onlyEng]").on("input paste keydown change", function() {
	   		 $(this).val($(this).val().replace(/[ㄱ-힣]/gi,""));
			}); 
	})
				//복사하기
				$(document).on("click","#copyBtn",function(){
					var rcomCd = $("#frdRcomKey").text();
					copyToClipboard(rcomCd);
				});

				//닉네임 입력 제한
				//입력 안했을 경우 에러 메시지
				//공백입력막기 
				 $(document).on("input paste keydown change","[name='nickNm']",function(){
					validateTxtLength(this, 20);
					 var nickNmNoSpace=$(this).val().replace(/ /gi, "");
					$(this).val(nickNmNoSpace); 
				})
				
				
	$(document).ready(function(){
		$('#nickNm').on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', () => {
			if(timer!=null){
				clearTimeout(timer);	
			}
			setTimeout(function(){	
				var nn =  $('#nickNm').val()
				var originNickNm = "히온";		
				if(nn == ""){
					validateMsg.emptyNickNm();
				}else{
					validWhenBlur.banWord({nickNm : nn}, function(returnCode){
						if(returnCode == "banWord"){
							validateMsg.banWordNickNm();
						}else{
							validWhenBlur.nickNm(nn,function(result){
								if(nn != originNickNm){
									validateMsg.duplicateNickNm(result);
								}
							});
						}
					})
				}
			},150) 
		});
		$('#email').on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', () => {
			setTimeout(function(){
				var e = $("#email").val();
				var originEmail = "hion@hion.com";
				if(e == ""){
					validateMsg.emptyEmail();
				}else if(!valid.ko.test(e)){
					validateMsg.notEmailFormat();
				}else {
					validWhenBlur.email(e,function(result){
					if(e != originEmail){
						validateMsg.duplicateEmail(result);
						}
					});
				}
			},150)
		});
		
		if("PC" != "PC"){
			$(".mo-heade-tit").text("회원정보 수정");
			$("#header_pc").addClass('logHeaderAc');
		};
		
		fnLoadDocument();
		
	})
	
				//가이드 문구 dim 처리 일괄
				$(document).on("focus input paste change ","#email , #nickNm",function(){
					$(this).css("-webkit-text-fill-color",$(this).val() == "" ? "#9a9a9a" : "black");
					$(this).attr("placeholder","");
				}).on("blur","#email , #nickNm", function(){
					$(this).css("-webkit-text-fill-color",$(this).val() == "" ? "#9a9a9a" : "black");
					 if(this.id=="nickNm"){
						$(this).attr("placeholder","닉네임을 입력해주세요.");
					}
					if(this.id=="email"){
						$(this).attr("placeholder","이메일을 입력해주세요.");
					}
				})
					/* .on("input change paste","#nickNm",function(){
					validateTxtLength(document.getElementById("nickNm"), 20);
				}); */

				//모바일 - 관심 태그 변경 뒤로가기, 닫기 버튼
				$(document).on("click","#interestTagPopBackBtn , #interestTagPopCloseBtn",function(){
					tag.setTagOnView(tag.getSelectedTag(),function(){
						$("#contents").show();
						ui.popLayer.close("interestTagPop");
						$("html").scrollTop(scrollTop);
					});
				});
				//모바일 - 태그 저장 버튼 클릭 시
			$(document).on("click","#tagSaveBtn",function(){
					tag.setTagOnView(memberTags,function(){
						orgMemberTags = tag.getSelectedTag();
						$("#contents").show();
						ui.popLayer.close("interestTagPop");
						$("html").scrollTop(scrollTop);
					});
				})

						
			function goBack() {
				history.replaceState("","",'myPage.do');
				location.href='myPage.do';
			}
		</script>
	
		
		<!-- 바디 - 여기위로 템플릿 -->
 <form id="memberForm" action="manageDetail.do" method="POST" enctype="multipart/form-data" >
<!-- 			<div id="hiiden-field">
				<input type="hidden" id="adapter" onchange="fnSnsStatSave();">
				<input type="hidden" name="prflNm" value="">
				<input type="hidden" name="prflImg" value="">
				<input type="hidden" name="orgPrflImg" value="">
				<input type="hidden" name="mobile" value="">
				<input type="hidden" name="orgMobile" value="">
				<input type="hidden" name="mobileCd" value="">
				<input type="hidden" name="ciCtfVal" value="">
				<input type="hidden" name="diCtfVal" value="">
				<input type="hidden" name="rcomUrl" value="https://me2.do/GKo2Ishu">
				<input type="hidden" name="rcomCd" value="9BD0770C">
				<input type="hidden" name="ntnGbCd" value="">
			</div> -->
			<main class="container page login srch" id="container">
<!-- 				<div class="header pageHead heightNone"> -->
<!-- 					<div class="inr"> -->
<!-- 						<div class="hdt"> -->
<!-- 							<button class="back" type="button" onclick="goBack();" data-content="" data-url="/mypage/indexMyPage">뒤로가기</button> -->
<!-- 						</div> -->
<!-- 						<div class="cent"><h2 class="subtit">회원정보 수정</h2></div> -->
<!-- 					</div> -->
<!-- 				</div> -->

				<div class="inr" style="min-height: 560px;">
					<!-- 본문 -->
					<div class="contents" id="contents">
						<div class="pc-tit">
							<h2>회원정보 수정</h2>
						</div>
						<div class="fake-pop">
							<div class="pct">
								<div class="poptents">
									<!-- 프로필 사진 -->
									<div class="my-picture">
										<p class="picture">
											<img id="prflImg" class="thumb" data-original="${ memDTO.mem_img }" src="${ memDTO.mem_img }" alt="">
											<input type="hidden" name="orgImg" value="${ memDTO.mem_img }" />
										</p>
										<label class="btn edit" for="prflImgBtn"></label>
										<input type="file" name="uploadFile" id="prflImgBtn" style="display:none;" onchange="readImage(event)"/>
										<!-- <button type="button" class="btn edit" id="prflImgBtn" onclick="img.upload();" data-content=""></button> -->
									</div>
									<!-- // 프로필 사진 -->
									<!-- 회원 정보 입력 -->
									<div class="member-input">
										<ul class="list">
											<li>
												<strong class="tit requied">아이디</strong>
												<p class="info">필수 입력 정보</p>
												<div class="input disabled coms">
													<input type="text" value="${ memDTO.mem_id }" readonly="" style="-webkit-text-fill-color:black;">
												</div>
											</li>
											<li>
												<strong class="tit">이름</strong>
												<div class="input disabled">
												<input type="text" id="mbrNm" value="" placeholder="본인확인이 필요합니다." readonly="" style="-webkit-text-fill-color:#9a9a9a;">
													</div>
											</li>
											<li id="mobile-li-default">
												<strong class="tit">휴대폰 번호</strong>
												<div class="input disabled flex">
													<input type="text" id="mobile" value="" placeholder="본인확인이 필요합니다." readonly="" style="-webkit-text-fill-color:#9a9a9a;">
														</div>
											</li>
											<li id="mobile-li-cert">
											</li>
											<li>
												<strong class="tit requied">닉네임</strong>
												<div class="input del coms">
													<input type="text" name="nickNm" class="valChkRequired" id="nickNm" value="${ memDTO.nickname }" maxlength="22" placeholder="닉네임을 입력해주세요." style="-webkit-text-fill-color:black;">
												</div>
											</li>
											<li>
												<strong class="tit requied">이메일</strong>
												<div class="input del coms">
													<input type="text" name="email" class="valChkRequired" id="email" value="${ memDTO.mem_email }" placeholder="이메일을 입력해주세요." maxlength="42" style="-webkit-text-fill-color:black;">
												</div>
											</li>
											<li class="b-line">
												<strong class="tit">초대코드</strong>
												<div class="flex-wrap">
													<div class="txt" id="frdRcomKey">${ memDTO.mem_invite }</div>
													<a href="javascript:;" class="btn sm" id="copyBtn">복사하기</a>
												</div>
											</li>
											<li class="b-line">
												<strong class="tit">GS&amp;POINT</strong>
												<div class="ptt" id="gs-point-notice" style="color: rgb(102, 154, 255);"><b class="t">사용 가능한 포인트</b> <em class="prc"><b class="b" id="gs-point">${ memDTO.mem_point }</b><i class="w">P</i></em></div>
											</li>
											<li class="b-line">
												<div class="flex-wrap">
													<strong class="tit mb0">관심태그</strong>
													<a href="javascript:tag.openLayer();" class="btn sm" data-url="/mypage/info/indexInterestTagPop" data-content="954216">변경</a>
												</div>
												<div class="tag-area" id="tag-li">
												<!-- mtag에 포함되면 그냥 span 없으면 display none -->
												<input type="hidden" id="htag" name="htag" />
													<span class="tag" id="T000000001" data-tag-no="T000000001" style="display:none;">강아지</span>
													<span class="tag" id="T000000106" data-tag-no="T000000106" style="display:none;">재미</span>
													<span class="tag" id="T000000172" data-tag-no="T000000172" style="display:none;">귀여움</span>
													<span class="tag" id="T000000002" data-tag-no="T000000002" style="display:none;">고양이</span>
													<span class="tag" id="T000000308" data-tag-no="T000000308" style="display:none;">다이어트</span>
													<span class="tag" id="T000000153" data-tag-no="T000000153" style="display:none;">힐링</span>
													<span class="tag" id="T000000179" data-tag-no="T000000179" style="display:none;">행동교정</span>
													<span class="tag" id="T000000174" data-tag-no="T000000174" style="display:none;">감동</span>
													<span class="tag" id="T000000176" data-tag-no="T000000176" style="display:none;">구조</span>
													<span class="tag" id="T000000252" data-tag-no="T000000252" style="display:none;">훈련</span>
													<span class="tag" id="T000000226" data-tag-no="T000000226" style="display:none;">케어</span>
													</div>
											</li>
											<li id="sns-connect-list">
												<strong class="tit">소셜 로그인 연동</strong>
<div class="flex-wrap">
    <div class="txt">네이버 로그인 연결</div>
    <a href="javascript:void(0);" class="btn sm " onclick="sns.connect(10)" data-content="954216" data-url="/snsLogin?chnlId=10">연결하기</a>
        </div>
<div class="flex-wrap">
    <div class="txt">카카오 로그인 연결</div>
    <a href="javascript:void(0);" class="btn sm " onclick="sns.connect(20)" data-content="954216" data-url="/snsLogin?chnlId=20">연결하기</a>
        </div>
<div class="flex-wrap">
    <div class="txt">구글 로그인 연결</div>
    <a href="javascript:void(0);" class="btn sm " onclick="sns.connect(30)" data-content="954216" data-url="/snsLogin?chnlId=30">연결하기</a>
        </div>
<div class="flex-wrap">
    <div class="txt">애플 로그인 연결</div>
    <a href="javascript:void(0);" class="btn sm " onclick="sns.connect(40)" data-content="954216" data-url="/snsLogin?chnlId=40">연결하기</a>
        </div></li>
										</ul>
									</div>
									<!-- // 회원 정보 입력 -->
								</div>
							</div>
							<div class="pbt pull">
								<div class="bts">
									<a href="javascript:manageSubmit();" class="btn xl a" id="saveBtn"> <!-- onclick="updateMember();" -->저장</a>
								</div>
							</div>
							<div class="btn-area">
								<a href="javascript:fnLeaveMember();" class="text-btn" data-url="/mypage/info/indexLeaveGuide" data-content="954216">회원탈퇴하기</a>
							</div>
						</div>
					</div>
				</div>
			</main>
		</form>

<article class="comm popLayer a interestTagPop" id="interestTagPop" tabindex="0" style="display: none;">
    <div class="pbd">
        <div class="phd">
            <div class="in">
                <button class="mo-header-backNtn" id="interestTagPopBackBtn">뒤로</button>
                <h1 class="tit left">관심 태그 변경</h1>
                <button type="button" class="btnPopClose" id="interestTagPopCloseBtn">닫기</button>
            </div>
        </div>
        <div class="pct" style="height: 782px;">
            <main class="poptents">
                <div class="tag-choise mt20">
                    <h2>
                        관심있는 태그를<br><span>최소 1개 이상</span> 선택해주세요.
                    </h2>
                    <p class="tag-txt mt60"></p>
                    <div class="filter-area t2">
                        <div class="filter-item">
                            <div class="tag" id="int-tag-list" style="text-align: center;height: auto;">
                                <button type="button" class="active" data-id="T000000001" data-content="T000000001" onclick="tag.onClick(this);">강아지</button>
                                    <button type="button" class="" data-id="T000000106" data-content="T000000106" onclick="tag.onClick(this);">재미</button>
                                    <button type="button" class="" data-id="T000000172" data-content="T000000172" onclick="tag.onClick(this);">귀여움</button>
                                    <button type="button" class="active" data-id="T000000002" data-content="T000000002" onclick="tag.onClick(this);">고양이</button>
                                    <button type="button" class="" data-id="T000000308" data-content="T000000308" onclick="tag.onClick(this);">다이어트</button>
                                    <button type="button" class="active" data-id="T000000153" data-content="T000000153" onclick="tag.onClick(this);">힐링</button>
                                    <button type="button" class="" data-id="T000000179" data-content="T000000179" onclick="tag.onClick(this);">행동교정</button>
                                    <button type="button" class="" data-id="T000000174" data-content="T000000174" onclick="tag.onClick(this);">감동</button>
                                    <button type="button" class="" data-id="T000000176" data-content="T000000176" onclick="tag.onClick(this);">구조</button>
                                    <button type="button" class="active" data-id="T000000252" data-content="T000000252" onclick="tag.onClick(this);">훈련</button>
                                    </div>
                        </div>
                    </div>
                </div>
                <div class="pull">
                    <div class="bts">
                        <a href="javascript:void(0);" id="tagSaveBtn" class="btn lg a">저장</a>
                    </div>
                </div>
            </main>
        </div>
    </div>
</article>
<!-- form 전송 스크립트 -->
<script>

// console.log($("#nickNm").val());

// 닉네임 중복체크
 $("#nickNm").on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', function() {
	 setTimeout(function(){
		var v = true ;
		var msg = "";
		var orgNickNm = "${memDTO.nickname}";
		var nickNm = $("#nickNm").val();
		var chkNickNm = nickNm.replace(/ /gi, "");
		nickNm = chkNickNm;
		if($("#nickNm").val() == ""){
			msg = "닉네임을 입력해주세요.";
			v = false;
		}else{
			
			
			var params =$("#memberForm").serialize()+"&check=nickname&orgNickNm="+orgNickNm;
				
			// console.log(params);
		              $.ajax({
		           
		           url: "manageDuplicate.jsp"
		           , dataType:"json"
		           , type:"get"
		           , data: params
		           , cache:false
		           , success:function (data){
		        
		              if( data.count == 1){
							var html ="<p class='validation-check' id='nickNm-format-error'>이미 사용 중인 닉네임이에요.</p>";
							$("#nickNm-format-error").remove();
							$("#nickNm").parent().after(html);
		              	}
		              }
		         });   
			
		}

		if(!v && $("#nickNm-format-error").html() == ""){
// 				$("#join_nickname").focus();
		}
		$("#nickNm-format-error").html(msg);
		
		$('.btnDel').click(function(){
			$('#nickNm-format-error').html("");
		});		 
	 },250)
}); 


// 이메일 중복체크
 $("#email").on("DEVICE_TYPE" == "20" ? 'mouseout focusout' : 'blur', function() {
	 setTimeout(function(){
		var v = true ;
		var msg = "";
		var orgEmail = "${memDTO.nickname}";
		var email = $("#email").val();
		var chkEmail = email.replace(/ /gi, "");
		email = chkEmail;
		if($("#email").val() == ""){
			msg = "메일 주소를 입력해주세요.";
			v = false;
		}else{
			
			
			var params =$("#memberForm").serialize()+"&check=mem_email&orgEmail="+orgEmail;
				
			// console.log(params);
		              $.ajax({
		           
		           url: "manageDuplicate.jsp"
		           , dataType:"json"
		           , type:"get"
		           , data: params
		           , cache:false
		           , success:function (data){
		        
		              if( data.count == 1){
							$("#email-format-error").remove();
							var msg = "이미 사용 중인 메일 주소에요.";
							var html ="<p class='validation-check' id='email-format-error'>"+msg + "</p>";
							$("#email").parent().after(html);
		              	}
		              }
		         });   
			
		}

		if(!v && $("#nickNm-format-error").html() == ""){
// 				$("#join_nickname").focus();
		}
		$("#nickNm-format-error").html(msg);
		
		$('.btnDel').click(function(){
			$('#nickNm-format-error').html("");
		});		 
	 },250)
}); 


	// (이미지 미리보기) input 값 변경되면 prflImg src 값 바뀌게
	function readImage(event) {
		if( $("#prflImgBtn").val() != "" ){
			var ext = $("#prflImgBtn").val().split('.').pop().toLowerCase();
			
	        // 확장자 검사 후 2초간 팝업 노출
		    if($.inArray(ext, ['png','jpg']) == -1) {
				$("body").append('<article id="imgpop" class="popToast" style="bottom: 74px; z-index: 1000;"><div class="pbd"><div class="pct">png, jpg 파일만 등록할 수 있어요.</div></div></article>');
 		    	setTimeout(function() {
 		    		$("#imgpop").addClass('on');
				}, 100);
 		    	setTimeout(function() {
 		    		$("#imgpop").removeClass('on');
				}, 2000);
 		    	
			} else {
		        // FileReader 인스턴스 생성
		        var reader = new FileReader();
		        // 이미지가 로드가 된 경우
		        reader.onload = function(event) {
		            $("#prflImg").attr("src", event.target.result);
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(event.target.files[0]);
			}
		}

    };
    
	function manageSubmit(){
		// 선택된 관심태그 /로 이어붙여 전송
		var str = '';
		for (let i=0; i<$("#tag-li span").length; i++) {
			if ($("#tag-li span").eq(i).not($("#tag-li span").not(":visible")).html() != undefined) {
				str += $("#tag-li span").eq(i).html() +'/';
			}
		}
		$("#htag").val(str);
		
		
		if ($("#nickNm-format-error").length > 0) {
			$("#nickNm").focus();
		} else if ($("#email-format-error").length > 0) {
			$("#email").focus();			
		} else {
			$("#memberForm").submit();				
		}
		
	};
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


</body></html>