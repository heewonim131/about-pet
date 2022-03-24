<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<link href="https://aboutpet.co.kr/_images/common/favicon.ico" rel="shrtcut icon">
<link href="https://aboutpet.co.kr/_images/common/favicon.png" rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>aboutPet</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="../scriptAll/jquery-ui.css"><script async src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript" 	src="../scriptAll/googleAnalytics.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', "G-NR86F31079");
</script>

<script type="text/javascript" src="../scriptAll/jquery-3.3.1.min.js" ></script>
<script type="text/javascript" src="../scriptAll/jquery-ui.min.js"></script>
<script type="text/javascript" src="../scriptAll/jquery.ui.datepicker-ko.js" ></script>
<script type="text/javascript" src="../scriptAll/jquery.blockUI.js" charset="utf-8"></script>
<script type="text/javascript" src="../scriptAll/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../scriptAll/jquery.number.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../scriptAll/jquery.form.min.js" ></script>
<script type="text/javascript" src="../scriptAll/jquery.countdown.js" ></script>
<script type="text/javascript" src="../scriptAll/jquery.cookie.js" ></script>
<script type="text/javascript" src="../scriptAll/swiper.min.js"></script>
<script type="text/javascript" src="../scriptAll/clipboard.min.js"></script>
<script type="text/javascript" src="../scriptAll/common.js" ></script>
<script type="text/javascript" src="../scriptAll/popup.js" ></script>
<script type="text/javascript" src="../scriptAll/ui.js"></script>
<script type="text/javascript" src="../scriptAll/deviceChk.js"></script>	<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- 상담톡 -->
<script src="../scriptAll/Twc.plugin.js"></script>

<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&libraries=services"></script>
<script type="text/javascript" src="../scriptAll/kakao-map.js"></script>
<!-- app interface --> 
<script type="text/javascript" src="../scriptAll/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" src="../scriptAll/adbrix.js"></script>
<script type="text/javascript" src="../scriptAll/ui.mo.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&submodules=geocoder"></script>
<script type="text/javascript">
//	const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
</script>

</head>
<body>
<% int mem_code=0;
if(session.getAttribute("num")!=null){
	mem_code=(int)session.getAttribute("num");
}
%>
<c:set var="mem_code" value="<%=mem_code%>"></c:set> 
<c:if test='${ mem_code eq 0 }'>
<c:import url="header.jsp" />
<p style="display: hidden" class="${ mem_code}" id="test"></p>
</c:if>
<c:if test='${ mem_code ne 0 }'>
<c:import url="loginheader.jsp" />
<p style="display: hidden" class="${ mem_code}" id="test"></p>
</c:if>

<%@
include file="sidebar.jsp"

%>


