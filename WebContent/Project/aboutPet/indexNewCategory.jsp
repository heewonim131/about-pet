<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		if("<%=request.getAttribute("uri")%>" == "/event/indexSpecialExhibitionZone" || 
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
		}else if(uri == "/AboutPet/Project/aboutPet/indexNewCategory.do" ||
				 uri == "/AboutPet/Project/aboutPet/indexBestGoodsList.do") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);	// NEW BEST?
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if(uri == "/Project/aboutPet/brandList.do"){
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
			url += "&lnbDispClsfNo="+viewDispClsfNo;
		}else {
			url += "?lnbDispClsfNo="+viewDispClsfNo;
		}
		location.href = url;
	}
	
	
	function clickAD() {
		alert("준비중..!");
	}
	
	function getSortNewGoodsList(cateCDM){

		$.ajax({
            url : "/AboutPet/Project/aboutPet/getNewGoodsListAjax.do"
               , type : "GET"
               , dataType : "html"
               , data : {
                  mcate:cateCDM
               }
               ,cache:false
                  , success : function(html){
                 $("#sortGoodsList").empty();
                  $("#sortGoodsList").append(html);
                  //alert("!!!");
               }
         });
		
	}

</script>
<nav class="lnb shop" id="lnb">
	<div class="inr">
		<nav class="menushop">
			<button type="button" class="bt st">
				<span class="t"></span>
			</button>
			<div class="list">
				<ul class="menu">
					<li id="menu_tab_1" class="" data-dispClsfNo="1"><a class="bt"
						href="javascript:;"><b id="b_tag_1" class="t">강아지</b></a></li>
					<li id="menu_tab_2" class="" data-dispClsfNo="2"><a class="bt"
						href="javascript:;"><b id="b_tag_2" class="t">고양이</b></a></li>
				</ul>
			</div>
		</nav>
		<div class="shopCate">
			<ul class="menu">
				<!-- 				<li id="categoryStart"></li> -->
				<li id="shortCut3"><a class="bt" href="javascript:;"
					onclick="goLink('/AboutPet/Project/aboutPet/indexNewCategory.do?dispCornType=NEW')">
						<b class="t">신상품</b>
				</a></li>
				<li id="shortCut4"><a class="bt" href="javascript:;"
					onclick="goLink('/AboutPet/Project/aboutPet/indexBestGoodsList.do?dispCornType=BEST')">
						<!-- dispClsfNo=300000174 --> <b class="t">베스트</b>
				</a></li>

				<li class="open" id="tab_category_1"><a class="bt tog"
					href="javascript:;"><b class="t">카테고리</b></a>
					<ul class="sm">
						<c:forEach items="${ shopCategory }" var="dto">
							<li class=""><a class="bt"
								href="javascript:setCateList('${ dto.mcate_code }', '<%= request.getAttribute("lnbDispClsfNo") %>', 'N');"><b
									class="t">${ dto.mcate_name }</b></a></li>
						</c:forEach>
					</ul></li>

				<li class="open" id="tab_category_2"><a class="bt tog"
					href="javascript:;"><b class="t">카테고리</b></a>
					<ul class="sm">

						<c:forEach items="${ shopCategory }" var="dto">
							<li class=""><a class="bt"
								href="javascript:setCateList('${ dto.mcate_code }', '<%= request.getAttribute("lnbDispClsfNo") %>', 'N');"><b
									class="t">${ dto.mcate_name }</b></a></li>
						</c:forEach>

					</ul></li>

			</ul>
		</div>
		<div class="gdrecent">
			<a class="box" href="#"
				onclick="location.href='/mypage/indexRecentViews/'" data-content=""
				data-url="/mypage/indexRecentViews/"> <b class="t">최근본상품</b>
				<div class="thumb">
					<div class="pic">
						<img src="../../_images/common/img-rc-vw-gds.jpg" alt=""
							class="img">
					</div>
				</div>
			</a>
		</div>
	</div>
</nav>
<!-- e : LNB 영역 -->
<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->

