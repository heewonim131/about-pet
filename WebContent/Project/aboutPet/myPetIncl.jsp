<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
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
<meta property="og:image:url"
	content="/_images/common/aboutpet_logo@2x.png">
<meta property="og:image:type" content="image/jpeg">
<meta property="og:image:width" content="300">
<meta property="og:image:height" content="300">

<link href="https://aboutpet.co.kr//_images/common/favicon.ico"
	rel="shrtcut icon">
<link href="https://aboutpet.co.kr//_images/common/favicon.png"
	rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css"
	href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css">
<!-- googole Analytics -->

<script type="text/javascript" async=""
	src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.sdk.js?timestemp=1625749753220"
	charset="UTF-8"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-187433715-1&amp;l=dataLayer&amp;cx=c"></script>
<script async=""
	src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript" src="../js/googleAnalytics.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', "G-NR86F31079");
</script>


<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="../js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="../js/jquery.blockUI.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="../js/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.number.min.js"
	charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.form.min.js"></script>
<script type="text/javascript" src="../js/jquery.countdown.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/swiper.min.js"></script>
<script type="text/javascript" src="../js/clipboard.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/popup.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript" src="../js/deviceChk.js"></script>
<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- kakao map -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&amp;libraries=services"></script>
<script charset="UTF-8"
	src="https://t1.daumcdn.net/mapjsapi/js/main/4.3.6/kakao.js"></script>
<script charset="UTF-8"
	src="https://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
<script type="text/javascript" src="../js/kakao-map.js"></script>
<!-- app interface -->
<script type="text/javascript" src="../js/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" src="../js/adbrix.js"></script>
<script type="text/javascript" src="../js/ui.mo.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&amp;submodules=geocoder"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
<script type="text/javascript">
//	const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
</script>

<!-- 펫뷰 스크립트 -->
<script type="text/javascript">
		
			$(document).ready(function(){
				console.log("PetBaseVO(petNo=31463, mbrNo=954216, imgPath=/pet/31463/c032886c-6723-4567-b8cc-fd8e013dbbce.png, petGbCd=10, petKindNm=, petKindNms=null, petNm=Q, petNms=null, petGdGbCd=20, age=0, month=11, birth=20200801, weight=null, dlgtYn=null, naverPetKey=null, fixingYn=N, allergyYn=N, wryDaYn=Y, cnt=null, sysRegDt=null, petInclCnt=null, diseaseNm=null, allergyNm=null, ageChoose=2, birthBatch=null)");

				// pc버전에서 질환/알러지 리스트 button 클릭시 header.jsp에서 걸어놨던 sendSearchEngineEvent ajax가 발생함으로
				// button을 클릭할때마다 로딩이 뜨기때문에 클릭이벤트를 off 시킨후 토글이벤트 init
// 				$(".uidropmu button").off("click");
// 				ui.dropmenu.init();						

				if("PC" != "PC") {
					$("footer").remove();
					$(".menubar").remove();
				}
			});
			
			function goBack() {
				//history.replaceState("","","/my/pet/myPetListView");
				//location.href = "/my/pet/myPetListView";
				//location.href = "/mypage/indexMyPage"
				storageHist.goBack("/my/pet/myPetListView");
			}
			
			function petUpdate() {
				//location.replace("/my/pet/petUpdateView?petNo=31463");
				storageHist.goBack("/my/pet/petUpdateView?petNo=31463");
			}
			
			function petDelete() {
				ui.confirm('마이펫 정보를 삭제할까요?',{ 
				    ycb:function(){
						var options = {
							url : "/my/pet/petDelete"
							, data : { petNo : "31463", mbrNo : "954216", imgPath : "/pet/31463/c032886c-6723-4567-b8cc-fd8e013dbbce.png"}
							, done : function(result){
								if(result == "S") {
									fncTagInfoLogApi(
											{ url:"/my/pet/myPetView"
											, targetUrl:"/my/pet/myPetListView"
											,callback:petDeleteCallback()
											});
								}
							}
						};
						ajax.call(options);
				    },
				    ncb:function(){
				    },
				    ybt:'예',
				    nbt:'아니요'
				});
			}
		
			function petDeleteCallback(){
				//location.href = "/my/pet/myPetListView?deleteYn=Y";
				storageHist.goBack("/my/pet/myPetListView?deleteYn=Y");
			}
			
			function myPetIncl(petNo , petNm){
				location.href = "myPetIncl.do?petNo=" + petNo;
			}
		</script>
