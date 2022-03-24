<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>


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

<%@
include file="./sidebar.jsp"

%> 

<%int cntItem=(int)request.getAttribute("cntItem");
     String s_word=(String)request.getAttribute("s_word");
     ArrayList<Integer>cntLog=(ArrayList<Integer>)request.getAttribute("cntLog");
     ArrayList<Integer>cntVideo=(ArrayList<Integer>)request.getAttribute("cntVideo");
   
     
%>
<script type="text/javascript">		
			$(function() {
				// 헤더 검색형 변경
				searchCommon.setHeader();
				
				if("로얄캐닌" == '' && 'PC' == 'PC'){	// 마지막 이벤트로 포커스 이동 및 click 
					// 화면 진입시 포커스
					$("#srchWord").trigger("focus");
					$("#srchWord").trigger("click");
				}
				
				if("로얄캐닌" != ''){	// 기본페이지
					// 결과수 제한 및 historyBack 결과 셋팅
					searchResult.chkFirstPage();
				}

				// 검색 자동완성
				searchCommon.autocomplete();
				
				// 검색 닫기 버튼 활성화
				$("#srchClsBtn").show();
				
				// 취소버튼 클릭시 이전진입 페이지로 이동
				$(".mo-header-rightBtn .mo-header-btnType01").click(function() {
					searchCommon.goLastUrl();
				});
				
				// adbrix data 전송
				searchResult.sendAdbrix();
				
				// 퍼블 스크립트 호출(높이 계산)
				ui.tapTouchAc.tab_height($(".uiTab_content > ul"));
			});

			/*
			*	공통 스크립트(default & result 페이지)
			*/
			var searchCommon ={
				goLastUrl : function() {				// 진입 url로 이동
					var lastUrl = $.cookie("searchLastUrl");
					history.replaceState("","",lastUrl);
					location.href = (lastUrl == "" || lastUrl == undefined)?"/":lastUrl;
				},
				setHeader : function() {				// 헤더 스타일 변경
					$(".mo-header-btnType01").addClass("gray");
					$(".mo-header-btnType01").text("취소");
					ui.headerSearech_input.set();
				},
				autoCnt : 0,
				autocomplete : function() { 			// 검색 자동완성
					$("#srchWord").attr("autocomplete","off");
					$("#srchWord").on("input", function(e) { 
						var thisAutoCnt = ++searchCommon.autoCnt;
			            $.ajax({
			                  url : "/searchAutoComplete"
			                , type : "GET"
			                , data : {searchText : $("#srchWord").val()} // 검색 키워드
			                , success : function(data){ // 성공
			                	let resBody = JSON.parse(data);
				                	if(resBody.STATUS.CODE == "200" && thisAutoCnt == searchCommon.autoCnt){
										let html = ''
										if( resBody.DATA.ITEMS.length > 0) {
											$("#key-word-list ul").empty();
											for(var i=0;i<resBody.DATA.ITEMS.length;i++){
												var thisWordData = resBody.DATA.ITEMS[i].HIGHLIGHT.replace(/\'\¶HS¶/gi, '').replace(/\¶HS¶/gi, '').replace(/\'\¶HE¶/gi, '').replace(/\¶HE¶/gi, '').replace(/&#39;/gi, '&#92;&#39;').replace(/'/gi, '&#39;').replace(/"/gi, '&quot;');
												html += '<li>';
												html += '	<a href="javascript:void(0);" data-content="" data-url="/commonSearchResults" onclick="searchCommon.goResultPage(\'' + thisWordData + '\');">';
												html += 		resBody.DATA.ITEMS[i].HIGHLIGHT.replace(/\¶HS¶/gi, '<span>').replace(/\¶HE¶/gi, '</span>');
												html += '	</a>';
												html += '</li>';
											}
											$("#key-word-list ul").html(html);
											$("#key-word-list").css("display", "block");
										}else {
											$("#key-word-list").css("display", "none");
										}
									}
				                }
				            });
				      
					});
					$("body").click(function(e) {
						if(!$(e.target).is($(".hdr .cdt .form")) && !$(e.target).is($(".key-word-list")) ) {
							$("#key-word-list").css("display", "none");
						}
					})
				},
				srchClsBtn : function() {				// 검색 닫기 버튼
					searchCommon.goLastUrl();
				},
				goResultPage : function(srchWord) { 	// 자동완성, 인기 검색어 클릭 시
					var searchLastFocus = $.cookie("searchLastFocus");
					var srchWrd = srchWord;
					var srchShopDispClsfNo = convertDispClsfNo("300000174");
					location.href = "/commonSearch?srchWord=" + encodeURIComponent(srchWord) + ((searchLastFocus == "" || searchLastFocus == undefined )?"":"&focus="+searchLastFocus) +"&cateCdL="+srchShopDispClsfNo;
				},
				goSearchToCateCdL : function(cateCdL) { 	// 자동완성, 인기 검색어 클릭 시
					searchResult.isFilterLoaing = false;
					$.cookie("searchLastFocus", "10", {path:'/'});
					goSearch(cateCdL);					
				},
				goSearchShopCateCdL : function(cateCdL) {//샵탭 하단의 카테고리 클릭 시 페이지리로드 -> ajax 변경
					searchResult.isSelectedCate = true;
					var srchShopDispClsfNo = convertDispClsfNo((cateCdL == "" || cateCdL == undefined) ? "300000174" : cateCdL);
					searchResult.selectedCateCdL = srchShopDispClsfNo;
					searchResult.goodsPage = 1;
					$("#popSample1").remove();					
					filter.delFilter(null);
				}
			}
			
			/*
			* 	default 페이지 스크립트
			*/
			var searchDafault = {
				goLatelySearch : function (obj) {		// 최근 검색어 결과페이지 이동
					var searchLastFocus = $.cookie("searchLastFocus");
					var srchWrd = $(obj).data("val");
					var srchShopDispClsfNo = convertDispClsfNo("300000174");
					location.href = "/commonSearch?srchWord="+encodeURIComponent(srchWrd)+((searchLastFocus == "" || searchLastFocus == undefined )?"":"&focus="+searchLastFocus)+"&cateCdL="+srchShopDispClsfNo;
				},
				delLarelyTag : function (obj) {			// 최근 검색어 삭제
					event.stopPropagation(); // 상위 요소 이벤트 방지
					let seq = $(obj).parents("li").data("seq");
					let options = {
						url : "search/delLatelyTag"
						, data : { seq : seq}
						, done : function(data){
							if(data.result == "S"){
								$(".lately-tag").find("li[data-seq="+ seq +"]").remove();
							}
							if($(".lately-tag").find("li").length == 0 ){ 
								$(".lately-tag").html('<p class="tit">최근 검색어</p><p class="txt-info">검색 내역이 없습니다.</p>');
							}
						}
					};
					ajax.call(options);
				}
			}
			
			/*
			* 	result 페이지 스크립트
			*/
			var searchResult ={
				srchWord : '로얄캐닌',				// 검색어 변수
				focusedTab : "tv",						// 현재탭 변수
				isFilterLoaing : false,
				setTabFocusH : function() {
					var scrollTop = $(window).scrollTop();
					// 이전 탭의 현 스크롤위치 적용
					var isHeaderActive = "N/";
					if($(".header .hdr").hasClass("active")){
						isHeaderActive = "Y/";
					}
					if(searchResult.focusedTab == 'tv'){
						$("#srchTab1").data("focush", isHeaderActive+scrollTop);
					}else if(searchResult.focusedTab == 'log'){
						$("#srchTab2").data("focush", isHeaderActive+scrollTop);
					}else if(searchResult.focusedTab == 'shop'){
						$("#srchTab3").data("focush", isHeaderActive+scrollTop);
					}
				},
				setfocusedTab : function(gb) {			// 탭 클릭 이벤트
					
					if (gb=='tv') {
						$("#srchTab1").addClass("active");
						$("#srchTab1").siblings().removeClass("active");
					  
						$(".uiTab_content>ul>li").eq(0).addClass("active");
						$(".uiTab_content>ul>li").eq(0).siblings().removeClass("active");

					}else if (gb=='log') {
						$("#srchTab2").addClass("active");
						$("#srchTab2").siblings().removeClass("active");
			
						$(".uiTab_content>ul>li").eq(1).addClass("active");
						$(".uiTab_content>ul>li").eq(1).siblings().removeClass("active");

		
					}else if(gb='shop'){
						$("#srchTab3").addClass("active");
						$("#srchTab3").siblings().removeClass("active");
			
						$(".uiTab_content>ul>li").eq(2).addClass("active");
						$(".uiTab_content>ul>li").eq(2).siblings().removeClass("active");
					
					}
					
					
					var thisTabFocus = new Array();
					if( searchResult.focusedTab != gb){
						searchResult.focusedTab = gb;
						// 검색 로그
						$.ajax({
							url : "/common/sendSearchEngineEvent"
							, data : {
								 "logGb" : 'SEARCH'
								, "section" : 'category'
								, "index" : searchResult.focusedTab.toUpperCase()
								, "keyword" : '로얄캐닌'
							}
						});
					}
					if('PC' != 'PC' && thisTabFocus != null){
						setTimeout(function() {
							window.scrollTo(0,thisTabFocus[1]);
						}, 400)
					}
				},
				getSize : function(gb, setFstPage) {			//  페이지별 ITEM수 확인
					if(gb == 'se_tv_video'){
						return 8;
					}else if(gb == 'se_log_content'){
						if('PC'=='PC'){
							return 10;
						}else{
							return 9;
						}
					}else if(gb == 'se_shop_goods'){
						return 10;
					}
					
					if( setFstPage == true ){   // 첫페이지인경우
						if('PC'=='PC'){
							if(gb == 'se_tv_series'){
								return 5;
							}else if(gb == 'se_log_member'){
								return 5;
							}else if(gb == 'se_shop_brand'){
								return 10;
							}
						}else{
							if(gb == 'se_tv_series'){
								return 3;
							}else if(gb == 'se_log_member'){
								return 3;
							}else if(gb == 'se_shop_brand'){
								return 6;
							}
						}
					}else{	// 첫페이지가 아닌경우
						return 30;
					}
				},
				seriesPage : 1,						// 시리즈 페이지
				memberPage : 1,						// 사용자 페이지
				brandPage : 1,						// 브랜드 페이지
				videoPage : 1,							// 동영상 페이지
				contentPage :1,							// 로그 동영상 페이지
				goodsPage : 1,							// 상품 동영상 페이지
				videoSort : "pop_rank",					// 동영상 정렬 기준
				contentSort : "pop_rank",					// 로그 동영상 정렬 기준
				goodsSort : "pop_rank",					// 상품 정렬 기준
				focus : '10',						// 마지막 포커스
				firstFocusItv : null,					// 포커스 이동 인터벌
				setSort : function(gb, val) {			// 정렬 기준 변경
					searchResult.focus ="";
					if(gb == 'video'){
						searchResult.videoSort = val;
						searchResult.videoPage = 1;
						searchResult.getSearchResults("se_tv_video", true, "");
					}else if(gb == 'content'){
						searchResult.contentSort = val;
						searchResult.contentPage = 1;
						searchResult.getSearchResults("se_log_content", true, "");
					}else if(gb == 'goods'){
						searchResult.goodsSort = val;
						searchResult.goodsPage = 1;
						searchResult.getSearchResults("se_shop_goods", true, "");
					}
				},
				selectedCateCdL : "12565",
				isSelectedCate : false,
				chkFirstPage : function() { 			// 각페이지별 다른 ITEM수 제한 / 내용 없을 경우 문구 노출
					// history back 사용시 포커스 처리
					var printOrder = ["tv","log","shop"];
					if(searchResult.focus != ''){
						if(searchResult.focus.indexOf("lm") == 0 ||searchResult.focus.indexOf("lc") == 0 || searchResult.focus.indexOf("30") == 0){
							$("#srchTab2").trigger("click");
							printOrder = ["log","shop","tv"];
						}else if(searchResult.focus.indexOf("sb") == 0 ||searchResult.focus.indexOf("sg") == 0  || searchResult.focus.indexOf("10") == 0){
							$("#srchTab3").trigger("click");
							printOrder = ["shop","tv","log"];
						}
					}
					
					for(let k=0 ; k < printOrder.length ; k++ ){	// 포커스 된 탭부터 처리
						if(printOrder[k] == "tv"){
							// TV 페이지
							searchResult.firstTvPage();
						}else if(printOrder[k] == "log"){
							// LOG 페이지
							searchResult.firstLogPage();
						}else if(printOrder[k] == "shop"){
							// SHOP 페이지
							searchResult.firstShopPage();
						}
					}
					
					// 포커스 이동
					searchResult.firstFocusItv = setInterval(function() {
						if(searchResult.focus != ""){
							var thisFocus = $("."+searchResult.focus);
 							if(thisFocus.length > 0){
 								window.scrollTo(0,(thisFocus.offset().top- (window.innerHeight/2)));
 								searchResult.focus ="";
 								clearInterval(searchResult.firstFocusItv);
 							}
						}
					},500);
				},
				firstTvPage : function() {
					var preNoItemHtml = '<section class="no_data txt"><div class="inr"><div class="msg">';
					var suNoItemHtml = ' 검색 결과가 없습니다.</div></div></section>';
					/*
					*	TV 시리즈			
					*/
					// 사이즈 조정
					let thisSeriesSize = searchResult.getSize("se_tv_series", true);
					$("#tvSeriesArea").find(".scrhItem").each( 				
							function(idx, obj) {
								if(idx >= thisSeriesSize){
									$(obj).remove();
								}
							});
					// 아이템 없음 표시
					if($("#tvSeriesArea").find(".scrhItem").length == 0){
						$("#tvSeriesArea").parent().before(preNoItemHtml+"시리즈"+suNoItemHtml);
					}
					// 더보기 버튼 컨트롤
					if(''>$("#tvSeriesArea .scrhItem").length){
						$("#tvSeriesMoreBtn").show();
					}
					// history param 적용(더보기)
					if('' != '' ){
						searchResult.seriesPage = '';
						searchResult.getSearchResults('se_tv_series', false, searchResult.focus);
					}
					
					/*
					*	TV 비디오
					*/
					// 사이즈 조정
					let thisVideoSize = searchResult.getSize("se_tv_video", true);
					$("#tvVideoArea").find(".scrhItem").each(
							function(idx, obj) {
								if(idx >= thisVideoSize){
									$(obj).remove();
								}
							});
					// 아이템 없음 표시
					if($("#tvVideoArea").find(".scrhItem").length == 0){
						$("#tvVideoArea").before(preNoItemHtml+"동영상"+suNoItemHtml);
						$("#tvSortArea").hide();
					}
					// history param 적용(정렬)
					if('' != ''){ 
						searchResult.videoSort = '';
						
						if(searchResult.videoSort == 'pop_rank'){
							$("#tvSortArea .uisort button .st").text("인기순");
							$("#tvSortArea .uisort .list ul li:eq(0)").addClass("active").siblings("li").removeClass("active");
						}else if(searchResult.videoSort == '_score'){
							$("#tvSortArea .uisort button .st").text("추천순");
							$("#tvSortArea .uisort .list ul li:eq(1)").addClass("active").siblings("li").removeClass("active");
						}else if(searchResult.videoSort == 'latest'){
							$("#tvSortArea .uisort button .st").text("최신");
							$("#tvSortArea .uisort .list ul li:eq(2)").addClass("active").siblings("li").removeClass("active");
						} 
						
						ui.sort.set();
					}
					// history param 적용(페이지)
					if('' != ''){
						searchResult.videoPage = '';
					}
					// history param 적용 재호출
					if('' != '' || '' != ''){
						searchResult.getSearchResults('se_tv_video', true, searchResult.focus);
					}
				},
				firstLogPage : function() {
					var preNoItemHtml = '<section class="no_data txt"><div class="inr"><div class="msg">';
					var suNoItemHtml = ' 검색 결과가 없습니다.</div></div></section>';
					/*
					*	LOG 멤버
					*/
					// 사이즈 조정
					let thisMemberSize = searchResult.getSize("se_log_member", true);
					$("#logMemberArea").find(".scrhItem").each(
							function(idx, obj) {
								if(idx >= thisMemberSize ){
									$(obj).remove();
								}
							});
					// 아이템 없음 표시
					if($("#logMemberArea").find(".scrhItem").length == 0){
						$("#logMemberArea").parent().before(preNoItemHtml+"친구"+suNoItemHtml);
					}
					// 더보기 버튼 컨트롤
					if(''>$("#logMemberArea .scrhItem").length){
						$("#logMemberMoreBtn").show();
					}
					// history param 적용(더보기)
					if(''!= ''){
						searchResult.memberPage = '';
						searchResult.getSearchResults('se_log_member', false, searchResult.focus);
					}
					
					/*
					*	LOG 게시물
					*/
					// 사이즈 조정
					let thisContentSize = searchResult.getSize("se_log_content", true);
					$("#logContentArea").find(".scrhItem").each(
							function(idx, obj) {
								if(idx >= thisContentSize ){
									$(obj).remove();
								}
							});
					// 아이템 없음 표시
					if($("#logContentArea").find(".scrhItem").length == 0){
						$("#logContentArea").parents(".mylog-area").before(preNoItemHtml+"게시물"+suNoItemHtml);
						$("#logSortArea").hide();
					}
					// history param 적용(정렬)
					if('' != ''){
						searchResult.contentSort = '';
						
						if(searchResult.contentSort == 'pop_rank'){
							$("#logSortArea .uisort button .st").text("인기순");
							$("#logSortArea .uisort .list ul li:eq(0)").addClass("active").siblings("li").removeClass("active");
						}else if(searchResult.contentSort == '_score'){
							$("#logSortArea .uisort button .st").text("추천순");
							$("#logSortArea .uisort .list ul li:eq(1)").addClass("active").siblings("li").removeClass("active");
						}else if(searchResult.contentSort == 'latest'){
							$("#logSortArea .uisort button .st").text("최신순");
							$("#logSortArea .uisort .list ul li:eq(2)").addClass("active").siblings("li").removeClass("active");
						}
						ui.sort.set();
					}
					// history param 적용(페이지)
					if('' != ''){
						searchResult.contentPage = '';
					}
					// history param 적용 재호출
					if('' != '' || '' != ''){
						searchResult.getSearchResults('se_log_content', true, searchResult.focus);
					}
				},
				firstShopPage : function() {
					var preNoItemHtml = '<section class="no_data txt" id="no_data_brand"><div class="inr"><div class="msg">';
					var suNoItemHtml = ' 검색 결과가 없습니다.</div></div></section>';
					/*
					*	SHOP 브랜드
					*/
					// 사이즈 조정
					let thisBrandSize = searchResult.getSize("se_shop_brand", true);
					$("#shopBrandArea").find(".scrhItem").each(
							function(idx, obj) {
								if(idx >= thisBrandSize ){
									$(obj).remove();
								}
							});
					// 아이템 없음 표시
					if($("#shopBrandArea").find(".scrhItem").length == 0){
						$("#shopBrandArea").parent().before(preNoItemHtml+"브랜드"+suNoItemHtml);
					}
					// 더보기 버튼 컨트롤
					if('1'>$("#shopBrandArea .scrhItem").length){
						$("#shopBrandMoreBtn").show();
					}
					// history param 적용(더보기)
					if('' != ''){
						searchResult.brandPage = '';
						searchResult.getSearchResults('se_shop_brand', false, searchResult.focus);
					}
					
					/*
					*	상품
					*/
					// 사이즈 조정
					let thisGoodsSize = searchResult.getSize("se_shop_goods", true);
					$("#shopGoodsArea").find(".scrhItem").each(
							function(idx, obj) {
								if(idx >= thisGoodsSize ){
									$(obj).remove();
								}
							});
					
					// history param 적용(필터)
					if("" != ""){ 
						var filtBoxHtml = "";
						var filtArr = "".split(',');
						filter.appliedFetGbCd = [];
						filter.appliedFilters = [];
						filter.appliedBrands = [];
						for(var thisIdx in filtArr){
							var thisFiltVal = filtArr[thisIdx].split('@');
							// 바닥 필터 설정
							filtBoxHtml += '<li class="swiper-slide"><span class="fil" name='+thisFiltVal[0]+'><em class="tt">'+thisFiltVal[1]+'</em> <button class="del"onclick="filter.delFilter(\''+thisFiltVal[0]+'\');">필터삭제</button></span></li>';
							filter.setFilterVal(thisFiltVal[0]);
						}
						$("#uifiltbox .flist .swiper-wrapper").html(filtBoxHtml);
						$("#uifiltbox").show();
						if($("#uifiltbox .swiper-wrapper .fil").length == 0){
							$(".uiTab_content .tit-box .uisort #filtBtn").removeClass("on");
							$(".uiTab_content .tit-box .uisort .n").html("");
						}else{
							$(".uiTab_content .tit-box .uisort #filtBtn").addClass("on");
							$(".uiTab_content .tit-box .uisort .n").html("("+$("#uifiltbox .swiper-wrapper .fil").length+")");
						}
					}
					
					// history param 적용(정렬)
					if('' != ''){
						searchResult.goodsSort = '';

						if(searchResult.goodsSort == 'pop_rank'){
							$("#shopSortArea .uisort button .st").text("인기순");
							$("#shopSortArea .uisort .list ul li:eq(0)").addClass("active").siblings("li").removeClass("active");
						}else if(searchResult.goodsSort == '_score'){
							$("#shopSortArea .uisort button .st").text("추천순");
							$("#shopSortArea .uisort .list ul li:eq(1)").addClass("active").siblings("li").removeClass("active");
						}else if(searchResult.goodsSort == 'latest'){
							$("#shopSortArea .uisort button .st").text("최신순");
							$("#shopSortArea .uisort .list ul li:eq(2)").addClass("active").siblings("li").removeClass("active");
						} 
						ui.sort.set();
					}
					// history param 적용(페이지)
					if('' != ''){
						searchResult.goodsPage = '';
					}
					// history param 적용 재호출
					if('' != '' || "" != "" || '' != '' ){
						searchResult.getSearchResults('se_shop_goods', true, searchResult.focus);
					}
					
					// 아이템 없음 표시
					preNoItemHtml = '<section class="no_data txt" id="no_data_goods"><div class="inr"><div class="msg">';
					if($("#shopGoodsArea").find(".scrhItem").length == 0){
						$("#shopGoodsArea").parent().before(preNoItemHtml+"상품"+suNoItemHtml);
						$("#shopSortArea").hide();
					}
				},
				afterAjaxShopPage : function() {					
					$("#shopBrandMoreBtn").hide();					
					$("#shopSortArea").show();
					
					var preNoItemHtml = '<section class="no_data txt" id="no_data_brand"><div class="inr"><div class="msg">';
					var suNoItemHtml = ' 검색 결과가 없습니다.</div></div></section>';
					/*
					*	SHOP 브랜드
					*/
					// 사이즈 조정
					let thisBrandSize = searchResult.getSize("se_shop_brand", true);
					$("#shopBrandArea").find(".scrhItem").each(
							function(idx, obj) {
								if(idx >= thisBrandSize ){
									$(obj).remove();
								}
					});
					// 아이템 없음 표시
					if($("#shopBrandArea").find(".scrhItem").length == 0){
						if($("#no_data_brand").length == 0){
							$("#shopBrandArea").parent().before(preNoItemHtml+"브랜드"+suNoItemHtml);
						}						
					}
					// 더보기 버튼 컨트롤
					if($("#ajaxBrandListSize").val() >$("#shopBrandArea .scrhItem").length){
						$("#shopBrandMoreBtn").show();
					}
					/*
					*	상품
					*/
					// 사이즈 조정
					let thisGoodsSize = searchResult.getSize("se_shop_goods", true);
					$("#shopGoodsArea").find(".scrhItem").each(
							function(idx, obj) {
								if(idx >= thisGoodsSize ){
									$(obj).remove();
								}
					});
					// 아이템 없음 표시
					preNoItemHtml = '<section class="no_data txt" id="no_data_goods"><div class="inr"><div class="msg">';
					if($("#shopGoodsArea").find(".scrhItem").length == 0){
						if($("#no_data_goods").length == 0){
							$("#shopGoodsArea").parent().before(preNoItemHtml+"상품"+suNoItemHtml);
						}
						$("#shopSortArea").hide();
						
					}
				},
				getSearchResults : function(targetGb, reload, histFocus) {		// 각 영역별 검색결과(타겟, 리로드 여부, historyback 포커스)			
					let index = "shop,log,tv";
					let tagetIndex = targetGb;
					let sort = "pop_rank";
					let from = "1"
					let size = "10"
					if(targetGb == "se_tv_series"){
						index = "tv";
						if(histFocus != "" && histFocus != undefined){
							size = searchResult.getSize('se_tv_series', true) + ((searchResult.seriesPage -1) * searchResult.getSize('se_tv_series'));
						}else{
							size = searchResult.getSize('se_tv_series', true) + ((++searchResult.seriesPage -1) * searchResult.getSize('se_tv_series'));
						}
					}else if(targetGb == "se_tv_video"){
						index = "tv";
						sort = searchResult.videoSort;
						if(histFocus != ""){
							from = 1;
							size = searchResult.videoPage * searchResult.getSize('se_tv_video');
						}else{
							from = ++searchResult.videoPage;
							size = searchResult.getSize('se_tv_video');
						}
					}else if(targetGb == "se_log_member"){
						index = "log";
						if(histFocus != "" && histFocus != undefined){
							size = searchResult.getSize('se_log_member', true) + ((searchResult.memberPage -1) * searchResult.getSize('se_log_member'));
						}else{
							size = searchResult.getSize('se_log_member', true) + ((++searchResult.memberPage -1) * searchResult.getSize('se_log_member'));
						}
					}else if(targetGb == "se_log_content"){
						index = "log";
						sort = searchResult.contentSort;
						if(histFocus != "" && histFocus != undefined){
							from = 1;
							size = searchResult.contentPage * searchResult.getSize('se_log_content');
						}else{
							from = ++searchResult.contentPage;
							size = searchResult.getSize('se_log_content');
						}
					}else if(targetGb == "se_shop_brand"){
						index = "shop";
						if(histFocus != "" && histFocus != undefined){
							size = searchResult.getSize('se_shop_brand', true) + ((searchResult.brandPage -1) * searchResult.getSize('se_shop_brand'));
						}else{
							size = searchResult.getSize('se_shop_brand', true) + ((++searchResult.brandPage -1) * searchResult.getSize('se_shop_brand'));
						}
					}else if(targetGb == "se_shop_goods"){
						index = "shop";
						sort = searchResult.goodsSort;
						if(histFocus != "" && histFocus != undefined){
							from = 1;
							size = searchResult.goodsPage * searchResult.getSize('se_shop_goods');
						}else{
							from = ++searchResult.goodsPage;
							size = searchResult.getSize('se_shop_goods');
						}
					}
					
					if(reload){
						from = 1;
					}
					let options = {
						 url : "/commonSearchResults"
						, dataType : "html"
						,data : {
							srchWord : $("#orgSrchWord").val(),
							cateCdL: searchResult.selectedCateCdL,//전체카테고리 처리 완료
							index : index,
							targetGb : targetGb,
							sort : sort,
							from : from,
							size : size,
							tagetIndex :tagetIndex							
						}
						,done : function(html) {
							if(targetGb == "se_tv_series"){
	 							$("#tvSeriesArea").html(html);
	 							var totCnt = '';
	 							var thisListCnt = $("#tvSeriesArea .scrhItem").length;
	 							if( totCnt <= thisListCnt){
	 								$("#tvSeriesMoreBtn").hide();
	 							}
	 						}else if(targetGb == "se_tv_video"){
	 							if(reload){
	 								$("#tvVideoArea").html(html);
	 								if(histFocus == ""){
		 								searchResult.videoPage = 1;
	 								}
	 							}else{
	 								$("#tvVideoArea").append(html);
	 							}
	 						}else if(targetGb == "se_log_member"){
	 							$("#logMemberArea").html(html);
	 							var totCnt = '';
	 							var thisListCnt = $("#logMemberArea .scrhItem").length;
	 							if( totCnt <= thisListCnt){
	 								$("#logMemberMoreBtn").hide();
	 							}
	 						}else if(targetGb == "se_log_content"){
	 							if(reload){
	 								$("#logContentArea").html(html);
	 								if(histFocus == ""){
	 									searchResult.contentPage = 1;
	 								}
	 							}else{
	 								$("#logContentArea").append(html);
	 							}
	 						}else if(targetGb == "se_shop_brand"){
	 							if(html != ""){
	 								$("#no_data_brand").remove();
	 							}else{
	 								var preNoItemHtml = '<section class="no_data txt" id="no_data_brand"><div class="inr"><div class="msg">';
	 								var suNoItemHtml = ' 검색 결과가 없습니다.</div></div></section>';	 								
	 								if($("#no_data_brand").length == 0){
	 									$("#shopBrandArea").parent().before(preNoItemHtml+"브랜드"+suNoItemHtml);
	 								}	 								
	 							}
	 							$("#shopBrandArea").html(html);
	 							var totCnt = '1';
	 							var thisListCnt = $("#shopBrandArea .scrhItem").length;
	 							if( totCnt <= thisListCnt){
	 								$("#shopBrandMoreBtn").hide();
	 							}
	 							if(searchResult.isSelectedCate){//동물카테고리 변경 시						 			
						 			searchResult.isSelectedCate = false;
						 			searchResult.afterAjaxShopPage();
						 		}
	 						}else if(targetGb == "se_shop_goods"){
	 							if(reload){
	 								if(html != ""){
		 								$("#no_data_goods").remove();
		 								$("#shopSortArea").show();
		 							}else{
		 								var preNoItemHtml = '<section class="no_data txt" id="no_data_goods"><div class="inr"><div class="msg">';
		 								var suNoItemHtml = ' 검색 결과가 없습니다.</div></div></section>';
		 								if($("#no_data_goods").length == 0){
		 									$("#shopGoodsArea").parent().before(preNoItemHtml+"상품"+suNoItemHtml);
		 								}
		 								$("#shopSortArea").hide();
		 							}
	 								$("#shopGoodsArea").html(html);
	 								// 상위 카운트 재 계산
 									var thisSearchGoodsCnt =  (html == "" )? 0 : $("#shopGoodsArea .scrhItem").first().data("goodscnt");
 									$("#goodsCount").html(thisSearchGoodsCnt == 0?"":parseInt(thisSearchGoodsCnt));
 							 		var brandCount = ($("#brandCount").text() == '')? 0 : parseInt($("#brandCount").text());
 							 		$("#shopCnt").html((thisSearchGoodsCnt + brandCount > 999)? "999+": thisSearchGoodsCnt + brandCount);
 							 		if(searchResult.focus == ''){
 							 			searchResult.goodsPage = 1;
 							 		}
 							 		if(searchResult.isSelectedCate){//동물카테고리 변경 시
 							 			searchResult.getSearchResults('se_shop_brand', false, searchResult.focus); 							 			
 							 		}
	 							}else{
	 								$("#shopGoodsArea").append(html);
	 							}
	 									 							
		 						// adbrix data 전송
	 							searchResult.sendAdbrix();
	 						}
																					
							// 퍼블 스크립트 호출(높이 계산)
							ui.tapTouchAc.tab_height($(".uiTab_content > ul"));
							
							// 레이지로드 제한 풀기
							if(histFocus == ""){
								searchResult.lazyLoading = false;
							}
						}
					};
					if(targetGb == "se_shop_goods"){
						if(filter.appliedFetGbCd.length != 0){
							$.extend(options.data, {petGbCd:filter.appliedFetGbCd.join(",")});
						}
						if(filter.appliedBrands.length != 0){
							$.extend(options.data, {bndNo:filter.appliedBrands.join(",")});
						}
						if(filter.appliedFilters.length != 0){
							$.extend(options.data, {filter:JSON.stringify(filter.appliedFilters)});
						}
					}
					ajax.call(options);
				},
				lazyLoading : false,
				lazyLoadResults : function() {		// 레이지 로드 결과
					// 추가적인 레이지 로드 호출 안받도록 제한
					if(searchResult.lazyLoading) return;
					searchResult.lazyLoading = true;
					
					if(searchResult.focusedTab == "tv"){
						let videoCnt = $("#videoCount").html();
						let nowCnt = $("#tvVideoArea .scrhItem").length;
						if(parseInt(videoCnt) > nowCnt){
							searchResult.getSearchResults("se_tv_video", false, "");
						}else{
							searchResult.lazyLoading = false;
						}
					}else if(searchResult.focusedTab == "log"){
						let contentCnt = $("#contentCount").html();
						let nowCnt = $("#logContentArea .scrhItem").length;
						if(parseInt(contentCnt) > nowCnt){
							searchResult.getSearchResults("se_log_content", false, "");
						}else{
							searchResult.lazyLoading = false;
						}
					}else if(searchResult.focusedTab == "shop"){
						let goodsCnt = $("#goodsCount").html();
						let nowCnt = $("#shopGoodsArea .scrhItem").length;
						if(parseInt(goodsCnt) > nowCnt){
							searchResult.getSearchResults("se_shop_goods", false, "");
						}else{
							searchResult.lazyLoading = false;
						}
					}
				},
				sendAdbrix : function() {					// 에드브릭스 데이터 전송
					if('로얄캐닌' != '' && 'PC' == 'APP'  ){
						var products = new Array();
						var goodsLi = $("#shopGoodsArea .needAdbrix");
						goodsLi.each(function(index, item){
							var thisProduct = {
								productId : $(item).data("productid"),
								productName : $(item).data("productname"),
								price : $(item).data("price"),
								quantity : 1, 
								discount : $(item).data("discount"),
								currency : 1,
								categorys : [
								],
								productDetailAttrs : {	
								}
							}
							products.push(thisProduct);
							$(item).removeClass("needAdbrix");
						});
						onSearchData.keyword = '로얄캐닌';
						onSearchData.productModels = products;
						toNativeAdbrix(onSearchData);
					}
				},
				setHistoryState : function (gb, obj) {					// history replace
					var stateUrl = "";
					if(searchResult.seriesPage != 1){
						stateUrl += '&series='+searchResult.seriesPage;
					}
					if(searchResult.memberPage != 1){
						stateUrl += '&member='+searchResult.memberPage;
					}
					if(searchResult.brandPage != 1){
						stateUrl += '&brand='+searchResult.brandPage;
					}
					if(searchResult.focus != ''){
						stateUrl += '&focus='+searchResult.focus;
					}
					if(searchResult.videoPage != 1){
						stateUrl += '&video='+searchResult.videoPage;
					}
					if(searchResult.contentPage != 1){
						stateUrl += '&content='+searchResult.contentPage;
					}
					if(searchResult.goodsPage != 1){
						stateUrl += '&goods='+searchResult.goodsPage;
					}
					if(searchResult.videoSort != "pop_rank"){
						stateUrl += '&vSort='+searchResult.videoSort;
					}
					if(searchResult.contentSort != "pop_rank"){
						stateUrl += '&cSort='+searchResult.contentSort;
					}
					if(searchResult.goodsSort != "pop_rank"){
						stateUrl += '&gSort='+searchResult.goodsSort;
					}
					
					var filtArr = new Array();
					$("#uifiltbox .swiper-slide").each(function() {
						filtArr.push($(this).find("span").attr("name")+"@"+$(this).find(".tt").text());
					});
					if(filtArr.length != 0){
						stateUrl += '&filtArrString='+filtArr.join(",");
					}
					
					var filtBSort = $("#bndSortVal").val();
					if(filtBSort == "v_1"){ 		//  브랜드 필터 가나다
						stateUrl += '&filtBSort=20';
					}
					
					//var url = "/commonSearch?srchWord=로얄캐닌&cateCdL=12565"+stateUrl;
					var url = "/commonSearch?srchWord=로얄캐닌&cateCdL="+searchResult.selectedCateCdL+stateUrl;
					if(searchResult.selectedCateCdL == null || searchResult.selectedCateCdL == 0){
						url = "/commonSearch?srchWord=로얄캐닌"+stateUrl;
					}
					
					storageHist.replaceHist(url);
					history.replaceState("","",url);
				},
				goSeries : function(srisNo, sesnNo) {
					var url = '/tv/series/petTvSeriesList?srisNo='+srisNo+'&sesnNo='+sesnNo;
					// 액션 로그
					searchResult.actionLog("tv",url);
					
					// 이동
					searchResult.focus = "ts"+srisNo+sesnNo;
					searchResult.setHistoryState("se_tv_series");
					location.href = url;
				},
				goMember : function(petLogUrl, mbrNo) {
					var url = '/log/indexMyPetLog/'+((petLogUrl == "")? "null":petLogUrl)+'?mbrNo='+mbrNo;
					// 액션 로그
					searchResult.actionLog("log",url);
					
					// 이동
					searchResult.focus = "lm"+mbrNo;
					searchResult.setHistoryState("se_log_member");
					location.href = url;
				},
				goBrand : function(bndNo) {
					var cateCdL = $(".petCate_tab").children("li[class~=active]").data("catecdl");
					var url = "/brand/indexBrandDetail?bndNo="+bndNo+"&cateCdL="+cateCdL;
					//TODO 전체 카테고리 검색 시 처리. 우선 cateCdL 제거.2021-06-25
					if(cateCdL == undefined){
						url = "/brand/indexBrandDetail?bndNo="+bndNo;
					}
					// 액션 로그
					searchResult.actionLog("shop",url);
					
					// 이동
					searchResult.focus = "sb"+bndNo;
					searchResult.setHistoryState("se_shop_brand");
					location.href = url;
				},
				goVideo : function(vdId) {
					// 검색 로그
					searchResult.searchLog(vdId);
					
					// 이동
					searchResult.focus = "tv"+vdId;
					searchResult.setHistoryState("se_tv_video");
					if(vdId.indexOf('E') == 0){
						/* APP에서 펫스쿨 상세 기존 onNewPage 호출 ==> 페이지 호출방식으로 변경 / 펫스쿨 상세는 pc, mo, app 모두 호출방식 동일함.
						if("false" == "true"){
							toNativeData.func = "onNewPage";
							toNativeData.type = "TV";
							toNativeData.url = "https://aboutpet.co.kr/tv/school/indexTvDetail?vdId="+vdId;
							toNative(toNativeData);
						}else{*/
							location.href = "/tv/school/indexTvDetail?vdId="+vdId;
						//}
					}else{
						$.cookie("backToSrch", location.href, {path:'/'});
						if("false" == "true"){
							toNativeData.func = "onNewPage";
							toNativeData.type = "TV";
							toNativeData.url = "https://aboutpet.co.kr/tv/series/indexTvDetail?vdId="+vdId+"&listGb=SEARCH";
							toNative(toNativeData);
						}else{
							location.href = "/tv/series/indexTvDetail?vdId="+vdId+"&listGb=SEARCH";
						}
					}
				},
				goContent : function(petLogNo) {
					// 검색 로그
					searchResult.searchLog(petLogNo);
					
					// 이동
					searchResult.focus = "lc"+petLogNo;
					searchResult.setHistoryState("se_log_content");
					location.href = "/log/indexPetLogDetailView?petLogNo="+petLogNo;
				},
				goGoods : function(goodsId) {
					// 검색 로그
					searchResult.searchLog(goodsId);
					
					// 이동
					searchResult.focus = "sg"+goodsId;
					searchResult.setHistoryState("se_shop_goods");
					location.href = "/goods/indexGoodsDetail?goodsId="+goodsId;
				},
				searchLog : function(contentId) {			// 검색 로그
					$.ajax({
						url : "/common/sendSearchEngineEvent"
						, data : {
							"logGb" : 'SEARCH'
							, "section" : 'content'
							, "index" : searchResult.focusedTab.toUpperCase()
							, "content_id" : contentId
							, "keyword" : '로얄캐닌'
						}
					});
				},
				actionLog : function(section, targetUrl) {			// 액션 로그
					$.ajax({
						url : "/common/sendSearchEngineEvent"
						, data : {
							"logGb" : 'ACTION'
							, "section" : section
							, "action" : "etc"
							, "url" : location.href
							, "targetUrl" : targetUrl
						}
					});
				}
			}//reseult-173
			
			/*
			* 	상품 필터
			*/
			var filter = {
				getPop : function(){						// 필터 팝업 컨트롤
					// 필터 팝업 열기
					if(filter.appliedCnt != ''){
						$("#preGoodsCnt").html(filter.appliedCnt);
					}else if($("#uifiltbox .swiper-wrapper .fil").length > 0){
						var filterdGoodsCnt = $("#goodsCount").text();
						$("#preGoodsCnt").html((filterdGoodsCnt != "" && filterdGoodsCnt != 0 )?filterdGoodsCnt+"개&nbsp;":"" );
					}
					if($("#popSample1").length != 0 ){
						filter.open();
					}else{
						waiting.start();
						if(searchResult.isFilterLoaing){
							var openPopInterval = setInterval(function() {
								if($("#popSample1").length != 0){
									clearInterval(openPopInterval);
									filter.open();
									waiting.stop();
								}
							}, 500);
						}else{
							searchResult.isFilterLoaing = true;
							$.get("/search/getFilterPop?srchWord="+searchResult.srchWord+"&cateCdL="+searchResult.selectedCateCdL,function (html) { 
								searchResult.isFilterLoaing = false;
								if($("#popSample1").length == 0){	// 필터 정보 추가전 상품탭 진입시 호출된 필터정보 들어가 있는지 다시 한번 확인
									$("body").append(html);
								}
								filter.open();
								waiting.stop();
							});
						}
					}
				},
				filterFirstOpen : true,
				open : function() {									// 필터 팝업 오픈
					// 브랜드 클릭 해제
					$(".brand-list li .checkbox").css("pointer-events", "");
					
					// history param 적용(필터의 브랜드 정렬)			
					var filtBSort = $("#bndSortVal").val();
					if("" == "20" && filter.filterFirstOpen){
						$("#bndSortVal").val("v_1");
						$("#bndSortVal").text("가나다순");
						$("#bndSortVal").next().find("ul li").removeClass("active");
						$("#bndSortVal").next().find("ul li:eq(1)").addClass("active");
						filter.filterFirstOpen = false;
						filter.brandSort('');
					}
					
					// 바닥 필터 팝업에 적용
					let filterHtml ="";
					$("#popSample1 .tag button").removeClass("active");
					$("#popSample1 .brand-list input").prop("checked", false);
					$(".uifiltbox .swiper-wrapper .fil").each(function() {
						let thisName = $(this).attr("name");
						let thisTxt = $(this).find(".tt").text();
						$("#"+thisName).addClass("active");
						if(thisName.indexOf("brand_") < 0){		// 필터
							$("#popSample1 .tag button[id='"+thisName+"']").addClass("active");
						}else{								// 브랜드
							$("#popSample1 .brand-list input[id='"+thisName+"']").prop("checked", true);
							/// [21.06.15 CSR-1075] 필터, 브랜드 항목 토글시키기. 토글방지 css 해제시킴.
							$("#popSample1 .brand-list input[id='"+thisName+"']").parent(".checkbox").css("pointer-events", "");
						}	
						filterHtml +='<li class="swiper-slide"><span class="remove-tag" name="'+ thisName+'">'+ thisTxt+'<button class="close" onclick="filter.delFilterOnPop(\''+thisName+'\');"></button></span></li>';
					});
					$("#fitersOnPop .swiper-wrapper").html(filterHtml);
					//20210531 수정. kwj. 필터 취소 후 다시 오픈했을경우 검색카운트 제거.
					if(filterHtml == ""){
						$("#preGoodsCnt").html("");
					}
					ui.popLayer.open('popSample1',{ 				// 콜백사용법
					    ocb:function(){
					        $("#filterDetail").click();
					    },
					    ccb:function(){
					    }
					});
				},
				btnActive : function(obj, isBrand) {				// 팝업내 필터 체크
					let thisObjId = $(obj).attr("id");
					
					if(!isBrand && !$(obj).hasClass("active")){					// 필터
						$(obj).toggleClass("active");
						let filterHtml ='<li class="swiper-slide"><span class="remove-tag" name="'+ thisObjId+'">'+ $(obj).text()+'<button class="close" onclick="filter.delFilterOnPop(\''+thisObjId+'\');"></button></span></li>';
						$("#fitersOnPop .swiper-wrapper").append(filterHtml);
						filter.chkGoodsCnt();
					} 
					// [21.06.15 CSR-1075] 필터, 브랜드 항목 토글시키기
					// 브랜드가 아니고(=상세조건) 이미 선택된 필터를 또 다시 클릭했을 경우.
					else if ( !isBrand && $(obj).hasClass("active") ) {
                     
                        // 헤딩필터 없애기, 필터 active css 없애기
                        filter.delFilterOnPop( thisObjId ); // 파라미터는 필터의 'id명' 임.
					}
					// 브랜드이고 선택안된 상태에서 클릭 했을경우
                    else if ( isBrand && $(obj).is(":checked") == true ) {
                    	let filterHtml ='<li class="swiper-slide"><span class="remove-tag" name="'+ thisObjId+'">'+ $(obj).data("bndnm")+'<button class="close" onclick="filter.delFilterOnPop(\''+thisObjId+'\');"></button></span></li>';
						$("#fitersOnPop .swiper-wrapper").append(filterHtml);
						filter.chkGoodsCnt();
                    }
					// 브랜드이고 선택된 상태에서 다시 선택한 경우
                    else if ( isBrand && $(obj).is(":checked") == false ) {

                        // 헤딩브랜드 없애기, 브랜트 체크박스 active css 없애기
                        filter.delFilterOnPop( thisObjId ); // 파라미터는 필터의 'id명' 임.
                    }

				},
				chkGoodsCnt : function() {							// 팝업 필터 적용시 상품 개수 확인
					var stndrPopArea = $("#fitersOnPop .swiper-slide");
					var popFetGbCd = [];
					var popBrands = [];
					var popFilters = [];
					stndrPopArea.each(function() {
						let thisName = $(this).find("span").attr("name");
						if(thisName.indexOf("brand_") != -1 ){			// 브랜드
							popBrands.push(thisName.replace("brand_",""));
						}else if(thisName.indexOf("petGbcd_") != -1 ){	// 펫구분 코드
							 popFetGbCd.push(thisName.replace("petGbcd_",""));
						}else{											// 필터
							let nos = thisName.split('_');
							let nosMap = 
								{
									FILTER_CD : nos[0],
									FILTER_VAL : [nos[1]]
								}
							let exstnKey = false;							
							
							for(let i=0 ; i < filter.appliedFilters.length ; i++){
								/* if( popFilters[i].FILTER_CD == nos[0]){
									popFilters[i].FILTER_VAL.push(nos[1]);
									exstnKey = true;
								} */
								if( filter.appliedFilters[i].FILTER_CD == nos[0]){
									if(!filter.appliedFilters[i].FILTER_VAL.includes(nos[1])){
										filter.appliedFilters[i].FILTER_VAL.push(nos[1]);
										exstnKey = true;
									}
																		
								}
							}
							if(!exstnKey){
								popFilters.push(nosMap);
							}
						}
					})
					
					let options = {
						 url : "/commonSearchGoodsCnt"
						,data : {
							srchWord : $("#orgSrchWord").val(),
							//cateCdL: '12565' //전체카테고리 처리 완료
							cateCdL: searchResult.selectedCateCdL //전체카테고리 처리 완료
						}
						,done : function(data) {			

							// [210611. APETQA-5691] 필터값 선택 모두 해제시, '상품보기'버튼 영역에 상품개수 표시 금지
                            if ( $("#fitersOnPop .swiper-slide").length == 0 ) {
                                $("#preGoodsCnt").html("");
                            } else {
                                $("#preGoodsCnt").html((data.result.goodsCount == null)?"0개&nbsp;":data.result.goodsCount+"개&nbsp;");
                            }
						}
					};
					if(popFetGbCd.length != 0){
						$.extend(options.data, {petGbCd:popFetGbCd.join(",")});
					}
					if(popBrands.length != 0){
						$.extend(options.data, {bndNo:popBrands.join(",")});
					}
					if(popFilters.length != 0){
						$.extend(options.data, {filter:JSON.stringify(popFilters)});
					}
					ajax.call(options);
				},
				delFilterOnPop : function(name) {					// 팝업내 필터 삭제
					$("#fitersOnPop .swiper-slide").each(function() {
						if(name == $(this).find("span").attr("name")){
							$(this).remove();
							// 필터 선택값 다시 확인
							if(name.indexOf("brand_") < 0){		// 필터
								$("#popSample1 .tag button[id='"+name+"']").removeClass("active");
							}else{								// 브랜드
								$("#popSample1 .brand-list input[id='"+name+"']").prop("checked", false);					
								$("#popSample1 .brand-list input[id='"+name+"']").parent(".checkbox").css("pointer-events", "");
							}	
						}
					});
					filter.chkGoodsCnt();
				},
				delFilter : function(name) {						// 필터 삭제
					if(name == null){
						$("#uifiltbox .flist .swiper-wrapper").html('');
						$("#uifiltbox").hide();
					}else{
						$("#uifiltbox .swiper-wrapper .fil").each(function() {
							if(name == $(this).attr("name")){
								$(this).remove();
							}
						});
					}
					filter.apply(); // 적용
				},
				resetFilterOnPop : function() {						// 팝업내 필터 삭제
					$("#fitersOnPop .swiper-wrapper").html("");
					$("#popSample1 .tag button").removeClass("active");
					$("#popSample1 .brand-list input").prop("checked", false);
				},
				brandSort : function(gb) { 						// 필터 브랜드 정렬

					// [21.06.16 CSR-1075] 통합검색 팝업 - 필터/브랜드 헤딩토글, 브랜드 통합검색으로 정렬
					// gb: 인기순 / v_2 / filter.brandSort('10') / pop_rank
					//    가나다순 / v_1 / filter.brandSort('') / bnd_nm_asc
					
					let bndSort = "";
				
					if ( gb == '10') {
						bndSort = 'pop_rank';
					} else if ( gb == '' ) {
						bndSort = 'bnd_nm_asc';
					}
				}
			
				
				
					//let options = {
						/*	url : "searchBrandList.jsp"
							, data : {srchWord : 
									 	//, cateCdL : '12565'
									 //	, cateCdL : searchResult.selectedCateCdL
										//, bndSort : bndSort 
										}
							, success:function(data,textStatus,jqXHR){
								*/
								  
								/* 
									   $(data.idname).each(function(i, element) {
								           if (element.nickName==logname) {
								        	    
								        	   $("#join_nickNm_error").html("이미 사용 중인 닉네임이에요.");
								        	     
										} 
										  
										 })
											}, */
								<%--있으면 이거생성 <div class="mybrand-list t3">
								<div class="brand" id="shopBrandArea">
								
									<a class="btn scrhItem sb950" href="javascript:searchResult.goBrand('950');">
				<span><%=s_word%></span></a>
				
				
		<input type="hidden" id="ajaxBrandListSize" value="1">
				
							</div> --%>
		
		/*없을때 이거생성<section class="no_data txt" id="no_data_brand"><div class="inr"><div class="msg">브랜드 검색 결과가 없습니다.</div></div></section>  */
		
		
								/* 	if(gb == 10){
									$("#bndSortVal").val('v_2');
								}else{
									$("#bndSortVal").val('v_1');
								}
								$("#popSample1 .brand-list").html(thisHtml);
								$("#fitersOnPop .swiper-slide").each(function() {
									let thisName = $(this).find("span").attr("name");
									if(thisName.indexOf("brand_") != -1 ){			// 브랜드
										$("#popSample1 .brand-list input[id='"+thisName+"']").prop("checked", true);
									}
								}) */
							
					
						
				},
				appliedCnt : "",									// 필터 적용시킨 상품 개수
				apply : function(isFromPop) {						// 필터 적용 상품 호출
					searchResult.goodsPage = 0;
					if(isFromPop){	// 팝업으로부터 왔을 경우 바닥페이지 셋팅
						// 적용된 필터 결과 페이지에 셋팅
						let filtBoxHtml = "";
						$("#fitersOnPop .swiper-slide").each(function() {
							let thisName = $(this).find(".remove-tag").attr("name");
							let thisTxt = $(this).find(".remove-tag").text();
							filtBoxHtml += '<li class="swiper-slide"><span class="fil" name='+thisName+'><em class="tt">'+thisTxt+'</em> <button class="del"onclick="filter.delFilter(\''+thisName+'\');">필터삭제</button></span></li>';
						});
						$("#uifiltbox .flist .swiper-wrapper").html(filtBoxHtml);
						$("#uifiltbox").show();
					}
				
					// 필터 개수 적용
					if($("#uifiltbox .swiper-wrapper .fil").length == 0){
						$(".uiTab_content .tit-box .uisort #filtBtn").removeClass("on");
						$("#uifiltbox").hide();
						$(".uiTab_content .tit-box .uisort .n").html("");
					}else{
						$(".uiTab_content .tit-box .uisort #filtBtn").addClass("on");
						$(".uiTab_content .tit-box .uisort .n").html("("+$("#uifiltbox .swiper-wrapper .fil").length+")");
					}
					
					filter.appliedFetGbCd = [];
					filter.appliedFilters = [];
					filter.appliedBrands = [];
					let stndrArea = $("#uifiltbox .fil");
					stndrArea.each(function() {
						let thisName = $(this).attr("name");
						filter.setFilterVal(thisName);
					})
					
					// 검색 결과 호출
					searchResult.getSearchResults("se_shop_goods", true, "");
					
					$("#popSample1 .btnPopClose").click();
					filter.appliedCnt = $("#preGoodsCnt").html();
				},
				setFilterVal : function(thisName) {					// 변수에 필터값 적용
					if(thisName.indexOf("brand_") != -1 ){			// 브랜드
						filter.appliedBrands.push(thisName.replace("brand_",""));
					}else if(thisName.indexOf("petGbcd_") != -1 ){	// 펫구분 코드
						filter.appliedFetGbCd.push(thisName.replace("petGbcd_",""));
					}else{											// 필터
						let nos = thisName.split('_');
						let nosMap = 
							{
								FILTER_CD : nos[0],
								FILTER_VAL : [nos[1]]
							}
						let exstnKey = false;
						
						for(let i=0 ; i < filter.appliedFilters.length ; i++){
							if( filter.appliedFilters[i].FILTER_CD == nos[0]){
								filter.appliedFilters[i].FILTER_VAL.push(nos[1]);
								exstnKey = true;
							}
						}
						if(!exstnKey){
							filter.appliedFilters.push(nosMap);
						}
					}
				},
				appliedFetGbCd : [],
				appliedFilters : [],
				appliedBrands : []
			}
				
				
		</script>

