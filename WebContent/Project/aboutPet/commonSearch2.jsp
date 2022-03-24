<%@page import="project.aboutPet.mypage.model.SearchDTO" %>
<%@page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<body>


<% int mem_code = 0;
    if (session.getAttribute("num") != null) {
        mem_code = (int) session.getAttribute("num");
    }
%>
<c:set var="mem_code" value="<%=mem_code%>"></c:set>
<c:if test='${ mem_code eq 0 }'>
    <c:import url="header.jsp"/>
</c:if>
<c:if test='${ mem_code ne 0 }'>
    <c:import url="loginheader.jsp"/>
</c:if>

<%@
        include file="./sidebar.jsp"

%>


<% ArrayList<SearchDTO> topList = new ArrayList<SearchDTO>();
    topList = (ArrayList<SearchDTO>) request.getAttribute("topList");
%>
<script>
    $("#srchWord").focus();


    $(function () {
        <%
        for(int i = 0 ; i<7 ; i++){
            if (topList.get(i).getChangedRank()>0){
               %>
        $(".ranking").eq(<%=i%>).attr("class", "ranking up");
        <%
     }else if(topList.get(i).getChangedRank()<0){
     %>
        $(".ranking").eq(<%=i%>).attr("class", "ranking down");
        <%   
    } else {%>
        $(".ranking").eq(<%=i%>).attr("class", "ranking stay");
        <%

        }
        }
        %>


    })
</script>

<main class="container  page 1dep 2dep" id="container">
    <div class="inr" style="min-height: 354px;">
        <!-- 검색 페이지 -->
        <div class="contents" id="contents">
            <!-- 공통 검색  -->
            <div class="search-wrap">
                <!-- 최근 태그  -->
                <!-- // 최근 태그  -->

                <div class="block-wrap">
                    <!-- 맞춤 추천  -->
                    <!-- 인기 검색어 -->
                    <div class="search-list" style="margin-top:0;">
                        <div class="swiper-container t01">
                            <p class="tit">인기 검색어</p>
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <ul class="item">
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage(' ${topList.get(0).getS_word() }');"
                                               data-content="" data-url="/commonSearch">
                                                <span class="num">1</span>
                                                <p class="txt"><%=topList.get(0).getS_word()%>
                                                </p>
                                                <span id="rnk1"
                                                      class="ranking"><%=Math.abs(topList.get(0).getChangedRank())%></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage(' <%=topList.get(1).getS_word()%>');"
                                               data-content="" data-url="/commonSearch">
                                                <span class="num">2</span>
                                                <p class="txt"><%=topList.get(1).getS_word() %>
                                                </p>
                                                <span id="rnk2"
                                                      class="ranking"><%=Math.abs(topList.get(1).getChangedRank())%></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage('<%=topList.get(2).getS_word()%>');"
                                               data-content="" data-url="/commonSearch">
                                                <span class="num">3</span>
                                                <p class="txt"><%=topList.get(2).getS_word() %>
                                                </p>
                                                <span class="ranking"><%=Math.abs(topList.get(2).getChangedRank())%></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage('<%=topList.get(3).getS_word()%>');"
                                               data-content="" data-url="/commonSearch">
                                                <span class="num">4</span>
                                                <p class="txt"><%=topList.get(3).getS_word()%>
                                                </p>
                                                <span class="ranking"><%=Math.abs(topList.get(3).getChangedRank())%></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage('<%=topList.get(4).getS_word() %>');"
                                               data-content="" data-url="/commonSearch">
                                                <span class="num">5</span>
                                                <p class="txt"><%=topList.get(4).getS_word() %>
                                                </p>
                                                <span class="ranking"><%=Math.abs(topList.get(4).getChangedRank())%></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul class="item">
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage('<%=topList.get(5).getS_word() %>');"
                                               data-content="" data-url="/commonSearch">
                                                <span class="num">6</span>
                                                <p class="txt"><%=topList.get(5).getS_word() %>
                                                </p>
                                                <span class="ranking "><%=Math.abs(topList.get(5).getChangedRank())%></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage('<%=topList.get(6).getS_word() %>');"
                                               data-content="" data-url="/commonSearch">
                                                <span class="num">7</span>
                                                <p class="txt"><%=topList.get(6).getS_word() %>
                                                </p>
                                                <span class="ranking "><%=Math.abs(topList.get(6).getChangedRank())%></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage('--');" data-content=""
                                               data-url="/commonSearch">
                                                <span class="num">8</span>
                                                <p class="txt">--</p>
                                                <span class="ranking "></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage('--');" data-content=""
                                               data-url="/commonSearch">
                                                <span class="num">9</span>
                                                <p class="txt">--</p>
                                                <span class="ranking ">--</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:searchCommon.goResultPage('--');" data-content=""
                                               data-url="/commonSearch">
                                                <span class="num">10</span>
                                                <p class="txt">-</p>
                                                <span class="ranking ">--</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                        <!-- 하단 배너  -->
                        <div class="b-banner">
                            <div class="swiper-container t02 swiper-container-initialized swiper-container-horizontal">
                                <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                                    <div class="swiper-slide swiper-slide-active" style="width: 406px;">
                                        <a class="box" href="/tv/series/petTvSeriesList/?srisNo=154&amp;sesnNo=1"
                                           data-content=""
                                           data-url="/tv/series/petTvSeriesList/?srisNo=154&amp;sesnNo=1">
                                            <img class="mo"
                                                 src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/154/srisImg/b3573553-f827-4ea1-88e0-cee4849fad60.jpg?type=f&amp;w=490&amp;h=279&amp;quality=90&amp;align=4"
                                                 alt="강아지는 키우고 싶은데, 어떻게 해야 할지 걱정이신가요?