</head>

<body class="body lnb my home isPc gnb_ac isTalk isFoot">
	<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData"
			value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">

		<div class="layers tv seriesHome" id="srisListPopup"></div>
		<!-- e : gnb 영역 -->
		<!-- s : LNB 영역 -->
		<script type="text/javascript">
</script>
		<nav class="lnb my" id="lnb">
			<div class="inr" style="bottom: 40px;">
				<div class="myCate">
					<ul class="menu">
						<li class="open"><a class="bt " href="myPage.do"
							data-url="myPage.do" data-content="954216"><b class="t">내
									활동</b></a>
							<ul class="sm">
								<li class="active"><a class="bt" href="myPetList.do"
									data-url="myPetList.do" data-content="954216"><b
										class="t">마이펫 관리</b></a></li>
								<li class=""><a class="bt" href="myWishTv.do"
									data-url="myWishTv.do" data-content="954216"><b
										class="t">마이 찜리스트</b></a></li>
								<li class=""><a class="bt"
									href="myRecentTv.do"
									data-url="myRecentTv.do"
									data-content="954216"><b class="t">최근 본 영상</b></a></li>
								<li class=""><a class="bt" href="myRecentShop.do"
									data-url="myRecentShop.do" data-content="954216"><b
										class="t">최근 본 상품</b></a></li>
							</ul></li>
						<li class="open"><a class="bt " href="javascript:;"><b
								class="t">나의 쇼핑정보</b></a>
							<ul class="sm">
								<li class=""><a class="bt"
									href="orderList.do"
									data-url="orderList.do"
									data-content="954216"><b class="t">주문/배송</b></a></li>
								<li class=""><a class="bt"
									href="/mypage/order/indexClaimList"
									data-url="/mypage/order/indexClaimList" data-content="954216"><b
										class="t">취소/반품/교환</b></a></li>
								<li class=""><a class="bt" href="myAlarmList.do"
									data-url="myAlarmList.do" data-content="954216"><b
										class="t">재입고 알림</b></a></li>
								<li class=""><a class="bt" href="myCouponList.do"
									data-url="myCouponList.do" data-content="954216"><b
										class="t">내 쿠폰</b></a></li>
								<li class=""><a class="bt"
									href="/customer/inquiry/inquiryView"
									data-url="/customer/inquiry/inquiryView" data-content="954216"><b
										class="t">1:1 문의</b></a></li>
								<li class=""><a class="bt" href="/mypage/goodsCommentList"
									data-url="/mypage/goodsCommentList" data-content="954216"><b
										class="t">상품 후기</b></a></li>
								<li class=""><a class="bt"
									href="/mypage/service/indexAddressList"
									data-url="/mypage/service/indexAddressList"
									data-content="954216"><b class="t">배송지 관리</b></a></li>
								<li class=""><a class="bt"
									href="/mypage/order/indexBillingCardList"
									data-url="/mypage/order/indexBillingCardList"
									data-content="954216"><b class="t">결제 카드 관리</b></a></li>
							</ul></li>
						<li class="open"><a class="bt " href="javascript:;"><b
								class="t">내 정보 관리</b></a>
							<ul class="sm">
								<li class=""><a class="bt"
									href="pswdUpdate.jsp"
									data-url="pswdUpdate.jsp" data-content="954216"><b
										class="t">비밀번호 설정</b></a></li>
								<li class=""><a class="bt"
									href="manageCheck.jsp"><b class="t"
										data-url="manageCheck.jsp" data-content="954216">회원정보
											수정</b></a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- e : LNB 영역 -->
		<!-- s : 검색 영역 -->
		<!-- e : 검색 영역 -->

		<!-- s : 본문영역 -->
		<!-- 바디 - 여기위로 템플릿 -->
		<main class="container lnb page 1dep 2dep" id="container"
			style="height: 1777px;">
			<div class="inr" style="min-height: 418px;">
				<!-- 본문 -->
				<div class="contents" id="contents" style="min-height: 590px;">
					<!-- PC 타이틀 모바일에서 제거  -->
					<div class="pc-tit">
						<h2>
							<p class="img">
								<img class="img"
									src="${ petDTO.pet_img }"
									alt="이미지">
							</p>
							건강수첩
						</h2>
						<div class="right-item"></div>

					</div>
					<!-- // PC 타이틀 모바일에서 제거  -->
					<!-- tab -->
					<section class="sect petTabContent leftTab">
						<!-- tab header -->
						<ul class="uiTab a line t2">
							<li class="">
								<button id="inclRecode" class="bt" data-content="" data-url=""
									onclick="return false;">예방접종 내역</button>
							</li>
							<li class="active">
								<button id="inclGuide" class="bt active" data-content=""
									data-url="" onclick="return false;">접종안내</button>
							</li>
						</ul>
						<!-- // tab header -->
						<div class="uiTab_content"
							style="height: calc(100vh - 106px) !important;">
							<ul style="left: 0%;">
								<li class="">
									<div class="health-note recodeHeight">
										<div class="item t2">
											<div class="g-box t2">
												<p id="noneIncl" class="txt" style="">
													<strong>${ petDTO.pet_name }</strong>의 예방접종 내역을 관리할 수 있습니다.
												</p>
												<!-- 예방 접종일 알림 체크하면.. -->
												<p id="existIncl" class="txt" style="display: none">
													<strong>${ petDTO.pet_name }</strong>의 다음 예방 접종일은 <span></span>입니다.
												</p>
												<p id="lateIncl" class="txt" style="display: none">
													<strong>${ petDTO.pet_name }</strong>의 접종 예정일 <span></span>이 지났습니다.
												</p>
												<p id="afterIncl" class="txt" style="display: none;">
													<strong>${ petDTO.pet_name }</strong>의 최종 접종(투약)일은 <span></span>입니다.
												</p>
												<div class="btn-area">
													<!-- mobile만 노출 -->
													<button class="btn add onMo_if" data-content="" data-url="">접종내역
														등록</button>
													<!-- pc만 노출 -->
													<button name="inclRecodeInsertBtn" class="btn add onWeb_if"
														data-sub-yn="N" data-content=""
														data-url="/my/pet/insertMyPetInclRecodePage?petNo=31411&amp;subYn=N">예방접종
														등록</button>
													<button name="inclRecodeInsertBtn" class="btn add onWeb_if"
														data-sub-yn="Y" data-content=""
														data-url="/my/pet/insertMyPetInclRecodePage?petNo=31411&amp;subYn=Y">투약
														등록</button>
												</div>
											</div>
											<!-- css 안먹어서 inline style temp -->
											<p class="info"
												style="margin-top: 100px; padding: 20px; color: #666; font-size: 13px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.69; letter-spacing: -0.2px; text-align: center;">
												${ petDTO.pet_cate } 예방접종 (기초접종, 정기접종) 에 대한 설명은 <span id="inclGuideSpan"
													style="color: #669aff; cursor: pointer">접종 안내</span> 메뉴에서
												확인하실 수 있습니다.
											</p>
										</div>
									</div> <!-- content -->
									<div class="noneBoxPoint p3" style="display: none">
										<div>
											<div class="noneBoxPoint_infoTxt" style="color: #666;">
												${ petDTO.pet_cate } 예방접종(기초접종, 정기접종)에 대한 설<br> 명은 접종 안내 메뉴에서 확인하실 수 있습니다.
											</div>
										</div>
									</div>
								</li>
								
								<li class="active">
								<c:if test="${ petDTO.pet_cate eq '강아지' }">
									<!-- // dog content -->
									<div class="health-note contentHeight" id="dogContent">
										<div class="item">
											<p class="tit">기초 접종</p>
											<div class="item-right">
												<p class="txt">1년 미만의 강아지는 기초접종이 필요합니다. 생후 6주부터 시작해 2주
													간격으로 접종합니다.</p>
												<div class="table-type01">
													<p class="t-info">*선택사항</p>
													<table>
														<colgroup>
															<col style="width: 33%">
															<col style="width: 33%">
															<col style="width: 33%">
														</colgroup>
														<thead>
															<tr>
																<th scope="col">접종시기</th>
																<th scope="col">기초접종</th>
																<th scope="col">선택접종</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>생후 6주</td>
																<td>종합백신 1차</td>
																<td><span class="f-gray">코로나 장염 1차</span></td>
															</tr>
															<tr>
																<td>생후 8주</td>
																<td>종합백신 2차</td>
																<td><span class="f-gray">코로나 장염 2차</span></td>
															</tr>
															<tr>
																<td>생후 10주</td>
																<td>종합백신 3차</td>
																<td><span class="f-gray">켄넬코프 1차</span></td>
															</tr>
															<tr>
																<td>생후 12주</td>
																<td>종합백신 4차</td>
																<td><span class="f-gray">켄넬코프 2차</span></td>
															</tr>
															<tr>
																<td>생후 14주</td>
																<td>종합백신 5차</td>
																<td><span class="f-gray">인플루엔자 1차</span></td>
															</tr>
															<tr>
																<td>생후 16주</td>
																<td><span class="f-gray">광견병</span></td>
																<td><span class="f-gray">인플루엔자 2차</span></td>
															</tr>
														</tbody>
													</table>
													<p class="b-info">항체가검사 : 5차 접종 후 2주뒤</p>
												</div>
											</div>
										</div>
										<div class="item">
											<p class="tit">정기 접종</p>
											<div class="item-right">
												<p class="txt">기초 예방접종을 마친 성견은 매년 1회 접종을 해야 합니다.</p>
												<div class="table-type01">
													<table>
														<colgroup>
															<col style="width: 50%">
															<col style="width: 50%">
														</colgroup>
														<thead>
															<tr>
																<th scope="col">예방접종명</th>
																<th scope="col">접종주기</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>종합백신</td>
																<td>매년 1회</td>
															</tr>
															<tr>
																<td>코로나 장염</td>
																<td>매년 1회</td>
															</tr>
															<tr>
																<td>켄넬코프</td>
																<td>매년 1회</td>
															</tr>
															<tr>
																<td>인플루엔자</td>
																<td>매년 1회</td>
															</tr>
															<tr>
																<td>광견병</td>
																<td>매년 1회</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="item">
											<p class="tit">예방접종 종류</p>
											<div class="g-box">
												<p class="tit">종합백신 (DHPPL)</p>
												<p class="txt">설사 또는 구토 증상을 일으키는 전염성 소화기관 질병입니다. 특히
													비위생적이거나 밀집된 사육 환경에서 감염이 촉진됩니다.</p>
												<p class="tit">켄넬코프 (보데텔라)</p>
												<p class="txt">전염성이 매우 강한 호흡기 질환입니다. 가벼운 증상일 경우 금방 회복될
													수 있지만, 바이러스하나 이상 복합적으로 감염되면 폐렴으로 이어질 수 있습니다.</p>
												<p class="tit">인플루엔자 (신종플루)</p>
												<p class="txt">접촉 및 공기중으로 전염되는 호흡기 바이러스 질환으로 무기력, 식욕감퇴,
													고열, 폐렴 등으로 진행될 수 있습니다.</p>
												<p class="tit">광견병</p>
												<p class="txt">강아지 뿐만 아니라 모든 포유동물에게 감염되며, 100% 치사율에
													도달하는 무시무시한 질병입니다.</p>
												<p class="tit">항체가검사</p>
												<p class="txt">백신 전/후, 항체가검사는 백신 접종 프로그램의 기본입니다. 반려견이
													예방접종을 했어도 항체가 높지않으면, 홍역이나 파보 바이러스로부터 안전하지 않습니다.</p>
											</div>
										</div>
										<div class="item">
											<div class="info-txt">
												<ul>
													<li>본 프로그램은 지역별, 병원별로 차이가 있을 수 있습니다.</li>
													<li>접종 후에는 때에 따라 가려움, 종창, 발적, 통증, 회농, 발열, 의기소침, 예민,
														쇼크 등의 증상이 나타날 수 있습니다. 접종반응이 심하거나 쇼크가 발생하면 즉시 동물병원에서 적절한
														조치를 받아야 합니다.</li>
													<li>접종 후 약 1주일 정도는 목욕, 미용, 여행 등의 스트레스를 가급적 피해야 합니다.</li>
													<li>임신, 수술 전후, 투약중, 질병, 바이러스 감염 시에는 접종을 피하거나 수의사의 검진
														후에 접종을 해야 합니다.</li>
												</ul>
											</div>
										</div>
									</div>
									<!-- // dog content -->
								</c:if>

								<c:if test="${ petDTO.pet_cate eq '고양이' }">
									<!-- cat content -->
									<div class="health-note contentHeight" id="catContent">
										<div class="item">
											<p class="tit">기초 접종</p>
											<div class="item-right">
												<p class="txt">1년 미만의 고양이는 기초접종이 필요합니다. 생후 8주부터 시작해 3주
													간격으로 접종합니다.</p>
												<div class="table-type01">
													<p class="t-info">*선택사항</p>
													<table>
														<colgroup>
															<col style="width: 33%">
															<col style="width: 33%">
															<col style="width: 33%">
														</colgroup>
														<thead>
															<tr>
																<th scope="col">접종시기</th>
																<th scope="col">기초접종</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>생후 8주</td>
																<td>혼방예방백신 1차</td>
															</tr>
															<tr>
																<td>생후 11주</td>
																<td>혼방예방백신 2차</td>
															</tr>
															<tr>
																<td>생후 14주</td>
																<td>혼방예방백신 3차</td>
															</tr>
															<tr>
																<td>생후 17~18주</td>
																<td><span class="f-gray">전염성복막염</span></td>
															</tr>
															<tr>
																<td>생후 21주</td>
																<td><span class="f-gray">광견병</span></td>
															</tr>
														</tbody>
													</table>
													<p class="b-info">항체가검사 : 3차 접종 후 2주뒤</p>
												</div>
											</div>
										</div>
										<div class="item">
											<p class="tit">정기 접종</p>
											<div class="item-right">
												<p class="txt">기초 예방접종을 마친 성묘는 정기 접종을 해야 합니다. 접종 주기는
													권장사항입니다.</p>
												<div class="table-type01">
													<table>
														<colgroup>
															<col style="width: 50%">
															<col style="width: 50%">
														</colgroup>
														<thead>
															<tr>
																<th scope="col">예방접종명</th>
																<th scope="col">접종주기</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>혼방예방백신</td>
																<td>매년 또는 3년 1회</td>
															</tr>
															<tr>
																<td>전염성복막염</td>
																<td>매년 1회</td>
															</tr>
															<tr>
																<td>광견병</td>
																<td>매년 1회</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="item">
											<p class="tit">예방접종 종류</p>
											<div class="g-box">
												<p class="tit">혼합예방백신</p>
												<p class="txt">접촉 및 공기중으로 전염되는 호흡기 바이러스 질환으로 무기력, 식욕감퇴,
													고열, 폐렴 등으로 진행될 수 있습니다.</p>
												<p class="tit">전염성복막염</p>
												<p class="txt">백신 전/후, 항체가검사는 백신 접종 프로그램의 기본입니다. 반려견이
													예방접종을 했어도 항체가 높지않으면, 홍역이나 파보 바이러스로부터 안전하지 않습니다.</p>
											</div>
										</div>
										<div class="item">
											<div class="info-txt">
												<ul>
													<li>본 프로그램은 지역별, 병원별로 차이가 있을 수 있습니다.</li>
													<li>접종 후에는 때에 따라 가려움, 종창, 발적, 통증, 회농, 발열, 의기소침, 예민, 쇼크
														등의 증상이 나타날 수 있습니다. 접종반응이 심하거나 쇼크가 발생하면 즉시 동물병원에서 적절한 조치를 받아야
														합니다.</li>
													<li>접종 후 약 1주일 정도는 목욕, 미용, 여행 등의 스트레스를 가급적 피해야 합니다.</li>
													<li>임신, 수술 전후, 투약중, 질병, 바이러스 감염 시에는 접종을 피하거나 수의사의 검진 후에
														접종을 해야 합니다.</li>
												</ul>
											</div>
										</div>
									</div>
									<!-- // cat content -->
								</c:if>

								</li>
							</ul>
						</div>
					</section>
					<!-- // tab -->
				</div>
			</div>
		</main>

		<!-- 플로팅 영역 -->
		<!-- TWC chatbot Scripts -->
		<script
			src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.plugin.js"></script>

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
		</nav>
		<script>

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
					<li id="liTag_20" class="tv "><a href="/tv/home/" class="bt"><span>TV</span></a>
					</li>
					<li id="liTag_30" class="log "><a href="/log/home/" class="bt"><span>로그</span></a>
					</li>
					<li id="liTag_10" class="shop "><a href="/shop/home/"
						class="bt"><span>샵</span></a></li>
					<li id="liTag_00" class="my active"><a
						href="myPage.do" class="bt"><span>MY</span></a></li>
				</ul>
			</div>
		</nav>
		<!-- e : menubar 영역 -->



		<!-- footer -->
		<jsp:include page="footer.jsp" flush="false" />

		<div id="layers"></div>
		<!-- e : footer 영역 -->
	</div>

	<style type="text/css">
