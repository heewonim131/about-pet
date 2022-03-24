<%@page import="project.aboutPet.shop.model.ShopDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

		<div class="layers">
			<!-- 레이어팝업 넣을 자리 -->
			<!-- 등급안내 팝업 추가 2021.05.13 -->
			<article class="popLayer a popLank " id="popLank">
				<div class="pbd">
					<div class="phd">
						<div class="in">
							<h1 class="tit"></h1>
							<button type="button" class="btnPopClose">닫기</button>
						</div>
					</div>
					<div class="pct">
						<main class="poptents">
							<div class="rankCont">
								<div class="rank_imgBox rank_pc">
									<img src="/_images/common/img-level-pc.png"
										alt="어바웃펫 패미리 등급별 혜택 이미지">
								</div>
							</div>
						</main>
					</div>
				</div>
			</article>
			<!-- //등급안내 팝업 추가 2021.05.13 -->
		</div>
		<!--// header pc-->
		<!-- e : header 영역 -->
		<!-- s : gnb 영역 -->
		<script type="text/javascript">
function setCateList(dispClsfNo, upDispClsfNo) {
	var dispClsfNo2 ='';	
	if('12564' == upDispClsfNo ) {			// 강아지
		dispClsfNo2 = '300000173'
	} else if('12565' == upDispClsfNo ) {	// 고양이
		dispClsfNo2 = '300000174'
	} else if('14111' == upDispClsfNo ) {	// 관상어
		dispClsfNo2 = '300000175'
	} else if('14196' == upDispClsfNo ) {	// 소동물
		dispClsfNo2 = '300000176'
	}
	
	location.href = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&dispClsfNo2="+dispClsfNo2+"&cateCdL="+upDispClsfNo+"&cateCdM="+dispClsfNo;
}

function goIndexLoginSettings() {
	location.href = "/indexLoginSettings?returnUrl=" + window.location.pathname;
}

//시리즈 팝업
function seriesOpen(){
	var options = {
		url : "/tv/series/getSeriesList"
		, type : "POST"
		, dataType : "html"
		, data : { }
		, done : function(result){
			$("#gnbSrisListPopup").empty();
			$("#gnbSrisListPopup").html(result);
			ui.gnb.using("close"); //시리즈 목록 레이어 팝업 실행시 gnb메뉴(전체메뉴) 닫기
			ui.popLayer.open('popSeriesList');
		}
	};
	/*ajax.call(options);*/
}


function goMyPetLogGnb(){
	if( checkLoginGnb() && checkRegPetGnb() ){
		location.href = "https://aboutpet.co.kr/log/indexMyPetLog/?mbrNo=0";
	}
}


function checkLoginGnb(){
	if( "false" != "true" ){
		ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들
			ycb:function(){
				location.href = "https://aboutpet.co.kr/indexLogin";
			},
			ncb:function(){
				return false;
			},
			ybt:"로그인", // 기본값 "확인"
			nbt:"취소"  // 기본값 "취소"
		});
	}else{
		return true;
	}
}


function checkRegPetGnb(){	
	if( "" == null || "" == ""){
		ui.confirm('마이펫 등록 후 이용할 수 있어요<br/>펫정보를 등록할까요?',{ // 컨펌 창 옵션들
			ycb:function(){
				// 반려동물 등록 화면으로 이동.
				location.href = "https://aboutpet.co.kr/my/pet/petInsertView";
			},
			ncb:function(){
				//alert('취소');
				return false;
			},
			ybt:"예", // 기본값 "확인"
			nbt:"아니요"  // 기본값 "취소"
		});
	}else{
		return true;
	}
}

</script>


<c:import url="./sidebar.jsp"></c:import>