<div class="wrap" id="wrap">
	<main class="container page logmain" id="container">
		<div class="inr">
			<form id="petLogShareForm" name="petLogShareForm" method="post" onSubmit="return false;">
				<input type="hidden" id="shrChnlCd" name="shrChnlCd" />
				<!-- 공유채널코드 -->
				<input type="hidden" name="petLogNo" />
				<!-- 펫로그번호 -->
				<input type="hidden" name="mbrNo" value="0" />
				<!-- 회원번호 -->
			</form>
			<form id="petLogReplyForm" name="petLogReplyForm" method="post" onSubmit="return false;">
				<input type="hidden" id="contsStatCd" name="contsStatCd" value="10" />
				<!-- 컨텐츠 상태코드(10-노출, 20-미노출, 30-신고차단) -->
				<input type="hidden" id="aply" name="aply" />
				<!-- 댓글 -->
				<input type="hidden" name="petLogNo" />
				<!-- 펫로그번호 -->
				<input type="hidden" name="petLogAplySeq" />
				<!-- 댓글 순번 -->
				<input type="hidden" name="mbrNo" value="0" />
				<!-- 회원번호 -->
			</form>
			<form id="petLogInterestForm" name="petLogInterestForm" method="post" onSubmit="return false;">
				<input type="hidden" id="intsGbCd" name="intsGbCd" />
				<!-- 관심구분코드(10-좋아요, 20-찜) -->
				<input type="hidden" name="petLogNo" />
				<!-- 펫로그번호 -->
				<input type="hidden" name="mbrNo" value="0" />
				<!-- 회원번호 -->
				<input type="hidden" name="saveGb" />
				<!-- 등록/삭제 구분 -->
			</form>
			
			<!-- 본문 -->
			<div class="contents log main" id="contents">
				<!-- PC 타이틀 영역 -->
				<section class="log_listviewTop">
					<div class="pic" onclick="goMyPetLog('','${ select_MemLog.mem_code }',event);">
						<img src="${ select_MemLog.pet_img }" alt="dog">
					</div>
					<h1>
						<a href="javascript:goMyPetLog('','${ select_MemLog.mem_code }');">${ select_MemLog.nickname }</a>
					</h1>
				</section>
				
				
				<!-- PC 타이틀 영역 -->
				<c:forEach items="${ petloglist }" var="plist">
				<div name="petLogListView">
					<!-- 펫로그 메인 콘턴츠 area 리스트 -->
					<section class="logContentBox" id="7743" style="margin-top: 20px;">
						<div class="lcbPicture sw">
							<!-- slider -->
							<div class="swiper-container logMain">
								<div class="swiper-pagination swiper-pagination-fraction"><span class="swiper-pagination-current"></span><span class="swiper-pagination-total"></span></div>
                                <ul class="swiper-wrapper slide" style="transform: translate3d(-600px, 0px, 0px); transition-duration: 0ms;">
                                 ${ plist.log_img }
                                </ul>
								<div class="remote-area">
									<button class="swiper-button-next" type="button"></button>
									<button class="swiper-button-prev" type="button"></button>
								</div>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
								<!-- // slider -->
							</div>
							<!-- 이미지/동영상 영역 : E -->
						
						
						<div class="lcbWebRconBox">
							<div class="lcbConTxt">
								<div class="userInfo">
									<div class="pic">
										<img src="${ plist.pet_img }" alt="dog">
									</div>
									<div class="con">
										<div class="txt">
											<a class="nickname" href="/AboutPet/Project/aboutPet/myPetlog.do?mem_code=${ plist.mem_code }">${ plist.nickname }</a>
											<span class="dotIcon2x2 onWeb_ib"></span>
											<span class="time">${ plist.log_date }</span>
										</div>
									</div>
									<!-- select box -->
									<div class="menu dopMenuIcon" onclick="ui.popSel.open(this,event)">
										<div class="popSelect r">
											<input type="text" class="popSelInput">
											<div class="popSelInnerWrap" style="height: 0px;">
												<ul>
													<li>
														<a class="bt" href="javascript:layerPetLogReport('7743','', '1','N');" id="btRptp1_7743"><b class="t">신고</b></a>
													</li>
												</ul>
											</div>
										</div>
									</div>
									<!-- // select box -->
								</div>
								
								<!-- content txt -->
								<span class="iconOm_arr"></span>
								<div class="lcbConTxt_content">
									${ plist.log_content }
								</div>
								<!-- // content txt -->
							</div>
							
							
							<!-- menu bar -->
							<div class="lcbmenuBar">
								<div class="inner">
									<ul class="bar-btn-area">
										<li id="likeBtn1_7743">
											<button class="logBtnBasic btn-like" id="like_${plist.log_code}"
											onclick="savePetLogInterest('${ plist.log_code }', '10', 'I', '1');">${ plist.log_like }</button>
										</li>
										<li>
											<button class="logBtnBasic btn-comment"
											onClick="viewReply('${ plist.log_code }','', this);">${ plist.log_cmt }</button>
										</li>
										<li>
											<button class="logBtnBasic btn-share"
													data-message="링크가 복사되었어요" title="COPY URL"
													onclick="sharePetLog('${ plist.log_code}', this.id, 'P');"
													id="share1_7743" data-title="${ plist.nickname }"
													data-clipboard-text="localhost/AboutPet/Project/aboutPet/detailpetlog.do?log_code=${ plist.log_code}">
													<span>공유</span>
											</button>
										</li>
										<li class="ml20" id="bookBtn1_7743">
											<button class="logBtnBasic btn-bookmark" id="mark_${plist.log_code}"
											onclick="savePetLogInterest('${ plist.log_code }', '20', 'I', '1');">
												<span>북마크</span>
											</button>
										</li>
									</ul>
								</div>
							</div>
							<!-- // menu bar -->
							
							<!-- 댓글 클릭 창 -->
                     		<div class="commentBoxAp logcommentBox pop1" id="cmt_${plist.log_code}" style="bottom: 0px; height: 90%;">
                     	
                     			<div class="head t2">
                     				<div class="con">
                     					<div class="tit">댓글 <span class="price-box">${ plist.log_cmt }</span></div>
                     					<a href="javascript:;" class="close" onclick="ui.commentBox.close(this);"></a>
                     				</div>
                     			</div>
                     			<div class="con t2">
                     				<div class="box inf">
                     					<div class="commendListBox">
                     			
                     						<c:choose>
                     						<c:when test="${ plist.log_cmt ne 0 }">
                     						<c:forEach items="${ cmtlist }" var="cl">
                     							<ul>
                     								<li>
                     									<div class="pic" onclick="javascript:goMyPetLog('','${ cl.mem_code }',event);"><img src="${ cl.pet_img }" alt="img"></div>
                     									<div class="con">
                     										<div class="tit">${ cl.nickname }</div>
                     										<div class="txt" id="aply_123_770">${ cl.lcmt }</div>	
                     										<div class="date"></div>
                     										<div class="date" id="modify__123_770">${ cl.lc_date }</div>
                     									</div>
                     									<!-- select box -->
                     									<div class="menu dopMenuIcon" onclick="ui.popSel.open(this,event)">
                     										<div class="popSelect">
                     											<input type="text" class="popSelInput">
                     												<div class="popSelInnerWrap">
                     													<ul>
                     														<li>
                     															<a class="bt" href="javascript:layerPetLogReport('${ cl.log_code }','770', '');"><b class="t">신고</b></a>
                     														</li>
                     													</ul>
                     												</div>
                     										</div>
                     									</div>
                     									<!-- // select box -->
                     								</li>
                     							</ul>
                     						</c:forEach>
                     						</c:when>
                     			
                     						<c:when test="${ plist.log_cmt eq 0 }">
		                     					<div class="no_data i1">
		                     						<div class="inr">
		                     							<div class="msg">첫번째 댓글을 남겨주세요.</div>
		                     						</div>
		                     					</div>
	                     					</c:when>
                     			
                     						</c:choose>
                     					</div>                     			
                     				</div>
                     		
                     				<div class="input">
                     					<span id="reply_123_byte"></span>
                     					<textarea onclick="checkReplyInput();" placeholder="댓글을 입력해주세요." id="reply_123" name="reply" tabindex="-1"></textarea>
                     					<div class="btn_wrap">
					                          <button class="del" style="display: none;">close</button>
					                          <button id="regBtn_8554" name="regBtn" onclick="savePetLogReply('8554', '', '')" class="ac">등록</button>
	                          			</div>
                     				</div>
                     				
                     				<div class="fixed_box">
                     					<div class="key-word-list" style="display:none;">
                     						<ul id="add_tag_list__123"></ul>
                     					</div>
                     					<div class="alert-commentBox" id="uptCmtDisp_123" style="display:none;">
                     						<p><span class="icon-speechBubble"></span>댓글을 수정 중입니다.</p>
                     						<button class="close" onclick="hideUptCmtDisp('123', '')"></button>
                     					</div>
                     				</div>
                     			</div>
                     		</div> <!-- 댓글 클릭 -->							
						</div>
					</section>
				</div> <!-- name="petLogListView" -->
			</c:forEach>	
		</div> <!-- id="contents" -->
		
		<!-- 상담톡 -->
		<nav class="floatNav">
		   <div class="inr">
		      <div class="bts">
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
		
		<!-- 신고 -->
	   	<article class="popLayer a popSample1 pc_popSize_500 on" id="popReport" style="display: none;" tabindex="0">
				<div class="pbd">
					<div class="phd">
						<div class="in">
							<!-- <button type="button" class="btnPopTxt left" onclick="ui.popLayer.close('popReport');">취소</button> -->
							<h1 class="tit">후기 신고 </h1>
							<button type="button" class="btnPopClose" onclick="$('#commitBtn').addClass('disabled')">닫기</button>
							<!-- <button type="button" class="btnPopTxt right c_b" onclick="insertPetLogReplyRptp('popReport');">완료</button> -->
						</div>
					</div>
					<div class="pct" style="height: 661.6px;">
						<main class="poptents report">
						<form id="petLogRptpForm" name="petLogRptpForm" method="post" onsubmit="return false;">
	 					<input type="hidden" name="petLogAplySeq" value=""><!-- 댓글 순번 -->
	 					<input type="hidden" name="petLogNo" value="8538"><!-- 펫로그번호 -->
						<input type="hidden" name="mbrNo" value="950350"><!-- 회원번호		 -->
						<input type="hidden" name="listNo" value=""><!-- 회원번호		 -->
						<input type="hidden" name="rvwYn" value="Y"><!-- 리뷰여부	 -->
							<div class="lay-gray-box">
								신고접수 시 운영정책에 따라 검토 후 해당글이 삭제됩니다.<br>
								신고 관련된 자세한 사항은 고객센터로 연락주세요.
							</div>
							<div class="member-input">
								<strong class="tit mb18">신고 사유</strong>
								<ul class="list">
									<li><label class="radio"><input type="radio" name="rptpRsnCd" value="10"><span class="txt">혐오 콘텐츠</span></label></li>
									<li><label class="radio"><input type="radio" name="rptpRsnCd" value="20"><span class="txt">지적 재산권 위반</span></label></li>
									<li><label class="radio"><input type="radio" name="rptpRsnCd" value="30"><span class="txt">기타</span></label></li>
								</ul>
							</div>
							<div class="textarea m"><textarea name="rptpContent" placeholder="신고사유를 입력해주세요." style="height:260px;"></textarea></div>
							<div class="log_btnWrap">
								<button class="btn lg onWeb_if" onclick="ui.popLayer.close('popReport');$('#commitBtn').addClass('disabled')">취소</button>
								<button class="btn a lg disabled" onclick="insertPetLogRptp('popReport');" id="commitBtn">완료</button>
							</div>
						</form>	
						</main>
					</div>
				</div>
		</article> <!-- 신고 -->
		
	</main>