<script type="text/javascript">
//페이지 로딩시 처음 목록
			$(function() {
				<%-- <%=s_word%> --%>
				
		      $.ajax({ 
				 url:"searchBrandList.jsp?srchWord=<%=s_word%>",
				 dataType:"text",  
				
				 type:"GET",
				 cache:false, 
				 success:function (data, textStatus, jqXHR){ 
					
						 $("#noDataBrand").html(data);

					
				 },
				 error:function (){
					 $("#tit_brand").after('그럼그렇지');
				 }
			 }); 	
		     
		      $.ajax({ 
					 url:"searchItemList.jsp?srchWord=<%=s_word%>&cateCdL=1",
					 dataType:"text",  
					
					 type:"GET",
					 cache:false, 
					 success:function (data, textStatus, jqXHR){ 
						 if (data=="") {
					    	  data=" <section class='no_data txt' id='no_data_goods'><div class='inr'><div class='msg'>상품 검색 결과가 없습니다.</div></div></section>";

								$("#noDataItem").html(data);
							}else{
								$("#item-list").html(data);
							}
							

						
					 },
					 error:function (){
						 $("#tit_brand").after('그럼그렇지');
					 }
				 }); 	 
				
		      
		   
		      $.ajax({ 
					 url:"searchFriendsList.jsp?srchWord=<%=s_word%>",
					 dataType:"text",  
					 
					 type:"GET",
					 cache:false, 
					 success:function (data, textStatus, jqXHR){ 
					 
						 if (data=="") {
							$("#noDataUser").html("<section class='no_data txt'><div class='inr'><div class='msg'>친구 검색 결과가 없습니다.</div></div></section>");
						}else{
							$("#logMemberArea").html(data);
						}
							

						
					 },
					 error:function (){
						 $("#tit_brand").after('그럼그렇지');
					 }
				 }); 	 
		     
		      $.ajax({ 
					 url:"searchLogPost.jsp?srchWord=<%=s_word%>",
					 dataType:"text",  
					 
					 type:"GET",
					 cache:false, 
					 success:function (data, textStatus, jqXHR){ 
					 
						 if (data=="") {
							$("#noDataLog").html(" <section class='no_data txt'><div class='inr'><div class='msg'>게시물 검색 결과가 없습니다.</div></div></section>");
						}else{
							$("#logContentArea").html(data);
						}
						
					 },
					 error:function (){
						 $("#tit_brand").after('그럼그렇지');
					 }
				 }); 	  
		   //시리즈
		      $.ajax({ 
					 url:"searchSeries.jsp?srchWord=<%=s_word%>",
					 dataType:"text",  
					 
					 type:"GET",
					 cache:false, 
					 success:function (data, textStatus, jqXHR){ 
					 
						 if (data=="") {
							$("#tit-series").after(" <section class='no_data txt'><div class='inr'><div class='msg'>시리즈 검색 결과가 없습니다.</div></div></section>");
						}else{
							$("#tvSeriesArea").html(data);
						}
						
					 },
					 error:function (){
						 $("#tit_brand").after('그럼그렇지');
					 }
				 });
		    //동영상
		      $.ajax({ 
					 url:"searchvideo.jsp?srchWord=<%=s_word%>",
					 dataType:"text",  
					 
					 type:"GET",
					 cache:false, 
					 success:function (data, textStatus, jqXHR){ 
					 
						 if (data=="") {
							$("#video-tit").after(" <section class='no_data txt'><div class='inr'><div class='msg'>동영상 검색 결과가 없습니다.</div></div></section>");
						}else{
							$("#tvVideoArea").html(data);
						}
						
					 },
					 error:function (){
						 $("#tit_brand").after('그럼그렇지');
					 }
				 });
				
		 

})
</script>