<script>
	$(document).ready(function(){
		
	});
	
	$(window).bind("pageshow", function(event){
		if(event.originalEvent.persisted || window.performance && window.performance.navigation.type == 2){
			var state = window.history.state;
			if(state) {
				page = state.page;
				scrollPrevent = state.scrollPrevent;
				$("#contents").html('');
				$("#contents").html(state.data);
				ui.disp.subnav.init();
				if(state.idx != undefined){
					ui.disp.subnav.elSwiper.el.slideTo(state.idx-1);
				}
			}else {
				window.history.replaceState(null, null, null);
				brandGoodsList.list();
			}
		}else{
			window.history.replaceState(null, null, null);
			brandGoodsList.list();
		}
	});
	
	// 브랜드 찜
	function insertWishBrand(obj, bndNo) {
		var isLogin = "false";
		if(isLogin == "true"){
			var options = {
				url : "/brand/insertWish",
				data : {bndNo : bndNo},
				done : function(data) {
					if (data.actGubun =='add') {
						$(obj).addClass("on");
						fnUiToast("찜리스트에 추가되었어요", "wish");
						userActionLog(bndNo, "interest");
					} else if (data.actGubun =='remove') {
						$(obj).removeClass("on");
						fnUiToast("찜리스트에서 삭제되었어요", "wished");
						userActionLog(bndNo, "interest_d");
					}
				}
			};
			/*ajax.call(options);*/
		}else{
			location.href = "/indexLogin";
		}
	}
	
	//공유하기 버튼 클릭
	function shareBtnClick(bndNo, linkUrl, bndNmKo){
		userActionLog(bndNo, "share");
		//app인 경우
		var deviceGb = "PC";
		if("PC" == "APP"){ // APP인경우
			// 데이터 세팅
			toNativeData.func = "onShare";
			toNativeData.image = $(".thum .pic .img").eq(0).attr("src");
			toNativeData.link = linkUrl;
			toNativeData.subject = bndNmKo;
			// 호출
			toNative(toNativeData);
		}else{
			//web인 경우
			copyToClipboard(linkUrl);
		}
	}
	
	function copyToClipboard(val){
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		textarea.value = val;
		textarea.select();
		document.execCommand('copy');
		document.body.removeChild(textarea);
		fnUiToast("링크가 복사되었어요", "share");
	}
	
	// toast
	function fnUiToast(text, cls){
		ui.toast(text,{
			cls : cls ,
			bot: 74, //바닥에서 띄울 간격
			sec:  3000 //사라지는 시간
		});
	}
	
	//검색API 클릭 이벤트(사용자 액션 로그 수집)
	function userActionLog(bndNo, action){	
		var mbrNo = "0";
		if (mbrNo != "0") {
			$.ajax({
				type: 'POST'
				, url : "/common/sendSearchEngineEvent"
				, async:false
				, dataType: 'json'
				, data : {
					"logGb" : "ACTION"
					, "mbr_no" : mbrNo
					, "section" : "shop" 
					, "content_id" : bndNo
					, "action" : action
					, "url" : document.location.href
					, "targetUrl" : document.location.href
				}
			});
		}
	}
	
	var res = {
	          loader : $("<div />" , {"class":"loader"})
	          , container: $("body")
	    };
	
	var brandGoodsList = {
			br_code : "<%=request.getParameter("br_code")%>",
			list : function(dispClsfNo, order){
				page = 0;
				result = true;
				scrollPrevent = true;
				var init = false;
				
				if(dispClsfNo == undefined && order == undefined) {
					init = true;
				}
				
				if(dispClsfNo == undefined) {
					dispClsfNo = '12564';
				}
				
				if(order == undefined) {
					order = $("li[class=active][id^=order]").children().val();
				}
				
				$.ajax({
					url : "/AboutPet/Project/aboutPet/brandAjaxList.do"
					, type : "get"
					, dataType : "html"
					, data : {
						br_code : <%=request.getParameter("br_code")%>
						, dispClsfNo :dispClsfNo
						, order : order
						, page : page
					}
					,cache: true
					, success : function(data){
						res.container.find(res.loader).remove();
						$("#sortGoodsList").empty();
						$("#sortGoodsList").append(data);
						$("#emTag_count").text(${count});
						
						if(!init) {
							brandGoodsList.pushUrl(dispClsfNo);
						}
					}
					,beforeSend:function ( xhr ){  
			    		   res.container.append( res.loader );
			    		}
				});
				/*ajax.call(options);*/
			},
			pushUrl : function(cateCdM) {
				var params = new URLSearchParams(location.search);
				params.set('cateCdM', cateCdM);
				var searchParams = params.toString();
				var goUrl = window.location.pathname + "?"+searchParams;
				var order = $("li[class=active][id^=order]").children().val();
				var idx = $("li[name=dispClsfNo][class~=active]").data("idx");
				window.history.replaceState( {data : $("#contents").html(), page : page, scrollPrevent : scrollPrevent, order : order, idx : idx}, null, goUrl);
			}
	}
	
	</script>

		<%
		String pCount = (String) request.getAttribute("count");
		int count = Integer.parseInt(pCount);
		%>
		<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
		<!-- e : gnb 영역 -->
		<!-- s : LNB 영역 -->
		
		<script type="text/javascript">		
	$(document).ready(function(){
		var cateCdL = "<%=request.getAttribute("lnbDispClsfNo")%>"	// 12564
 		var reqUri = "<%=request.getAttribute("uri")%>"		
		
 		$.each($('li[id^=shortCut] a'), function(){
			$(this).parent('li').attr("class", "");
	 		if($(this).attr("onclick").indexOf(reqUri) != -1){
	 				$(this).parent('li').attr("class", "active");
	 		}
 		});
		
 		// 분류창 열고 보내기
		showMyLnbList(cateCdL);
 		
		$("#lnb").show();
		$("#contents").show();
		

		$("li[id^=menu_tab_]").one('click', function(){	
			var dispClsfNo = $(this).data("dispclsfno");	// 클릭한 li태그의 data : dispclsfno 값
			$("#lnb").hide();
			$("#contents").hide();
			sendDispClsfNo(dispClsfNo);
		});
		
		// 카테고리 버튼 열기/닫기 버튼 쿠키 저장
		$("li[id^=tab_category_]").children('a').click(function(){
			var categoryClass = $(this).parent().attr("class");
			if(categoryClass == 'open') {
				$.cookie('categoryYn', 'N', {path:'/'});
			}else{
				$.cookie('categoryYn', 'Y', {path:'/'});
			}
		});
	});
	
	function loadCornerGoodsList(dispClsfNo, dispCornNo, dispClsfCornNo, dispType, timeDeal) {
		var petNo = $("#petNo_rec").val();
		var form = document.createElement("form");
		document.body.appendChild(form);
		var url = "/shop/indexGoodsList";
		form.setAttribute("method", "GET");
		form.setAttribute("action", url);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispClsfNo");
		hiddenField.setAttribute("value", dispClsfNo);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispCornNo");
		hiddenField.setAttribute("value", dispCornNo);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispClsfCornNo");
		hiddenField.setAttribute("value", dispClsfCornNo);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispType");
		hiddenField.setAttribute("value", dispType);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		if(timeDeal != undefined) {
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "timeDeal");
			hiddenField.setAttribute("value", timeDeal);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}
		if(dispType == 'RCOM') {
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "petNo");
			hiddenField.setAttribute("value", petNo);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}
		form.submit();
	}
	
	function setCateList(dispClsfNo, upDispClsfNo, scateYN) {
		var dispClsfNo2 ='';	
		if('1' == upDispClsfNo ) {			// 강아지
			dispClsfNo2 = '1'
		} else if('2' == upDispClsfNo ) {	// 고양이
			dispClsfNo2 = '2'
		}
		url = "/AboutPet/Project/aboutPet/itemList.do?dispClsfNo="+dispClsfNo+"&lnbDispClsfNo="+dispClsfNo2; //+"&cateCdL="+cateCdL+"&cateCdM="+cateCdM;
		var cateCdL = $("#cateCdL").val();
		var cateCdM = $("#cateCdM").val();
		if(scateYN == 'Y') {
// 			if(dispClsfNo == '') {
// 				url = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&lnbDispClsfNo="+lnbDispClsfNo+"&cateCdL="+cateCdL+"&cateCdM="+cateCdM;
// 			}else {
// 				url = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&lnbDispClsfNo="+lnbDispClsfNo+"&cateCdL="+cateCdL+"&cateCdM="+cateCdM;
// 			}
			url = "/AboutPet/Project/aboutPet/itemList.do?dispClsfNo="+dispClsfNo+"&lnbDispClsfNo="+dispClsfNo2; //+"&cateCdL="+cateCdL+"&cateCdM="+cateCdM;
		}
		location.href = url;
	}
	
	// 분류번호 보내기
	function sendDispClsfNo(dispClsfNo){		// 대분류 코드 받아서
		var lnbDispClsfNo = dispClsfNo
		var cateCdL = dispClsfNo
		
		
		if('1' == dispClsfNo ) {			// 강아지
			lnbDispClsfNo = '1'
		} else if('2' == dispClsfNo ) {	// 고양이
			lnbDispClsfNo = '2'
		} 
	
		var form = document.createElement("form");		//
		document.body.appendChild(form);
		var url = "<%=request.getAttribute("uri")%>";
		if("<%=request.getAttribute("uri")%>" == "/AboutPet/Project/aboutPet/brandList.do" || 
		   "<%=request.getAttribute("uri")%>" == "/shop/indexGoodsList"){
			url = "shop_home.do";
		}		// 없는 페이지 호출시 홈으로 되돌려줌
		
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lnbDispClsfNo');
		hiddenField.setAttribute('value', lnbDispClsfNo);	// 페이지를 클릭할 때마다 넘어가는 대분류 코드
		form.appendChild(hiddenField);
		
		var uri = "<%=request.getAttribute("uri")%>";
		
		if(uri == "/AboutPet/Project/aboutPet/itemList.do" ||
		   uri == "/event/indexExhibitionZone") {
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "cateCdL");
			hiddenField.setAttribute("value", cateCdL);	// 12564
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/AboutPet/Project/aboutPet/indexNewCategory" ||
				 uri == "/AboutPet/Project/aboutPet/indexBestGoodsList.do") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);	// NEW BEST?
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/AboutPet/Project/aboutPet/brandList.do"){
			var bndNo = $("input[id=bndNo]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "br_code");
			hiddenField.setAttribute("value", br_code);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/shop/indexPetShopTagGoods"){	
			var tags = new Array();
			tags.push( $("#tags").val() );
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "tags");
			hiddenField.setAttribute("value", tags);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "tagNm");
			hiddenField.setAttribute("value", $("#tagNm").val());
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/pet/event/petshopEventList" ||
				 uri == "/shop/indexLive"){
			form.setAttribute("method", "GET");
		}else if(uri == "/event/shop/main"){
			form.setAttribute("method", "GET");
			form.removeChild(hiddenField);

			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispClsfNo");
			hiddenField.setAttribute("value", lnbDispClsfNo);
			form.appendChild(hiddenField);
		}else {
			form.setAttribute("method", "GET");
		}
		form.setAttribute("action", url);
		document.body.appendChild(form);
		form.submit();
	}
	
	// 나의 반려 동물로 LNB 셋팅
	function showMyLnbList(lnbDispClsfNo) {
		$("#b_tag_"+lnbDispClsfNo).click();
		$("li[id^=tab_category_]").hide();
		$("#tab_category_"+lnbDispClsfNo).show();
	}
	
	function goLink(url) {
		var viewDispClsfNo = '<%=request.getAttribute("lnbDispClsfNo")%>';
		if(url.indexOf("?") > -1) {
			url += "&dispClsfNo="+viewDispClsfNo;
		}else {
			url += "?dispClsfNo="+viewDispClsfNo;
		}
		location.href = url;
	}
	
	
	function clickAD() {
		alert("준비중..!");
	}
	
