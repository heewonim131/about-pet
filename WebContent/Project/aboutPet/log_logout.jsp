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

<title>Log</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="../scriptAll/jquery-ui.css"><script async src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript"    src="../scriptAll/googleAnalytics.js"></script>
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
<script type="text/javascript" src="../scriptAll/deviceChk.js"></script>   <!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
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
   <div class="wrap" id="wrap">
      <main class="container page logmain" id="container">
      
         <div class="inr" style="min-height: 1092px;">
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
         <c:forEach items="${ loglist }" var="list">
        <div class="contents log main" id="contents">  
        <section class="logContentBox" id="${ list.log_code }" data-new-yn="">
        <div  id="first_log_code" style="display:  none" >${ list.log_code }</div>    
               <div class="lcbPicture sw">
                              <!-- slider -->
                              <div class="swiper-container logMain swiper-container-initialized swiper-container-horizontal">
                                 <div class="swiper-pagination swiper-pagination-fraction"><span class="swiper-pagination-current"></span><span class="swiper-pagination-total"></span></div>
                                 <ul class="swiper-wrapper slide" style="transform: translate3d(-600px, 0px, 0px); transition-duration: 0ms;">
                                  ${ list.log_img }
                                 </ul>
                                 <div class="remote-area">
                                    <button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
                                    <button class="swiper-button-prev" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="false"></button>
                                 </div>
                              <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                              <!-- // slider -->
                           </div>
                           <!-- 이미지/동영상 영역 : E -->      
            
               
               <div class="lcbWebRconBox">
               <!-- user content -->
                     <div class="lcbConTxt">
                        <!-- userInfo -->
                        
                        <div class="userInfo"> 
                           <div class="pic">
                              <img src="${ list.pet_img }" alt="dog">
                           </div> <!--  pic 프로필사진  -->
                           <div class="con">
                              <div class="txt">
                                 <a class="nickname" href="/AboutPet/Project/aboutPet/myPetlog.do?mem_code=${ list.mem_code }">${ list.nickname }</a> 
                                 <span class="dotIcon2x2 onWeb_ib"></span> <span class="time">${ list.log_date }</span>
                              </div>
                           </div> <!-- txt 닉네임 , 날짜 -->
                           
                            <div class="menu dopMenuIcon" onclick="ui.popSel.open(this,event)">
                              <div class="popSelect r">
                                 <input type="text" class="popSelInput">
                                 <div class="popSelInnerWrap" style="height: 0px;">
                                    <ul>
                                       <li><a class="bt" href="javascript:layerPetLogReport('7171','', '','N');" id="btRptp_7171"><b class="t">신고</b></a></li>
                                    </ul>
                                 </div>
                              </div>
                           </div> <!-- 신고 -->
                        </div> <!-- class="userInfo" -->
                        
                        <span class="iconOm_arr"></span>
                        <div class="lcbConTxt_content" id="contentArea">   
                           <p>${ list.log_content }</p>
                           <!-- 아래 내용 여기 삽입 -->
                        </div> <!-- 내용 -->
                                                
                     </div><!-- class="lcbConTxt" -->
                     
                     <!--  menu bar 상단 프로필내용 끝  -->
                     
                     
                     <div class="lcbmenuBar" id="adminHideArea2">
                        <div class="inner">
                           <ul class="bar-btn-area">
                              <li id="likeBtn1_3934">
                                 <button class="logBtnBasic btn-like"
                                    onclick="savePetLogInterest('${list.log_code}', '10', 'I', '')">${list.log_like}</button>
                              </li>
                              <li>
                                 <button class="logBtnBasic btn-comment"
                                    onclick="viewReply('${list.log_code}','', this);">${list.log_cmt}</button>
                              </li>
                              <li>
                                 <button class="logBtnBasic btn-share"
                                    data-message="링크가 복사되었어요" data-title="${ list.nickname }" title="COPY URL"
                                    onclick="sharePetLog('${ list.log_code}', this.id, 'P');"
                                    id="share1_3934"
                                    data-clipboard-text="localhost/AboutPet/Project/aboutPet/detailpetlog.do?log_code=${ list.log_code}">
                                    <span>공유</span>
                                 </button>
                              </li>
                              <li class="ml20" id="bookBtn1_3934">
                                 <button class="logBtnBasic btn-bookmark"
                                    onclick="savePetLogInterest('${list.log_code}', '20', 'I', '')">
                                    <span>북마크</span>
                                 </button>
                              </li>
                           </ul>
                           
                           <!-- 연관상품 테이블 ? -->
                           <!-- 
                           <div class="log_connectTingWrap">
                                 <buttron class="tvConnectedTing">연관상품</buttron>
                                 <button class="btn_connectTing" data-content="7171" data-url="getRelatedGoodsWithPetLog(this, '7171')">
                                    <span>10</span>
                                    <div class="inr_wrapBox"><img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/14/09/11/2481821/2481821_detail_050.jpg?type=m&amp;w=70&amp;h=70&amp;quality=90&amp;bgcolor=FFFFFF&amp;extopt=3" alt=""></div>
                                 </button>
                           </div>
                            -->
                        </div> <!-- class="inner" -->
                     </div> <!--class="lcbmenuBar"   -->
                     
                     <!-- 댓글 클릭 창 -->
                     <div class="commentBoxAp logcommentBox pop1" id="cmt_${list.log_code}" style="bottom: 0px; height: 90%;">
                        
                        <div class="head t2">
                           <div class="con">
                              <div class="tit">댓글 <span class="price-box">${list.log_cmt}</span></div>
                              <a href="javascript:;" class="close" onclick="ui.commentBox.close(this);"></a>
                           </div>
                        </div>
                        <div class="con t2">
                           <div class="box inf">
                              <div class="commendListBox">
                              
                              <c:choose>
                              <c:when test="${ list.log_cmt ne 0 }">
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
                              
                              <c:when test="${ list.log_cmt eq 0 }">
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
                              <textarea onclick="checkReplyInput();" placeholder="로그인 후 댓글을 입력해주세요." id="reply_123" name="reply" tabindex="-1"></textarea>
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
               </div> <!-- lcbWebRconBox 텍스트영역 -->
            </section>  <!-- class logContentBox -->
    </c:forEach>
