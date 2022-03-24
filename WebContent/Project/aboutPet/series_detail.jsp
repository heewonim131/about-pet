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

<link rel = "stylesheet" href = "../css/common.css">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	var sesnText = $("#"+"1").text();
	$(".btSel").text(sesnText);
	$("[name=select_pop_1]").val('1')
});


//시리즈 팝업
function srisOpen(){
	var options = {
		url : "/tv/series/getSeriesList"
		, type : "POST"
		, dataType : "html"
		, data : { }
		, done : function(result){
			$("#srisListPopup").empty()
			$("#srisListPopup").html(result);
			
			if("PC" == "PC"){
				ui.popLayer.open('popSeriesList',{
					ocb:function(){
						$("#srisListPopup .swiper-slide .thumb-box").removeClass('on');
						$("#srisListPopup #srisId_"+$("#srisNo").val()+"_"+$("#sesnNo").val()).addClass('on');
						$("#srisListPopup #srisId_"+$("#srisNo").val()+"_"+$("#sesnNo").val())[0].scrollIntoView();
						$("#srisListPopup #ch_"+$("#srisNo").val())[0].scrollIntoView();
					},
					ccb:function(){
						
					}
				});
			}else{
				ui.popLayer.open('popSeriesList',{
					ocb:function(){
						/*$("#srisListPopup .swiper-slide .thumb-box").removeClass('on');
						$("#srisListPopup #srisId_"+$("#srisNo").val()+"_"+$("#sesnNo").val()).addClass('on');
						$("#srisListPopup #srisId_"+$("#srisNo").val()+"_"+$("#sesnNo").val())[0].scrollIntoView();*/
						
						/* alert($("#srisNo").val());
						var hei = $("#srisListPopup .poptents #ch_"+$("#srisNo").val()).position();
						alert(hei.top);
						alert($("#srisListPopup .in").height());
						hei = hei.top - $("#popSeriesList .in").height();
						alert(hei);
						window.scrollTo({top : hei}); */
						
						
						var onThm = $("#srisId_"+ $("#srisNo").val() +"_"+ $("#sesnNo").val()).offset().top;
						$(".popLayer.a .pct").animate( { scrollTop : $("#srisId_"+ $("#srisNo").val() +"_"+ $("#sesnNo").val()).offset().top - 114 }, 0 );
						
						$(".poptents #srisId_"+ $("#srisNo").val() +"_"+ $("#sesnNo").val()).addClass('on');
						$(".poptents #srisId_"+ $("#srisNo").val() +"_"+ $("#sesnNo").val()).parents(".swiper-container").addClass("find");
						
						var bgSwiper = new Swiper(".swiper-container.find",{	//해당 스와이퍼 변수 찾을 수 없어 다시 그려줌.
							slidesPerView: 'auto',
							observer: true,
							observeParents: true,
							watchOverflow:true,
							freeMode: false
						});
						bgSwiper.slideTo($("#sesnNo").val() - 1, 0);	//스와이퍼는 0부터라 1빼쥼
					},
					ccb:function(){
						
					}
				});
			}
		}
	};
	ajax.call(options);
}
</script>
</head>
<body>


<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
<!-- e : gnb 영역 -->			
<!-- s : LNB 영역 -->
<!-- e : LNB 영역 -->
<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
<!-- s : 본문영역 -->			
		<input type="hidden" id="srisNo" name="srisNo" value="171"/>
		<input type="hidden" id="sesnNo" name="sesnNo" value="1"/>
		<main class="container page tv seriesHome" id="container">
			<div class="inr"> 
                <div class="pageHead k0429">
                    <div class="inr">
                        <div class="hdt">
                            <button class="back" type="button">뒤로가기</button>
                            <div class="pics"><img class="img" src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/171/srisProfile/f976d3b4-fbf1-464e-a201-e5b3b51910cc.png?type=f&w=144&h=144&quality=100&align=4" alt="사진"></div>
                            
                            <h2 class="subtit">${sidto.s_name} </h2>
                        </div>
                        <div class="mdt">
                            <button type="button" onClick="srisOpen();" class="golist">시리즈목록</button>
                        </div>
                    </div>
                </div>
                
				<!-- 본문 -->
				<div class="contents" id="contents">
                    <div class="pc-subtit">
                    	<span class="pics">
                            <img class="img" src="${sidto.c_img}" alt="사진">
                        </span>
                        <h2> ${sidto.s_name} </h2>
                        <div class="mdt">
                            <button type="button" onClick="srisOpen();" class="golist">시리즈목록</button>
                        </div>
                    </div>

                    <!-- 시리즈 배너 -->
                    <section class="main-banner">
                        <div class="thumb-box">
                            <div class="thumb-img s0427" style="background-image:url(${sidto.s_img});">
                            </div>
                            <p class="tlt">${sidto.s_desc}</p>
                        </div>
                    </section>

                    <!-- 시리즈 리스트 -->
					<div class="list-wrap">
						<div class="list-top">
							<!-- select-box -->
	
							<nav class="uisort only_down">
								<button type="button" class="bt st"></button>
								<div class="list">
									<ul class="menu">
										<li id="recently"><button type="button" class="bt" value="v_1">최신순</button></li>
										<li id="popular"><button type="button" class="bt" value="v_2">인기순</button></li>
									</ul>
								</div>
							</nav>
						</div>
						<!-- list-top -->
	
						<div class="list-cont"  id="getVod">
							<ul class="list vodList">
							<c:set var="flag" value="false" />         
                   				<c:forEach items="${ svlist }" var="svitem" varStatus="status"> 
                   				<c:if test="${ not flag }">
								<li>
										<div class="thumb-box"> 
											<div class="div-img">
												<a href="video_detail.do?s_code=${svitem.s_code}&s_season=${svitem.s_season}&v_code=${svitem.v_code}" id="srisIndex_0" class="thumb-img" style="background-image:url(${svitem.v_img});" data-content="" data-url="">
													<div class="time-tag"><span>${svitem.v_time}</span></div>
													</a>
											</div>
											<div class="thumb-info">
												<div class="info">
													<div class="tlt">
														<a href="video_detail.do?s_code=${svitem.s_code}&s_season=${svitem.s_season}&v_code=${svitem.v_code}" data-content="" data-url="">
															${svitem.v_name} </a>
													</div>
													<div class="detail">
														<!--<span class="read play">2,695</span>-->
														<span class="read like">142</span>
													</div>
												</div>
											</div>
										</div>
									</li>
							<c:if test="${ status.count ge 50 }">
                        <c:set var="flag" value="true" />
                        </c:if>
                     </c:if>
                        
                   </c:forEach>  	
										
								</ul>
						</div><!-- list-cont -->
					</div><!-- list-wrap -->
				</div><!-- contents -->
			</div><!-- inr -->
		</main>
		
<div class="seriesHome" id="srisListPopup"><script type="text/javascript">
	function seriesGnbDetail(sris, sesn){
		var callParam = "";
		if($("#callParam").val() != ""){
			if($("#srisNo").val() == sris){
				if("".indexOf("-N") == -1){
					callParam = "&callParam="+$("#callParam").val()+"-N";
				}else{
					callParam = "&callParam="+$("#callParam").val();
				}
			}
		}
		
		var url;
		if(sesn == undefined){
			url = "/tv/series/petTvSeriesList?srisNo="+sris+"&sesnNo=1"+callParam;
		}else{
			url = "/tv/series/petTvSeriesList?srisNo="+sris+"&sesnNo="+sesn+callParam;
		}
		
		location.href = url;
		//storageHist.goBack(url);
	}
</script>






<!-- 시리즈목록 -->

<article class="popLayer a popSeriesList" id="popSeriesList" tabindex="0" style="display: none;">
<div class="pbd">
	<div class="phd">
		<div class="in">
			<h1 class="tit">시리즈 목록</h1>
			<button type="button" class="btnPopClose">닫기</button>
		</div>
	</div>
	<div class="pct" style="height: 867px;">
		<main class="poptents">
        <section>
				<div class="channel-info" id="ch_111">
					<a href="video_detail.do?s_code=1&s_season=1&v_code=1" onclick="" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/111/srisProfile/6e5bc292-31ee-451e-b808-f08a7dea9736.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(111);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(111);">(주목!) 꼬물이 나가신다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_111_1">
									<a href="#" onclick="seriesGnbDetail(111, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/111/aed0bf49-d649-4982-8e54-8e83d92d1e02.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(111, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(111, 1); return false;" data-content="" data-url="seriesGnbDetail(111, 1)">
													하루 하루 몰라 보게 자라는 우리 꼬물이들의 일상, 함께 할까요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_56">
					<a href="#" onclick="seriesGnbDetail(56); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/56/srisProfile/b55635a5-913d-46db-9d1f-fb1a6618f49f.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(56);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(56);">The war</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_56_1">
									<a href="#" onclick="seriesGnbDetail(56, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/56/f0d62f5d-ff89-4764-922d-97259c92ea63.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(56, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>12</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(56, 1); return false;" data-content="" data-url="seriesGnbDetail(56, 1)">
													하루도 조용할 날이 없다. 하루가 멀다하고 싸우는 동물들의 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_56_2">
									<a href="#" onclick="seriesGnbDetail(56, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/56/89ed4e0f-67c0-45af-b67c-ee8077a52ee1.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(56, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>7</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(56, 2); return false;" data-content="" data-url="seriesGnbDetail(56, 2)">
													집사들의 마음을 졸이게 만드는 각종 사연들, 너희 꼭 화해하자</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_57">
					<a href="#" onclick="seriesGnbDetail(57); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/57/srisProfile/43121027-cf5b-4738-9486-13665f0aa0ad.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(57);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(57);">가슴뭉클 감동실화</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_57_1">
									<a href="#" onclick="seriesGnbDetail(57, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/57/1e68ce58-bc42-40bf-a8b8-519f4eb7e908.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(57, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>20</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(57, 1); return false;" data-content="" data-url="seriesGnbDetail(57, 1)">
													※눈물샘 자극 주의※ 동물들이 들려주는 가슴 뭉클한 감동 실화</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_57_2">
									<a href="#" onclick="seriesGnbDetail(57, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/57/5e5ec34f-156e-4400-aec5-3144e6da5caf.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(57, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(57, 2); return false;" data-content="" data-url="seriesGnbDetail(57, 2)">
													무지개다리를 건넌 가족, 친구를 잊지 못해 하염없이 기다리는 동물들의 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_58">
					<a href="#" onclick="seriesGnbDetail(58); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/58/srisProfile/cfbdc076-e454-4567-b1b3-0bccdff86837.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(58);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(58);">개나당신딸이에요 출생의 비밀</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_58_1">
									<a href="#" onclick="seriesGnbDetail(58, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/58/3118e4e1-f918-4b7c-b5d4-84f8e9e07e22.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(58, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>16</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(58, 1); return false;" data-content="" data-url="seriesGnbDetail(58, 1)">
													아침드라마 빰치는 출생의 비밀★ 우리 아빠를 찾습니다.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_119">
					<a href="#" onclick="seriesGnbDetail(119); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/119/srisProfile/8be2c1a4-0980-49c4-ac06-112f92aeec85.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(119);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(119);">개너자이저 열정부자</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_119_1">
									<a href="#" onclick="seriesGnbDetail(119, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/119/22a91fcc-b9a7-4b9a-bf36-1bd58645196b.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(119, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(119, 1); return false;" data-content="" data-url="seriesGnbDetail(119, 1)">
													열정 하나만은 자신 있다! 열정 넘치는 친구들의 일상</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_59">
					<a href="#" onclick="seriesGnbDetail(59); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/59/srisProfile/fa5de25b-073a-4691-bf22-b4fce664754b.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(59);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(59);">개놈프로젝트</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_59_1">
									<a href="#" onclick="seriesGnbDetail(59, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/59/800203af-ed5d-4ccf-aa41-a0d11dc37e3a.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(59, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>16</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(59, 1); return false;" data-content="" data-url="seriesGnbDetail(59, 1)">
													상처받은 동물들의 이상 행동들, 고쳐질 수 있을까요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_59_2">
									<a href="#" onclick="seriesGnbDetail(59, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/59/aa3d7954-da24-4bee-8b62-ec9d58c47969.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(59, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>12</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(59, 2); return false;" data-content="" data-url="seriesGnbDetail(59, 2)">
													너희 너 왜이러는거니? 식탐, 관종, 질투 등 다양한 사유로 하는 이상행동</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_59_3">
									<a href="#" onclick="seriesGnbDetail(59, 3); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/59/679547ef-f764-47fa-94db-04d6ab1642fa.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(59, 3)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌3</strong>
													<em>/</em>
												<span>15</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(59, 3); return false;" data-content="" data-url="seriesGnbDetail(59, 3)">
													견주님들 주목! 분리불안을 어떻게 고칠 수 있을까요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_59_4">
									<a href="#" onclick="seriesGnbDetail(59, 4); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/59/b4685da4-4e71-498b-b3e5-5810305957da.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(59, 4)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌4</strong>
													<em>/</em>
												<span>10</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(59, 4); return false;" data-content="" data-url="seriesGnbDetail(59, 4)">
													본격 문제해결 프로그램 &lt;개과천선&gt; 프로젝트를 실행합니다.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_59_5">
									<a href="#" onclick="seriesGnbDetail(59, 5); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/59/e90969b9-b793-4050-9ead-71a563e660b9.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(59, 5)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌5</strong>
													<em>/</em>
												<span>16</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(59, 5); return false;" data-content="" data-url="seriesGnbDetail(59, 5)">
													귀엽지만… 괜찮은 걸까? 도와줘요 찬종쌤!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
						<button class="swiper-button-prev" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="false"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_178">
					<a href="#" onclick="seriesGnbDetail(178); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/178/srisProfile/f1644968-ac4f-4ac3-a16f-f44aae93c243.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(178);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(178);">개는 이런 집을 꿈꾸집 </div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_178_1">
									<a href="#" onclick="seriesGnbDetail(178, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/178/fea16dbf-386f-461f-8542-e308a9140e47.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(178, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(178, 1); return false;" data-content="" data-url="seriesGnbDetail(178, 1)">
													개는 이런집을 꿈꾸집~