</script>

		<!-- e : LNB 영역 -->
		<!-- s : 검색 영역 -->
		<!-- e : 검색 영역 -->

		<!-- s : 본문영역 -->
		<main class="container lnb page shop dm brand" id="container">
			<input type="hidden" id="cateCdL" value="12564" /> <input
				type="hidden" id="cateCdM" value="" /> <input type="hidden"
				id="bndNo" value="426" />
			<div class="inr">
				<!-- 본문 -->
				<div class="contents" id="contents">
					<section class="sect dm brand tops">
						<div class="bts">
						</div>
						<div class="info ">
							<div class="blogo">
								<div class="pic"></div>
							</div>
							<div class="name-pet">
								<div class="bname">${map.item_name }</div>
								<div class="bpet" id="">${map.lcate_name }</div>
							</div>
						</div>
					</section>
					<nav class="subtopnav cates relat" style="height: auto;"></nav>
					<section class="sect dm brand">
						<div class="uioptsorts brand">
							<div class="dx lt">
								<div class="tot">
									총 <em class="n" id="emTag_count"><%=count%></em>개 상품
								</div>
							</div>
							<div class="dx rt">
								<nav class="uisort">
									<button type="button" class="bt st" value=""></button>
									<div class="list">
										<ul class="menu">
											<li id="order_SALE"><button type="button" class="bt"
													value="SALE">판매인기순</button></li>
											<li id="order_LOW"><button type="button" class="bt"
													value="LOW">낮은가격순</button></li>
											<li id="order_HIGH"><button type="button" class="bt"
													value="HIGH">높은가격순</button></li>
											<li id="order_SCORE"><button type="button" class="bt"
													value="SCORE">상품평순</button></li>
											<li id="order_DATE"><button type="button" class="bt"
													value="DATE">등록일순</button></li>
										</ul>
									</div>
								</nav>
							</div>
						</div>
						<div class="gdlist" id="sortGoodsList">
							<ul class="list" id="brandUl">
							</ul>
						</div>
					</section>
				</div>
			</div>
		</main>
		<!-- TWC chatbot Scripts -->
		<script
			src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.plugin.js"></script>

		<script type="text/javascript">
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

		<nav class="floatNav">
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
		<%
		int br_code = Integer.parseInt(request.getParameter("br_code"));
		%>

		<script>
		var page = 1
		var rows = '20';
		var result = true;
		var scrollPrevent = true;
		var deviceGb = "PC"
		var goodsCount ='<%=count%>';
		
		$(function(){
			$(window).on("scroll touchmove" , function(){
				if($(window).scrollTop()+1 >= $(document).height() - $(window).height()){
					if(result && scrollPrevent){
						var liLength = $("ul[id=brandUl]").children("li").length;
						if((liLength != goodsCount) && (liLength >= 20)){
							if(page == 1) {
								page = 1*rows
							} else {
								page = ((page/rows)+1) * rows
							}
							scrollPrevent = false;
							pagingGoodsList();
						}
					}
				}					
			});
		});
		
		
		function pagingGoodsList(){
			var dispClsfNo = $("li[class~=active][name^=dispClsfNo]").children().data("dispclsfno");
			var order = $("li[class=active][id^=order]").children().val();
			if(dispClsfNo == undefined) {
				dispClsfNo = '12564';
			}
		 	$.ajax({
				url : "/AboutPet/Project/aboutPet/brandAjaxList.do" 
				,type:"get"
				,data:{
					br_code : '<%=br_code%>'
					, mem_code : <%= mem_code%>	
				} 
				,dataType : "html"
				,cache:false
				, success : function(data){
					res.container.find(res.loader).remove();
					$("#brandUl").append(data);
					if($("#brandUl li").length % 20 != 0 || $("#brandUl li").length == goodsCount){
						result = false;					
					}else {
						scrollPrevent = true;
					}
					brandGoodsList.pushUrl(dispClsfNo);
				}
				 ,beforeSend:function ( xhr ){  
		    		   res.container.append( res.loader );
		    		}
				,error: function() {
					alert("실패");
				}
			});
		}
		</script>