</div> <!--  본문 id="contents" -->

<section class="logLikePet" id="likePetLogList">
         <div class="logTitle_area">
            <a href="javascript:goLikePetLogList(null , 1);" class="logTitle arr">좋아할만한 펫로그 </a>
         </div>
         <div class="slideType52">
            <div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
               <div class="swiper-pagination"></div>
                     <!-- 좋아할만한 펫로그 목록 -->
                     <ul class="swiper-wrapper slide" style="transform: translate3d(0px, 0px, 0px);">
                        <li class="swiper-slide swiper-slide-active" style="width: 233.6px; margin-right: 8px;">
                                 <a href="javascript:goLikePetLogList(0 , 1 ,6891 );" class="petLogCardBox" style="width: 100%;">
                                    <div class="vthumbs" video_id="lsT_22811342" type="video_thumb" uid="938590|950350" data-enchk="Y" style="background-color: rgb(247, 247, 247); height: 100%;" data-ready="Y"><div class="vthumbsCi newVthumbs" style="height:100%;;background:url(https://bxqnyciafsty6727912.cdn.ntruss.com/vod/lsT_22811342/video.png?type=f&amp;w=346&amp;h=461&amp;ttype=jpg) center / cover;background-color:#cdcddc; "></div></div>
                                       <div class="log_userInfoBar" id="likePetLogUserInfo" onclick="javascript:goMyPetLog('9F85130AAF','938590',event);">
                                       <div class="pic">
                                                <img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/938590/profile/c66cb611-8d6c-4012-9d68-fb9d4d28c27e.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4" alt="dog">
                                             </div>
                                          <p>절미</p>
                                    </div>
                                 </a>
                              </li>
                        <li class="swiper-slide swiper-slide-next" style="width: 233.6px; margin-right: 8px;">
                                 <a href="javascript:goLikePetLogList(1 , 1 ,6684 );" class="petLogCardBox">
                                    <img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/949212/d7fb0562-277d-428f-ac58-a6e305c597c9.png?type=f&amp;w=670&amp;h=892&amp;quality=100&amp;align=4" alt="">
                                       <div class="log_userInfoBar" id="likePetLogUserInfo" onclick="javascript:goMyPetLog('FA247D75CF','949212',event);">
                                       <div class="pic">
                                                <img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/member/949212/43749b2c-5130-4442-8472-14f167c225b6.png?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4" alt="dog">
                                             </div>
                                          <p>펫로그</p>
                                    </div>
                                 </a>
                        </li>
                        <li class="swiper-slide" style="width: 233.6px; margin-right: 8px;">
                                 <a href="javascript:goLikePetLogList(2 , 1 ,6662 );" class="petLogCardBox">
                                    <img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/940008/5d88e0ed-a155-44bd-a1e8-9858d74aaa69.jpg?type=f&amp;w=670&amp;h=892&amp;quality=100&amp;align=4" alt="">
                                       <div class="log_userInfoBar" id="likePetLogUserInfo" onclick="javascript:goMyPetLog('8724B0EABC','940008',event);">
                                       <div class="pic">
                                                <img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/940008/profile/4bc941a2-299c-400e-847b-1ceda373f641.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4" alt="dog">
                                             </div>
                                          <p>김쫀떡</p>
                                    </div>
                                 </a>
                        </li>
                        <li class="swiper-slide" style="width: 233.6px; margin-right: 8px;">
                                 <a href="javascript:goLikePetLogList(3 , 1 ,2523 );" class="petLogCardBox" style="width: 100%;">
                                    <div class="vthumbs" video_id="qcm8106315897" type="video_thumb" uid="938590|950350" data-enchk="Y" style="background-color: rgb(247, 247, 247); height: 100%;" data-ready="Y"><div class="vthumbsCi newVthumbs" style="height:100%;;background:url(https://bxqnyciafsty6727912.cdn.ntruss.com/vod/qcm8106315897/video.png?type=f&amp;w=346&amp;h=461&amp;ttype=jpg) center / cover;background-color:#cdcddc; "></div></div>
                                       <div class="log_userInfoBar" id="likePetLogUserInfo" onclick="javascript:goMyPetLog('9F85130AAF','938590',event);">
                                       <div class="pic">
                                                <img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/938590/profile/c66cb611-8d6c-4012-9d68-fb9d4d28c27e.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4" alt="dog">
                                             </div>
                                          <p>절미</p>
                                    </div>
                                 </a>
                        </li>
                        <li class="swiper-slide" style="width: 233.6px; margin-right: 8px;">
                                 <a href="javascript:goLikePetLogList(4 , 1 ,2518 );" class="petLogCardBox" style="width: 100%;">
                                    <div class="vthumbs" video_id="AO3G54951303" type="video_thumb" uid="938991|950350" data-enchk="Y" style="background-color: rgb(247, 247, 247); height: 100%;" data-ready="Y"><div class="vthumbsCi newVthumbs" style="height:100%;;background:url(https://bxqnyciafsty6727912.cdn.ntruss.com/vod/AO3G54951303/video.png?type=f&amp;w=346&amp;h=461&amp;ttype=jpg) center / cover;background-color:#cdcddc; "></div></div>
                                       <div class="log_userInfoBar" id="likePetLogUserInfo" onclick="javascript:goMyPetLog('81616880B4','938991',event);">
                                       <div class="pic">
                                                <img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/member/938991/4371f729-374c-4f75-9700-5c67b263683b.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4" alt="dog">
                                             </div>
                                          <p>바니맘</p>
                                    </div>
                                 </a>
                        </li>
                        <li class="swiper-slide" style="width: 233.6px; margin-right: 8px;">
                                 <a href="javascript:goLikePetLogList(5 , 1 ,2500 );" class="petLogCardBox">
                                    <img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/939192/f1940280-1bac-4a30-bf1f-322513779989.jpg?type=f&amp;w=670&amp;h=892&amp;quality=100&amp;align=4" alt="">
                                       <div class="log_userInfoBar" id="likePetLogUserInfo" onclick="javascript:goMyPetLog('A0B2B240B6','939192',event);">
                                       <div class="pic">
                                                <img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/member/939192/b70a6d21-ec13-4310-97e9-01707da9ecc0.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4" alt="dog">
                                             </div>
                                          <p>개밍순</p>
                                    </div>
                                 </a>
                        </li>
                    </ul>
                    
            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
            <div class="remote-area t1">
               <button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
               <button class="swiper-button-prev swiper-button-disabled" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
            </div>
         </div>
      </section> <!-- 좋아할만한 펫로그 -->