</div> <!-- id='wrap' -->



<script>
   // 로그인 후 이용 가능
   function checkLogin(){
	   return true;
   }

   //좋아요
   //관심구분코드(intsGbCd: 10-좋아요, 20-찜) 
   function savePetLogInterest(petLogNo, intsGbCd, saveGb, listNo){
	   
 	  var petLogNol = document.getElementById("like_"+petLogNo);
	  var petLogNom = document.getElementById("mark_"+petLogNo);
	  var tText= "I";
	  
	  // 로그인한 회원
	  var mem = document.getElementById("test").className;
	  // console.log(mem);
	  
	  // 카운트
	  var petLogLikeCMT = petLogNol.innerHTML;
	  // console.log( petLogLikeCMT );
	  
	  
      
      if( checkLogin()  ){
         
         if( intsGbCd == 20 ){ // 북마크
        	
        	 if($(petLogNom).hasClass("on")){
 					$(petLogNom).removeClass("on");
					tText = "찜리스트에서 삭제되었어요";
					ui.toast(tText,{   // 토스트 창띄우기
	                    bot:70
	                })
	                
        		}else{
					$(petLogNom).addClass("on");
	                tText = '<div class="link"><p class="tt">찜리스트에 추가되었어요</p><a href="/mypage/log/myWishList" data-content="950350" data-url="/mypage/log/myWishList" class="lk">바로가기</a></div>';
	                ui.toast(tText,{   // 토스트 창띄우기
	                    bot:70
	                })
        		}
                     	                
         }else if( intsGbCd== 10){ // 좋아요
            // $(petLogNol).toggleClass("on");
         	if ($(petLogNol).hasClass("on")) { // 이미 좋아요 클릭된 경우
				$(petLogNol).removeClass("on");
         		$(petLogNol).text( Number(petLogLikeCMT) == 0? 0 : (Number(petLogLikeCMT)-1) );
         		
         		console.log(petLogNo);
         		console.log(mem);
         		
         		var param = {
         				log_code:petLogNo, 	// 로그코드
         				mem_code:mem		// 로그인한 멤버
         		}
         		
         		//
         		$.ajax({
         			url:"log_like_delete.jsp",
         			data:param,
         			type:"POST",
         			cache:false,
         			success:function(result){
         				console.log("좋아요 취소 성공");
         				
         			},
         			error:function(result){
         				console.log("좋아요 취소 실패");
         			}
         		});
			} else { // 좋아요 클릭이 안 된 경우
				$(petLogNol).addClass("on");
				$(petLogNol).text( Number(petLogLikeCMT) + 1); // 카운트
				
				var param = {
						log_code:petLogNo, 	// 로그코드
						mem_code:mem		// 로그인한 멤버
				}
				
				//
				$.ajax({
					url:"log_like_insert.jsp",
					data:param,
					type:"POST",
					cache:false,
					success:function(result){
						console.log("좋아요 성공");
					},
					error:function(result){
						console.log("좋아요 실패");
					}
				});
			}
         }	   
	   
	   
 		}
   }
   
	
	//검색API 클릭 이벤트(사용자 액션 로그 수집)
	function userActionLog(petLogNo, action){	
		var mbrNo = "0";
		var litd = "";
		var lttd = "";
		if( action == "petlog" ){
			litd = $('#petLogBaseForm [name="logLitd"]').val();
			lttd = $('#petLogBaseForm [name="logLttd"]').val();
		}
		
		//alert(action+","+petLogNo+","+litd+","+lttd);
		if (mbrNo != "0") {
			$.ajax({
				type: 'POST'
				, url : "/common/sendSearchEngineEvent"
				, async:false
				, dataType: 'json'
				, data : {
					"logGb" : "ACTION"
					, "mbr_no" : mbrNo
					, "section" : "log" 
					, "content_id" : petLogNo
					, "action" : action
					, "url" : document.location.href
					, "targetUrl" : document.location.href
					, "litd" : litd
					, "lttd" : lttd
					, "prclAddr" : ""
					, "roadAddr" : ""
					, "postNoNew" : ""
					, "timestamp" : ""
				}
			});
		}
	}