<script>

	$(document).on("click", "button[id^=btnZzim_]",function() {
		<% 
		if(session.getAttribute("num")==null){
		%>
			alert("로그인 후 이용할 수 있습니다.")		
		<%
		} else{			
		%>
		
		/* alert(document.querySelector("#btnZzim").dataset.itemcode) */

		var item_code = $(this).data("itemcode")
		var zzimcheck = $(this).val()
		var mem_code = "<%= mem_code %>"
		
			$.ajax({
				url : "/AboutPet/Project/aboutPet/zzim.do"
					, type : "GET"
					, dataType : "text"
					, data : {
						item_code : item_code
						, zzimcheck : zzimcheck
						, mem_code : mem_code
					}
					,cache:false
	            	, success : function(data){
	            		
	            		if(data == 1){
							alert("찜 목록에 추가되었습니다.");
	            			location.reload();
							$(this).addClass("on");
							$(this).attr("value", "Y");
						}
						else if(data == 2){
							alert("찜 목록에서 삭제되었습니다.");
	            			location.reload();
							$(this).removeClass("on");
							$(this).attr("value", "N");
						} else {
							alert("찜 추가 실패!");
	            			location.reload();
						}
	            		
	            		/* 
	            		if(html != ""){
							alert("찜 목록에 추가되었습니다.");
	            			location.reload();
							$("div[id=item_zzim_"+item_code+"]").empty();
							$("div[id=item_zzim_"+item_code+"]").append(html);
	            		} else {	            			
							alert("찜 추가 실패!");
	            		}
						 */
						
						
						 
					}
			})

		<%
		}
		%>
		
	})
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
					<li id="liTag_20" class="tv "><a href="#"
						onclick="location.href='https://aboutpet.co.kr/tv/home/'"
						class="bt"><span>TV</span></a></li>
					<li id="liTag_30" class="log "><a href="#"
						onclick="location.href='https://aboutpet.co.kr/log/home/'"
						class="bt"><span>로그</span></a></li>
					<li id="liTag_10" class="shop active"><a href="#"
						onclick="location.href='https://aboutpet.co.kr/shop/home/'"
						class="bt"><span>샵</span></a></li>
					<li id="liTag_00" class="my "><a href="#"
						onclick="location.href='https://aboutpet.co.kr/mypage/indexMyPage/'"
						class="bt"><span>MY</span></a></li>
				</ul>
			</div>
		</nav>
		<!-- e : menubar 영역 -->

		<!-- s : footer 영역 -->
		<script type="text/javascript">
	/* 사업자정보 팝업 */
	function openLicensee(licensee) {
		var url = "http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no="+licensee;
		window.open(url, "communicationViewPopup", "width=750, height=700;");
	}
	
	/* Escrow */
	function openEscrow() {
		var options = {
			url : "/introduce/terms/indexEscrow",
			params : {},
			width : 640,
			height: 690,
			callBackFnc : "",
			modal : true
		};
		pop.open("escrow", options);
	}
	
	// 이용약관 pop
	function openTerms(termsCd , settingYn){
		if("false" == "true"){
			var url = "/introduce/terms/indexTermsApp?termsCd="+ termsCd +"&settingYn="+ settingYn;
			window.open(url, "termsContentPop");
		}else{
			var options = {
				url : "/introduce/terms/indexTerms"
				, data : {
					termsCd : termsCd
					, settingYn : settingYn
				}
				, dataType : "html"
				, done : function(html){
					$("#layers").html(html);
					ui.popLayer.open("termsContentPop");
				}
			}
		}
	}
	// 입점/제휴 문의 pop
	function openPartnershipInquiry(){
			var options = {
				url : "/customer/notice/indexPartnerNoticeList"
				, data : ''
				, dataType : "html"
				, done : function(html){
					$("#layers").html(html);
					ui.popLayer.open("popInqry");
				}
			}
			/*ajax.call(options);*/
		}