<br>드림하우스, 개꿈집을 소개합니다.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_165">
					<a href="#" onclick="seriesGnbDetail(165); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/165/srisProfile/64eb124a-ef72-4a0e-b428-02680cf22caa.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(165);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(165);">개를 위한 한끼</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_165_1">
									<a href="#" onclick="seriesGnbDetail(165, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/165/372f6e99-c58a-47f5-a635-961fcb7251d4.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(165, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(165, 1); return false;" data-content="" data-url="seriesGnbDetail(165, 1)">
													반려견을 위한 수제간식 레시피를 알려드립니다. </a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_166">
					<a href="#" onclick="seriesGnbDetail(166); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/166/srisProfile/0489cd1f-8a79-4127-81b9-37d85274e371.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(166);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(166);">개린이집 라이프</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_166_1">
									<a href="#" onclick="seriesGnbDetail(166, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/166/af7c74d8-9c56-4a77-b2b1-bb86857f557e.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(166, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(166, 1); return false;" data-content="" data-url="seriesGnbDetail(166, 1)">
													함께사는 보호자도 몰랐던 우리아이의 학교생활! </a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_60">
					<a href="#" onclick="seriesGnbDetail(60); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/60/srisProfile/5c6481c4-824d-4b7a-b6a5-ac0f295f929d.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(60);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(60);">개묘한 이야기</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_60_1">
									<a href="#" onclick="seriesGnbDetail(60, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/60/017c0327-5624-4fa9-a720-1122f419fd4d.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(60, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>11</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(60, 1); return false;" data-content="" data-url="seriesGnbDetail(60, 1)">
													아니 이게 무슨일이?! 미스테리한 일들이 발생했다!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_98">
					<a href="#" onclick="seriesGnbDetail(98); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/98/srisProfile/d221b92f-a748-47ed-abcb-da4dae784507.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(98);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(98);">개묘한 출근</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_98_1">
									<a href="#" onclick="seriesGnbDetail(98, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/98/9ec9c86d-d7c2-4ba2-ac56-799c2079916b.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(98, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(98, 1); return false;" data-content="" data-url="seriesGnbDetail(98, 1)">
													바쁘다, 바빠! 누구보다 부지런한 멍멍이들의 일상</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_61">
					<a href="#" onclick="seriesGnbDetail(61); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/61/srisProfile/3e5676fd-806a-46b3-afb5-471fa61f4e27.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(61);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(61);">개부부</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_61_1">
									<a href="#" onclick="seriesGnbDetail(61, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/61/9c696bc9-06af-45d2-ba33-82763f9c99c0.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(61, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(61, 1); return false;" data-content="" data-url="seriesGnbDetail(61, 1)">
													개부부들의 심창치않은 일상을 소개합니다.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_62">
					<a href="#" onclick="seriesGnbDetail(62); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/62/srisProfile/4b18dd31-68ae-4f4f-a8f5-1f96d947cdbb.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(62);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(62);">거절은 거절한다. 간택</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_62_1">
									<a href="#" onclick="seriesGnbDetail(62, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/62/760ac4db-d14a-4f6c-856a-7ae6cb7eed70.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(62, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>19</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(62, 1); return false;" data-content="" data-url="seriesGnbDetail(62, 1)">
													너 나의 집사가 되어라! 간택당한 집사들의 기상 천외한 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_63">
					<a href="#" onclick="seriesGnbDetail(63); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/63/srisProfile/7f66db6b-42fb-459b-89e4-93c2a6ca4780.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(63);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(63);">견생은 아름다워</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_63_1">
									<a href="#" onclick="seriesGnbDetail(63, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/63/7576daab-283d-4dec-bb44-ca3957024903.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(63, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>19</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(63, 1); return false;" data-content="" data-url="seriesGnbDetail(63, 1)">
													너희가 있어 다행이야, 마음 따듯하고 고마운 동물들의 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_148">
					<a href="#" onclick="seriesGnbDetail(148); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/148/srisProfile/fd5afd85-6208-4613-8509-9d02917fa343.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(148);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(148);">견주가 꼭 알아야할 6대 질환</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_148_1">
									<a href="#" onclick="seriesGnbDetail(148, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/148/011613c3-6fd9-4a5f-b2cb-fdf681f39835.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(148, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(148, 1); return false;" data-content="" data-url="seriesGnbDetail(148, 1)">
													미리 미리 예방합시다. 수의사가 알려주는 정보들, 꼭곡 기억해주세요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_64">
					<a href="#" onclick="seriesGnbDetail(64); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/64/srisProfile/81818f9f-4d65-48ff-8546-1ce793b266d7.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(64);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(64);">고대만</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_64_1">
									<a href="#" onclick="seriesGnbDetail(64, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/64/f2caab66-1087-488b-92df-90f8628ddd3d.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(64, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>9</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(64, 1); return false;" data-content="" data-url="seriesGnbDetail(64, 1)">
													나만없어 고양이.. 랜선 집사님들을 위해 준비했습니다.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_156">
					<a href="#" onclick="seriesGnbDetail(156); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/156/srisProfile/e7c2fc8c-51ed-4182-bb47-bbca57e805a8.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(156);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(156);">고양이는 왜?</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_156_1">
									<a href="#" onclick="seriesGnbDetail(156, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/156/77a7040b-b5fc-4e73-af9c-87d5a891e8a9.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(156, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(156, 1); return false;" data-content="" data-url="seriesGnbDetail(156, 1)">
													아기고양이들과 함께 알아보는 고양이는 왜?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_175">
					<a href="#" onclick="seriesGnbDetail(175); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/175/srisProfile/1d62658f-c513-4004-8455-151576f2d673.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(175);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(175);">고양이는 이런 집을 꿈꾸집</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_175_1">
									<a href="#" onclick="seriesGnbDetail(175, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/175/c0ed32b2-819e-4309-84b3-9750d19b25d6.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(175, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(175, 1); return false;" data-content="" data-url="seriesGnbDetail(175, 1)">
													집사야 이 집을 보거라
<br> 나도 이런곳에 살고싶다~</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_65">
					<a href="#" onclick="seriesGnbDetail(65); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/65/srisProfile/aacc5bc4-3363-4cd8-934e-a59d61cd16db.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(65);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(65);">고양이들의 도시</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_65_1">
									<a href="#" onclick="seriesGnbDetail(65, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/65/f9b08421-7c1b-4712-abeb-4356ce6da285.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(65, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>11</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(65, 1); return false;" data-content="" data-url="seriesGnbDetail(65, 1)">
													우리는 호기심 많고,  똑똑한 길 고양이! 길고양이로 살아남기!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_1">
					<a href="#" onclick="seriesGnbDetail(1); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/1/srisProfile/5ff5cd86-82e7-4a95-a185-45e52c24caf3.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(1);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(1);">구조 전 후</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_1_1">
									<a href="#" onclick="seriesGnbDetail(1, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/1/ca07c2c2-f0cb-4558-b7e8-9796e1a4349b.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(1, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>21</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(1, 1); return false;" data-content="" data-url="seriesGnbDetail(1, 1)">
													위기의 상황에서 구조된 아이들의 Before&amp;After</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_2">
					<a href="#" onclick="seriesGnbDetail(2); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/2/srisProfile/a0e33b22-8fef-4ef1-9ecc-19026b846db6.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(2);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(2);">구조해주세요 골든타임</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_2_1">
									<a href="#" onclick="seriesGnbDetail(2, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/2/ce7c37d1-d554-4aae-8821-2255fc5e12ac.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(2, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>13</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(2, 1); return false;" data-content="" data-url="seriesGnbDetail(2, 1)">
													일초가 긴급한 구조 현장,위기에 빠진 고양이를 구하라!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_2_2">
									<a href="#" onclick="seriesGnbDetail(2, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/2/14c25497-9997-4447-8203-ec8692612eb0.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(2, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>9</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(2, 2); return false;" data-content="" data-url="seriesGnbDetail(2, 2)">
													이번에도 잘 구해낼 수 있을까..? 함께 기도해주세요</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_3">
					<a href="#" onclick="seriesGnbDetail(3); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/3/srisProfile/b5c6fd45-68ba-463d-b03c-b0c5e9d32491.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(3);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(3);">구조해주세요 위기의 개</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_3_1">
									<a href="#" onclick="seriesGnbDetail(3, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/3/eb614c05-708f-4b6e-850b-c1a9200874bb.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(3, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>18</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(3, 1); return false;" data-content="" data-url="seriesGnbDetail(3, 1)">
													위기에 빠진 강아지들, 그리고 그들을 구하기 위해 모인 사람들의 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_3_2">
									<a href="#" onclick="seriesGnbDetail(3, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/3/88c503f2-3f81-4312-931a-725fe65e0b9b.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(3, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>17</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(3, 2); return false;" data-content="" data-url="seriesGnbDetail(3, 2)">
													무슨 일이 있었던 거야..? 