<div class="banner-wrap logBanner">
         <div class="uibanners">
            <div class="banner_slide">
               <div class="swiper-container slide swiper-container-initialized swiper-container-horizontal">
                  <ul class="swiper-wrapper list" style="transform: translate3d(-4800px, 0px, 0px); transition-duration: 0ms;"><li class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev" data-swiper-slide-index="2" style="width: 1200px;">
                           <a href="https://aboutpet.co.kr/event/detail?eventNo=14&amp;returnUrl=/log/home/" class="box">
                                       <img class="pc" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/141/fd6edc76-938e-473c-a9f9-35e92fd4cdbc.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4" alt="배너">
                                       <img class="mo" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/141/1d7c3467-fd2a-4489-ad9f-ab089f3d53e6.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4" alt="배너">
                                    </a>
                                 </li>
                     <li class="swiper-slide swiper-slide-duplicate-active" data-swiper-slide-index="0" style="width: 1200px;">
                           <a href="https://aboutpet.co.kr/event/detail?eventNo=68&amp;returnUrl=/log/home/" class="box">
                                       <img class="pc" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/440/c3feb5fc-a0ee-4bcb-8d04-a5d406e67bb8.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4" alt="배너">
                                       <img class="mo" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/440/06368c55-3763-4596-b1b6-5a82d99f06b1.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4" alt="배너">
                                    </a>
                                 </li>
                     <li class="swiper-slide" data-swiper-slide-index="1" style="width: 1200px;">
                           <a href="https://aboutpet.co.kr/event/detail?eventNo=66&amp;returnUrl=/log/home/" class="box">
                                       <img class="pc" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/422/8d51d783-1617-4893-9ff2-e0a8418dc447.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4" alt="배너">
                                       <img class="mo" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/422/5a329de0-bca4-4a0f-9220-8aac637403ec.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4" alt="배너">
                                    </a>
                                 </li>
                     <li class="swiper-slide swiper-slide-prev swiper-slide-duplicate-next" data-swiper-slide-index="2" style="width: 1200px;">
                           <a href="https://aboutpet.co.kr/event/detail?eventNo=14&amp;returnUrl=/log/home/" class="box">
                                       <img class="pc" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/141/fd6edc76-938e-473c-a9f9-35e92fd4cdbc.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4" alt="배너">
                                       <img class="mo" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/141/1d7c3467-fd2a-4489-ad9f-ab089f3d53e6.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4" alt="배너">
                                    </a>
                                 </li>
                     <li class="swiper-slide swiper-slide-duplicate swiper-slide-active" data-swiper-slide-index="0" style="width: 1200px;">
                           <a href="https://aboutpet.co.kr/event/detail?eventNo=68&amp;returnUrl=/log/home/" class="box">
                                       <img class="pc" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/440/c3feb5fc-a0ee-4bcb-8d04-a5d406e67bb8.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4" alt="배너">
                                       <img class="mo" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/440/06368c55-3763-4596-b1b6-5a82d99f06b1.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4" alt="배너">
                                    </a>
                                 </li></ul>
                  <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 1"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 2"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 3"></span></div>
                  <div class="sld-nav">
                     <button type="button" class="bt prev" tabindex="0" role="button" aria-label="Previous slide">이전</button>
                     <button type="button" class="bt next" tabindex="0" role="button" aria-label="Next slide">다음</button>
                  </div>
               <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
            </div>
         </div>
      </div> <!-- 이벤트 베너(여러 개) -->    
   </div>
</div><!-- inr -->

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
</nav> <!-- 상담 톡 -->
</main><!--  #container -->
</div><!-- wrap -->