#twc-chat-plugin #chat-icon {
	box-sizing: border-box;
	position: fixed;
	bottom: 25px;
	right: 25px;
	z-index: 500;
	display: none;
	width: 60px;
	height: 60px;
	background:
		url(https://storage.googleapis.com/cloud-gate-cdn/image/icon_webchat_bg_v2.png)
		no-repeat top left;
	-webkit-transition: 0.3s cubic-bezier(0.25, 0.8, 0.5, 1);
	transition: 0.3s cubic-bezier(0.25, 0.8, 0.5, 1);
	border-radius: 50%;
	overflow: hidden;
}

#twc-chat-plugin #chat-icon img {
	width: 100%;
	-webkit-transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1);
	transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1);
}

#twc-chat-plugin #chat-frame-box {
	box-sizing: border-box;
	position: fixed;
	bottom: -150%;
	right: 25px;
	z-index: 510;
	border-radius: 10px;
	overflow: hidden;
	background-color: #fff;
	-webkit-transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1);
	transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1);
	box-shadow: 2px 2px 25px rgba(94, 94, 94, 0.5);
}

#twc-chat-plugin #chat-frame-box iframe {
	width: 410px;
	height: 767px;
	border: 0;
	vertical-align: top;
}

#twc-chat-plugin .loader, #twc-chat-plugin .loader:after {
	box-sizing: border-box;
	border-radius: 50%;
	width: 30px;
	height: 30px;
}