<br>한마리도 빠짐 없이 구하기 위해 모인 사람들의 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_4">
					<a href="#" onclick="seriesGnbDetail(4); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/4/srisProfile/db722228-a74a-40b9-8a78-612049ca2e14.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(4);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(4);">귀여운 중입니다. 꼬물이</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_4_1">
									<a href="#" onclick="seriesGnbDetail(4, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/4/f15b7a45-78d3-41b7-bbbd-44cc1a3d641a.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(4, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>10</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(4, 1); return false;" data-content="" data-url="seriesGnbDetail(4, 1)">
													이렇게 귀엽기 있냐? 입구는 있지만 출구는 없는 꼬물이 시리즈!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_157">
					<a href="#" onclick="seriesGnbDetail(157); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/157/srisProfile/f05b9748-908c-41a2-98be-6e57342c66c2.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(157);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(157);">귀여워서 못버려 하드털이</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_157_1">
									<a href="#" onclick="seriesGnbDetail(157, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/157/ce745a7f-9799-4339-a59d-11517e8e575e.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(157, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(157, 1); return false;" data-content="" data-url="seriesGnbDetail(157, 1)">
													편집자만 보기에는 아쉬운 영상들을 
<br>모으고 또 모아 대공개!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_176">
					<a href="#" onclick="seriesGnbDetail(176); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/176/srisProfile/5f236db8-d7ed-41fd-98dc-6aa1bbaaa23e.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(176);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(176);">극한견주</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_176_1">
									<a href="#" onclick="seriesGnbDetail(176, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/176/23821c02-c093-4a24-9e7e-effd6ea108da.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(176, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(176, 1); return false;" data-content="" data-url="seriesGnbDetail(176, 1)">
													극한 견주의 삶, 정말 웹툰에서 보던 그대로일까?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_150">
					<a href="#" onclick="seriesGnbDetail(150); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/150/srisProfile/53e4ea84-92d8-45bd-aa35-4da59f873a08.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(150);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(150);">길냥이에서 우주대스타로 히끄네 집</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_150_1">
									<a href="#" onclick="seriesGnbDetail(150, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/150/72054ce9-91e5-4cf3-8493-1bba4ec7f59e.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(150, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(150, 1); return false;" data-content="" data-url="seriesGnbDetail(150, 1)">
													냥생역전! 길냥이에서 우주대스타로. 그 주인공은?!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_161">
					<a href="#" onclick="seriesGnbDetail(161); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/161/srisProfile/e83d1366-42b1-41a2-9b17-516bbb0af72d.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(161);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(161);">김수민의 동물뉴스</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_161_1">
									<a href="#" onclick="seriesGnbDetail(161, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/161/6b34df4d-4c88-47bc-9c3d-381bc6cb5ea9.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(161, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(161, 1); return false;" data-content="" data-url="seriesGnbDetail(161, 1)">
													아나운서 김수민이 알려주는 동물뉴스!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_143">
					<a href="#" onclick="seriesGnbDetail(143); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/143/srisProfile/5f39be38-a7e3-4c22-97c1-a2f9b25b7936.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(143);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(143);">김재경의 건강한 개밥</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_143_1">
									<a href="#" onclick="seriesGnbDetail(143, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/143/fff9aa8d-09c8-4dc3-a55a-5a1af45e02f9.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(143, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(143, 1); return false;" data-content="" data-url="seriesGnbDetail(143, 1)">
													우리 아이들은 건강한 것만 먹이고 싶은 주인의 마음! 건강한 개밥 만들기 배워보아요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_5">
					<a href="#" onclick="seriesGnbDetail(5); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/5/srisProfile/6d4e29b1-532d-4291-8cf0-faa6927869b8.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(5);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(5);">까꿍 리트리버</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_5_1">
									<a href="#" onclick="seriesGnbDetail(5, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/5/ff4bd470-404d-4301-aa36-4309f8772c56.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(5, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>10</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(5, 1); return false;" data-content="" data-url="seriesGnbDetail(5, 1)">
													원조 인절미 댕댕이들의 어린 시절 모음집.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_130">
					<a href="#" onclick="seriesGnbDetail(130); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/130/srisProfile/4bb870c8-8167-40bf-8090-cf6415a3bc46.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(130);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(130);">꼬꼬마 집사와 동물들</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_130_1">
									<a href="#" onclick="seriesGnbDetail(130, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/130/f26b8989-88c1-4885-951f-df01546a33c9.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(130, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(130, 1); return false;" data-content="" data-url="seriesGnbDetail(130, 1)">
													아기와 동물, 반드시 성공하는 조합이죠? 귀여워도 너무 귀여운 일상들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_6">
					<a href="#" onclick="seriesGnbDetail(6); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/6/srisProfile/26c6015a-e5ff-4bd9-b751-2f1653463dcd.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(6);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(6);">나는 거위 닭</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_6_1">
									<a href="#" onclick="seriesGnbDetail(6, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/6/00590b6b-15d9-468d-b1b8-f2b2a1b54de2.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(6, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(6, 1); return false;" data-content="" data-url="seriesGnbDetail(6, 1)">
													거위는 처음이죠? 매력적인 거위들의 이야기.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_94">
					<a href="#" onclick="seriesGnbDetail(94); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/94/srisProfile/a9192b8d-10be-4045-ab19-fde0f06efb8b.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(94);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(94);">나는 지옥안내견과 산다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_94_1">
									<a href="#" onclick="seriesGnbDetail(94, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/94/90351a2a-2c05-4f02-a6a2-4dd74f545348.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(94, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(94, 1); return false;" data-content="" data-url="seriesGnbDetail(94, 1)">
													집사를 지옥으로(?) 안내하는 똥꼬발랄한 강아지들의 일상 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_85">
					<a href="#" onclick="seriesGnbDetail(85); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/85/srisProfile/28aedf28-8ec0-4b0f-8968-4f802377503d.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(85);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(85);">나를 만져라 이웃집 관종 백호</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_85_1">
									<a href="#" onclick="seriesGnbDetail(85, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/85/3adb1979-9788-48d6-b4e0-88dab03c4c0b.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(85, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(85, 1); return false;" data-content="" data-url="seriesGnbDetail(85, 1)">
													이웃집 최고의 관종 강백호,SNS 스타견 웰시코기 백호 시리즈.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_112">
					<a href="#" onclick="seriesGnbDetail(112); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/112/srisProfile/b318caf0-eef2-411b-94cf-5b74e8ba01b7.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(112);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(112);">나를 미치게 하는 것들</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_112_1">
									<a href="#" onclick="seriesGnbDetail(112, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/112/2796f14f-d299-4955-bdfe-7d0b0cfaa707.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(112, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(112, 1); return false;" data-content="" data-url="seriesGnbDetail(112, 1)">
													하나에 푹 빠진 우리 멍멍이 친구들, 이 친구들 과연 왜 이러는걸까요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_7">
					<a href="#" onclick="seriesGnbDetail(7); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/7/srisProfile/afcb844a-369f-47ff-8a4e-f92caeaf3851.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(7);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(7);">나를 키우시개 간택</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_7_1">
									<a href="#" onclick="seriesGnbDetail(7, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/7/5b158bcf-c4b5-4ae5-8d6a-f05068cbea39.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(7, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>11</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(7, 1); return false;" data-content="" data-url="seriesGnbDetail(7, 1)">
													강아지들에게 집사로 간택된 사람들의 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_8">
					<a href="#" onclick="seriesGnbDetail(8); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/8/srisProfile/308c9a86-bdab-4f2f-b28c-9402d83e16b0.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(8);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(8);">나의 노견 - 디어 마이 올드독</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_8_1">
									<a href="#" onclick="seriesGnbDetail(8, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/8/35271fc6-d337-46bf-b295-d587b5caf457.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(8, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(8, 1); return false;" data-content="" data-url="seriesGnbDetail(8, 1)">
													함께한 세월이 오래된 만큼 추억도 가득하죠. 올드독들을 위하여.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_9">
					<a href="#" onclick="seriesGnbDetail(9); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/9/srisProfile/3cb39a43-3f44-4cf3-8e8e-23c065db614d.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(9);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(9);">날 보러 와요</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_9_1">
									<a href="#" onclick="seriesGnbDetail(9, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/9/32317c96-ec60-4dcd-ac7d-7c05df455f7f.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(9, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>22</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(9, 1); return false;" data-content="" data-url="seriesGnbDetail(9, 1)">
													곳곳의 매력쟁이 마스코트 동물들의 이야기.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_114">
					<a href="#" onclick="seriesGnbDetail(114); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/114/srisProfile/0a8a6c0f-e8a7-42c1-a1cc-46bda98da8cc.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(114);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(114);">내 몸은 고장났다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_114_1">
									<a href="#" onclick="seriesGnbDetail(114, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/114/497c144b-e097-41af-81d5-69b3f7dee63d.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(114, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(114, 1); return false;" data-content="" data-url="seriesGnbDetail(114, 1)">
													이 친구들.. 도대체 왜 이러는걸까요? 특이한 행동들의 이유를 찾아보자!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_12">
					<a href="#" onclick="seriesGnbDetail(12); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/12/srisProfile/67c82387-ad4c-4142-b6fc-06ca9df1fc8c.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(12);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(12);">내가뭘잘못했니 아웃사이더</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_12_1">
									<a href="#" onclick="seriesGnbDetail(12, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/12/20649849-8663-4a8e-bc62-d5603a4bd7c7.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(12, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(12, 1); return false;" data-content="" data-url="seriesGnbDetail(12, 1)">
													가슴아픈 아웃사이더들의 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_95">
					<a href="#" onclick="seriesGnbDetail(95); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/95/srisProfile/a4f17839-853e-446d-8cbf-c7cb5aad2029.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(95);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(95);">냥냥 대가족</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_95_1">
									<a href="#" onclick="seriesGnbDetail(95, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/95/ed587e72-f588-47f9-8c68-f3b8585a28c6.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(95, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(95, 1); return false;" data-content="" data-url="seriesGnbDetail(95, 1)">
													여러 고양이들이 함께 산다면 어떤 일이 생길까요?! 그 다양한 사건들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_11">
					<a href="#" onclick="seriesGnbDetail(11); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/11/srisProfile/5348344d-522e-417d-8933-8711bc58eb6e.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(11);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(11);">너 사람인줄 아냥</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_11_1">
									<a href="#" onclick="seriesGnbDetail(11, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/11/2ddec6da-afa2-4c79-9efa-ec11e9861e8c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(11, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>7</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(11, 1); return false;" data-content="" data-url="seriesGnbDetail(11, 1)">
													너희 증말로 사람아니냥?! 사람같은 고양이들만 모았다!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_13">
					<a href="#" onclick="seriesGnbDetail(13); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/13/srisProfile/a40b0181-e9b1-4dfe-b296-596b3c4bcbb4.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(13);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(13);">너라는 기적 미라클</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_13_1">
									<a href="#" onclick="seriesGnbDetail(13, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/13/83116ad7-1161-4ac2-9333-4723fa63df4a.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(13, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(13, 1); return false;" data-content="" data-url="seriesGnbDetail(13, 1)">
													세상에 기적이 존재한다면.. 동물들에게 일어난 기적같은 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_14">
					<a href="#" onclick="seriesGnbDetail(14); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/14/srisProfile/57f30d59-5d8f-45c7-b7f1-04a63313234b.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(14);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(14);">넌 나의 소울메이트</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_14_1">
									<a href="#" onclick="seriesGnbDetail(14, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/14/c45e376f-73f0-4508-b359-74de32b2503f.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(14, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>14</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(14, 1); return false;" data-content="" data-url="seriesGnbDetail(14, 1)">
													우린 영원히 함께야.. 동물들의 찐-한 우정 스토리</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_15">
					<a href="#" onclick="seriesGnbDetail(15); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/15/srisProfile/ec46bbca-6751-47c2-b1d7-5e5fd34a5444.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(15);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(15);">넌 나의 스타</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_15_1">
									<a href="#" onclick="seriesGnbDetail(15, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/15/de85542f-d8a2-4ccd-b3fc-b9c5bb84f9dc.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(15, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(15, 1); return false;" data-content="" data-url="seriesGnbDetail(15, 1)">
													유기동물을 입양한 스타와 동물들의 감동 스토리</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_16">
					<a href="#" onclick="seriesGnbDetail(16); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/16/srisProfile/56a02b4a-07b9-49e7-a247-d0f6c560004c.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(16);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(16);">널 보낼 수 있을까</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_16_1">
									<a href="#" onclick="seriesGnbDetail(16, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/16/8c497bc8-5b17-4031-b0e4-92b9a96c551e.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(16, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>9</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(16, 1); return false;" data-content="" data-url="seriesGnbDetail(16, 1)">
													눈물없이 볼 수 없는 반려동물과의 이별의 순간들</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_86">
					<a href="#" onclick="seriesGnbDetail(86); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/86/srisProfile/ce796138-b0d2-46a3-a8ce-3281e19cd9ee.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(86);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(86);">뇌색묘 뽀양이 '나도 길냥이였어요'</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_86_1">
									<a href="#" onclick="seriesGnbDetail(86, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/86/51433690-0c12-4707-8945-925ff0ffca32.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(86, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(86, 1); return false;" data-content="" data-url="seriesGnbDetail(86, 1)">
													집사 만나서 묘생역전한 천재냥이 뽀양이