<!-- s : 본문영역 -->
<main class="container lnb page shop dm newgd" id="container">
	<input type="hidden" id="cateCdL" value="12564" /> <input type="hidden"
		id="dispCornType_new" value="NEW" />
	<div class="pageHeadPc lnb">
		<div class="inr">
			<div class="hdt">
				<h3 class="tit">신상품</h3>
			</div>
		</div>
	</div>
	<div class="inr">
		<!-- 본문 -->
		<div class="contents" id="contents">
			<nav class="smain_cate_sld">
				<div class="sld-nav">
					<button type="button" class="bt prev">이전</button>
					<button type="button" class="bt next">다음</button>
				</div>

				<div class="swiper-container slide">
					<ul class="uiTab f swiper-wrapper list">
						<li class="swiper-slide active" id="12564" name="dispClsfNo">
							<button type="button" class="btn" data-ui-tab-btn="tab_bests"
								data-dispClsfNo="12564" onclick="getSortNewGoodsList('0');">전체</button>
						</li>
						<c:forEach items="${ mcate }" var="dto">
							<li class="swiper-slide " id="${dto.mcate_code }"
								name="dispClsfNo">
								<button type="button" class="btn" data-ui-tab-btn="tab_bests"
									data-dispClsfNo="${dto.mcate_code }"
									onclick="getSortNewGoodsList('${dto.mcate_code }' );">${dto.mcate_name }</button>
							</li>

						</c:forEach>
					</ul>
				</div>
			</nav>

			<section id="sortGoodsList">
				<section class="sect dm newgd">
					<div class="uioptsorts newgd">
						<div class="dx lt">
							<div class="tot">
								총 <em class="n">${newCategoryLength }</em>개 상품
							</div>
						</div>
						<div class="dx rt">
							<nav class="uisort">
								<button type="button" class="bt st" value="SALE">판매인기순</button>
								<div class="list">
									<ul class="menu">
										<li class="active" id="order_SALE"><button type="button"
												class="bt" value="SALE">판매인기순</button></li>
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
					<div class="gdlist">
						<ul class="list" id="cate">
							<c:forEach items="${ NewCategory }" var="dto">
								<li>
									<div class="gdset defgd">
										<div class="thum">
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
												class="pic" data-content='GI251022896'
												data-url="/goods/indexGoodsDetail?goodsId=GI251022896">
												<img class="img" src="${dto.item_img }"
												alt="${dto.item_name }"
												onerror="this.src='../../_images/common/img_default_thumbnail_2@2x.png'">
											</a>
											<c:set var="doneLoop" value="false"></c:set>
											<c:if test="${ zzim ne null }">
												<c:forEach items="${ zzim }" var="zzim" varStatus="status">
													<c:if test="${ not doneLoop }">
														<c:if test="${ zzim.item_code eq dto.item_code }">
															<button type="button" class="bt zzim on"
																id="btnZzim_${ dto.item_code }"
																data-itemcode="${ dto.item_code }" value="Y">찜하기</button>
															<c:set var="doneLoop" value="true"></c:set>
														</c:if>
														<c:if test="${ status.last }">
															<c:if
																test="${ status.current.item_code ne dto.item_code }">
																<button type="button" class="bt zzim "
																	id="btnZzim_${ dto.item_code }"
																	data-itemcode="${ dto.item_code }" value="N">찜하기</button>
																<c:set var="doneLoop" value="true"></c:set>
															</c:if>
														</c:if>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${ zzim eq null }">
												<button type="button" class="bt zzim "
													id="btnZzim_${ dto.item_code }"
													data-itemcode="${ dto.item_code }" value="N">찜하기</button>
											</c:if>
										</div>
										<div class="boxs">
											<div class="tit">
												<a
													href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
													class="lk" data-content='GI251022896'
													data-url="/goods/indexGoodsDetail?goodsId=GI251022896">${dto.item_name }</a>
											</div>
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${ dto.item_code }"
												class="inf" data-content='GI251022896'
												data-url="/goods/indexGoodsDetail?goodsId=GI251022896">
												<span class="prc"><em class="p">${dto.item_price }</em><i
													class="w">원</i></span> <span class="pct"><em class="n">${dto.sale_rate }</em><i
													class="w">%</i></span>
											</a>
										</div>
									</div>
								</li>
							</c:forEach>

						</ul>
					</div>
				</section>
			</section>
		</div>
	</div>
</main>
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
				onclick="location.href='https://aboutpet.co.kr/tv/home/'" class="bt"><span>TV</span></a>
			</li>
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
			ajax.call(options);
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
			ajax.call(options);
		} 
	function convertVerBtn(gb){
		if(gb == 'MO'){
			$.cookie("DEVICE_GB", "MO",  {path: '/'});
	 		window.location.reload();
		}else{
			$.cookie("DEVICE_GB", "PC",{path: '/'});
	 		window.location.reload();
		}		
	}
</script>

<!-- footer -->
<c:import url="./footer.jsp"></c:import>
</body>
</html>