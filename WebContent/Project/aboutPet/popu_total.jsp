<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function (){
	});
</script>
</head>

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

<body>

<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
<!-- e : gnb 영역 -->			
					<!-- s : LNB 영역 -->
					<!-- e : LNB 영역 -->
				<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
				
		<!-- s : 본문영역 -->			
		<input type="hidden" id="totalCnt" value="1"/>
		<input type="hidden" id="dispCornNo" value="568"/>
		<input type="hidden" id="petTvPage" value="0"/>
		<input type="hidden" id="sessNickNm" value=""/>
		<!-- 바디 - 여기위로 템플릿 -->
		<main class="container page tv homeList" id="container">
			<div class="inr">
				<!-- 본문 -->
				<div class="contents" id="contents">
                    <div class="pc-subtit">
                        <h2>지금 뜨는 인기영상</h2>
                    </div>

                    <!-- 영상리스트 영역 -->
                    <div class="list-wrap">
                        <ul class="list" id="petTvVodList">
	               <c:set var="flag" value="false" />         
                   <c:forEach items="${ plist }" var="pitem" varStatus="status"> 
                   <c:if test="${ not flag }">      
                        	<li>
	                                <div class="thumb-box">
	                                    <div class="div-header" style="cursor:pointer;">
	                                        <div class="pic" onclick="srisDetail(160);"><img src="${pitem.c_img}" alt=""></div>
	                                        <div class="tit" onclick="srisDetail(160);">${pitem.s_name}</div>
	                                    </div>
	                                    <div class="div-img"> 
	                                    	<a href="#" onclick="petTvDetail('N2021043003125', 0, 'N', 'PLY'); return false;" id="player_0" class="thumb-img" style="background-image:url(${pitem.v_img});" data-content="N2021043003125" data-url="">
		                                            <div class="time-tag"><span>${pitem.v_time}</span></div>
		                                        </a>
		                                    </div>
	                                    <div class="thumb-info">
	                                        <div class="info">
	                                            <div class="detail top">
	                                            	</div>	                                        
	                                            <div class="tlt k0426" id="petTvListTlt_0" onclick="petTvDetail('N2021043003125', 0, 'N', 'TTL');" data-content="N2021043003125;" data-url="">
	                                            	${pitem.v_name} </div>
	                                            <div class="detail">
													<!--<span class="read play"> 525</span>-->
	                                                <span class="read like" id="like_0"> ${pitem.v_like}</span>
	                                            </div>
	                                        </div>
	                                    </div>
 	                                    <!-- // menu bar -->
	                                </div>
	                                </li>
 	                                    <c:if test="${ status.count ge 10 }">
                        			<c:set var="flag" value="true" />
                       				 </c:if>	
                       				 </c:if>	
	                                   </c:forEach>  
	                            </li>
                            
                            </ul>
                    </div>
                    <!-- //영상리스트 영역 -->

	<!-- 				<section class="popular">
                        <div class="title-area">
                            <h2>펫TV 인기시리즈</h2>
                        </div>

                        <div class="popular-wrap" style="padding-bottom:0;">
                            <div class="ch-profile">
                                <div class="ch-profile-inner">
                                        <div>
                                        	<div class="round-img-pf" onclick="srisDetail(33);" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/33/srisProfile/8c8444aa-8123-4f29-afc2-0e6c4fbd556c.jpg?type=f&w=144&h=144&quality=100&align=4); cursor:pointer;"></div>
                                            <div class="tit" onclick="srisDetail(33);" style="cursor:pointer;">특이한 행동 WHY</div>
                                        </div>
                                </div>
                            </div>
                            //ch-profile
                            
                            <div class="popular-list">
                                <div class="swiper-div k0421">
                                    <div class="swiper-container">
                                        <ul class="swiper-wrapper">
                                        	<li class="swiper-slide">
                                                <div class="thumb-box">
                                                	<a href="#" onclick="fncGoStoragHist('/tv/series/indexTvDetail?vdId=N202104292095&sortCd=&listGb=SRIS_33'); return false;" onclick="videoAllPauses();" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081506540001200900687.jpg?type=f&w=250&h=141&quality=100&align=4);" data-content="N202104292095" data-url="/tv/series/indexTvDetail?vdId=N202104292095&sortCd=&listGb=SRIS_33">
                                                				<div class="time-tag"><span>02:10</span></div>
                                                    		</a>
                                                		<div class="thumb-info">
                                                        <div class="info">
                                                            <div class="tlt">
	                                                            <a href="#" onclick="fncGoStoragHist('/tv/series/indexTvDetail?vdId=N202104292095&sortCd=&listGb=SRIS_33'); return false;" data-content="N202104292095" data-url="/tv/series/indexTvDetail?vdId=N202104292095&sortCd=&listGb=SRIS_33">
			                                                				힙하다, 힙해! 레게 머리를 한 개 풀리</a>
			                                                		</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            </ul>
                                    </div>
                                    <div class="remote-area">
                                        <button class="swiper-button-next" type="button"></button>
                                        <button class="swiper-button-prev" type="button"></button>
                                    </div>
                                </div>
                                //Swiper
                            </div>
                            popular-wrap
                        </div>
                        //popular-wrap
                        
                    </section>
                    //인기 시리즈 추천 -->
				</div><!-- contents -->
			</div><!-- inr -->
        </main>
        
        <script>
           // Swiper 최근
           var swiperRecent = new Swiper('.popular-list .swiper-container', {
                slidesPerView: 4,
                spaceBetween: 16,
                observer: true,
                observeParents: true,
                watchOverflow:true,
                freeMode: false,
                navigation: {
                    nextEl: '.popular-list .swiper-button-next',
                    prevEl: '.popular-list .swiper-button-prev',
                }
            });
        </script>
        <!-- 플로팅 버튼 -->
        <!-- TWC chatbot Scripts -->
<script src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.plugin.js"></script>


</body>
</html>

<%@ include file="sidebar.jsp"%>
<%@ include file="footer.jsp"%>