<br>'저도 한 때는 길냥이였답니다'</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_17">
					<a href="#" onclick="seriesGnbDetail(17); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/17/srisProfile/8f26f299-e4b3-4e92-a728-0befc1220a8b.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(17);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(17);">니가 왜 거기서 살아?</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_17_1">
									<a href="#" onclick="seriesGnbDetail(17, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/17/d9036c62-51f8-49d2-9f41-f99fec8c556f.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(17, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>9</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(17, 1); return false;" data-content="" data-url="seriesGnbDetail(17, 1)">
													생각치도 못한 곳에 살고있는 고양이들, 더 좋은 보금자리를 찾아줘요!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_18">
					<a href="#" onclick="seriesGnbDetail(18); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/18/srisProfile/66375969-794a-430b-85eb-01388d768ea3.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(18);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(18);">다이어트 오늘부터1일</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_18_1">
									<a href="#" onclick="seriesGnbDetail(18, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/18/5a638d0b-5838-49d3-b474-f38811eaf33d.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(18, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>10</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(18, 1); return false;" data-content="" data-url="seriesGnbDetail(18, 1)">
													동물들도 다이어트가 필요해~! 귀엽지만 다이어트가 필요한 아이들 함께보시죠.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_164">
					<a href="#" onclick="seriesGnbDetail(164); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/164/srisProfile/fddd8fc1-398f-41b2-af4c-c19d43903b5d.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(164);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(164);">달라도 너무 다른 우리</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_164_1">
									<a href="#" onclick="seriesGnbDetail(164, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/164/07ab6313-c451-423b-9252-ecdf76f002e1.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(164, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(164, 1); return false;" data-content="" data-url="seriesGnbDetail(164, 1)">
													같은 질문에 대한 반려인들의 다른 대화들</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_163">
					<a href="#" onclick="seriesGnbDetail(163); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/163/srisProfile/b4a35c4c-9fb0-43fc-a71f-8c8a93b67f7a.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(163);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(163);">댕댕공방</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_163_1">
									<a href="#" onclick="seriesGnbDetail(163, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/163/c1bac7fd-3cc8-4903-b50b-ae9e7b007038.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(163, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(163, 1); return false;" data-content="" data-url="seriesGnbDetail(163, 1)">
													내 반려동물의 악세서리는 내가 직접만든다! 우리집 반려동물을 위한 제품 만들기 DIY 를 알려드립니다. </a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_145">
					<a href="#" onclick="seriesGnbDetail(145); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/145/srisProfile/1bbede80-7f36-42c4-b3ec-40ead62d922d.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(145);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(145);">도그 트래블러</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_145_1">
									<a href="#" onclick="seriesGnbDetail(145, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/145/a5d3b642-07f4-4d30-b947-59c92549c73c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(145, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(145, 1); return false;" data-content="" data-url="seriesGnbDetail(145, 1)">
													댕댕이와 함께 떠나요, 모두의 로망을 실현 시켜줄게요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_162">
					<a href="#" onclick="seriesGnbDetail(162); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/162/srisProfile/92b37cd6-cfd1-435b-9b9e-b61983414b97.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(162);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(162);">도그멘터리</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_162_1">
									<a href="#" onclick="seriesGnbDetail(162, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/162/cae5a2c6-aa84-479b-87ba-16ea10ff7304.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(162, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(162, 1); return false;" data-content="" data-url="seriesGnbDetail(162, 1)">
													지금은 개는 어떻게 사람의 가장 친한 친구가 될 수 있었던 걸까? 개에 대한 모든 것을 알려 드립니다. </a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_84">
					<a href="#" onclick="seriesGnbDetail(84); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/84/srisProfile/f62e3fea-641c-4f95-a960-1d6bc3919814.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(84);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(84);">도그인사이드</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_84_1">
									<a href="#" onclick="seriesGnbDetail(84, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/84/85f6f980-edc5-4ecd-afe4-25663b95fd3c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(84, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(84, 1); return false;" data-content="" data-url="seriesGnbDetail(84, 1)">
													반려견이 보는 세상도 사람과 같을까? 개의 시선으로 본 하루.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_19">
					<a href="#" onclick="seriesGnbDetail(19); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/19/srisProfile/9d15dc45-72cc-46a4-a836-ac6686126e60.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(19);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(19);">동물 속담 탐구</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_19_1">
									<a href="#" onclick="seriesGnbDetail(19, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/19/77acc736-72c1-4cbd-9280-6a1d3bd13846.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(19, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(19, 1); return false;" data-content="" data-url="seriesGnbDetail(19, 1)">
													동물들의 이야기로 배우는 동물 속담 탐구!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_38">
					<a href="#" onclick="seriesGnbDetail(38); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(38);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(38);">동물원에서 생긴일</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_38_1">
									<a href="#" onclick="seriesGnbDetail(38, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/38/8a087cfb-2769-4ab7-b40d-1d51fc180293.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(38, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>19</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(38, 1); return false;" data-content="" data-url="seriesGnbDetail(38, 1)">
													동물친구들이 잔뜩 모인 동물원, 그 기상천외한 사건들.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_39">
					<a href="#" onclick="seriesGnbDetail(39); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/39/srisProfile/b88d5739-68ba-4bac-b41f-ad1278aaca59.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(39);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(39);">때가족</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_39_1">
									<a href="#" onclick="seriesGnbDetail(39, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/39/53c2810b-732e-4ca8-9d41-88f0db822e5f.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(39, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>10</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(39, 1); return false;" data-content="" data-url="seriesGnbDetail(39, 1)">
													많으면 많을수록 좋다! 북적북적 대가족들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_40">
					<a href="#" onclick="seriesGnbDetail(40); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/40/srisProfile/f63d9836-9022-4879-ad2f-48844ce5c32f.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(40);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(40);">떠돌이개 방랑의 이유</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_40_1">
									<a href="#" onclick="seriesGnbDetail(40, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/40/68dcf505-66e7-4f5a-9018-b7ff03e866b8.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(40, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>11</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(40, 1); return false;" data-content="" data-url="seriesGnbDetail(40, 1)">
													강아지들의 이유있는 떠돌이… 그 이유를 찾아보자</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_40_2">
									<a href="#" onclick="seriesGnbDetail(40, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/40/feb4234b-7650-4805-bfe6-89a4c88023c5.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(40, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>7</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(40, 2); return false;" data-content="" data-url="seriesGnbDetail(40, 2)">
													어쩌다가…? 떠돌이개들의 이유 있는 사연들.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_41">
					<a href="#" onclick="seriesGnbDetail(41); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/41/srisProfile/832a1b7b-55cb-4daa-ab52-b85066ed6c3b.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(41);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(41);">떠돌이개- 한끼줍쇼</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_41_1">
									<a href="#" onclick="seriesGnbDetail(41, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/41/fc7f4af2-d40d-4823-892c-aa3d1532a700.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(41, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>7</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(41, 1); return false;" data-content="" data-url="seriesGnbDetail(41, 1)">
													합 입만 달라멍' 밥동냥 다니는 길 위 친구들의 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_42">
					<a href="#" onclick="seriesGnbDetail(42); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/42/srisProfile/ecfccda7-3ff6-4526-97e6-440219f9fc4f.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(42);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(42);">똥개 지오그래피</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_42_1">
									<a href="#" onclick="seriesGnbDetail(42, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/42/fba32930-abad-478b-8e7d-090e28d0d43c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(42, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(42, 1); return false;" data-content="" data-url="seriesGnbDetail(42, 1)">
													저는 공기좋고~ 물좋은~ 컨츄리에 사는 시고르R자브종입니다.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_43">
					<a href="#" onclick="seriesGnbDetail(43); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/43/srisProfile/27a77eaa-2b09-4e23-903c-5cb156195c91.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(43);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(43);">뚱냥이로 산다는것</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_43_1">
									<a href="#" onclick="seriesGnbDetail(43, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/43/5f56d18c-e53b-43c5-9648-43ae7b8f1c09.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(43, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(43, 1); return false;" data-content="" data-url="seriesGnbDetail(43, 1)">
													왕 크니까 왕 귀엽다냥. 귀엽지만 운동이 필요한 뚱냥이들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_44">
					<a href="#" onclick="seriesGnbDetail(44); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/44/srisProfile/b3505bfd-b0b8-40e2-bf57-fb821e02a5d0.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(44);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(44);">러브스토리</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_44_1">
									<a href="#" onclick="seriesGnbDetail(44, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/44/555765d9-01b1-467e-af10-0efcb735b4d2.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(44, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>15</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(44, 1); return false;" data-content="" data-url="seriesGnbDetail(44, 1)">
													우리라고 사랑을 모르지 않아요.
<br>쓸쓸한 당신, 진한 로멘스 한 편 어떠신가요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_45">
					<a href="#" onclick="seriesGnbDetail(45); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/45/srisProfile/60ad8ae4-cf74-4f3a-931a-cf0d4d35643a.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(45);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(45);">마하견야 바라간식 절에 산다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_45_1">
									<a href="#" onclick="seriesGnbDetail(45, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/45/0f5dbf4f-ffd3-40ad-8e3a-efa1774f6e24.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(45, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(45, 1); return false;" data-content="" data-url="seriesGnbDetail(45, 1)">
													우리는 어쩌다 절에 산다!
<br>절에서 벌어지는 동물들과 스님의 따뜻한 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_158">
					<a href="#" onclick="seriesGnbDetail(158); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/158/srisProfile/66968c12-7f0e-42f1-9b32-6c39e22a35f3.png?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(158);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(158);">만초의 법칙: 고양이</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_158_1">
									<a href="#" onclick="seriesGnbDetail(158, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/158/77c23e14-1acf-44d2-8624-fdfafd712abb.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(158, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>10</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(158, 1); return false;" data-content="" data-url="seriesGnbDetail(158, 1)">
													집사를 꿈꾸고 계신가요? 혹은 이미 집사이신가요?
<br>냥님을 모시는 것만큼 준비도 중요합니다^^
<br>좋은 집사가 되기 위해 봐야할 만초의법칙 고양이 시리즈, 시작합니다!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_158_2">
									<a href="#" onclick="seriesGnbDetail(158, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/158/46d0ab41-60f7-427f-a346-6f653e583031.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(158, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(158, 2); return false;" data-content="" data-url="seriesGnbDetail(158, 2)">
													초보 집사가 된 당신! 
