<!-- tv_main.jsp의 1317라인 -->

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 
<link rel = "stylesheet" href = "../css/com.css">
<link rel = "stylesheet" href = "../css/common.css">
<link rel = "stylesheet" href = "../css/disp.css">
<link rel = "stylesheet" href = "../css/layout.css">
<link rel = "stylesheet" href = "../css/style.css">
<link rel = "stylesheet" href = "../css/swiper.css">
<link rel = "stylesheet" href = "../css/tv.css">

</head>
<body>

<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
				
<!-- s : 본문영역 -->			
		<input type="hidden" id="totalCnt" value="9"/>
		<input type="hidden" id="dispCornNo" value="1000"/>
		<input type="hidden" id="dispCornNm" value="오늘 뭐 볼까? 고민될 때! "/>
		
		<!-- 바디 - 여기위로 템플릿 -->
		<main class="container page tv homeList" id="container">
			<div class="inr">
				<!-- 본문 -->
				<div class="contents" id="contents">
                    <div class="pc-subtit">
                        <h2>오늘 뭐 볼까? 고민될 때!</h2>
                    </div>

                    <!-- 영상리스트 영역 -->
                   <div class="list-wrap">
                    <ul class="list" id="srisVdoTagList">
	               <c:set var="flag" value="false" />         
                   <c:forEach items="${ rslist }" var="rsitem" varStatus="status"> 
                   <c:if test="${ not flag }">
                        	<li>
	                                <div class="thumb-box">
	                                    <div class="div-header" style="cursor:pointer; list-style:none; display:block;">
	                                        <div class="pic" onclick=<%-- "location.href(series_detail.do?s_code=${rsitem.s_code}&s_season=${rsitem.s_season})" --%>><img src="${rsitem.c_img}" alt=""style="list-style:none;" ></div>
	                                        <div class="tit" onclick="fncGoStoragHist('/tv/series/petTvSeriesList?srisNo=171&sesnNo=1');" style="list-style:none;">${rsitem.s_name} </div>
	                                    </div>
	                                    <div class="div-img"> 
	                                    	<a href="series_detail.do?s_code=${rsitem.s_code}&s_season=${rsitem.s_season}"  class="thumb-img" style="background-image:url(${rsitem.s_img});" style="list-style:none; float:left;" data-content="" data-url="/tv/series/petTvSeriesList?srisNo=&sesnNo=1">
			                                            </a>
	                                    		</div>
	                                    </div>
	                            </li>
	                                    <c:if test="${ status.count ge 19 }">
                        			<c:set var="flag" value="true" />
                       				 </c:if>	
                       				 </c:if>	
	                                   </c:forEach>  
                            <li>
                           </ul>
                    </div>
                    <!-- //영상리스트 영역 -->
                    
<!-- 인기 시리즈 추천 -->
					<section class="popular">
                        <div class="title-area">
                            <h2>펫TV 인기시리즈</h2>
                        </div>

                        <div class="popular-wrap" style="padding-bottom:0;">
                            <div class="ch-profile">
                                <div class="ch-profile-inner">
                                        <div>
                                        	<div class="round-img-pf" onclick="fncGoStoragHist('/tv/series/petTvSeriesList?srisNo=46&sesnNo=1');" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/46/srisProfile/123e3b7d-9152-4d74-80d5-56dd7b6e3686.jpg?type=f&w=144&h=144&quality=100&align=4); cursor:pointer;"></div>
                                            <div class="tit" onclick="fncGoStoragHist('/tv/series/petTvSeriesList?srisNo=46&sesnNo=1');" style="cursor:pointer;">먹킷리스트</div>
                                        </div>
                                </div>
                            </div>
                            
                            <div class="popular-list">
                                <div class="swiper-div k0421">
                                    <div class="swiper-container">
                                        <ul class="swiper-wrapper">
                                        	<li class="swiper-slide">
                                                <div class="thumb-box">
                                                	<a href="#" onclick="fncGoStoragHist('/tv/series/indexTvDetail?vdId=N202104291636&sortCd=&listGb=SRIS_46'); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508000001200905500.jpg?type=f&w=250&h=141&quality=100&align=4);" data-content="N202104291636" data-url="/tv/series/indexTvDetail?vdId=N202104291636&sortCd=&listGb=SRIS_46">
                                                				<div class="time-tag"><span>03:23</span></div>
                                                    		</a>
                                                		<div class="thumb-info">
                                                        <div class="info">
                                                            <div class="tlt">
	                                                            <a href="#" onclick="fncGoStoragHist('/tv/series/indexTvDetail?vdId=N202104291636&sortCd=&listGb=SRIS_46'); return false;" data-content="N202104291636" data-url="/tv/series/indexTvDetail?vdId=N202104291636&sortCd=&listGb=SRIS_46">
			                                                				아마 이십끼형 유민상도 울고 갈걸요?</a>
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
                                <!-- //Swiper -->
                            </div>
                            <!-- popular-wrap -->
                        </div>
                        <!-- //popular-wrap -->
                    </section>
                  <!--   //인기 시리즈 추천 -->
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
<style>
	.contents {
    	width: 100%; 
	}
	.last-wrap{
    	float: left;
	}
	.list{
    	float: left;
    	display: block;
	}
	.img{
		vertical-align:middle;
	}
</style>
</html>

<%@ include file="sidebar.jsp"%>
<%@ include file="footer.jsp"%>