</script>

		<!-- footer -->
		<footer class="footer" id="footer">
			<div class="inr">
				<div class="link">
					<ul class="list">
						<li><a href="#"
							onclick="openTerms('2001' , 'Y'); return false;">서비스 이용약관</a></li>
						<li><a href="#"
							onclick="openTerms('2002' , 'Y'); return false;">개인정보 처리방침</a></li>
						<li><a href="#" onclick="openPartnershipInquiry()">입점/제휴
								문의</a></li>
					</ul>
				</div>
				<div class="info">
					<ul class="list">
						<li>(주)어바웃펫 대표 : 김경환, 나옥귀</li>
						<li>사업자 등록번호 : 120-87-90035</li>
						<li class="dn">통신판매업신고번호 : 제 2020-서울강남-03142호</li>
						<li>개인정보관리자 : 정명성 hello@aboutpet.co.kr</li>
						<li>TEL : 1644-9601</li>
					</ul>
					<p class="adr">서울특별시 강남구 테헤란로 151 (역삼하이츠빌딩) 지하2층</p>
				</div>
				<div class="copy">&copy; copyright (c) www.aboutpet.co.kr all
					rights reserved.</div>
			</div>
		</footer>
		<!--// footer -->

		<div id="layers"></div>
		<!-- e : footer 영역 -->
	</div>
</body>
</html>