<br>냥님 모시기 이제 한달차! 
<br>초보 집사에게 꼭 필요한 정보들만 가득해요 :) </a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_154">
					<a href="#" onclick="seriesGnbDetail(154); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/154/srisProfile/7e6294ff-c860-41ad-83e4-035952993bfa.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(154);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(154);">만초의법칙: 강아지</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_154_1">
									<a href="#" onclick="seriesGnbDetail(154, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/154/7a109613-e12b-4ce0-acda-c8523e26b236.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(154, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>12</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(154, 1); return false;" data-content="" data-url="seriesGnbDetail(154, 1)">
													강아지는 키우고 싶은데, 어떻게 해야 할지 걱정이신가요?
<br>처음 강아지를 키우는 초보 견주들이 꼭 알아야 할 정보들만 알차게 모았습니다</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_46">
					<a href="#" onclick="seriesGnbDetail(46); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/46/srisProfile/123e3b7d-9152-4d74-80d5-56dd7b6e3686.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(46);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(46);">먹킷리스트</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_46_1">
									<a href="#" onclick="seriesGnbDetail(46, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/46/87df318c-5886-408c-8401-d754bb4d6d8c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(46, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(46, 1); return false;" data-content="" data-url="seriesGnbDetail(46, 1)">
													금강산도 식후경이다! 먹는 거 하나는 자신 있는 친구들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_96">
					<a href="#" onclick="seriesGnbDetail(96); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/96/srisProfile/5ad7919e-042b-4a08-89d1-92e86d815b61.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(96);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(96);">멍멍 대가족</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_96_1">
									<a href="#" onclick="seriesGnbDetail(96, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/96/43acb723-3824-4bf4-ba25-33dab5a0b3aa.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(96, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(96, 1); return false;" data-content="" data-url="seriesGnbDetail(96, 1)">
													여러 강아지들이 함께 산다면 어떤 일이 생길까?! 그 다양한 스토리들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_160">
					<a href="#" onclick="seriesGnbDetail(160); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/160/srisProfile/8c3f1210-ee28-49d4-a22e-f38a73cff8e9.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(160);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(160);">믿고 듣는 수의사 수다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_160_1">
									<a href="#" onclick="seriesGnbDetail(160, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/160/574e6afb-0588-4b32-81c8-062601affce9.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(160, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>15</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(160, 1); return false;" data-content="" data-url="seriesGnbDetail(160, 1)">
													수의사들만 알기 아까운, 집사들이 가장 많이 물어보는 이야기, 아무도 질문하지 않는 이야기 등 수의사들의 수다로 배우자!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_160_2">
									<a href="#" onclick="seriesGnbDetail(160, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/160/a87ae652-79f8-458e-8f0d-6c09b60dd658.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(160, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌 2</strong>
													<em>/</em>
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(160, 2); return false;" data-content="" data-url="seriesGnbDetail(160, 2)">
													수의사들만 알기 아까운, 집사들이 가장 많이 물어보는 믿수다 꿀정보
<br>&lt;믿고 듣는 수의사 수다&gt; 시즌2 시작합니다!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_47">
					<a href="#" onclick="seriesGnbDetail(47); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/47/srisProfile/ad5fcdbf-a463-46bc-b422-11b5884ac0e9.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(47);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(47);">벽속의 고양이</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_47_1">
									<a href="#" onclick="seriesGnbDetail(47, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/47/dab79514-2cee-4c41-a317-17d25c66c3b3.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(47, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(47, 1); return false;" data-content="" data-url="seriesGnbDetail(47, 1)">
													긴박한 구조의 순간, 안전하게 구할 수 있을까요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_142">
					<a href="#" onclick="seriesGnbDetail(142); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/142/srisProfile/ee9f327f-28f5-405e-9050-509f9d2ae8b8.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(142);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(142);">변코치 상담소</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_142_1">
									<a href="#" onclick="seriesGnbDetail(142, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/142/18e1313f-0f13-4481-8445-27514a75848b.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(142, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(142, 1); return false;" data-content="" data-url="seriesGnbDetail(142, 1)">
													도와줘요! 코치님! 상담이 필요한 멍멍이들을 모았어요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_48">
					<a href="#" onclick="seriesGnbDetail(48); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/48/srisProfile/213bed01-d975-48a4-8f0a-5a4ff0e8d32b.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(48);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(48);">별나다 별나 개취입니다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_48_1">
									<a href="#" onclick="seriesGnbDetail(48, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/48/d1748bcf-ed7e-4054-b464-8a7b14fdaa9c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(48, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>18</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(48, 1); return false;" data-content="" data-url="seriesGnbDetail(48, 1)">
													이런걸 좋아한다고? 멍멍이들의 별난 취향들 모음집.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_48_2">
									<a href="#" onclick="seriesGnbDetail(48, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/48/fea37f2a-bdc1-4af3-a9d4-e12b09747590.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(48, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>11</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(48, 2); return false;" data-content="" data-url="seriesGnbDetail(48, 2)">
													개취입니다 존중해주세요. 이번엔 어떤 별난 취향들이 있을까요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_49">
					<a href="#" onclick="seriesGnbDetail(49); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/49/srisProfile/dba4181c-bc17-4d6e-99cd-bf332ac377e8.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(49);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(49);">별난취냥 관전포인트</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_49_1">
									<a href="#" onclick="seriesGnbDetail(49, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/49/36349af2-d7b2-43f1-b545-8b345e31a8ab.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(49, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>8</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(49, 1); return false;" data-content="" data-url="seriesGnbDetail(49, 1)">
													별나다, 별나! 냥이들의 별난 취향들 모음집.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_50">
					<a href="#" onclick="seriesGnbDetail(50); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/50/srisProfile/2e0a510b-28e1-4269-a2c1-c54e605231cd.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(50);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(50);">불편해도 괜찮아 -냥</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_50_1">
									<a href="#" onclick="seriesGnbDetail(50, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/50/d5df81ec-117f-4849-adfd-de5544c86219.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(50, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(50, 1); return false;" data-content="" data-url="seriesGnbDetail(50, 1)">
													불편해도 괜찮아. 누구보다 특별한 냥이들의 일상.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_51">
					<a href="#" onclick="seriesGnbDetail(51); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/51/srisProfile/15f0905c-8904-4b78-b75f-20bd94bc25a3.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(51);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(51);">불편해도 괜찮아 -멍</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_51_1">
									<a href="#" onclick="seriesGnbDetail(51, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/51/6feeedc0-ae3b-4a6b-829d-f3dacf0fce2b.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(51, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>15</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(51, 1); return false;" data-content="" data-url="seriesGnbDetail(51, 1)">
													불편해도 괜찮아. 특별해서 더욱 행복한 강아지들.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_52">
					<a href="#" onclick="seriesGnbDetail(52); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/52/srisProfile/0a5d514e-4976-47f5-adb5-0877b2ef0fc9.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(52);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(52);">사고뭉치의 신세개</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_52_1">
									<a href="#" onclick="seriesGnbDetail(52, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/52/9ae23235-ff0b-4c75-9127-25a23b7a8e81.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(52, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>14</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(52, 1); return false;" data-content="" data-url="seriesGnbDetail(52, 1)">
													지금까지 이런 사고뭉치는 없었다! 사고뭉치의 신세개</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_53">
					<a href="#" onclick="seriesGnbDetail(53); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/53/srisProfile/6e18f413-8ef7-42ee-9aeb-e3fc4b74dc01.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(53);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(53);">사람인줄 아는 개</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_53_1">
									<a href="#" onclick="seriesGnbDetail(53, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/53/bf50816f-0ad8-45c3-ace2-d7484f218d0c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(53, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>16</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(53, 1); return false;" data-content="" data-url="seriesGnbDetail(53, 1)">
													너 개야? 사람이야? 사람인줄 알았개. 
<br>똑똑하다 못해 사람 같은 우리 멍멍이들.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_54">
					<a href="#" onclick="seriesGnbDetail(54); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/54/srisProfile/bce72037-46fa-4d36-88f0-3fc19da905d9.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(54);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(54);">사랑에 빠진게 죄는 아니잖아! 사랑과 전쟁</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_54_1">
									<a href="#" onclick="seriesGnbDetail(54, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/54/fdc4fcc7-7eb6-4a07-9d5b-68b9d18ec51a.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(54, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>15</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(54, 1); return false;" data-content="" data-url="seriesGnbDetail(54, 1)">
													사랑에 빠진게 죄는 아니잖아! 막장도 이런 개막장이 없다!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_54_2">
									<a href="#" onclick="seriesGnbDetail(54, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/54/10b824f0-9783-432b-86df-622c93a1882f.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(54, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(54, 2); return false;" data-content="" data-url="seriesGnbDetail(54, 2)">
													사랑을 쟁취해낼 수 있을까요? 흥미진진한 사랑 싸움 모음집</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_55">
					<a href="#" onclick="seriesGnbDetail(55); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/55/srisProfile/5d4401eb-267c-4d2e-9e09-52942116a12e.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(55);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(55);">살찐털찐 왜 더 귀여워 비만의 오류</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_55_1">
									<a href="#" onclick="seriesGnbDetail(55, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/55/fa170159-1cde-4c4b-aed5-1a8c1923ae40.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(55, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(55, 1); return false;" data-content="" data-url="seriesGnbDetail(55, 1)">
													너흰 왜 살찌면 귀엽냥.. 부럽게… 