처음 강아지를 키우는 초보 견주들이 꼭 알아야 할 정보들만 알차게 모았습니다">
                                        </a>
                                    </div>
                                    <div class="swiper-slide swiper-slide-next" style="width: 406px;">
                                        <a class="box" href="/tv/series/petTvSeriesList/?srisNo=171&amp;sesnNo=1"
                                           data-content=""
                                           data-url="/tv/series/petTvSeriesList/?srisNo=171&amp;sesnNo=1">
                                            <img class="mo"
                                                 src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/171/srisImg/d81d2351-1155-4336-89a2-c99846876054.jpg?type=f&amp;w=490&amp;h=279&amp;quality=90&amp;align=4"
                                                 alt="인기 스타 짱절미가 민박집을 오픈했답니다! 과연 절미네 민박엔 어떤 손님이 찾아 올까요?
소문으로 듣기로는 비글돌로 유명하다는 마마무가 첫 손님이라던데, 절미와 마마무의 캐미 구경오세요!

">
                                        </a>
                                    </div>
                                    <div class="swiper-slide" style="width: 406px;">
                                        <a class="box" href="/tv/series/petTvSeriesList/?srisNo=139&amp;sesnNo=1"
                                           data-content=""
                                           data-url="/tv/series/petTvSeriesList/?srisNo=139&amp;sesnNo=1">
                                            <img class="mo"
                                                 src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/139/srisImg/096727e8-296f-443a-bc39-b4d9d294ca06.jpg?type=f&amp;w=490&amp;h=279&amp;quality=90&amp;align=4"
                                                 alt="스타 중의 스타! 짱절미의 일상을 함께 할래요?">
                                        </a>
                                    </div>
                                    <div class="swiper-slide" style="width: 406px;">
                                        <a class="box" href="/tv/series/petTvSeriesList/?srisNo=160&amp;sesnNo=1"
                                           data-content=""
                                           data-url="/tv/series/petTvSeriesList/?srisNo=160&amp;sesnNo=1">
                                            <img class="mo"
                                                 src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/160/srisImg/fb652856-0089-40aa-96a2-0bd960a026c4.jpg?type=f&amp;w=490&amp;h=279&amp;quality=90&amp;align=4"
                                                 alt="수의사들만 알기 아까운, 집사들이 가장 많이 물어보는 이야기, 아무도 질문하지 않는 이야기 등 수의사들의 수다로 배우자!">
                                        </a>
                                    </div>
                                    <div class="swiper-slide" style="width: 406px;">
                                        <a class="box" href="/tv/series/petTvSeriesList/?srisNo=179&amp;sesnNo=1"
                                           data-content=""
                                           data-url="/tv/series/petTvSeriesList/?srisNo=179&amp;sesnNo=1">
                                            <img class="mo"
                                                 src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/179/srisImg/744249cb-f08a-41e5-9400-603ef011d508.JPG?type=f&amp;w=490&amp;h=279&amp;quality=90&amp;align=4"
                                                 alt="강아지 키워요? 본격 크리에이터들의 반려동물 무논리 토론배틀">
                                        </a>
                                    </div>
                                </div>
                                <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets">
                                    <span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0"
                                          role="button" aria-label="Go to slide 1"></span><span
                                        class="swiper-pagination-bullet" tabindex="0" role="button"
                                        aria-label="Go to slide 2"></span><span class="swiper-pagination-bullet"
                                                                                tabindex="0" role="button"
                                                                                aria-label="Go to slide 3"></span><span
                                        class="swiper-pagination-bullet" tabindex="0" role="button"
                                        aria-label="Go to slide 4"></span><span class="swiper-pagination-bullet"
                                                                                tabindex="0" role="button"
                                                                                aria-label="Go to slide 5"></span></div>
                                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                        </div>
                        <!-- 하단 배너  -->
                    </div>
                    <!-- // 인기 검색어 -->
                </div>
            </div>
            <!-- // 공통 검색  -->
        </div>
        <!-- 검색 페이지 -->
    </div>
    <!-- 	</main> -->


</main>
<%@
        include file="./footer.jsp"

%>

</body>