<script>
	// 광고
       $(document).ready(function (){
              // <section class="logContentBox" id="${ list.log_code }" data-new-yn=""    >    
             
              var logNum = $("#first_log_code").first().text();  //맨 마지막 로그번호 (제일큰 로그번호)
             console.log(logNum);
              
         
              var test ;
              for (var i = 0; i <= logNum; i++) {
            
                 if( Number(i) % 4==1 ){
                    
                    logNum = Number(logNum)-4;
                    console.log(logNum);
                    test = logNum;
                   $("#"+test+"").after("<section class=\"logLikePet\" id=\"likePetLogList\">\r\n" + 
                      "         <div class=\"logTitle_area\">\r\n" + 
                      "            <a href=\"javascript:goLikePetLogList(null , 1);\" class=\"logTitle arr\">좋아할만한 펫로그 </a>\r\n" + 
                      "         </div>\r\n" + 
                      "         <div class=\"slideType52\">\r\n" + 
                      "            <div class=\"swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode\">\r\n" + 
                      "               <div class=\"swiper-pagination\"></div>\r\n" + 
                      "                     <!-- 좋아할만한 펫로그 목록 -->\r\n" + 
                      "                     <ul class=\"swiper-wrapper slide\" style=\"transform: translate3d(0px, 0px, 0px);\">\r\n" + 
                      "                        <li class=\"swiper-slide swiper-slide-active\" style=\"width: 233.6px; margin-right: 8px;\">\r\n" + 
                      "                                 <a href=\"javascript:goLikePetLogList(0 , 1 ,6891 );\" class=\"petLogCardBox\" style=\"width: 100%;\">\r\n" + 
                      "                                    <div class=\"vthumbs\" video_id=\"lsT_22811342\" type=\"video_thumb\" uid=\"938590|950350\" data-enchk=\"Y\" style=\"background-color: rgb(247, 247, 247); height: 100%;\" data-ready=\"Y\"><div class=\"vthumbsCi newVthumbs\" style=\"height:100%;;background:url(https://bxqnyciafsty6727912.cdn.ntruss.com/vod/lsT_22811342/video.png?type=f&amp;w=346&amp;h=461&amp;ttype=jpg) center / cover;background-color:#cdcddc; \"></div></div>\r\n" + 
                      "                                       <div class=\"log_userInfoBar\" id=\"likePetLogUserInfo\" onclick=\"javascript:goMyPetLog('9F85130AAF','938590',event);\">\r\n" + 
                      "                                       <div class=\"pic\">\r\n" + 
                      "                                                <img src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/938590/profile/c66cb611-8d6c-4012-9d68-fb9d4d28c27e.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4\" alt=\"dog\">\r\n" + 
                      "                                             </div>\r\n" + 
                      "                                          <p>절미</p>\r\n" + 
                      "                                    </div>\r\n" + 
                      "                                 </a>\r\n" + 
                      "                              </li>\r\n" + 
                      "                        <li class=\"swiper-slide swiper-slide-next\" style=\"width: 233.6px; margin-right: 8px;\">\r\n" + 
                      "                                 <a href=\"javascript:goLikePetLogList(1 , 1 ,6684 );\" class=\"petLogCardBox\">\r\n" + 
                      "                                    <img src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/949212/d7fb0562-277d-428f-ac58-a6e305c597c9.png?type=f&amp;w=670&amp;h=892&amp;quality=100&amp;align=4\" alt=\"\">\r\n" + 
                      "                                       <div class=\"log_userInfoBar\" id=\"likePetLogUserInfo\" onclick=\"javascript:goMyPetLog('FA247D75CF','949212',event);\">\r\n" + 
                      "                                       <div class=\"pic\">\r\n" + 
                      "                                                <img src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/member/949212/43749b2c-5130-4442-8472-14f167c225b6.png?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4\" alt=\"dog\">\r\n" + 
                      "                                             </div>\r\n" + 
                      "                                          <p>펫로그</p>\r\n" + 
                      "                                    </div>\r\n" + 
                      "                                 </a>\r\n" + 
                      "                        </li>\r\n" + 
                      "                        <li class=\"swiper-slide\" style=\"width: 233.6px; margin-right: 8px;\">\r\n" + 
                      "                                 <a href=\"javascript:goLikePetLogList(2 , 1 ,6662 );\" class=\"petLogCardBox\">\r\n" + 
                      "                                    <img src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/940008/5d88e0ed-a155-44bd-a1e8-9858d74aaa69.jpg?type=f&amp;w=670&amp;h=892&amp;quality=100&amp;align=4\" alt=\"\">\r\n" + 
                      "                                       <div class=\"log_userInfoBar\" id=\"likePetLogUserInfo\" onclick=\"javascript:goMyPetLog('8724B0EABC','940008',event);\">\r\n" + 
                      "                                       <div class=\"pic\">\r\n" + 
                      "                                                <img src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/940008/profile/4bc941a2-299c-400e-847b-1ceda373f641.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4\" alt=\"dog\">\r\n" + 
                      "                                             </div>\r\n" + 
                      "                                          <p>김쫀떡</p>\r\n" + 
                      "                                    </div>\r\n" + 
                      "                                 </a>\r\n" + 
                      "                        </li>\r\n" + 
                      "                        <li class=\"swiper-slide\" style=\"width: 233.6px; margin-right: 8px;\">\r\n" + 
                      "                                 <a href=\"javascript:goLikePetLogList(3 , 1 ,2523 );\" class=\"petLogCardBox\" style=\"width: 100%;\">\r\n" + 
                      "                                    <div class=\"vthumbs\" video_id=\"qcm8106315897\" type=\"video_thumb\" uid=\"938590|950350\" data-enchk=\"Y\" style=\"background-color: rgb(247, 247, 247); height: 100%;\" data-ready=\"Y\"><div class=\"vthumbsCi newVthumbs\" style=\"height:100%;;background:url(https://bxqnyciafsty6727912.cdn.ntruss.com/vod/qcm8106315897/video.png?type=f&amp;w=346&amp;h=461&amp;ttype=jpg) center / cover;background-color:#cdcddc; \"></div></div>\r\n" + 
                      "                                       <div class=\"log_userInfoBar\" id=\"likePetLogUserInfo\" onclick=\"javascript:goMyPetLog('9F85130AAF','938590',event);\">\r\n" + 
                      "                                       <div class=\"pic\">\r\n" + 
                      "                                                <img src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/938590/profile/c66cb611-8d6c-4012-9d68-fb9d4d28c27e.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4\" alt=\"dog\">\r\n" + 
                      "                                             </div>\r\n" + 
                      "                                          <p>절미</p>\r\n" + 
                      "                                    </div>\r\n" + 
                      "                                 </a>\r\n" + 
                      "                        </li>\r\n" + 
                      "                        <li class=\"swiper-slide\" style=\"width: 233.6px; margin-right: 8px;\">\r\n" + 
                      "                                 <a href=\"javascript:goLikePetLogList(4 , 1 ,2518 );\" class=\"petLogCardBox\" style=\"width: 100%;\">\r\n" + 
                      "                                    <div class=\"vthumbs\" video_id=\"AO3G54951303\" type=\"video_thumb\" uid=\"938991|950350\" data-enchk=\"Y\" style=\"background-color: rgb(247, 247, 247); height: 100%;\" data-ready=\"Y\"><div class=\"vthumbsCi newVthumbs\" style=\"height:100%;;background:url(https://bxqnyciafsty6727912.cdn.ntruss.com/vod/AO3G54951303/video.png?type=f&amp;w=346&amp;h=461&amp;ttype=jpg) center / cover;background-color:#cdcddc; \"></div></div>\r\n" + 
                      "                                       <div class=\"log_userInfoBar\" id=\"likePetLogUserInfo\" onclick=\"javascript:goMyPetLog('81616880B4','938991',event);\">\r\n" + 
                      "                                       <div class=\"pic\">\r\n" + 
                      "                                                <img src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/member/938991/4371f729-374c-4f75-9700-5c67b263683b.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4\" alt=\"dog\">\r\n" + 
                      "                                             </div>\r\n" + 
                      "                                          <p>바니맘</p>\r\n" + 
                      "                                    </div>\r\n" + 
                      "                                 </a>\r\n" + 
                      "                        </li>\r\n" + 
                      "                        <li class=\"swiper-slide\" style=\"width: 233.6px; margin-right: 8px;\">\r\n" + 
                      "                                 <a href=\"javascript:goLikePetLogList(5 , 1 ,2500 );\" class=\"petLogCardBox\">\r\n" + 
                      "                                    <img src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/939192/f1940280-1bac-4a30-bf1f-322513779989.jpg?type=f&amp;w=670&amp;h=892&amp;quality=100&amp;align=4\" alt=\"\">\r\n" + 
                      "                                       <div class=\"log_userInfoBar\" id=\"likePetLogUserInfo\" onclick=\"javascript:goMyPetLog('A0B2B240B6','939192',event);\">\r\n" + 
                      "                                       <div class=\"pic\">\r\n" + 
                      "                                                <img src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/member/939192/b70a6d21-ec13-4310-97e9-01707da9ecc0.jpg?type=f&amp;w=144&amp;h=144&amp;quality=100&amp;align=4\" alt=\"dog\">\r\n" + 
                      "                                             </div>\r\n" + 
                      "                                          <p>개밍순</p>\r\n" + 
                      "                                    </div>\r\n" + 
                      "                                 </a>\r\n" + 
                      "                        </li>\r\n" + 
                      "                    </ul>\r\n" + 
                      "                    \r\n" + 
                      "            <span class=\"swiper-notification\" aria-live=\"assertive\" aria-atomic=\"true\"></span><span class=\"swiper-notification\" aria-live=\"assertive\" aria-atomic=\"true\"></span></div>\r\n" + 
                      "            <div class=\"remote-area t1\">\r\n" + 
                      "               <button class=\"swiper-button-next\" type=\"button\" tabindex=\"0\" role=\"button\" aria-label=\"Next slide\" aria-disabled=\"false\"></button>\r\n" + 
                      "               <button class=\"swiper-button-prev swiper-button-disabled\" type=\"button\" tabindex=\"0\" role=\"button\" aria-label=\"Previous slide\" aria-disabled=\"true\"></button>\r\n" + 
                      "            </div>\r\n" + 
                      "         </div>\r\n" + 
                      "      </section> <!-- 좋아할만한 펫로그 -->\r\n" + 
                      "\r\n" + 
                      "<div class=\"banner-wrap logBanner\">\r\n" + 
                      "         <div class=\"uibanners\">\r\n" + 
                      "            <div class=\"banner_slide\">\r\n" + 
                      "               <div class=\"swiper-container slide swiper-container-initialized swiper-container-horizontal\">\r\n" + 
                      "                  <ul class=\"swiper-wrapper list\" style=\"transform: translate3d(-4800px, 0px, 0px); transition-duration: 0ms;\"><li class=\"swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev\" data-swiper-slide-index=\"2\" style=\"width: 1200px;\">\r\n" + 
                      "                           <a href=\"https://aboutpet.co.kr/event/detail?eventNo=14&amp;returnUrl=/log/home/\" class=\"box\">\r\n" + 
                      "                                       <img class=\"pc\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/141/fd6edc76-938e-473c-a9f9-35e92fd4cdbc.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                       <img class=\"mo\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/141/1d7c3467-fd2a-4489-ad9f-ab089f3d53e6.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                    </a>\r\n" + 
                      "                                 </li>\r\n" + 
                      "                     <li class=\"swiper-slide swiper-slide-duplicate-active\" data-swiper-slide-index=\"0\" style=\"width: 1200px;\">\r\n" + 
                      "                           <a href=\"https://aboutpet.co.kr/event/detail?eventNo=68&amp;returnUrl=/log/home/\" class=\"box\">\r\n" + 
                      "                                       <img class=\"pc\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/440/c3feb5fc-a0ee-4bcb-8d04-a5d406e67bb8.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                       <img class=\"mo\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/440/06368c55-3763-4596-b1b6-5a82d99f06b1.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                    </a>\r\n" + 
                      "                                 </li>\r\n" + 
                      "                     <li class=\"swiper-slide\" data-swiper-slide-index=\"1\" style=\"width: 1200px;\">\r\n" + 
                      "                           <a href=\"https://aboutpet.co.kr/event/detail?eventNo=66&amp;returnUrl=/log/home/\" class=\"box\">\r\n" + 
                      "                                       <img class=\"pc\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/422/8d51d783-1617-4893-9ff2-e0a8418dc447.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                       <img class=\"mo\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/422/5a329de0-bca4-4a0f-9220-8aac637403ec.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                    </a>\r\n" + 
                      "                                 </li>\r\n" + 
                      "                     <li class=\"swiper-slide swiper-slide-prev swiper-slide-duplicate-next\" data-swiper-slide-index=\"2\" style=\"width: 1200px;\">\r\n" + 
                      "                           <a href=\"https://aboutpet.co.kr/event/detail?eventNo=14&amp;returnUrl=/log/home/\" class=\"box\">\r\n" + 
                      "                                       <img class=\"pc\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/141/fd6edc76-938e-473c-a9f9-35e92fd4cdbc.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                       <img class=\"mo\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/141/1d7c3467-fd2a-4489-ad9f-ab089f3d53e6.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                    </a>\r\n" + 
                      "                                 </li>\r\n" + 
                      "                     <li class=\"swiper-slide swiper-slide-duplicate swiper-slide-active\" data-swiper-slide-index=\"0\" style=\"width: 1200px;\">\r\n" + 
                      "                           <a href=\"https://aboutpet.co.kr/event/detail?eventNo=68&amp;returnUrl=/log/home/\" class=\"box\">\r\n" + 
                      "                                       <img class=\"pc\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/440/c3feb5fc-a0ee-4bcb-8d04-a5d406e67bb8.jpg?type=f&amp;w=1200&amp;h=94&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                       <img class=\"mo\" src=\"https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/banner/440/06368c55-3763-4596-b1b6-5a82d99f06b1.jpg?type=f&amp;w=750&amp;h=176&amp;quality=100&amp;align=4\" alt=\"배너\">\r\n" + 
                      "                                    </a>\r\n" + 
                      "                                 </li></ul>\r\n" + 
                      "                  <div class=\"swiper-pagination swiper-pagination-clickable swiper-pagination-bullets\"><span class=\"swiper-pagination-bullet swiper-pagination-bullet-active\" tabindex=\"0\" role=\"button\" aria-label=\"Go to slide 1\"></span><span class=\"swiper-pagination-bullet\" tabindex=\"0\" role=\"button\" aria-label=\"Go to slide 2\"></span><span class=\"swiper-pagination-bullet\" tabindex=\"0\" role=\"button\" aria-label=\"Go to slide 3\"></span></div>\r\n" + 
                      "                  <div class=\"sld-nav\">\r\n" + 
                      "                     <button type=\"button\" class=\"bt prev\" tabindex=\"0\" role=\"button\" aria-label=\"Previous slide\">이전</button>\r\n" + 
                      "                     <button type=\"button\" class=\"bt next\" tabindex=\"0\" role=\"button\" aria-label=\"Next slide\">다음</button>\r\n" + 
                      "                  </div>\r\n" + 
                      "               <span class=\"swiper-notification\" aria-live=\"assertive\" aria-atomic=\"true\"></span></div>\r\n" + 
                      "            </div>\r\n" + 
                      "         </div>\r\n" + 
                      "      </div> <!-- 이벤트 베너(여러 개) -->\r\n" + 
                      "      \r\n" );
                 
                console.log(logNum);
                 } 
                 
            }
              
       })            