#twc-chat-plugin .loader {
	box-sizing: border-box;
	font-size: 10px;
	position: absolute;
	top: 14px;
	left: 14px;
	text-indent: -9999em;
	border-top: 4px solid rgba(255, 255, 255, 1);
	border-right: 4px solid rgba(255, 255, 255, 1);
	border-bottom: 4px solid rgba(255, 255, 255, 0);
	border-left: 4px solid #ffffff;
	-webkit-transform: translateZ(0);
	-ms-transform: translateZ(0);
	transform: translateZ(0);
	-webkit-animation: load8 1.1s infinite linear;
	animation: load8 1.1s infinite linear;
	display: none;
}

@
-webkit-keyframes load8 { 0% {
	-webkit-transform: rotate(0deg);
	transform: rotate(0deg);
}

100
%
{
-webkit-transform
:
rotate(
360deg
);
transform
:
rotate(
360deg
);
}
}
@
keyframes load8 { 0% {
	-webkit-transform: rotate(0deg);
	transform: rotate(0deg);
}

100
%
{
-webkit-transform
:
rotate(
360deg
);
transform
:
rotate(
360deg
);
}
}
#twc-chat-plugin.on img {
	-ms-transform: scale(0);
	-moz-transform: scale(0);
	-o-transform: scale(0);
	-webkit-transform: scale(0);
	transform: scale(0);
}

#twc-chat-plugin.on .loader {
	display: block;
	opacity: 1;
}
</style>
	<div id="twc-chat-plugin">
		<div id="chat-icon">
			<img
				src="https://storage.googleapis.com/cloud-gate-cdn/image/icon_webchat_v2.png">
			<div class="loader">Loading...</div>
		</div>
		<div id="chat-frame-box">
			<iframe id="chat-frame" style="height: 730px;"></iframe>
		</div>
	</div>
</body>
</html>