<script type="text/javascript">		
 function changeList(gb) {			// 탭 클릭 이벤트
					
					if (gb=='tv') {
						$("#srchTab1").addClass("active");
						$("#srchTab1").siblings().removeClass("active");
					  
						$(".uiTab_content>ul>li").eq(0).addClass("active");
						$(".uiTab_content>ul>li").eq(0).siblings().removeClass("active");

					}else if (gb=='log') {
						$("#srchTab2").addClass("active");
						$("#srchTab2").siblings().removeClass("active");
			
						$(".uiTab_content>ul>li").eq(1).addClass("active");
						$(".uiTab_content>ul>li").eq(1).siblings().removeClass("active");

		
					}else if(gb='shop'){
						$("#srchTab3").addClass("active");
						$("#srchTab3").siblings().removeClass("active");
			
						$(".uiTab_content>ul>li").eq(2).addClass("active");
						$(".uiTab_content>ul>li").eq(2).siblings().removeClass("active");
					
					}

 }			
 </script>

<main class="container  page 1dep 2dep" id="container">
			<div class="inr" style="min-height: 354px;">
				<!-- 검색 결과 페이지 -->
<div class="contents" id="contents">
	<input type="hidden" value="가필드" id="orgSrchWord">
	<!-- PC 타이틀 모바일에서 제거  -->
	<div class="pc-tit">
		<h2><span><%=s_word %></span> 검색결과</h2>
	</div>
	<!-- // PC 타이틀 모바일에서 제거  -->
	<!-- tab -->
	<section class="sect petTabContent mode_fixed leftTab hmode_auto srchRslt">
		<!-- tab header -->
		<ul class="uiTab a line t2">
			
			<li id="srchTab1" onclick="changeList('tv');" class="">
				<a class="bt" href="javascript:void(0);">
					<div>
						TV
						<div class="both-txt" id="tvCnt"><%=cntVideo.get(0)+cntVideo.get(1) %></div>
							</div>
				</a>
			</li>
			<li id="srchTab2" onclick="changeList('log');"class="">
				<a class="bt" href="javascript:void(0);">
					<div>
						로그
						<div class="both-txt" id="logCnt"><%=cntLog.get(0)+cntLog.get(1) %></div>
							</div>
				</a>
			</li>
			<li id="srchTab3" onclick="changeList('shop');" class="active">
				<a class="bt" href="javascript:void(0);">
					<div>
						샵
						<div class="both-txt" id="shopCnt"><%=cntItem %></div>
							</div>
				</a>
			</li>
			
		</ul>
		<!-- // tab header -->
		<!-- tab content --> 
		<div class="uiTab_content">
			<ul style="left: 0%;">
				<li class="">
					<div class="tit-box" id="tit-series">
						<p class="tit">시리즈 <span><%=cntVideo.get(0) %></span></p>
					</div>
					<div class="series-list tvTab">
						<ul id="tvSeriesArea">
							</ul>
					</div>
					<div class="moreload ts2" id="tvSeriesMoreBtn" style="display: none;">
						<button type="button" class="bt more" onclick="searchResult.getSearchResults('se_tv_series')">시리즈 더보기</button>
					</div>
					<!-- //시리즈  -->
					<!-- 동영상  -->
					<div class="tit-box" id="video-tit">
						<p class="tit">동영상 <span id="videoCount"><%=cntVideo.get(1) %></span></p>
						<div class="right" id="tvSortArea">
							<nav class="uisort">
								<button type="button" class="bt st" value="v_2">최신순</button>
								<div class="list">
									<ul class="menu" id="videoSortArea">
										<li class="active"><button type="button" class="bt" value="v_2" onclick="searchResult.setSort('video','latest')">최신순</button></li>
										<li><button type="button" class="bt" value="v_3" onclick="searchResult.setSort('video','pop_rank')">인기순</button></li>
										<!-- <li><button type="button" class="bt" value="v_1" onclick="searchResult.setSort('video','_score')">추천순</button></li> -->
									</ul>
								</div>
							</nav>
						</div>
					</div>
					<div class="watch-movie t2" id="tvVideoArea">