<br>살찌면 더 귀여운 심멎주의 털복숭이들.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_66">
					<a href="#" onclick="seriesGnbDetail(66); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/66/srisProfile/4a40255a-f8db-4982-aadb-770b8aad0a73.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(66);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(66);">새상에 이런일이</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_66_1">
									<a href="#" onclick="seriesGnbDetail(66, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/66/2095efd3-24d2-4811-9452-99b32306b664.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(66, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>17</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(66, 1); return false;" data-content="" data-url="seriesGnbDetail(66, 1)">
													비둘기부터 공작새까지! 새롭고 색다른 새들의 세상살이</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_174">
					<a href="#" onclick="seriesGnbDetail(174); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/174/srisProfile/4794ed62-dcf7-46c3-9a70-d25618b333bd.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(174);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(174);">설채현의 퍼피 클래스</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_174_1">
									<a href="#" onclick="seriesGnbDetail(174, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/174/dbc1dd67-90ec-44eb-ada8-86e1718a1577.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(174, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(174, 1); return false;" data-content="" data-url="seriesGnbDetail(174, 1)">
													설채현쌤이 알려주는 교육법! 집중해서 듣고, 곧장 실천하자!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_67">
					<a href="#" onclick="seriesGnbDetail(67); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/67/srisProfile/9ac636ae-26e8-48f7-89ee-1a9d98a9d841.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(67);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(67);">세상의 모든 애니멀</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_67_1">
									<a href="#" onclick="seriesGnbDetail(67, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/67/87917d3c-912f-41b6-a8a6-984cf8dd4065.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(67, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>20</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(67, 1); return false;" data-content="" data-url="seriesGnbDetail(67, 1)">
													동물이 반려견 반려묘만 있는건 아니잖아요! 다양한 동물들의 사연!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_67_2">
									<a href="#" onclick="seriesGnbDetail(67, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/67/511176a0-6320-4284-a0b3-2048dd3206a2.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(67, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>17</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(67, 2); return false;" data-content="" data-url="seriesGnbDetail(67, 2)">
													아직 다 못보여줬어요! 새로운 동물들의 모습들.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_67_3">
									<a href="#" onclick="seriesGnbDetail(67, 3); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/67/9cc906a3-387e-422d-ad05-e3416a37e181.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(67, 3)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌3</strong>
													<em>/</em>
												<span>22</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(67, 3); return false;" data-content="" data-url="seriesGnbDetail(67, 3)">
													좀 더 특별한 동물들을 모아봤습니다! 그 일상들.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_121">
					<a href="#" onclick="seriesGnbDetail(121); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/121/srisProfile/b29c9b99-0fbd-4695-9602-6fff9544dd05.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(121);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(121);">세젤귀 멍냥손주</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_121_1">
									<a href="#" onclick="seriesGnbDetail(121, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/121/036c6e7a-55fd-4f92-9597-34de2f86940b.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(121, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(121, 1); return false;" data-content="" data-url="seriesGnbDetail(121, 1)">
													할부지, 할무니! 응석 부리는 멍냥 손주들의 일상</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_68">
					<a href="#" onclick="seriesGnbDetail(68); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/68/srisProfile/7f1104c3-ce67-444f-a4ec-37a93afabcc1.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(68);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(68);">솟아라 호랑이 기운</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_68_1">
									<a href="#" onclick="seriesGnbDetail(68, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/68/e11e3c15-47be-4971-9671-34723f32fe05.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(68, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(68, 1); return false;" data-content="" data-url="seriesGnbDetail(68, 1)">
													무섭지만은 않아요! 카리스마 넘치는 호랑님 이야기!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_172">
					<a href="#" onclick="seriesGnbDetail(172); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/172/srisProfile/8c5ebccc-90b0-439f-853b-1d6258b13eec.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(172);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(172);">수의사언니</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_172_1">
									<a href="#" onclick="seriesGnbDetail(172, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/172/9289be41-198c-4ad1-8d2c-1fffc68352fe.png?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(172, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>7</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(172, 1); return false;" data-content="" data-url="seriesGnbDetail(172, 1)">
													수의사이며 유튜브크리에이터인 루루언니가 알려주는 유익한 반려동물 정보입니다. </a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_69">
					<a href="#" onclick="seriesGnbDetail(69); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/69/srisProfile/8ac50716-62ed-4cc4-a2e7-88c460464933.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(69);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(69);">수의사와 산다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_69_1">
									<a href="#" onclick="seriesGnbDetail(69, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/69/a9444474-48e8-4abf-bd51-e0c1137ebb88.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(69, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>10</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(69, 1); return false;" data-content="" data-url="seriesGnbDetail(69, 1)">
													동물병원 수의사와 사는 동물들의 삶은 어떨까? 수의사들의 반려라이프</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_173">
					<a href="#" onclick="seriesGnbDetail(173); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/173/srisProfile/cb3d3c45-20df-4d03-9c1c-5b044a141187.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(173);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(173);">스타펫츠</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_173_1">
									<a href="#" onclick="seriesGnbDetail(173, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/173/3e46edb1-9eb5-4832-a883-4719f411cae6.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(173, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(173, 1); return false;" data-content="" data-url="seriesGnbDetail(173, 1)">
													주인만 슈스인줄 알았더니...?
<br> 셀럽보다 더 셀럽 같은 스타의 반려동물들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_146">
					<a href="#" onclick="seriesGnbDetail(146); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/146/srisProfile/dc7490ba-38a3-4354-8eca-34a031cd28f8.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(146);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(146);">슬기로운 반려생활</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_146_1">
									<a href="#" onclick="seriesGnbDetail(146, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/146/f7765b65-5508-4d0b-801f-88ef5403f9ab.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(146, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(146, 1); return false;" data-content="" data-url="seriesGnbDetail(146, 1)">
													반려인이라면 꼭 필요한 슬기롭게 반려 생활 하는 법!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_70">
					<a href="#" onclick="seriesGnbDetail(70); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/70/srisProfile/2212148b-60c8-4057-b2f4-cc36b45748d0.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(70);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(70);">시고르자브종(sigor jabzong)</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_70_1">
									<a href="#" onclick="seriesGnbDetail(70, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/70/e217291d-febb-4333-922a-3899dd364c61.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(70, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(70, 1); return false;" data-content="" data-url="seriesGnbDetail(70, 1)">
													가장 사랑받고 있는 견종은 바로 시고르자브종! 세상 귀여운 믹스견들 모여라!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_79">
					<a href="#" onclick="seriesGnbDetail(79); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/79/srisProfile/a6edfbcc-483a-4666-a500-e21d0c8d71be.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(79);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(79);">신기한 동물 이야기</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_79_1">
									<a href="#" onclick="seriesGnbDetail(79, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/79/a2400986-af70-491a-9344-8ccafb870dde.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(79, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(79, 1); return false;" data-content="" data-url="seriesGnbDetail(79, 1)">
													기네스에 등재된 신기한 동물들의 이야기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_71">
					<a href="#" onclick="seriesGnbDetail(71); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/71/srisProfile/9b03693f-8351-4b87-8ab5-fe5ee3fedfa0.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(71);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(71);">씨스터앤브라더</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_71_1">
									<a href="#" onclick="seriesGnbDetail(71, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/71/78c14394-effc-4243-bbd6-fa188977867d.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(71, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(71, 1); return false;" data-content="" data-url="seriesGnbDetail(71, 1)">
													동물친구들의 형제자매끼리 벌어지는 좌우충돌 사건들</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_92">
					<a href="#" onclick="seriesGnbDetail(92); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/92/srisProfile/96e3c062-674f-4194-89c3-537b440bb9bc.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(92);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(92);">아기+강아지=♥</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_92_1">
									<a href="#" onclick="seriesGnbDetail(92, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/92/e932a454-6bc3-4fd7-8d31-16e0e99b9c48.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(92, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(92, 1); return false;" data-content="" data-url="seriesGnbDetail(92, 1)">
													말 안 해도 아시죠? 애기 + 강아지 = LOVE♡</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_72">
					<a href="#" onclick="seriesGnbDetail(72); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/72/srisProfile/776db73c-e2c3-4f52-a40f-fbb2ab1a3c0b.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(72);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(72);">아기와나</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_72_1">
									<a href="#" onclick="seriesGnbDetail(72, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/72/7b36940e-0139-4e45-8b83-09a0f07e48d9.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(72, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>15</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(72, 1); return false;" data-content="" data-url="seriesGnbDetail(72, 1)">
													본격! 아기와 반려동물의 육아 탐구 생활</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_73">
					<a href="#" onclick="seriesGnbDetail(73); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/73/srisProfile/9665a454-afbc-425c-983f-5bdf8ae9d076.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(73);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(73);">아는만큼 사랑한다. 강아지 정보</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_73_1">
									<a href="#" onclick="seriesGnbDetail(73, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/73/4cf654e6-8b12-4360-b155-0c57af0d5c29.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(73, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>8</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(73, 1); return false;" data-content="" data-url="seriesGnbDetail(73, 1)">
													강아지 어디까지 알고 계시나요? 알아두면 유용한 강아지에 대한 모든 것~!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_74">
					<a href="#" onclick="seriesGnbDetail(74); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/74/srisProfile/fdc69796-d77c-4260-926f-66ebc6057e72.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(74);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(74);">아이캔두잇! 천재 다 모여</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_74_1">
									<a href="#" onclick="seriesGnbDetail(74, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/74/85166d46-b43c-4ebf-a0d9-b8fb85558f8d.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(74, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>18</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(74, 1); return false;" data-content="" data-url="seriesGnbDetail(74, 1)">
													재능이 뛰어난 천재 동물들 모여라! 각 분야 천재 동물들의 놀라운 모습들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_74_2">
									<a href="#" onclick="seriesGnbDetail(74, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/74/a6a369ff-04a7-4ef0-9d95-0576a0584c0e.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(74, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(74, 2); return false;" data-content="" data-url="seriesGnbDetail(74, 2)">
													동물계의 멘사 출신들? 지능이 남다른 동물들의 두뇌자랑 스타트!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_75">
					<a href="#" onclick="seriesGnbDetail(75); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/75/srisProfile/8550ec9f-895d-4388-952d-e7de3330de0f.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(75);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(75);">아임 유어 껌딱지</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_75_1">
									<a href="#" onclick="seriesGnbDetail(75, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/75/17aa9c0f-e7dc-441e-93c9-4f4ea30dc459.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(75, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(75, 1); return false;" data-content="" data-url="seriesGnbDetail(75, 1)">
													껌딱지를 자처한 반려동물들!
<br>그들의 귀엽고 치명적인 취향 존중 반려동물 라이프.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_109">
					<a href="#" onclick="seriesGnbDetail(109); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/109/srisProfile/53b6b75f-c46d-4f9a-a12f-ab5b29d7bfc8.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(109);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(109);">아파도 사랑해</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_109_1">
									<a href="#" onclick="seriesGnbDetail(109, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/109/5d73784a-2445-4341-bac0-e3d95413c0bd.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(109, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(109, 1); return false;" data-content="" data-url="seriesGnbDetail(109, 1)">
													비록 몸은 아파도 사랑하는 마음만은 영원해요. 행복하고 싶은 우리.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_76">
					<a href="#" onclick="seriesGnbDetail(76); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/76/srisProfile/c169796d-9af9-4ddb-ad2b-842237d88aac.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(76);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(76);">안녕 나 수달이야</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_76_1">
									<a href="#" onclick="seriesGnbDetail(76, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/76/6fa401ae-255e-4f62-a082-31e13a8df883.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(76, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(76, 1); return false;" data-content="" data-url="seriesGnbDetail(76, 1)">
													어서와 수달은 처음이지? 귀엽고 애교 많은 수달의 모든것</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_159">
					<a href="#" onclick="seriesGnbDetail(159); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/159/srisProfile/9d783688-fcc5-4b33-bf3b-3ff6d2029516.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(159);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(159);">알랑가 몰라</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_159_1">
									<a href="#" onclick="seriesGnbDetail(159, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/159/73b36cd9-bcb3-46ac-a06e-0e106e40b7da.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(159, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>8</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(159, 1); return false;" data-content="" data-url="seriesGnbDetail(159, 1)">
													꼭 필요한 정보만 !30초면 충분한 딱 맞춤 핀.셋.정.보!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_170">
					<a href="#" onclick="seriesGnbDetail(170); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/170/srisProfile/168d4eac-81d7-4dc2-a6dc-4692a261ece4.png?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(170);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(170);">애옹상담소</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_170_1">
									<a href="#" onclick="seriesGnbDetail(170, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/170/9b7599f8-5358-4bde-85a6-49f9fe78eb76.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(170, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(170, 1); return false;" data-content="" data-url="seriesGnbDetail(170, 1)">
													우리 고양이 왜 이런걸까요?