</script>

<script>
	// 댓글
	function viewReply(petLogNo, listNo, obj){
		var petLogNo = document.getElementById("cmt_"+petLogNo);
		
		// alert("댓글");
		$(petLogNo).toggleClass("open ton");
		
	}

	   
   // goMyPetLog('A2D6E52BCA','947246',event)
   function goMyPetLog(petLogUrl, mbrNo, event , insertYn){
		if(!insertYn){
			insertYn = "N";
		}
		
		//event.preventDefault;
		if(event !== undefined ){
			if(event.stopPropagation() !== undefined ){
				event.stopPropagation();
				//console.log("111-"+event.stopPropagation())		
			}else{
				//console.log("222-"+event.cancelBubble)
				event.cancelBubble = true;
			}
		} // /AboutPet/aboutPet/log/myPetlog.do?mem_code=${ list.mem_code }
		location.href = "/AboutPet/Project/aboutPet/myPetlog.do"+ petLogUrl + "?mem_code=" + mbrNo + "&insertYn="+insertYn;
		//location.href = "https://aboutpet.co.kr/log/indexMyPetLog/"+ petLogUrl + "?mbrNo=" + mbrNo + "&insertYn="+insertYn;
	}
   
   
   	//
	function checkReplyInput() {

		if (checkLogin() && checkRegPet()) {
			//alert('등록 가능');
			// 키패드 노출..
		}
	}
	
	function checkRegPet() {
		if ("N" == "Y") {
			return true
		} else {
			ui
					.confirm(
							'펫 등록 후 서비스를 이용할 수 있어요<br/>등록 할까요?',
							{ // 컨펌 창 옵션들
								ycb : function() {
									// 반려동물 등록 화면으로 이동.
									location.href = "https://aboutpet.co.kr/my/pet/petInsertView";
								},
								ncb : function() {
									//alert('취소');
									return false;
								},
								ybt : "등록하기", // 기본값 "확인"
								nbt : "취소" // 기본값 "취소"
							});
			return false;
		}
	}

	// 링크
	// 공유채널코드(10:카카오, 20:네이버, 30:URL, 40:APP)
	function sharePetLog(shareNo, objId, shareGb) {

		var shortUrl = $("#" + objId).attr("data-clipboard-text");
		var nickNm = $("#" + objId).attr("data-title");

		if (shortUrl == null || shortUrl == '') {
			getShortUrl(shareNo, objId, shareGb, nickNm);
		} else {
			//alert(shortUrl);
			insertPetLogShare(shareNo, objId, shareGb, shortUrl, nickNm);
		}
	}

	// 공유채널코드(10:카카오, 20:네이버, 30:URL)
	function insertPetLogShare(shareNo, objId, shareGb, shortUrl, nickNm) {
		var shrChnlCd = "40"; // app 일 경우.
		var shrPetLogUrl, petLogNo;
		if (shareGb == "M") {
			if (objId.indexOf("_") > 0)
				shrPetLogUrl = objId.substring(objId.indexOf("_") + 1);
			else
				shrPetLogUrl = objId;
		} else {
			petLogNo = shareNo;
		}

		copyUrl(objId);
		shrChnlCd = "30";
		ui.toast($("#" + objId).attr("data-message"), {
			bot : 70
		});

		var options = {
			url : "/log/petLogShareInsert;jsessionid=1AF65709C56FDA8E63DFEA5094C234FA",
			data : {
				petLogNo : petLogNo,
				shrPetLogUrl : shrPetLogUrl,
				shrChnlCd : shrChnlCd
			//공유채널코드 (30:URL)
			},
			done : function(data) {
				// action log 처리
				userActionLog(petLogNo, "share");

				//alert("PC");
			}
		};
		//ajax.call(options);
	}

	function getShortUrl(shareNo, objId, shareGb, nickNm) {
		var originUrl = "https://aboutpet.co.kr/log/petLogShare?shareGb="
				+ shareGb + "&shareNo=" + shareNo;

		if (shareGb !== undefined && shareGb == 'M') {
			if (objId.indexOf("_") > 0) {
				originUrl = "https://aboutpet.co.kr/log/petLogShare?shareGb="
						+ shareGb + "&shareNo="
						+ objId.substring(objId.indexOf("_") + 1) + "_"
						+ shareNo;
			} else {
				originUrl = "https://aboutpet.co.kr/log/petLogShare?shareGb="
						+ shareGb + "&shareNo=" + objId + "_" + shareNo;
			}
		}

		//alert(originUrl);
		var options = {
			url : "/log/getShortUrl;jsessionid=1AF65709C56FDA8E63DFEA5094C234FA",
			data : {
				originUrl : originUrl,
				shareGb : shareGb,
				shareNo : shareNo
			},
			done : function(data) {
				if (data == null) {
					ui.alert("getShortUrl : 오류가 발생되었습니다. 다시 시도하여 주십시오.");
					//return null;
				} else {
					$("#" + objId).attr("data-clipboard-text", data);
					$("#" + objId).trigger("click");
				}
			}
		}
		ajax.call(options);
	}

	// 신고
	function layerPetLogReport(petLogNo, petLogAplySeq, listNo, rvwYn) {
		if (checkLogin()) {
			ui.popLayer.open("popReport");

			// layer form 초기화.
			form.clear('petLogRptpForm');
			$('#petLogRptpForm [name="rptpRsnCd"]').prop('checked', false);

			var $title = $(".pbd .phd .tit");
			if (petLogAplySeq != undefined && petLogAplySeq != '') {
				$title.text("댓글 신고 ");
			} else {
				if (rvwYn != null && rvwYn != '' && rvwYn == "Y") {
					$title.text("후기 신고 ");
				} else {
					rvwYn = "N";
					$title.text("게시물 신고 ");
				}
				$('#petLogRptpForm [name="rvwYn"]').val(rvwYn);
			}

			$('#petLogRptpForm [name="petLogNo"]').val(petLogNo);
			$('#petLogRptpForm [name="petLogAplySeq"]').val(petLogAplySeq);
			$('#petLogRptpForm [name="mbrNo"]').val('0');
			$('#petLogRptpForm [name="listNo"]').val(listNo);

		}
	}