</div>
					<!-- //동영상  -->
				</li>
				<li class="">
					<div class="tit-box" id="friend-tit">
						<p class="tit">친구 <span><%=cntLog.get(0) %></span></p>
					</div>
					<section id="noDataUser"></section>
					<!--없으면 여기에<section class="no_data txt"><div class="inr"><div class="msg">친구 검색 결과가 없습니다.</div></div></section>  -->
					<div class="series-list">
						<ul id="logMemberArea">
						
						<!-- <li class="scrhItem lm938916" onclick="searchResult.goMember('D02ACCABB3','938916')">
		<p class="img"><img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/938916/profile/0130e2a9-e72e-479a-9d90-c59d9dbeb890.jpg?type=f&amp;w=80&amp;h=80&amp;quality=90&amp;align=4" alt="/log/938916/profile/0130e2a9-e72e-479a-9d90-c59d9dbeb890.jpg" onerror="this.src='../../_images/common/icon-img-profile-default-m@2x.png'"></p>
		<div class="txt">
			<p class="t1"><span>시츄</span>사랑이</p>
			<p class="t2">
				<span>게시물 12</span>
				<span>팔로워 0</span>
			</p>
		</div> 
	</li> -->
							</ul>
					</div>
					<div class="moreload ts2" id="logMemberMoreBtn" style="display: none;">
						<button type="button" class="bt more" onclick="searchResult.getSearchResults('se_log_member')">친구 더보기</button>
					</div>
					<!-- //사용자 -->
					<!-- 로그 동영상 -->
					<div class="tit-box" id="post-tit">
						<p class="tit">게시물 <span id="contentCount"><%=cntLog.get(1) %></span></p>
						<div class="right" id="logSortArea">
							<nav class="uisort">
								<button type="button" class="bt st" value="v_2">최신순</button>
								<div class="list">
									<ul class="menu">
										<li class="active"><button type="button" class="bt" value="v_2" onclick="searchResult.setSort('content','latest')">최신순</button></li>
										<li><button type="button" class="bt" value="v_3" onclick="searchResult.setSort('content','pop_rank')">인기순</button></li>
										<!-- <li><button type="button" class="bt" value="v_1" onclick="searchResult.setSort('content','_score')">추천순</button></li> -->
									</ul>
								</div>
							</nav>
						</div>
					</div>
					<section id="noDataLog"></section>
					<!--게시물 없을때 여기에 <section class="no_data txt"><div class="inr"><div class="msg">게시물 검색 결과가 없습니다.</div></div></section>  -->
					
					<div class="mylog-area">
						<div class="logPicMetric t2">
							<ul id="logContentArea">