<br>애옹상담소 김효진 수의사가 함께 알려드려요</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_89">
					<a href="#" onclick="seriesGnbDetail(89); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/89/srisProfile/f0268e27-8e9f-4540-8178-8cb1262558e0.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(89);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(89);">야바위꾼 토토</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_89_1">
									<a href="#" onclick="seriesGnbDetail(89, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/89/206241f8-4a6b-4029-87c5-e2d45ab81e51.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(89, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(89, 1); return false;" data-content="" data-url="seriesGnbDetail(89, 1)">
													고창석 닯기로도 유명한데 야바위까지 하는 천재 강아지 토토의 일상.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_81">
					<a href="#" onclick="seriesGnbDetail(81); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/81/srisProfile/987a671f-5109-4d83-89f2-3d44c0301317.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(81);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(81);">어느 멋진날 개쌀롱</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_81_1">
									<a href="#" onclick="seriesGnbDetail(81, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/81/01458ad7-2820-40c7-8841-9cde43a8d539.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(81, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>0</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(81, 1); return false;" data-content="" data-url="seriesGnbDetail(81, 1)">
													입양을 기다리는 아이들에게 찾아온 어느 멋진 날~!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_77">
					<a href="#" onclick="seriesGnbDetail(77); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/77/srisProfile/2830c6ba-9c0a-41f9-9def-fb29824d1f45.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(77);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(77);">어메이징 스토리</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_77_1">
									<a href="#" onclick="seriesGnbDetail(77, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/77/8e6a2e5e-5f6b-49f9-ad38-9eea87ab89d8.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(77, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>12</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(77, 1); return false;" data-content="" data-url="seriesGnbDetail(77, 1)">
													사람을 구한 놀랍고 신기한 동물들의 어메이징 스토리</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_20">
					<a href="#" onclick="seriesGnbDetail(20); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/20/srisProfile/020486fd-13b5-4e43-bd9c-22641df3297f.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(20);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(20);">오구오구 내 강아지 - 할머니와 개</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_20_1">
									<a href="#" onclick="seriesGnbDetail(20, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/20/424095ff-e143-4246-a433-bafb7548a05f.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(20, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>17</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(20, 1); return false;" data-content="" data-url="seriesGnbDetail(20, 1)">
													할머니와 강아지의 조합은 언제나 옳죠! 정감가는 우리네 일상</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_21">
					<a href="#" onclick="seriesGnbDetail(21); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/21/srisProfile/6abd99b2-58af-48b1-966f-8d8bff60c617.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(21);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(21);">오냐오냐 할머니와 고양이</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_21_1">
									<a href="#" onclick="seriesGnbDetail(21, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/21/7948339a-161e-47d2-a210-2a41ca73b521.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(21, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(21, 1); return false;" data-content="" data-url="seriesGnbDetail(21, 1)">
													냥이는 할미가 좋아! 냥이와 할머니의 알콩달콩한 일상 이야기9</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_147">
					<a href="#" onclick="seriesGnbDetail(147); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/147/srisProfile/ab03b028-f498-44f9-a191-65ace319267f.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(147);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(147);">오늘도 건강하개 -여름편</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_147_1">
									<a href="#" onclick="seriesGnbDetail(147, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/147/9c11eaf1-af66-40f9-ab53-d54f366910c2.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(147, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(147, 1); return false;" data-content="" data-url="seriesGnbDetail(147, 1)">
													어우, 더워! 반려견과 건강하게 여름나기.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_22">
					<a href="#" onclick="seriesGnbDetail(22); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/22/srisProfile/4588754e-d3b8-420f-9480-20a6226c21d3.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(22);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(22);">오늘도 자란다 - 냥냥 육아일기</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_22_1">
									<a href="#" onclick="seriesGnbDetail(22, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/22/e085796e-cf4a-4c88-b5f1-606ecd623e39.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(22, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(22, 1); return false;" data-content="" data-url="seriesGnbDetail(22, 1)">
													사고뭉치 캣초딩 시절들을 모았다!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_23">
					<a href="#" onclick="seriesGnbDetail(23); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/23/srisProfile/86836e2f-4e1c-4474-a70e-1d922d9bb377.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(23);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(23);">오늘도 자란다 - 댕댕 육아일기</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_23_1">
									<a href="#" onclick="seriesGnbDetail(23, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/23/71bf04a5-060b-4121-9755-387887098d82.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(23, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>14</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(23, 1); return false;" data-content="" data-url="seriesGnbDetail(23, 1)">
													오늘도 쑥쑥- 사고뭉치 꼬물이 시절의 댕댕이들 모음집</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_144">
					<a href="#" onclick="seriesGnbDetail(144); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/144/srisProfile/f0d69edb-327b-4f32-8091-a21e778d9382.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(144);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(144);">오지의 테이블</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_144_1">
									<a href="#" onclick="seriesGnbDetail(144, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/144/31e95a98-2bd8-4d33-b868-4c1a7571633c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(144, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(144, 1); return false;" data-content="" data-url="seriesGnbDetail(144, 1)">
													우리 댕댕이들 건강한 간식 만들어 줘요. 오지의 레시피, 공유할게요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_137">
					<a href="#" onclick="seriesGnbDetail(137); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/137/srisProfile/a103a9c0-4fd3-46c4-9d81-ef3b6bfdab41.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(137);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(137);">완자의 기막힌 동거</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_137_1">
									<a href="#" onclick="seriesGnbDetail(137, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/137/0be672f9-1518-4a1f-a138-d8282248fabb.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(137, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(137, 1); return false;" data-content="" data-url="seriesGnbDetail(137, 1)">
													똑똑한 포메 완자와 냥이의 특별한 동거!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_24">
					<a href="#" onclick="seriesGnbDetail(24); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/24/srisProfile/bd8be629-316e-4e31-9162-fdba927f8847.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(24);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(24);">왜 어울려? 이색조합</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_24_1">
									<a href="#" onclick="seriesGnbDetail(24, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/24/b774efd6-1b82-4458-b5a0-c9c49f5ebb15.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(24, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>13</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(24, 1); return false;" data-content="" data-url="seriesGnbDetail(24, 1)">
													더 이상 편견은 그만! 종을 넘나드는 사랑과 우정, 그 일상.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_87">
					<a href="#" onclick="seriesGnbDetail(87); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/87/srisProfile/1af733a6-1774-4cd3-a1a7-8daf1f182f00.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(87);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(87);">우당탕탕 마벨이네</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_87_1">
									<a href="#" onclick="seriesGnbDetail(87, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/87/1f8cc85e-8443-4a00-b1df-4f8cf50ad21e.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(87, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(87, 1); return false;" data-content="" data-url="seriesGnbDetail(87, 1)">
													하루도 조용할 날이 없는 우당탕탕 마벨이네로 놀러오세요</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_25">
					<a href="#" onclick="seriesGnbDetail(25); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/25/srisProfile/6f6aedbb-5146-4cc3-bcf6-e34c30c8d50f.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(25);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(25);">위너와 산다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_25_1">
									<a href="#" onclick="seriesGnbDetail(25, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/25/7da1d2a5-4a68-4bab-b565-ab8b77acc7a2.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(25, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(25, 1); return false;" data-content="" data-url="seriesGnbDetail(25, 1)">
													아이돌 그룹 위너와 반려동물 4마리의 좌충우돌 육아일기</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_135">
					<a href="#" onclick="seriesGnbDetail(135); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/135/srisProfile/e60a025a-0246-40c7-b604-5583754c5dcb.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(135);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(135);">육묘일기</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_135_1">
									<a href="#" onclick="seriesGnbDetail(135, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/135/b4901e1b-9263-41b9-9942-98f7413e4856.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(135, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(135, 1); return false;" data-content="" data-url="seriesGnbDetail(135, 1)">
													많으니까 더 귀엽다! 6마리의 고양이가 함께하는 밍가네의 일상.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_26">
					<a href="#" onclick="seriesGnbDetail(26); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/26/srisProfile/e1b8e809-d12e-478d-908e-e69dd25e058f.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(26);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(26);">이상한 조합 어쩌다 동거</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_26_1">
									<a href="#" onclick="seriesGnbDetail(26, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/26/cea33655-285b-4c47-984b-8cae5ee41c04.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(26, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(26, 1); return false;" data-content="" data-url="seriesGnbDetail(26, 1)">
													어쩌다가? 이러다가! 
<br>어색하고 이상해 보여도 우리 잘 살고 있어요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_93">
					<a href="#" onclick="seriesGnbDetail(93); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/93/srisProfile/2e6a1fc9-e5fe-4443-affa-840fce28ee37.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(93);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(93);">저세상 텐션들이 사는 세상</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_93_1">
									<a href="#" onclick="seriesGnbDetail(93, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/93/89ffddb8-a817-4c5d-ba84-7561687af279.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(93, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(93, 1); return false;" data-content="" data-url="seriesGnbDetail(93, 1)">
													저세상 텐션이라 더 귀여운 리트리버들의 美친 일상들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_171">
					<a href="#" onclick="seriesGnbDetail(171); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/171/srisProfile/f976d3b4-fbf1-464e-a201-e5b3b51910cc.png?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(171);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(171);">절미네 민박 </div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_171_1">
									<a href="#" onclick="seriesGnbDetail(171, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/171/c5daa2a3-4a00-4810-aa09-3aba500399cc.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(171, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>11</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(171, 1); return false;" data-content="" data-url="seriesGnbDetail(171, 1)">
													인기 스타 짱절미가 민박집을 오픈했답니다! 
<br>절미네 민박에 찾아온 특별 손님 마마무!
<br>절미와 마마무의 캐미, 함께해요💕</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_83">
					<a href="#" onclick="seriesGnbDetail(83); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/83/srisProfile/a7b5e780-0221-47c0-9f69-d637acc6ec51.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(83);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(83);">집사는 모른다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_83_1">
									<a href="#" onclick="seriesGnbDetail(83, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/83/cbe314af-14bd-43e6-995a-4bbbf3a0f095.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(83, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(83, 1); return false;" data-content="" data-url="seriesGnbDetail(83, 1)">
													대표 냥자친구와 천재냥이 집사들에게 알려주는 고양이 상식</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_149">
					<a href="#" onclick="seriesGnbDetail(149); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/149/srisProfile/ce1de2ad-ed2a-4c19-b651-96d50f30a4c1.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(149);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(149);">집사의 자격</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_149_1">
									<a href="#" onclick="seriesGnbDetail(149, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/149/a30cf8d1-34cf-4bcd-ba99-d4e3c070e233.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(149, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(149, 1); return false;" data-content="" data-url="seriesGnbDetail(149, 1)">
													집사에게도 자격이 필요하다?! 초보 집사들 집중!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_27">
					<a href="#" onclick="seriesGnbDetail(27); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/27/srisProfile/074df3b4-be53-4d66-98be-af146b247e57.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(27);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(27);">집착견</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_27_1">
									<a href="#" onclick="seriesGnbDetail(27, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/27/c9d8876a-3509-4e51-9f2d-7780e1a218e2.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(27, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>15</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(27, 1); return false;" data-content="" data-url="seriesGnbDetail(27, 1)">
													기상천외한 것들에 집착하는 친구들! 
