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
<!--  -->
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>aboutPet</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css">
<script async src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
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
include file="./sidebar.jsp"

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
         <div class="contents log my" id="contents">
            <!-- 페이지 헤더 -->
            <!-- mobile -->
            <div class="pageHead logHeaderAc" style="height: 0;">
               <div class="inr">
                  <div class="hdt">
                     <button class="back" type="button" onclick="storageHist.getOut('log/indexMyPetLog');" 뒤로가기></button>
                  </div>
                  <div class="cent">
                     <h2 class="subtit"></h2>
                  </div>
                  <div class="mdt"></div>
               </div>
            </div>
            <!-- // mobile -->
            <!-- // 페이지 헤더 -->
            <div class="mylog_area info">
               <div class="mylog_area_innerWrap">
                  <!-- 사용자 정보 -->
                  <div class="mylog_userInfo">
                     <!-- 사용자 -->
                     <div class="mylog_user">
                        <div class="pic">
                           <a> <img
                              src="${select_MemLog.pet_img}"
                              alt="">
                           </a>
                        </div>
                        <div class="profile">
                           <div class="nick scroll_tit_ac log_match">${select_MemLog.nickname}</div>
                           <div class="pro_btn scroll_move_wrap">
                              <a href="javascript:;"
                                 onclick="saveFollowMapMember('${ select_MemLog.mem_code }', 'I', this);"
                                 id="follow" class="btn a">팔로우</a>
                              <button class="logBtnBasic btn-share"
                                 data-message="링크가 복사되었어요" data-title="절미" title="COPY URL"
                                 onclick="sharePetLog('${ select_MemLog.log_code }', this.id, 'M');"
                                 id="share_9F85130AAF"
                                 data-clipboard-text="localhost/AboutPet/Project/aboutPet/myPetlog.do?mem_code=${ select_MemLog.mem_code}">
                                 <span>공유</span>
                              </button>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- // 사용자 정보 -->

                  <!-- APET-1104 210611 lju02 / 위치 이동 -->
                  <!-- 자기소개 -->
                  <div class="txt" style="white-space: pre-line;"></div>
                  <!-- //자기소개 -->
                  <!-- //APET-1104 210611 lju02 / 위치 이동 -->
                  <!-- 게시물 -->
                  <div class="mylog_contents">
                     <ul>
                        <li><a>
                              <div class="tit">게시물</div>
                              <div class="num">${select_MemLog.log_count}</div>
                        </a></li>
                        <li><a
                           href="javascript:goFollowList('follower','${ select_MemLog.mem_code }', '${ select_MemLog.nickname }');">
                              <div class="tit">팔로워</div>
                              <div class="num">${select_MemLog.mem_follow}</div>
                        </a></li>
                        <li><a
                           href="javascript:goFollowList('following','${ select_MemLog.mem_code }', '${ select_MemLog.nickname }');">
                              <div class="tit">팔로잉</div>
                              <div class="num">${select_MemLog.mem_following}</div>
                        </a></li>
                     </ul>
                  </div>
                  <!-- // 게시물 -->
               </div>
            </div>
            
            <!-- 이미지 부분 -->
            <c:choose>
            <c:when test="${select_MemLog.log_count ne 0}">
	            <div class="mylog_area con">
	               <div class="logPicMetric only3">
	                 	<ul id="myPetLogList">
					  		<c:forEach items="${ logImg_List }" var="logImg">
						        <li><a href="/AboutPet/Project/aboutPet/petMemLog.do?mem_code=${logImg.mem_code}&log_code=${logImg.log_code}"class="logPicBox">
						           <span class="logIcon_pic i02"></span>
						           <img src="${ logImg.log_img } " alt="" /></a>
						        </li>
					  		</c:forEach>
						</ul>
					</div>	
				</div>
			</c:when>
					
			<c:when test="${select_MemLog.log_count eq 0}">
				<div class="mylog_area con" style="height: 582px;">
					<section class="no_data i1 auto_h">
						<div class="inr">
							<div class="msg">아직 등록된 게시물이 없어요.</div>
						</div>
					</section>
				</div>
			</c:when>
			</c:choose>				            
         </div> <!-- id="contents" -->
    </main>
   
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
	   <!-- 상담톡 -->