<!-- 		게시물생성						
<li class="scrhItem lc8240">
		<a href="javascript:searchResult.goContent('8240')" class="logPicBox">
			<span class="logIcon_pic "></span>
					<img src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/log/886917/64e1845d-f92c-4f2a-b80f-85dccff1a86b.jpg?type=f&amp;w=226&amp;h=226&amp;quality=90&amp;align=4" alt="/log/886917/64e1845d-f92c-4f2a-b80f-85dccff1a86b.jpg" onerror="this.src='../../_images/common/icon-img-profile-default-m@2x.png'">
				</a>
	</li> -->

</ul>
  <script type="text/javascript">		
  function changeCate(cateCdL){
	 
	   $.ajax({
	        type:"get"
	       , url: 'searchResultAjax2.jsp?srchWord=<%=s_word%>&cateCdL=' +cateCdL
	        //,data:searchWordData
	        ,dataType : "json"
	        ,cache:false
	       , success:function (data){
	    	  
	    		   
	    		   $("#shopCnt").html(data.count);
	             
	              }
	    });
	   $.ajax({ 
			 url:"searchItemList.jsp?srchWord=<%=s_word%>&cateCdL="+cateCdL,
			 dataType:"text",  
			
			 type:"GET",
			 cache:false, 
			 success:function (data, textStatus, jqXHR){ 
				if (data=="") {
		    	  data=" <section class='no_data txt' id='no_data_goods'><div class='inr'><div class='msg'>상품 검색 결과가 없습니다.</div></div></section>";
		    	  $("#item-list").html("");
					$("#noDataItem").html(data);
				}else{
					$("#noDataItem").html("");
					$("#item-list").html(data);
				}
						
			 },
			 error:function (){
				 $("#tit_brand").after('그럼그렇지');
			 }
		 }); 	 
	   
	   
	   
	   
	   
  }
 
   </script>

						</div>
					</div>
					<!-- // 로그 동영상 -->
				</li>
				<li class="active">
					<ul class="petCate_tab mt20">
						<li class="active" id="petGbcd_10" data-catecdl="12564"><a href="javascript:;" class="btn" onclick="changeCate(1)">강아지</a></li>