</script>


<script>
   // 로그인 후 이용 가능
   function checkLogin(){
            ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들
               ycb:function(){
                  //location.href = "https://aboutpet.co.kr/indexLogin";
                  location.href = "/AboutPet/Project/aboutPet/myPage.do";
                  //location.href = "https://aboutpet.co.kr/indexLogin?returnUrl=/log/home/" + location.search;
               },
               ncb:function(){
                  return false;
               },
               ybt:"로그인", // 기본값 "확인"
               nbt:"취소"  // 기본값 "취소"
            });         
         
   }

   //좋아요
   //관심구분코드(intsGbCd: 10-좋아요, 20-찜) 
   //    savePetLogInterest('${list.log_code}', '10', 'I', '')
   function savePetLogInterest(petLogNo, intsGbCd, saveGb, listNo){
      if( checkLogin() ){
      
          $('#petLogInterestForm [name="intsGbCd"]').val(intsGbCd);
          $('#petLogInterestForm [name="petLogNo"]').val(petLogNo);
          $('#petLogInterestForm [name="saveGb"]').val(saveGb);
   
          var action = "like";
          
          var options = {
            url : "/log/petLogInterestSave"
            , data : $("#petLogInterestForm").serialize()
            , done : function(data){
               //alert("등록되었습니다.");
               if(data.existCheck == "Y"){
                  saveGb = "D";
               }
               if( intsGbCd == '20' ){   
                  action = "interest";
                  
                  var tText = '<div class="link"><p class="tt">찜리스트에 추가되었어요</p><a href="/mypage/log/myWishList" data-content="950350" data-url="/mypage/log/myWishList" class="lk">바로가기</a></div>';
                  if( saveGb == 'D') tText = "찜리스트에서 삭제되었어요";
                  ui.toast(tText,{   // 토스트 창띄우기
                     bot:70
                  });
               }         
               
               //callback 함수 호출
               //alert(data.petLogNo+"등록되었습니다.");
               var cnt = 0;
               if( intsGbCd == '10' ) cnt = data.likeCnt;
               reloadInterest(petLogNo, intsGbCd, saveGb, listNo, cnt);
               
               if( saveGb == 'D'){
                  action += "_d";                  
               }
               userActionLog(petLogNo, action);   
                
            }
         };
         ajax.call(options);
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

   //
   function searchPetLogReply(petLogNo, no){
         
          $('#petLogReplyForm [name="petLogNo"]').val(petLogNo);
          
         //<div class="commentBoxAp logcommentBox pop1" id='" + petLogNo + "'>\          
         var options = {
            url : "/log/listPetLogReply"
            , data : $("#petLogReplyForm").serialize()
            , done : function(data){            
               
               var replyCnt = data.petLogReplyList.length;
               
               $("#replyCnt"+no+"_"+petLogNo).text(replyCnt);
               //alert("replyCnt==>"+$("#replyCnt_"+petLogNo).text());
               
               var addHtml = '\
               <div class="head t2">\
                  <div class="con">\
                     <div class="tit">댓글 <span class="price-box">'  + replyCnt + '</span></div>\
                     <a href="javascript:;" class="close" onClick="ui.commentBox.close(this)"></a>\
                  </div>\
               </div>\
               <div class="con t2">\
                  <div class="box inf">';
               
               if(data.petLogReplyList.length > 0){
                  addHtml += '\
                     <div class="commendListBox">\
                     <ul>';
                     
                  var listHtml = '';
                  for(var i=0; i<data.petLogReplyList.length; i++){ 
                     var obj = data.petLogReplyList[i];
                     var date = "";
                     if( obj.sysRegDtm != null && obj.sysRegDtm != '') date = elapsedTime(obj.sysRegDtm, "년월일");
                     
                     var pic = 'https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images'+ obj.prflImg +'?type=f&w=124&h=124&quality=90&align=4';
                     if (obj.prflImg == null || obj.prflImg == '') {                           
                        pic = '../../_images/common/icon-img-profile-default-m@2x.png'
                     }   
                     var picLink = 'onclick="javascript:goMyPetLog(\'' + obj.petLogUrl+ '\',\''+  obj.mbrNo+ '\',event);"';
                     if(obj.mbrStatCd == '50'){ //탈퇴회원인 경우 링크삭제
                        picLink = '';
                     }
                     listHtml += '\
                        <li>\
                           <div class="pic" '+ picLink +'><img src="'+ pic +'" alt="img"></div>\
                           <div class="con">\
                              <div class="tit">' + obj.nickNm;
                              
   //                      if('950350'== obj.mbrNo )   {
   //                         listHtml += '<span class="nameCardAp">작성자</span>';
   //                      }
   console.log(obj.aply)
                        listHtml += '\
                              </div>\
                              <div class="txt" id="aply' + no + '_' + obj.petLogNo + '_' + obj.petLogAplySeq+ '">' + obj.aply + '</div>\
                              <div class="date"></div>\
                              <div class="date" id="modify_' + no + '_' + obj.petLogNo + '_' + obj.petLogAplySeq+ '">' + date + '</div>\
                           </div>\
                           <!-- select box -->\
                           <div class="menu dopMenuIcon" onClick="ui.popSel.open(this,event)">\
                              <div class="popSelect">\
                                 <input type="text" class="popSelInput">\
                                 <div class="popSelInnerWrap">\
                                    <ul>';
                                    
                        if('950350'== obj.mbrNo )   {
                           listHtml += '\
                                       <li><a class="bt" href="javascript:updatePetLogReplySet(\''+ obj.petLogNo +'\',\'' + obj.petLogAplySeq+ '\', \''+ no +'\');"><b class="t">수정</b></a></li>\
                                       <li><a class="bt" href="javascript:deletePetLogReply(\''+ obj.petLogNo +'\',\'' + obj.petLogAplySeq+ '\', \''+ no +'\');"><b class="t">삭제</b></a></li>';
                        }else{
                           if( obj.rptpYn == null || obj.rptpYn == 'N'){
                           listHtml += '\
                                       <li><a class="bt" href="javascript:layerPetLogReport(\''+ obj.petLogNo +'\',\'' + obj.petLogAplySeq+ '\', \''+ no + '\');"><b class="t">신고</b></a></li>';
                           }else{
                              //listHtml += '<li><a class="bt" href="javascript:alert(\'댓글 당 1번만 신고할 수 있습니다.\');">신고</a></li>';
                              listHtml += '<li><a class="bt" href="javascript:ui.toast(\'이미 신고한 댓글이에요\',{ bot:70 });">신고</a></li>';   
                           }
                        }
                        
                        listHtml += '\
                                    </ul>\
                                 </div>\
                              </div>\
                           </div>\
                           <!-- // select box -->\
                        </li>';
                        
                  }
                  addHtml = addHtml + listHtml;
                  addHtml += '\
                  </ul>\
                  </div>';   
                  
                  // 댓글 수정 중 알림.
   //                addHtml += '\
   //                <div class="alert-commentBox" id="uptCmtDisp'+no+'_'+obj.petLogNo+'" style="display:none;">\
   //                   <p><span class="icon-speechBubble"></span>댓글을 수정 중입니다.</p>\
   //                   <button class="close" onClick="hideUptCmtDisp(\''+ obj.petLogNo + '\', \''+ no + '\')"></button>\
   //                </div>';
                  
               }else{
                  addHtml += '\
                  <div class="no_data i1">\
                     <div class="inr">\
                        <div class="msg">첫번째 댓글을 남겨주세요.</div>\
                     </div>\
                  </div>';                  
               }
               
               addHtml += '\
               </div>\
               <div class="input">';
                  
            
               addHtml += '\
                  <span id="reply'+ no + '_'+ petLogNo + '_byte">\
                  </span>\
                  <textarea onClick="checkReplyInput();" placeholder="댓글을 입력해주세요." id="reply'+ no + '_'+ petLogNo + '" name="reply" tabindex="-1"></textarea>\
                  <button id="regBtn'+no+ '_'+ petLogNo+ '" name="regBtn" onClick="savePetLogReply(\'' + petLogNo + '\', \''+ no + '\', \'\')">등록</button>';               
               
   
               addHtml += '\
               </div>\
               <div class="fixed_box">\
                  <div class="key-word-list" style="display:none;">\
                     <ul id="add_tag_list_'+ no + '_'+ petLogNo + '">\
                     </ul>\
                  </div>';
               
               addHtml += '\
                  <div class="alert-commentBox" id="uptCmtDisp'+no+'_'+ petLogNo+'" style="display:none;">\
                     <p><span class="icon-speechBubble"></span>댓글을 수정 중입니다.</p>\
                     <button class="close" onClick="hideUptCmtDisp(\''+ petLogNo + '\', \''+ no + '\')"></button>\
                  </div>\
               </div>';
               
               
               // 댓글 수정 중 알림.
               addHtml += '\
            </div>';   
            
               //alert(addHtml);
               $("#pop"+no+"_"+petLogNo).html(addHtml);   
               
               // 태그, 닉네임 자동완성을 위한 셋팅
               roadTagFunc( no , petLogNo );
               
               //댓글 #/@ 링크 변환
               setAplyLink();
               
               ui.addInputDel.createAddSource("#reply"+ no + "_"+ petLogNo);
               
               // 열린 commentBox 가 있으면 먼저 다 닫는다
               $('.commentBoxAp.close').each(function(){
                   ui.commentBox.close($(this));
               });
               
               ui.commentBox.open('#pop'+no+'_'+petLogNo);      
            }
         };
         // ajax.call(options);
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
      } // /aboutpet/aboutPet/log/myPetlog.do?mem_code=${ list.mem_code }
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
   $(document).ready(function(){
      $(".lnb.my").hide();
      
      //$(window).scrollTop($("#").offset().top);
      /*    var hTimer = setInterval(function(){
            $("#header_pc .tmenu .list li:eq(1)").addClass("active").siblings().removeClass("active")
            if($("#header_pc").length) clearInterval(hTimer);
         });
      */
      
         var swiperBox = new Array();
            //PC
            /* 메인 스와이프 */
            swiperBox.push(new Swiper(".swiper-container.logMain", {
               slidesPerView: 1,
               slidesPerGroup: 1,
               freeMode: false,
               navigation: {
                  nextEl: '.swiper-container.logMain .swiper-button-next',
                  prevEl: '.swiper-container.logMain .swiper-button-prev',
               },
               pagination: {
                  el: '.swiper-container.logMain .swiper-pagination',
                  type: 'fraction',
               },
               on: {
                  slideResetTransitionStart: function() {
                     if ((this.snapIndex + 1) == this.imagesLoaded) {
                        $(this.wrapperEl).find(".swiper-slide-active").removeClass("swiper-slide-active").addClass("si_last");
                     } else {
                        $(this.wrapperEl).find(".si_last").removeClass("si_last");
                     }
                  }
               }
            }));
            
         /* $(".iconOm_arr").click(function(){
            $(this).parents(".lcbConTxt").toggleClass("active")
         });
         */
         
         var swiper52 = new Array();
         $('.slideType52 .swiper-container').each(function(i,n){
            swiper52.push(new Swiper($(n), {
               slidesPerView: 5,
               slidesPerGroup:1,
               spaceBetween: 8,
               freeMode: true,
               navigation: {
                  nextEl: $(n).parents(".slideType52").find('.swiper-button-next'),
                  prevEl: $(n).parents(".slideType52").find('.swiper-button-prev'),
               }
            }));
          });
    });
</script>

<script>
	// 좋아할만한 펫로그 관련 
   function goLikePetLogList(selIdx , page){         
      /* var param ="";
      if( idx !== undefined && idx != '' ) param = "?petLogNo="+idx;
      location.href = "https://aboutpet.co.kr/log/indexLikePetLogList"+param;    */   
      
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
         if ("0" == "0") {
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
 

</body>
</html>