</script>

<script>
 // 이미지 슬라이드 js
$(document).ready(function() {
	$(".lnb.my").hide();

	var swiperBox = new Array();

	/* 메인 스와이프 */
	swiperBox.push(new Swiper(
			".swiper-container.logMain",
			{
				slidesPerView : 1,
				slidesPerGroup : 1,
				freeMode : false,
				navigation : {
				nextEl : '.swiper-container.logMain .swiper-button-next',
				prevEl : '.swiper-container.logMain .swiper-button-prev',
				},
				pagination : {
					el : '.swiper-container.logMain .swiper-pagination',
					type : 'fraction',
				},
				on : {
						slideResetTransitionStart : function() {
							if ((this.snapIndex + 1) == this.imagesLoaded) {
								$(this.wrapperEl).find(".swiper-slide-active")
												 .removeClass("swiper-slide-active")
												 .addClass("si_last");
							} else {
								$(this.wrapperEl).find(".si_last")
												 .removeClass("si_last");
							}
						}
					  }
			}));
	
	var swiper52 = new Array();
	$('.slideType52 .swiper-container').each(function(i, n) {
		swiper52.push(new Swiper($(n), 
			{
				slidesPerView : 5,
				slidesPerGroup : 1,
				spaceBetween : 8,
				freeMode : true,
				navigation : {
								nextEl : $(n).parents(".slideType52")
											 .find('.swiper-button-next'),
								prevEl : $(n).parents(".slideType52")
											 .find('.swiper-button-prev')
							  }
			 }));
	});

});
</script>