<!-- 						<li class="" id="petGbcd_20" data-catecdl="12565"><a href="javascript:;" class="btn" onclick="searchCommon.goSearchShopCateCdL(300000174);">고양이</a></li> -->	
 						<li class="" id="petGbcd_20" data-catecdl="12565"><a href="javascript:;" id="ccat" class="btn" onclick="changeCate(2)">고양이</a></li>
     					<li class="" id="petGbcd_40" data-catecdl="14111"><a href="javascript:;" class="btn" onclick="changeCate(3)">관상어</a></li>
						<li class="" id="petGbcd_50" data-catecdl="14196"><a href="javascript:;" class="btn" onclick="changeCate(4)">소동물</a></li>
					</ul>
					<script>
						$('.petCate_tab li').click(function(){
							$(this).addClass('active');
							$(this).siblings().removeClass('active');
						});
					</script>
					<!-- 브랜드 -->
					<div class="tit-box" id="tit_brand">
						<p class="tit">브랜드 </p>
					</div>
					<section id="noDataBrand"></section>
					<!-- <div class="mybrand-list t3">
						<div class="brand" id="shopBrandArea"> -->
						
					<%-- 		<a class="btn scrhItem sb950" href="javascript:searchResult.goBrand('950');">
		<span><%=s_word%></span></a>
		 --%>
		<!--여기까지  -->