<br>하나에 집착하는 버릇은 어떻게 고치면 좋을까요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_139">
					<a href="#" onclick="seriesGnbDetail(139); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/139/srisProfile/ff8bee78-7427-4ae5-9569-f93728f4c4b5.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(139);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(139);">짱절미</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_139_1">
									<a href="#" onclick="seriesGnbDetail(139, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/139/096727e8-296f-443a-bc39-b4d9d294ca06.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(139, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌1</strong>
													<em>/</em>
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(139, 1); return false;" data-content="" data-url="seriesGnbDetail(139, 1)">
													스타 중의 스타! 짱절미의 일상을 함께 할래요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide swiper-slide-next" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_139_2">
									<a href="#" onclick="seriesGnbDetail(139, 2); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/139/fe00ed1a-5182-4e8e-b37c-0be37813bb4b.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(139, 2)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌2</strong>
													<em>/</em>
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(139, 2); return false;" data-content="" data-url="seriesGnbDetail(139, 2)">
													짱절미가 스타 친구를 만났어요!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_139_3">
									<a href="#" onclick="seriesGnbDetail(139, 3); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/139/b4c61824-3246-4fb6-b192-319c840a07e4.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(139, 3)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>시즌3</strong>
													<em>/</em>
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(139, 3); return false;" data-content="" data-url="seriesGnbDetail(139, 3)">
													짱절미가 처음으로 겨울을 맞이해요! 다른 이벤트들도..?!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="swiper-slide" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_139_4">
									<a href="#" onclick="seriesGnbDetail(139, 4); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/139/d7fd12e8-7361-4ce3-9212-bfb51539c127.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(139, 4)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<strong>특별편</strong>
													<em>/</em>
												<span>3</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(139, 4); return false;" data-content="" data-url="seriesGnbDetail(139, 4)">
													두둥! 짱절미의 특별한 일상을 공개합니다.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
						<button class="swiper-button-prev" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="false"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_100">
					<a href="#" onclick="seriesGnbDetail(100); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/100/srisProfile/f9c7e98e-4d48-4490-8ca4-92e6e6528d94.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(100);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(100);">천재견 호야</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_100_1">
									<a href="#" onclick="seriesGnbDetail(100, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/100/9e98bfb5-ea92-49e0-bae3-4f9490cc3015.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(100, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(100, 1); return false;" data-content="" data-url="seriesGnbDetail(100, 1)">
													원조 천재견 호야, 사람보다 낫다는 호야의 천재성!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_104">
					<a href="#" onclick="seriesGnbDetail(104); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/104/srisProfile/85291813-12ad-4541-9daf-e8e2e8ba7e3e.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(104);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(104);">천재로 산다는 것</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_104_1">
									<a href="#" onclick="seriesGnbDetail(104, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/104/ebccaef1-441e-45cc-b8e7-0d6ddeb81b20.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(104, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>0</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(104, 1); return false;" data-content="" data-url="seriesGnbDetail(104, 1)">
													천재로 산다는 건.. 어떤 기분일까? 똑똑이들만 모였다!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_28">
					<a href="#" onclick="seriesGnbDetail(28); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/28/srisProfile/04a71dc4-1d91-4c0f-bd80-1870fd5e2ef4.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(28);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(28);">체험삶의 견장</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_28_1">
									<a href="#" onclick="seriesGnbDetail(28, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/28/6871b50a-fc77-489e-8e82-e3091ed7ce80.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(28, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(28, 1); return false;" data-content="" data-url="seriesGnbDetail(28, 1)">
													멍멍이들의 다양한 직업들! 멍직업소개!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_29">
					<a href="#" onclick="seriesGnbDetail(29); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/29/srisProfile/47f2cf00-c7cd-4759-bcca-70e18111e0c3.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(29);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(29);">출근하개 워커홀릭</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_29_1">
									<a href="#" onclick="seriesGnbDetail(29, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/29/43269c7d-ba88-47b9-8b44-73488c056f17.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(29, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>17</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(29, 1); return false;" data-content="" data-url="seriesGnbDetail(29, 1)">
													하루 하루 출근하기 바쁘다는 멍멍이들의 일상</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_30">
					<a href="#" onclick="seriesGnbDetail(30); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/30/srisProfile/a9618a81-4c61-4dc4-ba8b-bf8fad04a766.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(30);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(30);">출산 그 신비의 순간</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_30_1">
									<a href="#" onclick="seriesGnbDetail(30, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/30/3f15565b-10f7-4242-b1c2-f3382732b7a6.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(30, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(30, 1); return false;" data-content="" data-url="seriesGnbDetail(30, 1)">
													가장 아름답고 신비로운 순간들, 함께해요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_113">
					<a href="#" onclick="seriesGnbDetail(113); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/113/srisProfile/b2750df8-83d8-41a2-8e8b-03fd80a230b6.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(113);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(113);">취향 존중</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_113_1">
									<a href="#" onclick="seriesGnbDetail(113, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/113/093930dc-5eb7-4f12-a6e7-f586a227c938.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(113, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>1</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(113, 1); return false;" data-content="" data-url="seriesGnbDetail(113, 1)">
													존중입니다, 취향해주세요. 취향 한번 독특한 친구들의 이야기.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_31">
					<a href="#" onclick="seriesGnbDetail(31); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/31/srisProfile/4f280e3e-c0f0-4c1e-a57c-088c001573fc.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(31);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(31);">츄르값벌러왔습니다</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_31_1">
									<a href="#" onclick="seriesGnbDetail(31, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/31/9f791af1-1162-47bb-a13f-772aa9b71ce0.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(31, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(31, 1); return false;" data-content="" data-url="seriesGnbDetail(31, 1)">
													취직한 냥부장들의 출근하는 일상들</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_177">
					<a href="#" onclick="seriesGnbDetail(177); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/177/srisProfile/48e87b72-8ec0-436c-80b1-60b9d9c627c8.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(177);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(177);">클리커 클래스</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_177_1">
									<a href="#" onclick="seriesGnbDetail(177, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/177/0543139f-9cdb-4297-8836-f73bd3ecdb8d.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(177, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>6</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(177, 1); return false;" data-content="" data-url="seriesGnbDetail(177, 1)">
													클리커란 무엇인고? 초보 반려인들 주목! 클리커 교육의 모든것!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_32">
					<a href="#" onclick="seriesGnbDetail(32); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/32/srisProfile/a4812f40-0d9e-4ec8-9c61-b0f77f19e1fd.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(32);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(32);">트라우마 / 상처주지마세요</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_32_1">
									<a href="#" onclick="seriesGnbDetail(32, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/32/bb8ce1d0-f4da-4e15-b828-1900dffddb91.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(32, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>7</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(32, 1); return false;" data-content="" data-url="seriesGnbDetail(32, 1)">
													아픔이 너무 큰 친구들, 우리 함께 극복 해나갈 수 있을까요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_33">
					<a href="#" onclick="seriesGnbDetail(33); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/33/srisProfile/8c8444aa-8123-4f29-afc2-0e6c4fbd556c.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(33);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(33);">특이한 행동 WHY</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_33_1">
									<a href="#" onclick="seriesGnbDetail(33, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/33/22f1746e-5bd8-4af9-96cb-6197898ec3d8.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(33, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>22</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(33, 1); return false;" data-content="" data-url="seriesGnbDetail(33, 1)">
													우리 강아지, 고양이 도대체 왜 이러는 걸까요? 그 이유를 찾아서!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_167">
					<a href="#" onclick="seriesGnbDetail(167); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/167/srisProfile/b15c81b0-64b0-4f7b-9635-1670721e9ac4.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(167);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(167);">펫미팅</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_167_1">
									<a href="#" onclick="seriesGnbDetail(167, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/167/ceeab0b4-58cc-453f-b40a-005d3ebfadc6.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(167, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(167, 1); return false;" data-content="" data-url="seriesGnbDetail(167, 1)">
													핫하고 핫한! 
<br>슈스 댕냥이들을 만나보았어요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_179">
					<a href="#" onclick="seriesGnbDetail(179); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/179/srisProfile/9224f604-1046-4404-823b-108666ff000e.JPG?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(179);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(179);">펫분토론</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_179_1">
									<a href="#" onclick="seriesGnbDetail(179, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/179/744249cb-f08a-41e5-9400-603ef011d508.JPG?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(179, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>7</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(179, 1); return false;" data-content="" data-url="seriesGnbDetail(179, 1)">
													강아지 키워요? 본격 크리에이터들의 반려동물 무논리 토론배틀</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_169">
					<a href="#" onclick="seriesGnbDetail(169); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/169/srisProfile/bf34509c-033e-4f53-8ede-264e869f61d4.png?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(169);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(169);">펫캐스트</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_169_1">
									<a href="#" onclick="seriesGnbDetail(169, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/169/96d2f08c-c0d4-4085-96ab-5b34f36c0b6d.png?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(169, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>9</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(169, 1); return false;" data-content="" data-url="seriesGnbDetail(169, 1)">
													수의사가 알려주는 동물뉴스</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_34">
					<a href="#" onclick="seriesGnbDetail(34); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/34/srisProfile/bc89bc3e-e6b5-4cde-971f-5a4d96765fdf.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(34);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(34);">폭군 길들이기</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_34_1">
									<a href="#" onclick="seriesGnbDetail(34, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/34/f9f97bdf-3be2-4aa0-98f1-d84f3d201b02.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(34, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>13</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(34, 1); return false;" data-content="" data-url="seriesGnbDetail(34, 1)">
													누가 쟤 좀 말려줘요,
<br>우리 집에도 평화가 찾아오긴 할까요?</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_78">
					<a href="#" onclick="seriesGnbDetail(78); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/78/srisProfile/759d9ffc-14bc-446e-88c0-6052a3155e01.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(78);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(78);">품행제로</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_78_1">
									<a href="#" onclick="seriesGnbDetail(78, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/78/d2d56414-1378-493b-9f38-32059e6692f3.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(78, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>4</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(78, 1); return false;" data-content="" data-url="seriesGnbDetail(78, 1)">
													동물의 변신은 무죄! 몰라보게 달라진 댕댕이들 보러오세요!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_35">
					<a href="#" onclick="seriesGnbDetail(35); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/35/srisProfile/1be508b6-dc68-4e0e-9262-a3d5727affa1.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(35);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(35);">함께 살아요</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_35_1">
									<a href="#" onclick="seriesGnbDetail(35, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/35/3e86aeab-4834-42e9-bfc0-d9432b2ef14c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(35, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>5</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(35, 1); return false;" data-content="" data-url="seriesGnbDetail(35, 1)">
													동물과 사람, 저희 이 지구안에서 사이좋게 함께 잘 살아요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_36">
					<a href="#" onclick="seriesGnbDetail(36); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/36/srisProfile/26922801-a8a4-4eaf-b461-5ba722fd027b.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(36);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(36);">현생극복. 헬로힐링</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_36_1">
									<a href="#" onclick="seriesGnbDetail(36, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/36/0822a763-2a46-49d7-8d74-50bbbaeee89c.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(36, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>12</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(36, 1); return false;" data-content="" data-url="seriesGnbDetail(36, 1)">
													지친 일상에 힐링 한 방울.. 귀여운 친구들 보고 함께 힐링해요.</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		<section>
				<div class="channel-info" id="ch_117">
					<a href="#" onclick="seriesGnbDetail(117); return false;" class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/117/srisProfile/337c59cd-ba13-4bf8-86df-c1a3072c3fd8.jpg?type=f&amp;w=72&amp;h=72&amp;quality=100&amp;align=4);" data-content="" data-url="seriesGnbDetail(117);"></a>
					<div class="ch-name" onclick="seriesGnbDetail(117);">현실개남매</div>
                </div>
				<div class="swiper-div k0421 petSeriesListGroup">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
						<ul class="swiper-wrapper" style="transition-duration: 0ms;">
							<li class="swiper-slide swiper-slide-active" style="width: 185.667px; margin-right: 10px;">
								<div class="thumb-box" id="srisId_117_1">
									<a href="#" onclick="seriesGnbDetail(117, 1); return false;" class="thumb-img" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/season/117/e561a430-341a-4c87-bd56-bcd971901094.jpg?type=f&amp;w=244&amp;h=137&amp;quality=100&amp;align=4	);" data-content="" data-url="seriesGnbDetail(117, 1)"></a>
									<div class="thumb-info">
										<div class="info">
											<div class="paging">
												<span>2</span>개
											</div>
											<div class="tlt">
												<a href="#" onclick="seriesGnbDetail(117, 1); return false;" data-content="" data-url="seriesGnbDetail(117, 1)">
													우당탕탕, 어디서 부서지는 소리 안 들리세요? 제 심장이요… 사고뭉치 개남매들!</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							</ul>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					<div class="remote-area">
						<button class="swiper-button-next swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
						<button class="swiper-button-prev swiper-button-disabled swiper-button-lock" type="button" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					</div>
				</div>
			</section>
		</main>
	</div>
</div>
</article>

<script>
			//시리즈목록레이어 리스트 Swiper
			$(".swiper-div.petSeriesListGroup").each(function(idx){
				varslide = [];
				varslide[idx] = new Swiper($(this).find('.swiper-container'), {
					slidesPerView: 3,
					spaceBetween: 10,
					navigation: {
						nextEl: $(this).find('.swiper-button-next'),
						prevEl: $(this).find('.swiper-button-prev'),
					},
					observer: true,
					observeParents: true,
					watchOverflow:true,
					freeMode: false,
					breakpoints: {
						1024: {
							spaceBetween: 10,
							slidesPerView: 3,
							slidesPerGroup:1,
							freeMode: true,
						}
					}
				});
			});
		</script>
	</div>		
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


</body>
</html>

<%@ include file="sidebar.jsp" %>
<%@ include file="footer.jsp" %>



