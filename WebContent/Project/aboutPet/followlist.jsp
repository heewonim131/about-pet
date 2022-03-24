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
<link href="https://aboutpet.co.kr/_images/common/favicon.png"
   rel="apple-touch-icon-precomposed">
<!--  -->
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>aboutPet</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css">
<script type="text/javascript" src="../scriptAll/googleAnalytics.js"></script>
<script>
   window.dataLayer = window.dataLayer || [];
   function gtag() {
      dataLayer.push(arguments);
   }
   gtag('js', new Date());

   gtag('config', "G-NR86F31079");
</script>

<script type="text/javascript" src="../scriptAll/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../scriptAll/jquery-ui.min.js"></script>
<script type="text/javascript" src="../scriptAll/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="../scriptAll/jquery.blockUI.js" charset="utf-8"></script>
<script type="text/javascript" src="../scriptAll/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../scriptAll/jquery.number.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../scriptAll/jquery.form.min.js"></script>
<script type="text/javascript" src="../scriptAll/jquery.countdown.js"></script>
<script type="text/javascript" src="../scriptAll/jquery.cookie.js"></script>
<script type="text/javascript" src="../scriptAll/swiper.min.js"></script>
<script type="text/javascript" src="../scriptAll/clipboard.min.js"></script>
<script type="text/javascript" src="../scriptAll/common.js"></script>
<script type="text/javascript" src="../scriptAll/popup.js"></script>
<script type="text/javascript" src="../scriptAll/ui.js"></script>
<script type="text/javascript" src="../scriptAll/deviceChk.js"></script>
<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
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
   //   const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
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
      <main class="container page 1dep 2dep" id="container">
         <div class="inr">
            <!-- 본문 -->
            <div class="contents" id="contents">
               <section class="log_listviewTop">
                  <div class="pic">
                     <a href="/log/indexMyPetLog/9F85130AAF?mbrNo=938590"> <img
                        src="${ follow_Page.pet_img }" alt="">
                     </a>
                  </div>
                  <h1>
                     <a href="/AboutPet/Project/aboutPet/myPetlog.do?mem_code=${ follow_Page.mem_code }">${ follow_Page.nickname }</a>
                  </h1>
               </section>
               <!-- tab -->
               <section class="sect petTabContent hmode_auto follow mode_fixed">
                  <ul class="uiTab a line">
                     <li class="active" id="followerTab"><a class="bt active"
                        href="javascript:;">팔로우<span>${ follow_Page.mem_follow }</span></a></li>
                     <li class="" id="followingTab"><a class="bt"
                        href="javascript:;">팔로잉<span>${ follow_Page.mem_following }</span></a></li>
                  </ul>

                  <!-- 목록 -->
                  <div class="uiTab_content">
                     <ul style="left: 0%;">
                                          	
                        <!-- 팔로워  -->
                        <li class="active">
                           <section class="follow-listBox">
                              <c:forEach items="${ follow_List }" var="f_list">
                              <ul>
                                 <li><a href="/AboutPet/Project/aboutPet/myPetlog.do?mem_code=${ f_list.folm_code}">
                                       <span class="pic"> <img src="${ f_list.pet_img }" alt=""></span>
                                       <span class="nick">${ f_list.folm_name }</span>
                                 	</a>
                                 	<button href="javascript:;" onclick="saveFollowMapMember('${ f_list.mem_code }', 'I', this);" class="btn a" id="I_943172">팔로우</button>
                                 </li>
                              </ul>
                              </c:forEach>
                           </section>
                        </li>
                        
                        <c:set value="${ follow_Page.mem_following }" var="fmi"/>
                         <c:if test="${ fmi eq 0 }">
                           <li class="active">
                              <div class="noneBoxPoint p3" style="height: calc(100vh - 157px)">
                                 <section class="no_data i1">
                                    <div class="inr">
                                       <div class="msg">회원님이 팔로우하는 친구가 아직 없어요.</div>
                                    </div>
                                 </section>
                              </div>
                           </li>
                         </c:if>
                        
                        
                        <!-- 팔로잉  -->
                        <li class="active">
                           <section class="follow-listBox">
                                <c:forEach items="${ following_List }" var="fi_list">
                                 <ul>
                                    <li><a href="/AboutPet/Project/aboutPet/myPetlog.do?mem_code=${ fi_list.folim_code }">
                                       	  <span class="pic"> <img src="${ fi_list.pet_img }" alt=""></span>
                                       	  <span class="nick">${ fi_list.folim_name }</span>
                                    	</a>
                                    	<button href="javascript:;" onclick="saveFollowMapMember('${ fi_list.mem_code }', 'I', this);" class="btn a" id="IW_945114">팔로우</button>
                                    </li>
                                 </ul>
                                </c:forEach>
                            </section>
                        </li>
                        
                        <!-- 적용 안 됐음 -->
                        <c:set value="${ follow_Page.mem_follow }" var="fm"/>
                         <c:if test="${ fm eq 0 }">
                           <li class="active">
                              <div class="noneBoxPoint p3" style="height:calc(100vh - 157px)">
                                 <section class="no_data i1">
                                    <div class="inr">
                                       <div class="msg">회원님을 팔로우하는 친구가 아직 없어요.</div>
                                    </div>
                                 </section>
                              </div>
                           </li>
                         </c:if>
                                                  
                     </ul>
                  </div>
               </section>
               <!-- // tab -->
            </div>
         </div>
         <!-- inr -->
      </main>
      <!-- location 영역 포함  -->
</div>
<!-- wrap -->


<script>
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
</script>


<%@
include file="./footer.jsp"

%>

</body>
</html>