</div>

<script>
	function goFollowList(tabGb, mbrNo, nickNm){
		location.href = "/AboutPet/Project/aboutPet/followlist.do?followlist="+tabGb+"&mem_code="+mbrNo+"&nickname="+nickNm;
	}
</script>

<script type="text/javascript">
  // 아무데나 클릭
   $(document).ready(function(){
      $("li[id^=liTag_]").one('click', function(){
         $(this).addClass("active");
       });
      
   });
  
  // 
  function goPetLogListM(mbrNo , selIdx , page){
         var viewIdx = selIdx;
         var page = Number(page);
         // 첫 페이지 24개 일 시 페이지 및 index set
         if(viewIdx >= 12){
            if(page == 1){
               viewIdx = viewIdx-12;               
            }
            page = page+1;
             
         }
         location.href = "/log/indexPetLogList?pageType=M&mbrNo="+mbrNo+"&selIdx="+viewIdx+"&page="+page
  }
</script>

<script type="text/javascript">
	// 로그인 후 이용 가능
	function checkLogin(){
		
		// var petLogNol = document.getElementById("like_"+petLogNo);
		// <p style="display: hidden" class="test_${ mem_code}" id="test"></p>
		var mem_code = document.getElementById("test").className; //로그인 한 멤버 코드 받아오는 변수 
	   	console.log(mem_code);
		
		if (mem_code == 0) { // mem_code == 0 -> 로그인 하지않은 회원 / mem_code != 0 -> 로그인 한 회원
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들
		        ycb:function(){
		           //location.href = "https://aboutpet.co.kr/indexLogin";
		           location.href = "/AboutPet/Project/aboutPet/myPage.do";
		        }
	        });
		} else { // 멤버코드가 있을 때
			
			return true;
		}
		
	}

	// 회원 - 팔로우
	function saveFollowMapMember(mbrNo, saveGb, obj){
		// var followId = $(obj).attr("id");
		
		// 로그인 체크 후 ajax -> INSERT
		if (checkLogin()) {
			var test = document.getElementById("test").className;
			console.log(mbrNo);
			console.log(test);
			
			//
			if ($(obj).hasClass("a")) {
				$(obj).removeClass("a");
				$(obj).addClass("c");
				$(obj).text("팔로잉");
				
				tText = "친구를 팔로우 했어요";
	             ui.toast(tText,{   // 토스트 창띄우기
	                 bot:70
	             })
	            
	            var param = {
	            	 mem_code:test,
	            	 mf_code:mbrNo
	            }
	            
	            //
	            $.ajax({
	            	 url:"log_follow_insert.jsp",
	            	 data:param,
	            	 type:"POST",
	            	 cache:false,
	            	 success:function(result){
	            		 // console.log(result);
	            		 console.log("팔로우 성공");
	            	 },
	            	 error:function(){
	            		 console.log("팔로우 실패");
	            	 }
	            });
				
			} else if ($(obj).hasClass("c")) { // 팔로우 취소
				$(obj).removeClass("c");
				$(obj).addClass("a");
				$(obj).text("팔로우");
			
				tText = "팔로우를 취소했어요";
	             ui.toast(tText,{   // 토스트 창띄우기
	                 bot:70
	             })
				
				var param = {
	            	 mem_code:test,
	            	 mf_code:mbrNo
	             }
	            
	            //
	            $.ajax({
	            	url:"log_follow_delete.jsp",
	            	data:param,
	            	type:"POST",
	            	cache:false,
	            	success:function(result){
	            		// console.log("result");
	            		console.log("팔로우 취소 성공");
	            	},
	            	error:function(){
	            		console.log("팔로우 취소 실패");
	            	}
	            });
	             
			} // if()
				
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
</script>

<script>
	// 상담톡
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


<%@
include file="./footer.jsp"

%>

</body>
</html>