<!-- <input type="hidden" id="ajaxBrandListSize" value="1"> -->
		<!-- </div>
						<div class="uimoreload" id="shopBrandMoreBtn" style="display: none;">
							<button type="button" class="bt more" onclick="searchResult.getSearchResults('se_shop_brand')">브랜드 더보기</button>
						</div>
					</div> -->
					<!-- // 브랜드 -->
					<!-- 상품 -->
					<div class="tit-box">
						<p class="tit">상품 <span id="goodsCount"><%=cntItem %></span></p>
						
						
						<div class="right" id="shopSortArea" style="display: none;">
							<nav class="uisort">
								<button type="button" id="filtBtn" class="bt filt st t1" value="v_1" onclick="filter.getPop();">필터<i class="n"></i></button>
							</nav>
							<nav class="uisort">
								<button type="button" class="bt st" value="v_3">판매 인기순</button>
								<div class="list">
									<ul class="menu">
										<li class="active"><button type="button" class="bt" value="v_3" onclick="searchResult.setSort('goods','pop_rank')">판매 인기순</button></li>
										<!-- <li><button type="button" class="bt" value="v_1" onclick="searchResult.setSort('goods','_score')">추천순</button></li> -->
										<li><button type="button" class="bt" value="v_2" onclick="searchResult.setSort('goods','latest')">등록일순</button></li>
										<li><button type="button" class="bt" value="v_4" onclick="searchResult.setSort('goods','price_asc')">낮은가격순</button></li>
										<li><button type="button" class="bt" value="v_5" onclick="searchResult.setSort('goods','price_desc')">높은가격순</button></li>
										<li><button type="button" class="bt" value="v_6" onclick="searchResult.setSort('goods','review')">상품평순</button></li>
									</ul>
								</div>
							</nav>
						</div>
						
						<div class="uifiltbox on filOneLine" id="uifiltbox" style="display: none">
							<div class="flist swiper-container swiper-container-initialized swiper-container-horizontal">
								<ul class="swiper-wrapper" style="transition-duration: 0ms;">
								</ul>
							<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="bts">
								<button type="button" class="bt refresh" onclick="filter.delFilter();">새로고침</button>
							</div>
						</div>
						
						
					</div>
					<section id="noDataItem"></section>
					<!--상품 없으면 여기에  생성<section class="no_data txt" id="no_data_goods"><div class="inr"><div class="msg">상품 검색 결과가 없습니다.</div></div></section> -->
					
					<div class="thumbnail-list t2" id="item-list">
						
						
						
					</div>
					<!-- // 상품 -->			
				</li>
			</ul>
		</div>
		<!-- // tab content -->
	</section>
	<!-- // tab -->
</div>
<!-- 검색 결과 페이지 -->
		</div>
		</main>
<%@
include file="./footer.jsp"

%>


</body>