<script>
	function goLikePetLogList(selIdx , page){			
		/* var param ="";
		if( idx !== undefined && idx != '' ) param = "?petLogNo="+idx;
		location.href = "https://aboutpet.co.kr/log/indexLikePetLogList"+param;	 */	
		
		goPetLogList("L", selIdx , page);
	}
	
	function goPetLogList(pageType, selIdx , page){
		var param ="";
		
		if(selIdx ){			
			param += "?selIdx="+selIdx;
		}
		// 태그리스트, 마이펫로그 리스트의 경우, title 셋팅
		if(pageType){
			if(param.length > 1 ) param += "&pageType="+pageType;
			else param += "?pageType="+pageType;
		}
		
		if(page){
			param += "&recommendPage="+page
		}
		
		location.href = "https://aboutpet.co.kr/log/indexPetLogList"+param;
	}
</script>

<script type="text/javascript">
  // 아무대나 클릭해도 레이어창 닫힘
   $(document).on("click" , function(){
      ui.popSel.closeAll();
   });
  
  //상담톡
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
         if ("mem_code" == "0") {
            ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{
                ycb:function(){ // 확인 버튼 클릭
                    // 로그인 페이지로 이동 (로그인 후 returnUrl로 이동);
                  /* location.href = "/indexLogin?returnUrl=/tv/home/"; */
                  location.href = "/indexLogin?returnUrl=/shop/home/"; // * url 변경 *
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

<%@
include file="footer.jsp"

%>

</body>
</html>