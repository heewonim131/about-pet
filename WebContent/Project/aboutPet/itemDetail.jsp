<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.collections.map.HashedMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
int mem_code = 0;
String isLogin = "false";
if (session.getAttribute("num") != null) {
	mem_code = (int) session.getAttribute("num");
	isLogin = "true";
}
%>
<c:set var="mem_code" value="<%=mem_code%>"></c:set>
<c:if test='${ mem_code eq 0 }'>
	<c:import url="header.jsp" />
</c:if>
<c:if test='${ mem_code ne 0 }'>
	<c:import url="loginheader.jsp" />
</c:if>


<c:set value="${dto }" var="dto"></c:set>
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
	if("true" == "true"){
		var options = {
			url : "/tv/series/getSeriesList"
			, type : "POST"
			, dataType : "html"
			, data : { }
			, done : function(result){
				$("#srisListPopup").append(result);
				ui.popLayer.open('popSeriesList');
			}
		};
		ajax.call(options);
	}else{
		var url = "/tv/series/getSeriesListApp";
		window.open(url, "popSeriesList");
	}
}


function goMyPetLogGnb(){
	if( checkLoginGnb() && checkRegPetGnb() ){
		location.href = "https://aboutpet.co.kr/log/indexMyPetLog/?mbrNo=0";
	}
}


function checkLoginGnb(){
		if( "false" != "true" ){
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들ㅁㅁㅁ
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

<div class="layers tv seriesHome" id="srisListPopup"></div>
<!-- e : gnb 영역 -->
<!-- s : LNB 영역 -->
<!-- e : LNB 영역 -->
<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->

<!-- s : 본문영역 -->
<main class="container page shop view" id="container">
	<div class="inr">
		<div class="contents" id="contents">
			<!-- 카테고리 -->
			<script type="text/javascript">
//메인으로 가기
function goPetShopMain(dispClsfNo) {
	
	if('12564' == dispClsfNo ) {			// 강아지
		dispClsfNo = '300000173'
	} else if('12565' == dispClsfNo ) {	// 고양이
		dispClsfNo = '300000174'
	} else if('14111' == dispClsfNo ) {	// 관상어
		dispClsfNo = '300000175'
	} else if('14196' == dispClsfNo ) {	// 소동물
		dispClsfNo = '300000176'
	}
	
	var form = document.createElement("form");
	document.body.appendChild(form);
	var url = "/shop/home/";
	form.setAttribute("method", "POST");
	form.setAttribute("action", url);

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "lnbDispClsfNo");
	hiddenField.setAttribute("value", dispClsfNo);
	form.appendChild(hiddenField);
	document.body.appendChild(form);
	form.submit();
}
</script>

			<nav class="location">
				<ul class="loc">
					<li><a href="javascript:;" class="bt st"></a>
						<ul class="menu">
							<li class="active"><a class="bt"
								href="javascript:goPetShopMain('12564');">강아지</a></li>
							<li><a class="bt" href="javascript:goPetShopMain('12565');">고양이</a>
							</li>
							<li><a class="bt" href="javascript:goPetShopMain('14111');">관상어</a>
							</li>
							<li><a class="bt" href="javascript:goPetShopMain('14196');">소동물</a>
							</li>
						</ul></li>
					<li><a href="javascript:;" class="bt st"></a>
						<ul class="menu">
							<li class="active"><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12569&cateCdL=12564&cateCdM=12569">사료</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12571&cateCdL=12564&cateCdM=12571">간식</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12572&cateCdL=12564&cateCdM=12572">건강관리</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12575&cateCdL=12564&cateCdM=12575">위생/배변</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12576&cateCdL=12564&cateCdM=12576">미용/목욕</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12577&cateCdL=12564&cateCdM=12577">급식/급수기</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12573&cateCdL=12564&cateCdM=12573">장난감/훈련</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12578&cateCdL=12564&cateCdM=12578">하우스</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=13998&cateCdL=12564&cateCdM=13998">이동장</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12579&cateCdL=12564&cateCdM=12579">패션/의류</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12581&cateCdL=12564&cateCdM=12581">목줄/하네스</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=100000196&cateCdL=12564&cateCdM=100000196">반려인용품</a>
							</li>
						</ul></li>

					<li><a href="javascript:;" class="bt st"></a>
						<ul class="menu">
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=100000179&cateCdL=12564&cateCdM=12569">건식</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12586&cateCdL=12564&cateCdM=12569">소프트</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12583&cateCdL=12564&cateCdM=12569">습식</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=14247&cateCdL=12564&cateCdM=12569">자연식</a>
							</li>
							<li class="active"><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12587&cateCdL=12564&cateCdM=12569">건조생식</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12588&cateCdL=12564&cateCdM=12569">분유/우유</a>
							</li>
							<li><a class="bt"
								href="/shop/indexCategory?dispClsfNo=12589&cateCdL=12564&cateCdM=12569">사료샘플</a>
							</li>
						</ul></li>
				</ul>
			</nav>
			<div class="pdTops">

				<!-- 상품 이미지 영역 START -->
				<section class="pdPhoto">
					<!-- 이미지 왼쪽 상단 -->
					<div class="pdThumbSlide">
						<div class="swiper-container">
							<ul class="swiper-wrapper slide">
								<li class="swiper-slide"><a href="javascript:" class="box"><span
										class="pic"><img class="img" src="${dto.item_img }" /></span></a>
								</li>
							</ul>
						</div>
					</div>

					<!-- 메인 이미지 영역 START -->
					<div class="pdPhotoSlide">
						<!-- 타임딜 / 재고임박 / 유통기한 임박 -->
						<div class="flags"></div>
						<!-- 메인 이미지 슬라이드 -->
						<div class="swiper-container">
							<div class="swiper-pagination"></div>
							<ul class="swiper-wrapper slide" name="detailImg">
								<li class="swiper-slide"><a href="javascript:" class="box">
										<span class="pic"> <img class="img"
											onclick="detailGoodsImgPop(this)" src="${dto.item_img }">
									</span>
								</a></li>
							</ul>
						</div>
					</div>
					<!-- 메인 이미지 영역 END -->
				</section>
				<!-- 상품 이미지 영역 END -->

				<section class="pdInfos p1">

					<!-- 공유하기 -->
					<div class="share">
						<a href="javascript:void(0)" onclick="fnShare();" class="bt shr">공유하기</a>
					</div>

					<!-- 아이콘 -->
					<div class="flag">
						<em class="fg a">${dto.lcate_name }</em>
					</div>

					<!-- 브랜드관 노출/비노출 영역 -->
					<div class="pstore">
						<a
							href="/AboutPet/Project/aboutPet/brandList.do?br_code=${dto.br_code }"
							class="bt lk">${dto.br_name }</a>
					</div>
					<!-- 상품명 -->
					<div class="names">${dto.item_name }</div>

					<!-- 후기 평점 -->
					<script type="text/javascript">

							
	$(function (){
		$('#pdRevCnt').text(<%=request.getAttribute("count")%>);
	});
</script>
					<!-- 후기 -->
					<div class="starpoint">
						<c:if test="${ itemStar.c_vote ne null }">
							<span class="stars sm p_${ star[0] }_${ star[1] < 5 ? 0 : 5 }"></span>
							<span class="point">${ itemStar.rv_star }</span>
							<span class="revew"><a href="javascript:;" class="lk"
								onclick="$('i[name=pdRevCnt]').trigger('click'); return false;"
								name="pdRevCnt">(${ itemStar.c_vote })</a></span>
						</c:if>
					</div>
					<!-- 가격 -->
					<div class="prices">
						<div class="price">
							<c:choose>
								<c:when test="${ dto.sale_rate eq 0 }">
									<span class="prcs"><fmt:formatNumber pattern="#,###"
											value="${ dto.item_price }"></fmt:formatNumber><i class="w">원</i></span>
								</c:when>
								<c:otherwise>
									<span class="disc">${ dto.sale_rate }%</span>
									<c:set value="${ (100 - dto.sale_rate) / 100 }" var="s_price"></c:set>
									<span class="prcs"><fmt:formatNumber pattern="#,###"
											value="${ dto.item_price * s_price  }"></fmt:formatNumber><i
										class="w">원</i></span>
									<span class="ogpc">${ dto.item_price }<i class="w">원</i></span>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 쿠폰받기 -->
						<div class="coupon" id="isCoupon" style="display: none">
							<a href="javascript:;" onclick="openPopupCoupon();"
								class="bt cpn">쿠폰받기</a>
						</div>
						<style>
li.disabled button {
	pointer-events: none;
	cursor: default;
}
</style>
						<script type="text/javascript">
	//쿠폰 목록 세팅
	var cpNos = [];
	var couponList = [];
	var limit = 20;

	$(function(){
		fnGetCoupons('PI000003601', 'ITEM');
	});

	/**
	 * 쿠폰 목록 조회
	 */
	function fnGetCoupons(goodsId, goodsCstrtTpCd, goodsNm) {
		//묶음/옵션 상품 목록 클릭하였을 경우
		if(goodsNm) {
			//묶음/옵션 상품 목록 콤보 박스 닫기
			ui.popBot.close('popCouponOptPdSel');

			//묶음/옵션 상품 목록 선택 상품명 세팅
			$('#goodsNm').text(goodsNm);
		}

		//화면 초기화
		couponList = [];
		$('#couponUl').html('');

		// 쿠폰 템플릿
		var template = document.querySelector("#templateCouponli").innerHTML;

	}
	/**
	 * 쿠폰 목록 조회
	 */
	function fnCouponList(page) {
		//console.log('쿠폰 목록 조회:' + page);
		if(!page) {
			page = 0;
		}

		var pageStrt = page * limit;
		var pageEnd = pageStrt + limit;

		//console.log('쿠폰 페이징 std : ' + pageStrt +', end : '+ pageEnd);
		$.each(couponList, function(i, v){
			if(i >= pageStrt && i < pageEnd) {
				$('#couponUl').append(v);
			}
		});

		// 상품 상세 쿠폰받기 버튼 활성화
		/* if(page == 0) {
			$('#isCoupon').show();
		} */
	}

	function fnCheckLogin(cpNo, obj) {

		if('false' == 'true') {
			if(cpNo == null) {
				fnDownloadGoodsCouponAll();
			} else {
				fnDownloadGoodsCoupon(cpNo);
			}
		} else {
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들
				ycb:function(){
					var url = encodeURIComponent(document.location.href);
					//App일때 영상상세에서 다른화면으로 이동시 화면 닫고 이동해야함
					if("false" == "true" && document.location.href.indexOf("/tv/series/indexTvDetail") > -1){
						// 데이터 세팅
						toNativeData.func = "onCloseMovePage";
						toNativeData.moveUrl = "https://aboutpet.co.kr/indexLogin?returnUrl="+url;
						// APP 호출
						toNative(toNativeData);
					}else{
						document.location.href = '/indexLogin?returnUrl='+url;
					}
				},
				ncb:function(){
					return false;
				},
				ybt:"로그인", // 기본값 "확인"
				nbt:"취소"  // 기본값 "취소"
			});
		}
	}

	/**
	 * 쿠폰 다운로드
	 * @param cpNo
	 * @param obj
	 */
	async function fnDownloadGoodsCoupon(cpNo) {

		var option = {
			url : '/goods/downloadGoodsCoupon'
			,   data : { cpNo : cpNo }
			,   done : function(data){

				if(data.result > 0) {
					//성공한 쿠폰 다운로드 버튼 비활성화
					$('#li_'+ cpNo).addClass('disabled');
					ui.toast("쿠폰 다운로드가 완료되었어요.")
				} else {
					if(data.message) {
						ui.toast(data.message);
					}
				}
			}
		};
		await ajax.call(option);
	}

	/**
	 * 쿠폰 다운로드
	 * @param cpNo
	 * @param obj
	 */
	async function fnDownloadGoodsCouponAll() {

		if('false' == 'true') {

			var size = cpNos.length;
			var noCpNos = [];

			//다운로드 받지 않은 쿠폰 세팅
			$.each(cpNos, function(i,v) {
				if(v.cpUseYn == 'N') {
					noCpNos.push(v.cpNo);
				}
			});

			var option = {
				url : '/goods/downloadGoodsCouponAll'
				, data : JSON.stringify(noCpNos)
				, contentType : 'application/json'
				, done : function(data){

					if(data.result > 0) {
						//성공한 쿠폰 개별 다운로드 버튼 비활성화
						$.each(data.successList, function(index, value){
							//기존 쿠폰 array 에 cpUseYn 업데이트
							$.each(cpNos, function(i,v) {
								if(v.cpNo == value){
									v.cpUseYn = 'Y';
								}
							});
							$('#li_'+ value).addClass('disabled');
						});

						//전체 다운받기 비활성화 - 모두 성공하였을 경우,
						if(size == i) {
							$('#downloadAllBtn').prop('disabled', true);
						}

						alert('쿠폰 다운로드가 완료되었어요.');
					} else {
						alert('쿠폰 다운로드가 실패되었습니다.');
					}
				}
			};
			await ajax.call(option);

		} else {
			if(confirm('로그인 후 다운로드 가능합니다. 로그인 하시겠습니까?')) {
				window.open("/indexLogin?returnUrl="+encodeURIComponent(document.location));
			}
		}
	}

	function openCouponNotic(cpNo) {
		if('10' == '10') {
			$('#popCpnGudNotice').html('');
			$('#popCpnGudNotice').html($('#notice_'+ cpNo).text());
			ui.popBot.open('popCpnGud');
		} else {
		}
	}
</script>
						<article class="popLayer a popCpnGet" id="popCpnGet">
							<div class="pbd">
								<div class="phd">
									<div class="in">
										<h1 class="tit">쿠폰받기</h1>
										<button type="button" class="btnPopClose inpop">닫기</button>
									</div>
								</div>
								<div class="pct">
									<main class="poptents">
										<div class="btstop">
											<form id="command" name="couponForm"
												action="/goods/indexGoodsDetail?goodsId=PI000003601"
												method="post"></form>
										</div>
										<div class="cupon-wrap">
											<div class="cupon-area t2 setAutoh" data-dh="60">
												<ul class="cupon-list" id="couponUl"></ul>
											</div>
										</div>
									</main>
								</div>
								<div class="pbt">
									<div class="bts">
										<button type="button" id="downloadAllBtn"
											class="btn xl a btnGet" onclick="fnCheckLogin(null, this);">쿠폰
											모두 받기</button>
									</div>
								</div>
							</div>
						</article>

						<!-- 쿠폰이용안내 -->
						<article class="popBot popCpnGud k0427" id="popCpnGud">
							<div class="pbd">
								<div class="phd">
									<div class="in">
										<h1 class="tit">이용안내</h1>
										<button type="button" class="btnPopClose">닫기</button>
									</div>
								</div>
								<div class="pct">
									<main class="poptents">
										<ul class="tplist" id="popCpnGudNotice"></ul>
									</main>
								</div>
							</div>
						</article>


						<script type="text/template" id="templateCouponli">
<li class="{{disabled}}" id="li_{{cpNo}}" >
	<div class="sale">
		{{aplTxt}}
		<div class="uitooltip" style="display: {{none}}">
			<button type="button" class="btn i btnTooltop" onclick="openCouponNotic('{{cpNo}}')">이용안내</button>
			<div class="toolctn">
				<div class="tptit">이용안내</div>
				<ul class="tplist" id="notice_{{cpNo}}">{{notice}}</ul>
			</div>
		</div>
	</div>
	<p class="tit">[상품쿠폰]{{cpNm}}</p>
	<div class="bottom-item">
		<div class="txt">
			<p>{{maxDcTxt}}</p>
			<p>{{vldPrdPeriod}}</p>
		</div>
	</div>
	<button type="button" class="btn-down" onclick="fnCheckLogin('{{cpNo}}', this);">쿠폰 다운로드</button>
</li>
</script>

						<script>
	var isScrBot = true ;
	var page = 1;
	$("#popCpnGet .pct").on("scroll resize",function(){
		var scTop = $(this).scrollTop();
		var scBox = $(this).outerHeight();
		var scCtn = $(this).prop("scrollHeight");
		if (scCtn <= scTop + scBox && isScrBot == true) {
			isScrBot = false;
			setTimeout(function(){
				fnCouponList(page ++);
				isScrBot = true;
			},500);
		}
	});
</script>
						<!-- 쿠폰다운 -->
					</div>
					<c:set value="${dto }" var="dto"></c:set>
					<div class="tags relaTags">
						<div class="tit">연관태그</div>
						<div class="box">
							<ui class="tgs"> <c:forEach begin="0"
								end="${fn:length(tag)-1}" var="r">
								<li><a
									href="/AboutPet/Project/aboutPet/tagPageList.do?tagNm=${tag[r] }"
									class="tg">#${tag[r] }</a></li>
							</c:forEach> <!-- MD PICK 노출/비노출 --> <!-- 연관태그 --> <!-- <li><a href="/shop/indexPetShopTagGoods?tags=T000000001&tagNm=강아지" class="tg">#강아지</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000000005&tagNm=전연령" class="tg">#전연령</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000000518&tagNm=사료" class="tg">#사료</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000000596&tagNm=관절건강" class="tg">#관절건강</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000000984&tagNm=건조생식" class="tg">#건조생식</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001015&tagNm=공통" class="tg">#공통</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001114&tagNm=대용량" class="tg">#대용량</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001226&tagNm=반려식품" class="tg">#반려식품</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001377&tagNm=식욕증진" class="tg">#식욕증진</a></li>
										<li><a href="/shop/indexPetShopTagGoods?tags=T000001415&tagNm=알러지" class="tg">#알러지</a></li> -->
							</ui>
							<div class="more">
								<a href="javascript:;" class="bt">더보기</a>
							</div>
						</div>
					</div>


					<hr class="hbar">

					<!-- 할인혜택 -->
					<div class="benefit">
						<div class="box">
							<div class="tit">할인혜택</div>
							<div class="ctn">
								<c:set value="${ (100 - dto.sale_rate) / 100 }" var="s_price"></c:set>
								<p>
									GS&POINT <em class="pt"><fmt:formatNumber pattern="#,###"
											value="${ dto.item_price * s_price*0.001  }"></fmt:formatNumber>P</em>
									적립
								</p>
							</div>
						</div>
					</div>

					<!-- 배송정보 -->
					<div class="deliys">
						<div class="box">
							<div class="tit">배송정보</div>
							<div class="ctn">
								<p>
									<span class="dawn"><span name="dlvrAmt">배송비${dto.item_fee }원</span></span>
								</p>
								<p>
									<span class="free"><span name="dlvrFree">${dto.free_fee }원
											이상 무료배송</span></span>
								</p>
							</div>
							<a href="javascript:;" class="bt more"
								onclick="ui.popBot.open('popDelInfo', {'pop':true});">더보기</a>
						</div>
						<!-- 배송 추가 정보 -->
						<script type="text/javascript">
	$(function(){
		// 배송 정보
		//goods.dlvrcPlcNo: 1
		//goods.dlgtSubDlvrcPlcNo: 
		getDeliveryInfo('912', '1');
	});

	/**
	 * 배송정보
	 * @param goodsId
	 * @param compPlcNo
	 */ //goods.freeDlvrYn: N


	/**
	 * todo[상품, 이하정, 202010314] 연결 데이터 확인 후 작업 더 필요함
	 * 체크 결제 완료시 연결 데이터 체크
	 * 체크 업체 배송일 때 문구 확인
	 * @param
	 */
</script>
						<div class="deliguides">
							<ul class="gdlist">
								<li class="dl2">
									<div class="ht">당일배송</div>
									<div class="dt">
										<div class="tt" name="onedayText"></div>
										<div class="ss" data-delivery="day">11시 30분 전 결제완료 시</div>
									</div>
								</li>

								<li class="dl1">
									<div class="ht">새벽배송</div>
									<div class="dt">
										<div class="tt" name="dawnText"></div>
										<div class="ss" id="dawn" data-delivery="dawn">21시 전 결제
											완료시</div>
									</div>
								</li>

								<li class="dl3">
									<div class="ht">택배배송</div>
									<div class="dt">
										<div class="tt">1 ~ 2일 소요 예정</div>
										<div class="ss" data-delivery="parcel">
											16시 이전 주문 : 다음날 도착 (98%) <br>16시 이후 주문 : 2일 이내 도착
										</div>
										<!-- CSR-1309 건으로 주석 처리 20210622
						<div class="tt">당일 출고 예정(주말, 공휴일 제외)</div>
						<div class="ss" data-delivery="parcel">16시 전 결제 완료시 (<span name="dlvryHour">00</span>시 <span name="dlvryMin">00</span>분 남음)</div>
						-->
										<!-- 04-23 QA 요청 안보여도 되는 데이터 
						<div class="ss"><span name="dlvrAmt"></span> <span name="dlvrFreePop"></span></div>
						 -->
									</div>
								</li>
							</ul>
						</div>
						<div class="layers">
							<article class="popBot popDelInfo" id="popDelInfo">
								<div class="pbd">
									<div class="phd">
										<div class="in">
											<h1 class="tit">배송/반품/교환</h1>
											<button type="button" class="btnPopClose">닫기</button>
										</div>
									</div>
									<div class="pct">
										<main class="poptents">
											<section class="sect">
												<div class="hdt">
													<span class="tit">배송안내</span>
												</div>
												<div class="cdt">
													<ul class="gdlist">
														<li class="dl1">
															<div class="ht">당일배송</div>
															<div class="dt">
																<div class="tt">11:30 배송마감</div>
															</div>
															<div class="dd">
																<div class="tt" name="onedayText"></div>
																<div class="ss">
																	<ul class="bls">
																		<li>서울, 인천, 경기 일부 가능</li>
																		<li>명절연휴(설날/추석 당일) 제외</li>
																	</ul>
																</div>
															</div>
														</li>
														<li class="dl2">
															<div class="ht">새벽배송</div>
															<div class="dt">
																<div class="tt">21:00 배송마감</div>
															</div>
															<div class="dd">
																<div class="tt" name="dawnText"></div>
																<div class="ss">
																	<ul class="bls">
																		<li>서울, 경기 일부 가능</li>
																		<li>일요일, 명절연휴(설날/추석 당일) 제외</li>
																	</ul>
																</div>
															</div>
														</li>
														<li class="dl3">
															<div class="ht">택배배송</div>
															<div class="dt">
																<div class="tt">16:00 배송마감</div>
															</div>
															<div class="dd">
																<div class="tt">1 ~ 2일 소요 예정</div>
																<div class="ss">
																	<ul class="bls">
																		<li>16시 이전 주문 : 다음날 도착 (98%)</li>
																		<li>16시 이후 주문 : 2일 이내 도착</li>
																		<li>토요일,일요일,공휴일 제외</li>
																	</ul>
																</div>
															</div>
														</li>
													</ul>
												</div>
											</section>
											<section class="sect">
												<div class="cdt" id="rtnExcInfo"></div>
											</section>
										</main>
									</div>
								</div>
							</article>
						</div>
					</div>

					<!-- 사은품 -->
				</section>
			</div>

			<!-- 상품 상세 텝 메뉴 -->
			<div class="pdCtns">
				<div class="tabMenu">
					<div class="inr">
						<ul class="uiTab a menu">
							<li data-btn-sid="pd-inf"><a class="bt" href="javascript:;"><span
									class="tt">상품정보</span></a></li>
							<li data-btn-sid="pd-rev"><a class="bt" href="javascript:;"><span
									class="tt"><span class="tt">후기</span> <i class="nm"
										name="pdRevCnt" id="pdRevCnt"><%=request.getAttribute("count")%></i></a>
							</li>
							<li data-btn-sid="pd-qna"><a class="bt" href="javascript:;"><span
									class="tt">Q&amp;A</span> <i class="nm" name="pdQnaCnt"></i></a></li>
						</ul>
					</div>
				</div>

				<!-- 상품정보 -->
				<div class="tabCtns">
					<section class="sec inf" data-sid="pd-inf">
						<script type="text/javascript">
	var cstrtArr = new Array();
	
		var cstrt = {};
		cstrt.goodsId = 'PI000003601';
		cstrt.goodsNm = '지위픽 독 식품 트라이프&amp;양고기 1kg';
		cstrt.count = '1';

		cstrtArr.push(cstrt);

	/**
	 * [레이어] 자세히 열기
	 */
	function fnOpenPopPdDetView(goodsId, isOpen) {
		var goodsNm = '';
		var goodsCount = '';
		$.each(cstrtArr, function(i, v){
			if(v.goodsId == goodsId) {
				goodsNm = v.goodsNm;
				goodsCount = '상품'+v.count;
			}
		});
		$('#optPdNm').text(goodsNm);
		$('#optPdCount').text(goodsCount);

		var options = {
			url : '/goods/getGoodsDesc'
			, data : {goodsId:goodsId}
			, done : function(result){
				if(result.goodsDesc) {
					var goodsDesc = result.goodsDesc;
					var goodsNm = '';

					$('#cstrtPc').html($.parseHTML(goodsDesc.contentPc));
					$('#cstrtMobile').html($.parseHTML(goodsDesc.contentMobile));

					if(isOpen) {
						ui.popLayer.open('popPdDetView');
					}
				}
			}
		};
		ajax.call(options);
	}

	/**
	 * [레이어] 자세히 닫기
	 */
	function fnClosePopPdDetView() {
		$('#cstrtPc').html();
		$('#cstrtMobile').html('');

		ui.popBot.close('popOptPdSel');
		ui.popLayer.close('popPdDetView');
	}
</script>

						<div class="cdts">

							<!-- 공통 상품 배너 정보
	<div class="html_editor mo" id="bannerMobile"></div>
	<div class="html_editor pc" id="bannerPc"></div>
	-->
							<!-- 묶음 상품 정보 -->
							<div class="html_editor mo" id="contentMobile">
								<script type="text/javascript">
	/* console.log("성분 정보 변동 여부 : " + goods.igdtInfoLnkYn); */
</script>


								<div class="gdtbl c">
									<div class="gdthdt">상품 필수 정보</div>
									<table class="tblist c" cellpadding="0" cellspacing="0"
										summary="품명 및 모델명, 제조사,제조국,A/S책임자,인증허가,안정인증여부 테이블">
										<caption>상품 필수 정보</caption>
										<colgroup>
											<col>
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th>품명 및 모델명</th>
												<td>${shopRequiredInfo.item_name }</td>
											</tr>
											<tr>
												<th>법에 의한 인증,허가 등을 받았음을 확인할수 있는 경우 그에 대한 사항</th>
												<td>${shopRequiredInfo.legal }</td>
											</tr>
											<tr>
												<th>제조국 또는 원산지</th>
												<td>${shopRequiredInfo.country }</td>
											</tr>
											<tr>
												<th>제조자,수입품의 경우 수입자를 함께 표기</th>
												<td>${shopRequiredInfo.company }</td>
											</tr>
											<tr>
												<th>AS책임자와 전화번호 또는 소비자상담 관련 전화번호</th>
												<td>${shopRequiredInfo.as_contact }</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- 상품 상세 END -->

							</div>

							<div class="html_editor pc template_area" id="contentPc">
								<img src="${ dto.item_content }" border="0"
									class="full_img_area">
								<script type="text/javascript">
   /* console.log("성분 정보 변동 여부 : " + goods.igdtInfoLnkYn); */
</script>

								<div class="gdtblset">
									<!-- @@ 03.03 .gdtblset 영양정보,상세정보 감싸기 -->
								</div>


								<div class="gdtbl c">
									<div class="gdthdt">상품 필수 정보</div>
									<table class="tblist c" cellpadding="0" cellspacing="0"
										summary="품명 및 모델명, 제조사,제조국,A/S책임자,인증허가,안정인증여부 테이블">
										<caption>상품 필수 정보</caption>
										<colgroup>
											<col>
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th>품명 및 모델명</th>
												<td>${shopRequiredInfo.item_name }</td>
											</tr>
											<tr>
												<th>법에 의한 인증,허가 등을 받았음을 확인할수 있는 경우 그에 대한 사항</th>
												<td>${shopRequiredInfo.legal }</td>
											</tr>
											<tr>
												<th>제조국 또는 원산지</th>
												<td>${shopRequiredInfo.country }</td>
											</tr>
											<tr>
												<th>제조자,수입품의 경우 수입자를 함께 표기</th>
												<td>${shopRequiredInfo.company }</td>
											</tr>
											<tr>
												<th>AS책임자와 전화번호 또는 소비자상담 관련 전화번호</th>
												<td>${shopRequiredInfo.as_contact }</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- 상품 상세 END -->

							</div>

							<div class="btsmore">
								<button type="button" class="bt more" data-ui-btsmore="more">
									<em class="t">상품정보 더보기</em>
								</button>
							</div>
						</div>
					</section>


					<!-- 후기 -->
					<section class="sec rev" data-sid="pd-rev">
						<script type="text/javascript">
	/*APET-1121  펫로그 후기만 있는 경우, 펫로그 후기가 선택되어 노출*/
	$(document).ready(function(){
		
		
		
   		if(false && false){
			$('.uirevtabs>.menu>li:nth-child(1)').removeClass('active');
			$('.uirevtabs>.menu>li:nth-child(2)').addClass('active');
			$('tabrev rev_a active').removeClass('active');
			$('tabrev rev_b active').addClass('active');
		}
	});
	
	

	$(function(){
		
		
		
		/* goodsComment.getGoodsCommentScore(); */
		goodsComment.getGoodsPhotoComment();
		goodsComment.getGoodsCommentList();
		
		petLogList.list();
		
		$("button[name=sortBtn]").on('click', function(){
			goodsComment.page = 1;
			var sidx;
			var sord;
			if($(this).val() == "v_1"){
				sidx = "SYS_REG_DTM";
				sord = "DESC";
			}else if($(this).val() == "v_2"){
				sidx = "ESTM_SCORE";
				sord = "DESC";
			}else if($(this).val() == "v_3"){
				sidx = "ESTM_SCORE";
				sord = "ASC";
			}
			goodsComment.sidx = sidx;
			goodsComment.sord = sord;
			goodsComment.getGoodsCommentList();
		});
		
		$("[name=morePhotoCommentBtn]").on('click', function(){
			getGoodsPhotoCommentPop();
			
		});

		$("#commentMore").on('click', function(){
			goodsComment.page = parseInt(goodsComment.page)+1;
			var param = {
				callback : goodsComment.getGoodsCommentListMore
			}
			goodsComment.getGoodsCommentList(param);
		});
		
		
		$("#commentListUl").on('click', '.pics img', function(){
			goodsComment.detailImgPop(this);
		})
		
		$("#goodsLayers").on('click', '.sld-nav>button', function(){
			var viewIndex = $(".popPhotoRv").find('[id^=photoCommentEstmNo_]').index($(".popPhotoRv").find('[id^=photoCommentEstmNo_].swiper-slide-active'));
			$("i[name=viewPoint]").text(viewIndex+1);
		});
		
		$("#optGoodsId").on('change', function(){
			goodsComment.page = 1;
			goodsComment.optGoodsId = $(this).val();
			
			goodsComment.getGoodsCommentList();
		})
		
		$("#imgListUl").on('click', 'a', function(){
			if($(this).attr('name') != 'morePhotoCommentBtn'){
				goodsComment.getAllGoodsCommentDetail($(this).data('goodsEstmNo'));
			}
		});
		
		$("#goodsLayers").on('click', '#popPhotoRv nav button.st, #popPhotoRv nav', function(){
			$($(this).parents('div.def').find('nav')).removeClass('bot');
		});

		$('#goodsLayers').on('click', '#popPhotoRv button[name=detailClose]', function(){
			ui.popLayer.close("popPhotoRv");
			
			if(!$('article#popRvPhoto').hasClass('on')){
				getGoodsPhotoCommentPop();
			}
		});
		
		$('#goodsLayers').on('click', '#popPhotoRv .btnPopClose', function(){
			ui.popLayer.close("popRvPhoto");
		});
	});
	
	//상품평
	var goodsComment = {
		goodsId : ${item_code},
		goodsCstrtTpCd : "ITEM",
		totalPageCount : null,
		page : null,
		totalPageCount : null,
		sidx : null,
		sord : null,
		optGoodsId : null,
		selectTab : null,
		/* ajax -> 페이지 들어올때 실행하도록 수정 - ㅔcm 
		getGoodsCommentScore : function(){
			var options = {
				url : "/goods/getGoodsCommentScore.do"
				, type : "POST"
				, dataType : "html"
				, data : {
					goodsId : goodsComment.goodsId
					, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
				}
				, done : function(result){
					$('#estmArea').html(result);
				}
			};
			ajax.call(options);
		}, */
		getGoodsPhotoComment : function(newData){
			var defaultData = {
				url : "/goods/getGoodsPhotoComment.do"
				, dataType : "Json"
				, done : goodsComment.getgoodsPhotoCommentResult
			}
			$.extend(defaultData, newData);
			var options = {
				url : defaultData.url
				, type : "POST"
				, dataType : defaultData.dataType
				, data : {
						goodsId : goodsComment.goodsId
						, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
					}
				, done : defaultData.done
			};
		},
		getgoodsPhotoCommentResult : function(result){
			var data = result.imgList;
			if(data != null && data.length > 0){
				$("#photoTotalCnt").text(result.so.totalCount+'건');
				html = "";
				for(var i = 0; i < data.length; i++){
					html += "<li class=\"swiper-slide\">";
					html += "<div class=\"box\">";
					html += "<div class=\"thum\">";
					html += "<a href=\"javascript:;\" class=\"pic\" data-goods-estm-no=\""+data[i].goodsEstmNo+"\">";
					
					var imgPath = ""
					if(data[i].imgPath.indexOf('http') > -1){
						imgPath = data[i].imgPath;
					}else{
						imgPath = 'https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images'+ data[i].imgPath +'?type=f&w=720&h=720&quality=100&align=4';
					}
					
					html += "<img class=\"img\" src=\""+imgPath+"\" alt=\"이미지\">";
					if(data[i].imgCnt != null && data[i].imgCnt > 1 ){
						html += "<em class=\"n\" style=\"display:block\">"+data[i].imgCnt+"</em>";
					}
					html += "</a>";
					html += "</div></div></li>";
				}
				if(data.length>=10){
					//포토상품평 10개 이상 시 이미지 리스트 10개 출력 후 더보기 버튼 추가
					html += "<li class=\"swiper-slide more\"><div class=\"box\"><a href=\"javascript:;\" onclick=\"getGoodsPhotoCommentPop(); return false;\" class=\"link\" name=\"morePhotoCommentBtn\"><i class=\"t\">더보기</i></a></div></li>";
				}
	
				$("#imgListUl").append(html);
			}else{
				$("div[name^=photoCommentDiv_]").remove();
			}
		},
		getgoodsPhotoCommentPopResult : function(result){
			//$(".popRvPhoto").remove();
			//$("#goodsLayers").append(result);
			$("#goodsLayers").empty();
			$("#goodsLayers").html(result);
			ui.popLayer.open('popRvPhoto');
		},
		getGoodsCommentList : function(param){
			var _this = goodsComment;
			var data = {
				item_code : _this.goodsId
				, goodsCstrtTpCd : _this.goodsCstrtTpCd
				, page : _this.page==null?1:_this.page
				, sidx : _this.sidx
				, sord : _this.sord
				, optGoodsId : _this.optGoodsId
			}
			
			var done = _this.getGoodsCommentListResult;
			
			if(param != null && param.callback != null){
				done = param.callback;
			}
			
			$.ajax({
				url : "/AboutPet/Project/aboutPet/getGoodsCommentList.do"
				, type : "get"
				, dataType : "html"
				, data : {item_code : ${item_code}}
				,cache: false
				, success : function() {
				}
			});
		},
		getGoodsCommentListResult : function(result){
			$('#commentListUl').html(result);
		},
		getGoodsCommentListMore : function(result){
			$('#commentListUl').append(result);
		},
		layerPopRemove : function(btn){
			var popId = $(btn).parents('article')[0].id;
			$("#"+popId).remove();
		},
		deleteGoodsComment : function(btn){
			var dataArea = $(btn).parents('div[name=estmDataArea]');
			ui.confirm('후기를 삭제할까요?',{ // 컨펌 창 옵션들
				ycb:function(){
					var options = {
						url : "/goods/deleteGoodsComment.do"
						, type : "POST"
						, data : {
							goodsId : goodsComment.goodsId
							, goodsEstmNo : $(dataArea).data('goodsEstmNo')
							, ordNo : $(dataArea).data('ordNo')
							, ordDtlSeq : $(dataArea).data('ordDtlSeq')
						}
						, done : function(result){
							var _this = goodsComment;
							_this.page = 1;
							_this.sidx = "SYS_REG_DTM";
							_this.sord = "DESC"
							
							var param = {
								callback : function(result){
									$('#commentListUl').html(result);
									ui.toast('후기가 삭제 되었어요');
								}
							}
							_this.getGoodsPhotoComment();
							_this.getGoodsCommentList(param);
							
						}
					};
					ajax.call(options);
				},
				ncb:function(){
					
				},
				ybt:"예",
				nbt:"아니오"
			});
			
		},
		reWriteGoodsComment : function(btn){
			var dataArea = $(btn).parents('div[name=estmDataArea]');
			var goodsEstmTp = "NOR";
			
			var url = "/mypage/commentWriteView"
			var html = '';
			html += '<input type="hidden" name="goodsId" value="'+ $(dataArea).data('goodsId') +'">';
			html += '<input type="hidden" name="goodsEstmTp" value="'+ goodsEstmTp +'">';
			html += '<input type="hidden" name="ordNo" value="'+$(dataArea).data('ordNo')+'">';
			html += '<input type="hidden" name="ordDtlSeq" value="'+$(dataArea).data('ordDtlSeq')+'">';
			html += '<input type="hidden" name="goodsEstmNo" value="'+ $(dataArea).data('goodsEstmNo') +'">';
			var goform = $("<form>",
				{ method : "post",
				action : url,
				target : "_self",
				html : html
				}).appendTo("body");
			goform.submit();
		},
		likeComment : function(btn){
			var loginYn = '0' != '0' ? 'Y' : 'N';
			if(loginYn == 'Y'){
				var dataArea = $(btn).parents('div[name=estmDataArea]');
				var options = {
					url : "/goods/likeComment.do"
					, type : "POST"
					, data : {goodsEstmNo : $(dataArea).data('goodsEstmNo')}
					, done : function(result){
						var count = result.count;
						var likeCnt = $(btn).children('.n').text();
						if(count == 0){
							$(btn).children('.n').text(parseInt(likeCnt)-1);
							if(likeCnt == '1'){
								$(btn).removeClass('on');
							}
						}else{
							$(btn).children('.n').text(parseInt(likeCnt)+1);
							$(btn).addClass('on');
						}
						$(btn).toggleClass('me');
					}
				}
				ajax.call(options);
			}else{
				ui.confirm('로그인 후 서비스를 이용할 수 있어요<br/>로그인 할까요?',{
					ycb: function () {
						document.location.href = '/indexLogin?returnUrl=' + encodeURIComponent(document.location.href);
					},
					ncb: function () {
						return false;
					},
					ybt: "로그인", // 기본값 "확인"
					nbt: "취소"  // 기본값 "취소"
				});
			}
			
		},
		commentReportPop : function(btn, anotherPop){
			var loginYn = '0' != 0 ? 'Y' : 'N';
			if(loginYn == 'Y'){
				var dataArea = $(btn).parents('div[name=estmDataArea]');
				var options = {
					url : "/goods/commentReportPop.do"
					, type : "POST"
					, data : {goodsEstmNo : $(dataArea).data('goodsEstmNo')}
					, type : "POST"
					, dataType : "html"
					, done : function(result){
						//$("#commentReportPop").remove();
						//$("#goodsLayers").append(result);
						$("#goodsLayers").empty();
						$("#goodsLayers").html(result);
						ui.popLayer.open('commentReportPop');
						if(anotherPop != null){
							//$("#"+anotherPop).css('z-index', $("#commentReportPop").css('z-index')-1);
							//APETQA-5573. 2021.06.02
							$("#commentReportPop").css('z-index', $("#"+anotherPop).css('z-index')+1);
						}
					}
				}
				ajax.call(options);
			}else{
				ui.confirm('로그인 후 서비스를 이용할 수 있어요<br/>로그인 할까요?',{
					ycb: function () {
						document.location.href = '/indexLogin?returnUrl=' + encodeURIComponent(document.location.href);
					},
					ncb: function () {
						return false;
					},
					ybt: "로그인", // 기본값 "확인"
					nbt: "취소"  // 기본값 "취소"
				});
			}
		},
		reportGoodsComment : function(){
			if($("input[name=rptpRsnCd]:checked").length != 0){
				var data = $.extend($("#rptpForm").serializeJson(), {rptpRsnContent : $("textarea[name=rptpRsnContent]").val()});
				
				var options = {
					url : "/goods/reportGoodsComment.do"
					, type : "POST"
					, data : data
					, done : function(result){
						ui.toast('신고가 완료되었어요');
						ui.popLayer.close("commentReportPop");
						$("#commentReportPop").remove();
					}
				}
				ajax.call(options);
			}else{
				ui.toast('신고사유를 선택해주세요');
			}
		},
		detailImgPop : function(clickImg){
			var clickImgPath = clickImg.src;
			var imgs = $(clickImg).parents('.pics').find('img');
			var selectIndex = imgs.index(clickImg);
			var bigHtml = '';
			var thumbHtml = '';
			for(var i = 0; i < imgs.length; i++){
				var imgPath = imgs[i].src;
				bigHtml += "<li class=\"swiper-slide\">"
				bigHtml += "<div class=\"box swiper-zoom-container\">"
				bigHtml += "<span class=\"pic\">"
				bigHtml += "<img class=\"img\" src=\""+imgPath+"\" alt=\"\">"
				bigHtml += "</span></div></li>"
				
				thumbHtml += "<li class=\"swiper-slide\">"
				thumbHtml += "<a href=\"javascript:;\" class=\"box\">"
				thumbHtml += "<span class=\"pic\">"
				thumbHtml += "<img class=\"img\" src=\""+imgPath+"\" alt=\"\">"
				thumbHtml += "</span></a></li>"
			}
			
			var options = {
				url : "/goods/includeGoodsCommentImgPop"
				, type : "POST"
				, dataType : "html"
				, data : {}
				, done : function(result){
					$("#goodsLayers").empty();
	 				$("#goodsLayers").html(result);
	 				
					ui.popLayer.open('popPdImgView');
					
					$("#bigImgArea").html(bigHtml);
					$("#thumbImgArea").html(thumbHtml);
					$("#pdPopFlag").val("COMMENT");
					$("#imgViewTitle").text("이미지 보기");

					ui.shop.pdPic.opt1 = {
						observer : true,
						observeParents : true,
						watchOverflow : true,
						simulateTouch : false,
						spaceBetween : 20,
						navigation : {
							nextEl : '.pdDtPicSld .sld-nav .bt.next',
							prevEl : '.pdDtPicSld .sld-nav .bt.prev',
						},
						initialSlide : selectIndex
					};

					ui.shop.pdPic.galleryTop = new Swiper(ui.shop.pdPic.els1, ui.shop.pdPic.opt1);
					ui.shop.pdPic.galleryThumbs = new Swiper(ui.shop.pdPic.els2, ui.shop.pdPic.opt2);
					
					$(document).on("click",".pdDtThmSld .slide>li .box",function(){
						var my_idx = $(this).closest("li").index();
						$(this).closest("li").addClass("active").siblings("li").removeClass("active");
						ui.shop.pdPic.galleryTop.slideTo(my_idx);
					});
					
					ui.shop.pdPic.galleryTop.on('slideChangeTransitionEnd', function(swiper) {
						// this.galleryThumbs.slideTo(2);
						var idx = this.realIndex + 1 ;
						$(".pdDtThmSld .slide>li:nth-child("+ idx +")").addClass("active").siblings("li").removeClass("active");
						ui.shop.pdPic.galleryThumbs.slideTo(this.realIndex-3 < 0 ? 0 : this.realIndex-3);
					});
					
					if("PC" != "PC"){
						$(".pdDtThmSld .slide>li .box").eq(selectIndex).click();
					}else{
						if(selectIndex == 0){
							$(".pdDtThmSld .slide>li").eq(selectIndex).addClass("active");
						}else{
							$(".pdDtThmSld .slide>li .box").eq(selectIndex).click();
						}
					}
					
				}
			};
			ajax.call(options);
		},
		getAllGoodsCommentDetail : function(goodsEstmNo){
			var options = {
				url : "/goods/getAllGoodsCommentDetail.do"
				, type : "POST"
				, dataType : "html"
				, data : {
						goodsId : goodsComment.goodsId
						, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
						, imgRegYn : "Y"
					}
				, done : function(result){
					//$(".popPhotoRv").remove();
					//$("#goodsLayers").append(result);
					$("#goodsLayers").empty();
					$("#goodsLayers").html(result);
					
					$(".popPhotoRv .phd .nm .s").text($(".photo_review_sld .swiper-container.slide.k0422 .revlists  > li").length)
					/* scroll 이벤트 추가 */
					if(ui.check_brw.mo()){
						$(".photo_review_sld .swiper-container.slide.k0422").scroll(function(){
							var $child = $(this).find(".revlists.swiper-wrapper > .swiper-slide");
							var max = $child.length;
							var position = new Array();
							var st =  $(this).scrollTop();
							var ind = 0;
							var maxPoint = ($(".photo_review_sld .swiper-container.slide.k0422 > .revlists").innerHeight() - $(".photo_review_sld .swiper-container.slide.k0422").innerHeight());
							$child.each(function(i,n){
								position[(max - i - 1)] = $(n).position().top;
							});
							for(var i=0; i<position.length; i++){
								if(st >= maxPoint){
									ind = max;
									break;
								}else if(st >= (position[i]) ){
									ind = max - i;
									break;
								}
							}
							$(".popPhotoRv .phd .nm .n").text(ind);
						})
					}
					
					var commentArea = $("#photoDetailList").children('li');
					var selectIndex = commentArea.index($("#photoCommentEstmNo_"+goodsEstmNo)[0]);
					if(true){
						var selectIndex = commentArea.index($("#photoCommentEstmNo_"+goodsEstmNo)[0]);
						$.extend(ui.shop.revPicSet.opt,
							{
								initialSlide : selectIndex,
								pagination: {
									el: '.goodsPhotoCommetListCount',
									type: 'custom',
									renderCustom : function(swiper , current , total){
										var html = '';
										html += '<i class="n" name="viewPoint">'+current+'</i>/<i class="s">'+total+'</i>';
										$(".goodsPhotoCommetListCount").html(html);
									}
								}
							}
						);
						$("i[name=viewPoint]").text(selectIndex+1);
						ui.shop.revPicSet.using();
					}
					ui.shop.revPic.using();
					
					ui.popLayer.open('popPhotoRv');
					$(".photo_review_sld .swiper-container.slide.k0422").scrollTop($("#photoCommentEstmNo_"+goodsEstmNo).position().top+2);
					
				}
			};
			ajax.call(options);
		}
	}
	
	
	
	var validateComment = {
		check : function(){
			var _this = validateComment;
			_this.scoreCheck();
			_this.qstCheck();
		},
		scoreCheck : function(){
			var score = $("#commentForm").find('li.f').length;
			if(score == 0){
				alert('별점을 선택해 주세요.');
				return false;
			}
		},
		qstCheck : function(){
			if($("div[name=goodsEstmQstArea]").length != 0){
				for(var i = 0; i < $("div[name=goodsEstmQstArea]").length; i++){
					var area = $("div[name=goodsEstmQstArea]")[i];
					if($(area).find("input[name^=estmQstNo_]:checked").length == 0){
						var msg = $(area).find(".tit").text();
						alert("\""+msg+"\" 항목을 평가 해주세요.");
						return false;
					}
				}
			}
		}
	}
	
	function removePop(btn){
		var popId = $(btn).parents('article')[0].id;
		ui.popLayer.close(popId);
		$("#"+popId).remove();
	}
	
	function getGoodsPhotoCommentPop(){
		var data = {
			url : "/goods/getGoodsPhotoCommentPop.do"
			, dataType : "html"
			, done : goodsComment.getgoodsPhotoCommentPopResult
		}
		goodsComment.getGoodsPhotoComment(data);
	}
	
	///////////////////////////////////////펫로그 후기
	var petLogList = {
			totalCount : null,
			totalPageCount : null,
			page : null,
			list : function(callback){
 				var done = petLogList.result;
				if(callback !=  null){
					done = callback;
				}
				var options = {
					url : "/AboutPet/Project/aboutPet/getGoodsCommentList.do"
					, type : "GET"
					, dataType : "html"
					, data : {
							goodsId : goodsComment.goodsId
							, page : petLogList.page == null ? 1 : petLogList.page
							, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
						}
 					, done : done
			};
				ajax.call(options);
			},
			result : function(result){
 				$('#petLogList').html(result);
 				if(petLogList.totalCount > 0){
 	 				$("#petLogTotalCnt").text(petLogList.totalCount);	
 				}else{
 					$(".logPicMetric").text("등록된 후기가 없습니다.")
 					$(".logPicMetric").css("text-align" , "center")
 				}
 				
 			},
 			add : function(result){
 				$('#petLogList').append(result);
 			},
 			petLogMore : function(){
 				petLogList.page = petLogList.page*1 + 1;
 				petLogList.list(petLogList.add);
 			}
	}
	
	//펫로그 후기 상세
	function petlogReviewDetail(petLogNo , tag){
		var options = {
			url : "/goods/indexPetLogCommentDetailList"
			, type : "POST"
			, dataType : "html"
			, data : {
					index : $(tag).data("idx")
					, goodsId : goodsComment.goodsId
					, petDetailNo : petLogNo
					, totalCount : petLogList.totalCount
					, goodsCstrtTpCd : goodsComment.goodsCstrtTpCd
			}
			, done : function(result){
				//$(".popLogRv").remove();
 				//$("#goodsLayers").append(result);
				$("#goodsLayers").empty();
 				$("#goodsLayers").html(result);
 				var selectIndex = $("#petLogDetails").children('li[id^=petLogDetails_]').index($("#petLogDetails_"+ petLogNo));
				
				$.extend(ui.shop.revLogSet.opt, {
					initialSlide : selectIndex,
					pagination: {
						el: '.petLogCommentCount',
						type: 'custom',
						renderCustom : function(swiper , current , total){
							var html = '';
							current = current > 0 ? current : 1;
							html += '<i class="n" id="listIndex">'+current+'</i>/<i class="s">'+total+'</i>';
							$(".petLogCommentCount").html(html);
						}
					}
				})
 				setTimeout(function(){
	 				ui.shop.revLog.using();
	 				ui.shop.revLogSet.using();
					ui.popLayer.open('popLogRv');
 					move_scroll(selectIndex);
 				}, 50);
			}
		};
		ajax.call(options);
	}
</script>
						<%
						String psize = (String) request.getAttribute("html_size");
						%>
						<div class="hdts">
							<span class="tit"><em class="t">후기</em> <i class="i"></i></span>
							<div class="bts">
								<!-- <a href="javascript:;" class="btn b btnRev" onclick="ui.popBot.open('popRevSel');">후기작성</a> -->
								<div style="display: none;">
									<form id="writePopDataForm">
										<input type="text" name="goodsId" /> <input type="text"
											name="goodsEstmTp" />
									</form>
								</div>
							</div>
						</div>
						<div class="cdts">

							<!-- 구매만족도 -->

							<div class="uisatis" id="estmArea">
							<c:if test="${ itemStar.rv_star ne null }">
								<div class="starpan">
									<div class="inr">

											<div class="ptbox">
												<div class="pnt">${itemStar.rv_star }</div>
												<div class="sta starpoint">
													<span class="stars p_${ star[0] }_${ star[1] < 5 ? 0 : 5 }"></span>
												</div>
											</div>
										

										<div class="ptlit">
											<ul class="plist">

												<%
												Map<Integer, Double> map = (Map<Integer, Double>) request.getAttribute("map");

												for (int i = 5; i >= 1; i--) {
													if (map.get(i) != null) {
												%>
												<li class=""><span class="pnt"><b class="p"><%=i%></b><i
														class="w">점</i></span> <span class="gage"><em class="bar"
														style="width: <%=(int) (Math.ceil(map.get(i) * 100))%>%;"></em></span>
													<span class="pct"><b class="p"><%=(int) (Math.ceil(map.get(i) * 100))%></b><i
														class="w">%</i></span></li>
												<%
												} else {
												%>
												<li class=""><span class="pnt"><b class="p"><%=i%></b><i
														class="w">점</i></span> <span class="gage"><em class="bar"
														style="width: 0%;"></em></span> <span class="pct"><b
														class="p">0</b><i class="w">%</i></span></li>
												<%
												}
												}
												%>
												
											</ul>
										</div>
									</div>
								</div>
								
							</c:if>

								<script type="text/javascript">
	if($('.iflist').find('li').length != null && $('.iflist').find('li').length != 0){
		var estm = $('.iflist').find('li').length;
		for(var i = 0; i < estm; i++){
			var percent = $($('.prlist')[i]).find('li.act span.pct b.p').text();
			var orgstr = $($('.iflist').find('li')[i]).find('div.dd span.ss').text();
			var newstr = percent + orgstr.substring(orgstr.indexOf('%'), orgstr.length);
			$($('.iflist').find('li')[i]).find('div.dd span.ss').text(newstr);
		}
	}
</script>
							</div>
							<div class="uirevtabs">
								<ul class="menu">
									<li class="active">
										<button type="button" class="btn md" data-ui-tab-btn="tab_rvt"
											data-ui-tab-val="tab_rvt_a">
											일반 후기
											<%=request.getAttribute("count")%></button>
									</li>
									<li>
										<button type="button" class="btn md" data-ui-tab-btn="tab_rvt"
											data-ui-tab-val="tab_rvt_b">펫로그 후기 0</button>
									</li>
								</ul>
							</div>

							<!-- 일반후기 영역 -->
							<div data-ui-tab-ctn="tab_rvt" data-ui-tab-val="tab_rvt_a"
								class="tabrev rev_a active">
								<div class="uireviews">
									<div class="rvhdt phto" name="photoCommentDiv_1">
										<a href="javascript:;" class="rht"> <span class="tit">포토후기</span>
											<span class="num" id="photoTotalCnt">0건</span> <em
											class="bt more" name="morePhotoCommentBtn">더보기</em>
										</a>
									</div>
									<div class="rvphotos" name="photoCommentDiv_2">
										<div class="ui_rvphoto_slide">
											<div class="swiper-container slide">
												<ul class="swiper-wrapper list" id="imgListUl">
													<!-- 포토 후기 최대 10개 노출, 10개 이상 존재 시 더보기 버튼 노출 -->
												</ul>
											</div>
											<div class="sld-nav">
												<button type="button" class="bt prev">이전</button>
												<button type="button" class="bt next">다음</button>
											</div>
										</div>
									</div>
									<div class="rvhdt all">
										<div class="rht">
											<span class="tit">일반 후기</span><span class="num"
												name="commentAllCnt"><%=request.getAttribute("count")%>
												건</span>
										</div>
										<div class="rdt">
											<nav class="uisort dsort">
												<button type="button" class="bt st" value="v_1">최신순</button>
												<div class="list">
													<ul class="menu">
														<li class="active"><button type="button" class="bt"
																name="sortBtn" value="v_1">최신순</button></li>
														<li><button type="button" class="bt" name="sortBtn"
																value="v_2">평점높은순</button></li>
														<li><button type="button" class="bt" name="sortBtn"
																value="v_3">평점낮은순</button></li>
													</ul>
												</div>
											</nav>
										</div>
									</div>
									<div class="revalls" name="commentArea">
										<div class="selopts" name="commentOptList"></div>
										<ul class="revlists" id="commentListUl">
											<!-- 상품평 리스트 영역 -->
										</ul>
										<div class="moreload">
											<button type="button" class="bt more" id="commentMore">일반후기
												더보기</button>
										</div>
									</div>
								</div>
							</div>
							<div data-ui-tab-ctn="tab_rvt" data-ui-tab-val="tab_rvt_b"
								class="tabrev rev_b">
								<div class="uilogrevs">
									<div class="rvhdt">
										<a class="rht" href="javascript:;"><span class="tit">펫로그
												후기</span><span class="num" name="petLogTotal">0건</span></a>
										<div class="rdt">
											<div class="warning">펫로그 후기는 모바일앱에서 작성할 수 있습니다.</div>
										</div>
									</div>
									<div class="logPicMetric on">
										<ul id="petLogList">
										</ul>
										<div class="moreload">
											<button type="button" class="bt more" id="pegLogMoreBtn"
												onclick="petLogList.petLogMore();">펫로그 후기 더보기</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<script type="text/javascript">
	/* $(document).on("click",".uireviews .bt.hlp",function(){
		$(this).addClass("on"); // 숫자가 있으면 on
		$(this).addClass("me"); // 나가 추천하면 me
	}); */
	$(document).on("click",".logRvSet .contxt .bt.tog",function(e){
		$(this).closest(".rconbox").toggleClass("active");
	});
	$(document).on("click",".logRvSet .picture .bt.sound",function(e){
		$(this).toggleClass("on");
	});
</script>

						<!-- Qna -->

						<script type="text/javascript">
	$(function(){
		goodsQna.getGoodsInquiryList();
		//비밀 글 제외
		$("#hiddenCheck").on('click', function(){
			if(this.checked){
				goodsQna.hiddenYn = "N";
			}else{
				goodsQna.hiddenYn = "Y";
			}
			goodsQna.page = null;
			goodsQna.getGoodsInquiryList();
		});
		
		//문의 더보기
		$("#qnaMore").on('click', function(){
			goodsQna.page = parseInt(goodsQna.page) + 1;
			goodsQna.getGoodsInquiryList(goodsQna.addGoodsInquiry);
		});

		$("#goodsLayers").on('click', 'button[name=delImg]', function(){
			delImage(this);
		});
	
	});	
</script>


						<section class="sec qna" data-sid="pd-qna">
							<div class="hdts">
								<span class="tit"><em class="t">Q&amp;A</em> <i class="i"
									name="pdQnaCnt"></i></span>
								<div class="bts">
									<a href="javascript:;" class="btn b btnQna" id="writeQna">문의하기</a>
								</div>
							</div>
							<div class="cdts">
								<div class="uiqnalist">
									<div class="secret" id="qnaHidden">
										<label class="checkbox"><input type="checkbox"
											id="hiddenCheck"><span class="txt"><em
												class="tt">비밀글 제외</em></span></label>
									</div>
									<ul id="qnaList" class="uiAccd qalist" data-accd="tog">
									</ul>
									<div class="moreload">
										<button type="button" class="bt more" id="qnaMore">Q&A
											더보기</button>
									</div>
								</div>
							</div>
						</section>

						<!-- 함께 많이 보는 상품 -->
						<script type="text/javascript">
						
						$(function() {
							$("#writeQna").on("click", function(event) {
								 var isLogin = <%=isLogin%>;
								 if (isLogin) {
									 $.ajax({
											url : "/AboutPet/Project/aboutPet/writeQna.do"
											, type : "POST"
											,dataType:"html"
											,cache: false
											, success : function(resutl) {
											$("#goodsLayers").empty();
											$("#goodsLayers").html(resutl);
											ui.popLayer.open('popQnaMod');
											}
										});

								 }else{
									alert("로그인이 필요한 서비스 입니다");
								}
						});
						
						$("#goodsLayers").on('click', '#insertQna', function(){
							if($("#qnaForm").find("input[name=goodsIqrNo]").val() != null && $("#qnaForm").find("input[name=goodsIqrNo]").val() != ''){
								updateGoodsQna();
							}else{
								insertGoodsQna();
							}
						});
						
						//이미지 삭제
						$("#goodsLayers").on('click', 'button[name=delImg]', function(){
							if($(this).parent().data('imgSeq') != null){
								var html = "<input type=\"hidden\" name=\"delImgSeqs\" value=\""+$(this).parent().data('imgSeq')+"\">";
								$("#qnaImgArea").append(html);
							}
							
							$(this).parents('li').remove();
							qnaImgCheck();
						});
						
						//작성하기 - 비밀글 여부 선택
						$("#goodsLayers").on('click', 'input[name=hiddenYnChck]', function(){
							if(this.checked){
								$("input[name=hiddenYn]").val("Y");
							}else{
								$("input[name=hiddenYn]").val("N");
							}
						});
						
						//작성하기 - 답변 알림 여부 선택
						$("#goodsLayers").on('click', 'input[name=rplAlmRcvYnChck]', function(){
							if(this.checked){
								$("input[name=rplAlmRcvYn]").val("Y");
							}else{
								$("input[name=rplAlmRcvYn]").val("N");
							}
						});
						
						//문의 글 등록버튼 제한 - 5자 이상 시 활성화
						$("#goodsLayers").on('propertychange keyup input change paste ', 'textarea[name=iqrContent]', function(){
							if($(this).val().length < 5){
								$("#insertQna").addClass('disabled');
								/* $("#insertQna").attr('disabled', 'disabled'); */
							}else{
								$("#insertQna").removeClass('disabled');
								/* $("#insertQna").removeAttr('disabled'); */
							}
							
							if($(this).val().length > 100){
								$(this).val($(this).val().substring(0,100));
								ui.toast("100자까지 입력 가능합니다");
							}
						});
						
						$(".layers").on('click', '#popQnaMod .btnPopClose', function(){
							
							if(confirm('상품문의 작성을 취소할까요?')){
									ui.popLayer.close('popQnaMod');
									$("#popQnaMod").remove();
									$(document).on("click", ".popLayer:not(.win, .popQnaMod) .btnPopClose:not(.none, [name=notClose])", function() {
										var id = $(this).closest(".popLayer").attr("id");
										ui.popLayer.close(id);
									});
							}else{
								
								return false;
							}
							
						});
						
						function insertGoodsQna() {
							
							 $.ajax({
									url : "/AboutPet/Project/aboutPet/insertQna.do"
									, type : "get"
									,data:{"item_code":${item_code} , "mem_code":<%=mem_code%>
											,"iqrContent" : $("textarea[name=iqrContent]").val()
											,"hiddenYn":$("input[name=hiddenYn]").val()
											,"rplAlmRcvYn":$("input[name=rplAlmRcvYn]").val()}
									,dataType:"text"
									,cache: false
									, success : function(resutl) {
									if( resutl>0 ){
										ui.popLayer.close('popQnaMod');
										alert("등록완료");
									}else{
										ui.popLayer.close('popQnaMod');
										alert("등록실패");
									}
									}
								});
							
							
						}
							
						});
				
							
							
</script>
						<section class="sec custm">
							<div class="hdts">
								<span class="tit"><em class="t">함께 비교하면 좋을 상품</em></span>
							</div>
							<div class="cdts">
								<div class="ui_custm_slide">
									<!-- ui.shop.custm.using(); -->
									<div class="swiper-container slide">
										<ul class="swiper-wrapper list">
											<c:forEach items="${compareList }" var="list">
												<li class="swiper-slide">
													<div class="gdset custm">
														<div class="thum">
															<a
																href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }"
																class="pic"> <!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500 -->
																<img class="img" src="${list.item_img }" alt="" />
															</a>
															<c:set var="doneLoop" value="false"></c:set>
															<c:if test="${ zzim ne null }">
																<c:forEach items="${ zzim }" var="zzim"
																	varStatus="status">
																	<c:if test="${ not doneLoop }">
																		<c:if test="${ zzim.item_code eq list.item_code }">
																			<button type="button" class="bt zzim on"
																				id="btnZzim_${list.item_code }"
																				data-itemcode="${list.item_code }" value="Y">찜하기</button>
																			<c:set var="doneLoop" value="true"></c:set>
																		</c:if>
																		<c:if test="${ status.last }">
																			<c:if
																				test="${ status.current.item_code ne list.item_code }">
																				<button type="button" class="bt zzim "
																					id="btnZzim_${list.item_code }"
																					data-itemcode="${list.item_code }" value="N">찜하기</button>
																				<c:set var="doneLoop" value="true"></c:set>
																			</c:if>
																		</c:if>
																	</c:if>
																</c:forEach>
															</c:if>
															<c:if test="${ zzim eq null }">
																<button type="button" class="bt zzim "
																	id="btnZzim_${list.item_code }"
																	data-itemcode="${list.item_code }" value="N">찜하기</button>
															</c:if>
														</div>
														<div class="boxs">
															<div class="cate"></div>
															<div class="tit">
																<a
																	href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }"
																	class="lk">${list.item_name }</a>
															</div>
															<div class="inf">
																<span class="prc"><em class="p">${list.item_price}</em><i
																	class="w">원</i></span> <span class="pct"><em class="n">${list.sale_rate }</em><i
																	class="w">%</i></span>
															</div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="sld-nav">
										<button type="button" class="bt prev">이전</button>
										<button type="button" class="bt next">다음</button>
									</div>
								</div>
							</div>
						</section>
						<!-- 최근 본 상품 -->
				</div>
			</div>
		</div>
	</div>
</main>

<script>
	$("button[id^=btnZzim_]").on("click", function() {
		<%if (session.getAttribute("num") == null) {%>
			alert("로그인 후 이용할 수 있습니다.")		
		<%} else {%>
		
		/* alert(document.querySelector("#btnZzim").dataset.itemcode) */

		var item_code = $(this).data("itemcode")
		var zzimcheck = $(this).val()
		var mem_code = "<%=mem_code%>"
		
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
					}
			})

		<%}%>
		
	})
</script>

<article class="uiPdOrdPan" id="uiPdOrdPan">
	<input type="hidden" name="goodsItemTotalAmt" id="goodsItemTotalAmt"
		value="57400" />
	<button type="button" class="btDrag">열기/닫기</button>
	<div class="hdts">
		<div class="inr">
			<div class="bts">
				<button type="button" class="bt close">닫기</button>
			</div>
			<span class="tit">상품선택</span>
		</div>
	</div>
	<script type="text/javascript">
	var indexOrdpan = 1;
	$(document).ready(function(){

		var goodsCstrtTpCd = "ITEM";

		// 수량 직접 변경시 가격 및 총수량 계산
		if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET") {

			$(document).off("click", ".uispiner .bt");
			$(document).off("click", ".uispiner .plus");
			$(document).on("click",".uispiner .plus",function(e) {
				e.preventDefault();
				var $qtyObj = $(this).siblings(".amt");
				console.log('includeGoodsOrdpanDetail click plus ' + parseInt($qtyObj.val()))
				var maxOrdQty = $qtyObj.data("maxOrdQty") ? $qtyObj.data("maxOrdQty") : 999;
				var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";

				if (!maxOrdQty || parseInt($qtyObj.val()) < maxOrdQty) {
					var cartQty = parseInt($qtyObj.val()) + 1;
					//var cartQty = parseInt($qtyObj.val());
					var itemNo = $qtyObj.data("itemNo");
					//$("#buyQty" + itemNo).attr("value", cartQty);
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty);
					var goodsCstrtTpCd = "ITEM";
					//console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", itemNo : " + itemNo + ", cartQty : " + cartQty);
					if(ordmkiYn == "Y"){	// 각인여부
						indexOrdpan++;
						if(!document.getElementById('spanOrdmki_'+ itemNo + '_' + cartQty)){
							var spanText = "";
							var n2Class = "";
							if(9 < cartQty){
								n2Class = "n2";
							}
							spanText += "<span class='input nms "+n2Class+"' id='spanOrdmki_"+itemNo+"_"+cartQty+"'>";
							spanText += "	<i class='n'>"+cartQty+".</i><input type='text' name='inputOrdmki' id='inputOrdmki_"+itemNo+"_"+cartQty+"' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onkeydown='javascript:fnCheckOrdmkiTextLength(this);' >";
							spanText += "</span>";
							//$("#divOrdmki_"+cartQty-1).html($("#divOrdmki_"+cartQty).html() + spanText);
							var gudText = "<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>";
							$("#divOrdmki_"+itemNo + " .gud").remove();
							$("#divOrdmki_"+itemNo).append(spanText + gudText);
						}
					}

					if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
						fnClickItemTotalCnt(itemNo, cartQty);
					}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
						var originSaleAmt = $qtyObj.data("saleAmt");
						fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
					}
				}else{
					var cartQty = parseInt($qtyObj.val());
					if(cartQty == maxOrdQty) {
					} else {
						cartQty = parseInt($qtyObj.val()) -1;
					}
					var itemNo = $qtyObj.data("itemNo");
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty);
					fnGoodsUiToast("최대 " + maxOrdQty + "개까지 구매할 수 있어요", "maxOrdQty");
				}
			});

			$(document).off("click", ".uispiner .bt");
			$(document).off("click", ".uispiner .minus");
			$(".uispiner .minus").prop("disabled", "");
			$(document).on("click",".uispiner .minus",function(e){
				e.preventDefault();
				var $qtyObj = $(this).siblings(".amt");
				console.log('includeGoodsOrdpanDetail click minus ' + parseInt($qtyObj.val()))
				var minOrdQty = $qtyObj.data("minOrdQty") ? $qtyObj.data("minOrdQty") : 1;
				var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";
				if (parseInt($qtyObj.val()) > minOrdQty) {
					var cartQty = parseInt($qtyObj.val()) - 1;
					//var cartQty = parseInt($qtyObj.val())
					var itemNo = $qtyObj.data("itemNo");
					//$("#buyQty" + itemNo).attr("value",cartQty);
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty);
					if(indexOrdpan <= 0){
						indexOrdpan = 1;
					}else{
						indexOrdpan--;
					}

					var goodsCstrtTpCd = "ITEM";
					console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", itemNo : " + itemNo + ", cartQty : " + cartQty);

					if(ordmkiYn == "Y"){
						$("[id^=spanOrdmki_" + itemNo + "_]").each(function(index){
							var idx = index + 1;
							if(cartQty < idx){
								$(this).remove();
							}
						});
					}

					if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
						fnClickItemTotalCnt(itemNo, cartQty);

					}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
						var originSaleAmt = $qtyObj.data("saleAmt");
						console.log("originSaleAmt : " + originSaleAmt);
						fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
					}
				}else{
					var cartQty = parseInt($qtyObj.val());
					if(cartQty == minOrdQty){
						cartQty = parseInt($qtyObj.val());
					} else if(parseInt($qtyObj.val()) - 1 == 0) {
						cartQty = parseInt($qtyObj.val());
					} else {
						cartQty = parseInt($qtyObj.val()) - 1;
					}
					var itemNo = $qtyObj.data("itemNo");
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty);
					fnGoodsUiToast("최소" + minOrdQty + "개이상 구매할 수 있어요", "maxOrdQty");
				}
			});
		}
	});


	// ITEM, SET
	function fnClickItemTotalCnt(itemNo, cartQty){
		var priceCnt = Number(cartQty);
		var originPrice = Number(${dto.item_price}-${(dto.sale_rate*(1/100))*dto.item_price});
		var priceAmt = valid.numberWithCommas(originPrice * priceCnt);
		//console.log("priceCnt : " + priceCnt + ", originPrice : " + originPrice + ", priceAmt : " + priceAmt);
		$("#emPriceTotalCnt").html(priceCnt);
		$("#emPriceTotalAmtItem").html(priceAmt);
		$("#emPriceTotalAmt").html(priceAmt);
	}

	// PAK, ATTR
	function fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt){

		var totalPriceAmt = 0;
		var toalCartQtyCnt = 0;
		$("[id^=selected_itemNo_]").each(function(index){
			var itemNoSelected = $("[id^=selected_itemNo_]").eq(index).val();
			var cartQtyNumber = Number($("#buyQty"+itemNoSelected).val());
			//console.log("cartPriceNumber : " + Number(originSaleAmt) + ", cartQtyNumber : " + cartQtyNumber);
			if(itemNoSelected == itemNo){
				cartQtyNumber = Number(cartQty);
				var priceAmt = valid.numberWithCommas(Number(originSaleAmt * Number(cartQty)));
				$("#buyPriceRight"+itemNoSelected).html(priceAmt);
				$("#inputBuyPriceRight"+itemNoSelected).val(priceAmt);
			}
			//totalPriceAmt = (totalPriceAmt + (Number(originSaleAmt * cartQtyNumber)));
			totalPriceAmt += Number(removeComma($("#inputBuyPriceRight"+itemNoSelected).val()));
			toalCartQtyCnt = (toalCartQtyCnt + cartQtyNumber);
			//console.log("cartPriceNumber : " + Number(originSaleAmt) + ", cartQtyNumber : " + cartQtyNumber);
		});

		//console.log("totalPriceAmt : " + totalPriceAmt + ", toalCartQtyCnt : " + toalCartQtyCnt);
		$("#emPriceTotalCnt").html(toalCartQtyCnt);
		//$("#emPriceTotalAmtItem").html(valid.numberWithCommas(totalPriceAmt * toalCartQtyCnt));
		//console.log("buyQty itemNo : " + $("#buyQty"+itemNo).val());
		$("#emPriceTotalAmt").html(valid.numberWithCommas(totalPriceAmt));

	}
	
	
	

	function fnChangebuyQty(obj){
		var $qtyObj = $("#"+obj.id);
		var itemNo = $qtyObj.data("itemNo");
		var minOrdQty = $qtyObj.data("minOrdQty") ? $qtyObj.data("minOrdQty") : 1;
		var maxOrdQty = $qtyObj.data("maxOrdQty") ? $qtyObj.data("maxOrdQty") : 999;
		var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";

		console.log("$qtyObj : "+ $qtyObj + " minOrdQty : "+minOrdQty + " maxOrdQty : "+maxOrdQty + " ordmkiYn: "+ ordmkiYn );

		var cartQty = $qtyObj.val();
		cartQty = cartQty.replace(/[^0-9]/g, '');

		// MIN 구매수량 제한
		if(cartQty < minOrdQty){
			fnGoodsUiToast("최소 " + minOrdQty + "개이상 구매할 수 있어요", "minOrdQty");
			//$qtyObj.val(minOrdQty);
			cartQty = minOrdQty;
		}

		// MAX 구매수량 제한
		if(cartQty > maxOrdQty){
			fnGoodsUiToast("최대 " + maxOrdQty + "개까지 구매할 수 있어요", "maxOrdQty");
			//$qtyObj.val(maxOrdQty);
			cartQty = maxOrdQty;
		}

		$qtyObj.val(cartQty).attr("value",cartQty);


		var goodsCstrtTpCd = "ITEM";

		// 수량 직접 변경시 가격 및 총수량 계산
		if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
			fnClickItemTotalCnt(itemNo, cartQty);

		}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
			var originSaleAmt = $qtyObj.data("saleAmt");
			fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
		}

		// 제작상품 시 입력폼 수정
		if(ordmkiYn == "Y"){
			var inputOrmkiLen = $("[id^=inputOrdmki_"+itemNo+"_]").length;

			if(inputOrmkiLen < cartQty){	// 변경된 값이 기존값 보다 클때 ( + 기능 )


				var spanText = "";
				$("#divOrdmki_"+itemNo + " .gud").remove();
				//$("[id^=inputOrdmki_"+itemNo+"_]").remove();
				for(var i = 1; i <= cartQty; i++){
					if(!document.getElementById('spanOrdmki_'+ itemNo + '_' + i)){
						spanText += "<span class='input nms' id='spanOrdmki_"+itemNo+"_"+i+"'>";
						spanText += "	<i class='n'>"+i+".</i><input type='text' name='inputOrdmki' id='inputOrdmki_"+itemNo+"_"+i+"' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onkeydown='javascript:fnCheckOrdmkiTextLength(this);'>";
						spanText += "</span>";
					}
				}
				var gudText = "<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>";
				$("#divOrdmki_"+itemNo).append(spanText + gudText);

			}else {	// 변경된 값이 기존값 작을 때 ( - 기능 )
				for(var i = 1; i <= inputOrmkiLen; i++){
					if(cartQty < i){
						$("#divOrdmki_"+itemNo + " #spanOrdmki_" + itemNo + "_" + i).remove();	// 항목 삭제
					}
				}
			}
		}
	}

	
	function fnCartItems(nowBuyYn){
		var isLogin = "<%=isLogin%>";
		var uiPdOrdPanClass = $("#uiPdOrdPan").attr("class");
		var productOptionClass = $("#productOption").attr("class");
		var setCartItemsCheck = false;
		if(uiPdOrdPanClass == undefined){
			// 상품 요약일때
			if(productOptionClass.indexOf("none") > -1){
				setCartItemsCheck = true;
			}
		}else{
			// 상품 상세일때
			if(uiPdOrdPanClass.indexOf("open") > -1){
				setCartItemsCheck = true;
			}
		}

		if(setCartItemsCheck){
			var goodsCstrtTpCd = 'ITEM';
			var goodsId = '${item_code}';
			var totalCnt = $("#emPriceTotalCnt").html().trim();
			if(nowBuyYn == 'N' && isLogin == 'true'){
				if(confirm("장바구니에 추가하시겠습니까?")){
					$.ajax({ type : "get"
							, url : "/AboutPet/Project/aboutPet/checkCart.do",
							data : {"item_code" : ${item_code} , "mem_code":<%=mem_code%>}
					, success : function(value){
						if(value.trim()=="1"){ 
							alert("이미 장바구니에 있는 상품입니다"); 
						}else{
							$.ajax({
								url : "/AboutPet/Project/aboutPet/insertCart.do"
								, type : "get"
								,dataType:"text"
								, data : {"item_code" : ${item_code}
										,"totalCnt": totalCnt
										,"mem_code":<%=mem_code%>
										}
								,cache: false
								, success : function(d) {
									if(d.trim()=="1"){ 
										alert("장바구니에 상품이 담겼습니다!");
										if(confirm("장바구니로 이동하시겠습니까?")){ 
											} 
										}
								},
							});	//ajax
							
						}
					}
				});//ajax
				}	
			}else{
				alert("로그인이 필요합니다");
				location.href="logon_input.jsp";
				}
			}	
		}
	

	//App일때 영상상세에서 로그인 화면으로 화면 닫고 이동해야해서 추가된 함수
	function fncAppCloseMoveLogin(url){
		//데이터 세팅
		toNativeData.func = "onCloseMovePage";
		toNativeData.moveUrl = "https://aboutpet.co.kr/indexLogin?returnUrl="+url;
		//APP 호출
		toNative(toNativeData);

		//toNativeData.func = "onClosePassingData";
		//var data = "https://aboutpet.co.kr/indexLogin?returnUrl="+url;
		//toNativeData.parameters = JSON.stringify(data);
		//toNativeData.callback = "fnOnClosePassingData";
		//toNative(toNativeData);
	}

	// 텍스트 인코딩
	function fnTextEncode(str){
		if (window.TextEncoder) {
			return new TextEncoder('utf-8').encode(str);
		}
		var utf8 = unescape(encodeURIComponent(str));
		var result = new Uint8Array(utf8.length);
		for (var i = 0; i < utf8.length; i++) {
			result[i] = utf8.charCodeAt(i);
		}
		return result;
	}

	// 비로그인 함수처리.
	function fnIsLogin(){
		ui.confirm("로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?",{
			ycb : function(){
				console.log("로그인 화면이동.");
				location.href = "/indexLogin";
			}
		});
	}
	/*
	 * 단품, 세트 - commonFunc.insertCart(‘GI000054458:302610:’, 1, ‘N’); or commonFunc.insertCart(‘GI000054458:302610:::’, ‘N’);
	 * 옵션 - commonFunc.insertCart(‘GI000054458:302610:GS000012345’, 1, ‘N’); or commonFunc.insertCart(‘GI000054458:302610:GS000012345::’, ‘N’);
	 * 묶음상품 - commonFunc.insertCart([‘GI000054458:302610:GP000012345’,'GI000054458:302610:GP000012345’], [1,2], ‘N’);
	 * commonFunc.insertCart
	* */
	function fnAddAttrsCart(){
		var listPaks = [];
		var listQtys = [];
		var goodsId = "${dto.item_code}";
		$("[id^=selected_attrNo_]").each(function(index){
			var attrNo = $("[id^=selected_attrNo_]").eq(index).val();
			var subGoodsId = $("#selected_subGoodsId_"+attrNo).val();
			var cartQtyNumber = Number($("#buyQty"+attrNo).val());
			var goodsIdStr = subGoodsId + ":" + attrNo + ":" + (goodsId ? goodsId : "");
			console.log("goodsIdStr : " + goodsIdStr);
			// listPaks.push(goodsIdStr);
			// listQtys.push(cartQtyNumber);
		});
		// console.log("listPaks : " + JSON.stringify(listPaks) + ", listQtys : " + JSON.stringify(listQtys));
		// fnGoodsInsertCart(listPaks, listQtys, 'N');
	}

	function fnAddAttrCart(nowBuyYn){
		console.log("fnAddAttrCart");
		// var listPaks = [];
		// var listQtys = [];
		var goodsId = "PI000005494";
		$("[id^=selected_attrNo_]").each(function(index){
			var attrNo = $("[id^=selected_attrNo_]").eq(index).val();
			var attrGoodsId = $("#selected_subGoodsId_"+attrNo).val();
			var cartQtyNumber = Number($("#buyQty"+attrNo).val());
			var goodsIdStr = attrGoodsId + ":" + attrNo + ":" + (goodsId ? goodsId : "");
			console.log("goodsIdStr : " + goodsIdStr);
			// listPaks.push(goodsIdStr);
			// listQtys.push(cartQtyNumber);
		});
		// console.log("listPaks : " + JSON.stringify(listPaks) + ", listQtys : " + JSON.stringify(listQtys));
		// fnGoodsInsertCart(listPaks, listQtys, nowBuyYn);
	}


	function fnAddCart(goodsId, itemNo, cartQty, nowBuyYn, pakGoodsId, mkiGoodsOptContent){

		var mkiGoodsYn = "N";	// 제작 여부
		var goodsIdStr = goodsId + ":" + itemNo + ":" + (pakGoodsId ? pakGoodsId : "") + ":"+(mkiGoodsYn ? mkiGoodsYn : "")+":"+(mkiGoodsOptContent ? mkiGoodsOptContent : "");

		console.log("fnAddCart = goodsIdStr : " + goodsIdStr + ", cartQty : " + cartQty + ", nowBuyYn : " + nowBuyYn);

		//fnGoodsInsertCart(goodsIdStr, cartQty, nowBuyYn);
	}

	function fnGoodsInsertCart(goodsIdStr, cartQty, nowBuyYn){
		commonFunc.insertCart(goodsIdStr, cartQty, nowBuyYn, function(data){
			// FRONT_WEB_VIEW_ORDER_CART_MSG_INSERT_CART_SUCCESS
			if(nowBuyYn == 'N'){
				//fnGoodsUiToast("장바구니에 상품이 담겼습니다.", "nowbuy");
			}else{
				//console.log("insertCart response");
				//location.reload();
			}
		});
	}
	// 입고 알림
		// insertWishS(obj, goodsId, searchGoodsId);

	//$(document).bind("keydown change","[id^=inputOrdmki_]",function(e){

	function fnCheckOrdmkiTextLength(obj){
		var curValue = obj.value;

		if(curValue.indexOf("|") > -1){
			curValue = curValue.substr(0, curValue.indexOf("|"));
		}

		if( 40 < curValue.length ){
			curValue = curValue.substr(0, 40);
		}

		$("#"+obj.id).val(curValue) ;
	}
	//})

</script>

	<div class="optpan">
		<div class="inr" id="artUiPdOrdPan">

			<div class="cdtwrap">
				<script type="text/javascript">
	$(document).ready(function(){
		console.log("goodsId : PI000005494, goodsCstrtTp : ITEM");
		
		var goodsCstrtTpCd = "ITEM";

		if(goodsCstrtTpCd == "PAK"){
			fnSelectPakGoodsList("N");
		}
		
	});

	var fnOption = {
		choose : function (attrNo, obj, attrVal, itemNo){
			var attrValNo = $(obj).val();

			$("#selected_attrValNo_"+attrNo).val(attrValNo);
			$("#selected_attrVal_"+attrNo).val(attrVal);

		},
		check : function (){
			var addFlag = true;

			// 옵션이 모두 선택되었는지 확인
			$("[id^=selected_attrValNo_]").each(function(index){
				if($(this).val() == ""){
					addFlag = false;
					ui.alert("옵션을 선택하세요.");

				}
			});

			if(addFlag){
				if ("" == "order") {
					fnOption.update();
				} else {
					fnOption.exChange();
				}
			}
		}
		, exPaksAdd : function (type, rownum, itemNo, saleAmt, imgPath, cstrtShowNm, subGoodsId, minOrdQty, maxOrdQty, ordmkiYn, cnt, salePsbCd, openFlag, ioAlmYn, orgSaleAmt, detailSelAttrVals){
			
			
			
			var optionSelAttrVals = $("#optionSelAttrVals").val();
			
			// 상세에서 상품선택시.
			if(openFlag == "DETAILSEL"){
				$("#uiPdOrdPan").addClass("open");
				$("#cartNavs").addClass("open");
				
				optionSelAttrVals = detailSelAttrVals;
			}

			var addType = type;
			if(type == 'btn'){
				var btnPakSelected = $("#btnPakSelected"+itemNo).hasClass("a sm");
				if(btnPakSelected === true) {
					addType = "remove"; // 버튼 2번 클릭시 삭제 처리.
				}else{
					addType = "add";
				}
			}else{
				if(salePsbCd != "00" && addType == "add"){	// 판매가능상품 일때만 장바구니 담기
					ui.alert("판매가능상품이 아닙니다.");
					return;
				}
			}
			var dataObj = {};
			dataObj.rownum 			= rownum;
			dataObj.itemNo 			= itemNo;
			dataObj.imgPath 		= imgPath;
			dataObj.cstrtShowNm 	= cstrtShowNm;
			dataObj.subGoodsId 		= subGoodsId;
			dataObj.saleAmt 		= ${dto.sale_rate};
			dataObj.orgSaleAmt		= ${dto.item_price };
			dataObj.minOrdQty 		= minOrdQty ? minOrdQty : 1;
			dataObj.maxOrdQty 		= maxOrdQty ? maxOrdQty : 999;
			//dataObj.unit 			= $("#uispinerUnitLeft" + itemNo).val(); // 개수
			dataObj.unit 			= 1; // 개수
			dataObj.ordmkiYn		= ordmkiYn;
			dataObj.salePsbCd		= salePsbCd;
			dataObj.ioAlmYn			= ioAlmYn;
			dataObj.goodsCstrtTpCd	= "ITEM";
			dataObj.optionSelAttrVals = optionSelAttrVals;
			//dataObj.ordmkiContent	= $("#inputOrdmki_"+cnt).val(); 
			// console.log("itemNo : " + itemNo + ", dataObj : " + JSON.stringify(dataObj));
			fnPaksRight(dataObj, addType);
			
			// 선택옵션 text 초기화
			$("#optionSelAttrVals").val("");
			
			$(document).off("click", ".uispiner .bt");
			$(document).off("click", ".uispiner .plus");
			$(document).on("click",".uispiner .plus",function(e){
				e.preventDefault();

				var $qtyObj = $(this).siblings(".amt");
				var maxOrdQty = $qtyObj.data("maxOrdQty") ? $qtyObj.data("maxOrdQty") : 999;
				
				var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";

				if (!maxOrdQty || parseInt($qtyObj.val()) < maxOrdQty) {
					var cartQty = parseInt($qtyObj.val()) + 1;
					//var cartQty = parseInt($qtyObj.val());
					var itemNo = $qtyObj.data("itemNo");
		 			//$("#buyQty" + itemNo).attr("value", cartQty);
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty); // 사용하지말것.
					var goodsCstrtTpCd = "ITEM";
					//console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", itemNo : " + itemNo + ", cartQty : " + cartQty);
					if(ordmkiYn == "Y"){	// 각인여부
						indexOrdpan++;
						if(!document.getElementById('spanOrdmki_'+ itemNo + '_' + cartQty)){
							var spanText = "";
							var n2Class = "";
							if(9 < cartQty){
								n2Class = "n2";
							}
							spanText += "<span class='input nms"+n2Class+"' id='spanOrdmki_"+itemNo+"_"+cartQty+"'>";
							spanText += "	<i class='n'>"+cartQty+".</i><input type='text' name='inputOrdmki' id='inputOrdmki_"+itemNo+"_"+cartQty+"' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onkeydown='javascript:fnCheckOrdmkiTextLength(this);'>";
							spanText += "</span>";
							//$("#divOrdmki_"+cartQty-1).html($("#divOrdmki_"+cartQty).html() + spanText);
							var gudText = "<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>";
							$("#divOrdmki_"+itemNo + " .gud").remove();
							$("#divOrdmki_"+itemNo).append(spanText + gudText);
						}
					}
					
					if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
						fnClickItemTotalCnt(itemNo, cartQty);
					}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
						var originSaleAmt = $qtyObj.data("saleAmt");
						fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
					}
				}else{
					fnGoodsUiToast("최대 " + maxOrdQty + "개까지 구매할 수 있어요", "maxOrdQty");
					return;
				}
			});
			
			$(document).off("click", ".uispiner .bt");
			$(document).off("click", ".uispiner .minus");
			$(document).on("click",".uispiner .minus",function(e){
				e.preventDefault();

				var $qtyObj = $(this).siblings(".amt");
				var minOrdQty = $qtyObj.data("minOrdQty") ? $qtyObj.data("minOrdQty") : 1;
				var ordmkiYn = $qtyObj.data("ordmkiYn") ? $qtyObj.data("ordmkiYn") : "N";
				if (parseInt($qtyObj.val()) > minOrdQty) {
					var cartQty = parseInt($qtyObj.val()) - 1;
					//var cartQty = parseInt($qtyObj.val());
					var itemNo = $qtyObj.data("itemNo");
		 			//$("#buyQty" + itemNo).attr("value",cartQty);
					$("#buyQty" + itemNo).val(cartQty).attr("value",cartQty); // 사용하지말것.
					if(indexOrdpan <= 0){
						indexOrdpan = 1;
					}else{
						indexOrdpan--;
					}

					var goodsCstrtTpCd = "ITEM";
					//console.log("goodsCstrtTpCd : " + goodsCstrtTpCd + ", itemNo : " + itemNo + ", cartQty : " + cartQty);

					if(ordmkiYn == "Y"){
						$("[id^=spanOrdmki_" + itemNo + "_]").each(function(index){
							var idx = index + 1;
							if(cartQty < idx){
								$(this).remove();
							}
						});
					}
					
					if(goodsCstrtTpCd == "ITEM" || goodsCstrtTpCd == "SET"){
						fnClickItemTotalCnt(itemNo, cartQty);
						
					}else if(goodsCstrtTpCd == "PAK" || goodsCstrtTpCd == "ATTR"){
						var originSaleAmt = $qtyObj.data("saleAmt");
						fnClickPaksTotalCnt(itemNo, cartQty, originSaleAmt);
					}
				}else{
					fnGoodsUiToast("최소 " + minOrdQty + "개 이상 구매할 수 있어요", "maxOrdQty");
				}
			});
			
		}
		, exChange : function (itemNo, type){

			var data = [];
			$("[id^=selected_attrValNo_]").each(function(index){

				var dataObj = {};
				console.log("index : " + index + ", listPaks obj ; " + JSON.stringify(obj));
				dataObj.attrNo 		= $("[id^=selected_attrNo_]").eq(index).val();
				dataObj.attrValNo 	= $(this).val();
				dataObj.attrVal 	= $("[id^=selected_attrVal_]").eq(index).val();
				dataObj.itemNo 		= itemNo;
				dataObj.unit 		= 1;
				dataObj.obj 		= obj;
				data.push(dataObj);
			});

		}
	};
	
	function fnCheckSoldOutYn(obj){

		var goodsCstrtTpCd = "ITEM";
		var soldOutExceptYn = "N";
		
		if(obj.checked){
			soldOutExceptYn = "Y";
		}
		
		if(goodsCstrtTpCd == "PAK"){
			fnSelectPakGoodsList(soldOutExceptYn);
		}else if(goodsCstrtTpCd == "ATTR"){
			var optionCnt = $("#optionCnt").val();
			
			$("#soldOutExceptYn").val(soldOutExceptYn);
			// 옵션목록 초기화.
			$("#attrNo").val($("#attr1No").val());
			$("#attrIdx").val("");
			
			for(var i=1; i <= optionCnt; i++){
				
				$("#attr"+i+"ValNo").val("");
				
				// 옵션상품은 '옵션을 선택해주세요'가 아닌 옵션명을 셋팅한다. 
				$("#optsetsVal"+i).text( $("#cstrTpAttrNm"+i).val());
				
				if(i == 1 ){
					$("#divOptsets"+i).addClass("open");
				}else{
					$("#divOptsets"+i).removeClass("open");
					$("#optionSetList"+i).empty();
				}
			}
			ajax.load("optionSetList1", "/goods/getOptionSetList", $("#optionGoodsForm").serializeJson());
		}
	}
	
	function fnOptionselect(attrNo, attrValNo, attrVal, subGoodsId){
		
		$("#subGoodsId").val(subGoodsId);
		
		var idx = $("#listAttrsCount"+attrNo).val();
		var soldOutExceptYn = "N";
		
		if($("#chkSoldOutExceptYn").is(":checked")){
			soldOutExceptYn = "Y";
		}
		
		$("#soldOutExceptYn").val(soldOutExceptYn);
		var optionCnt = $("#optionCnt").val();
		var nextidx = Number(idx) + 1;
		
		if(attrValNo != "" && idx != ""){
			$("#attrNo").val($("#attr"+nextidx+"No").val());
			$("#attr"+idx+"ValNo").val(attrValNo);
			$("#optsetsVal"+idx).text(attrVal);
			$("#attrIdx").val(idx);
		}

		var resultCallCheck = true;
		var optionSelAttrVals = "";
		
		var goodsCstrtTpCd = "ITEM";
		
		for(var i = 1; i <= optionCnt; i++){
			// 옵션값이 다 설정 되지 않으면 조회 하지 않음.
			if($("#attr"+i+"ValNo").val() == ""){
				resultCallCheck = false;
			}
			
			if(idx < i){
				$("#attr"+i+"ValNo").val("");
			
				if( goodsCstrtTpCd == "ATTR") {
					// 옵션상품은 '옵션을 선택해주세요'가 아닌 옵션명을 셋팅한다. 
				    $("#optsetsVal"+i).text( $("#cstrTpAttrNm"+i).val());
				} else {
					$("#optsetsVal"+i).text("옵션을 선택해 주세요");
				}
			}
			
			if(i != 1){
				optionSelAttrVals += " / "; 
			}
			optionSelAttrVals += $("#optsetsVal"+i).text();
		}

		if(idx < optionCnt){
			ajax.load("optionSetList"+nextidx, "/goods/getOptionSetList", $("#optionGoodsForm").serializeJson());	
			// next 옵션목록 자동 open
			$("#divOptsets"+nextidx).addClass("open");
		}	
		
			
		if(resultCallCheck){
			$("#optionSelAttrVals").val(optionSelAttrVals);
			fnOptionSelectResult(optionCnt);
		}
	}
	
	function fnOptionSelectResult(optionCnt){

		ajax.load("optionGoodsList", "/goods/getOptionGoodsList", $("#optionGoodsForm").serializeJson());
		
		var goodsCstrtTpCd = "ITEM";
		
		// 옵션값으로 조회후 초기화.
		for(var i = 1; i <= optionCnt; i++){
			$("#attr"+i+"ValNo").val("");
			 
			if( goodsCstrtTpCd == "ATTR") {
				// 옵션상품은 '옵션을 선택해주세요'가 아닌 옵션명을 셋팅한다. 
			    $("#optsetsVal"+i).text( $("#cstrTpAttrNm"+i).val());
			} else {
				$("#optsetsVal"+i).text("옵션을 선택해 주세요");
			}
			
			$("#divOptsets"+i).removeClass("open");
			if(i != 1){
				$("#optionSetList"+i).empty();
			}
		}
	}; 
	
	function fnSelectPakGoodsList(soldOutExceptYn){
		$("#soldOutExceptYn").val(soldOutExceptYn);
		ajax.load("cstrtPakGoodsList", "/goods/getPakGoodsList", $("#pakGoodsForm").serializeJson());
	}

</script>

				<!-- 단품/세트 상품 -->
				<div class="cdt cdt_l">
					<div class="optresul" style="min-width: 50%">
						<ul class="list">
							<li>
								<div class="unitRes">
									<a href="javascript:" class="box"> <!-- <button type="button" class="bt del">삭제</button> -->
										<div class="infs">
											<span class="lk wb_bAll_k0426">${dto.item_name }</span>
										</div>
									</a>
									<div class="cots">
										<div class="uispiner">
											<input type="text" value="1" class="amt" id="buyQty369630"
												name="buyQty" onblur="fnChangebuyQty(this)"
												onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"
												data-item-no="369630" data-min-ord-qty="1"
												data-max-ord-qty="99999" data-ordmki-yn="N">
											<button type="button" class="bt minus">수량빼기</button>
											<button type="button" class="bt plus">수량더하기</button>
										</div>
										<div class="price">
											<em class="p" id="emPriceTotalAmtItem"><fmt:formatNumber pattern="#,###"
                        value="${ dto.item_price * s_price  }"></fmt:formatNumber></em>
                        <i class="w">원</i>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>

				<!-- 묶음/옵션 상품 Right -->
				<script type="text/javascript">
	$(document).ready(function(){
	});

	// 묶음, 옵션 처리.
	function fnPaksRight(data, type){
		console.log("fnPaksRight obj : " + JSON.stringify(data));
		var artUiPdOrdPanRight = $("#artUiPdOrdPanRight").html();
		var buyQtyRight = data.minOrdQty;
		if(type == "add"){
			if(!document.getElementById('selected_itemNo_'+data.itemNo)){
				$("#artUiPdOrdPanRight").html(artUiPdOrdPanRight + fnOrdpanRight(data));
				$("#btnPakSelected"+data.itemNo).removeClass("c sm");
				$("#btnPakSelected"+data.itemNo).addClass("a sm");
			}else{  // 동일한 상품인 경우 +1 처리.
				
				if(data.maxOrdQty == $("#buyQty" + data.itemNo).val()){
					fnGoodsUiToast("최대 " + data.maxOrdQty + "개까지 구매할 수 있어요", "maxOrdQty");
					return;
				}
				
				buyQtyRight = Number($("#buyQty" + data.itemNo).val()) + 1;
				$("#buyQty" + data.itemNo).val(buyQtyRight).attr("value",buyQtyRight);
				
				if(data.ordmkiYn == "Y"){

					var spanText = "";
					$("#divOrdmki_" + data.itemNo + " .gud").remove();
					//$("[id^=inputOrdmki_"+itemNo+"_]").remove();
					for(var i = 1; i <= buyQtyRight; i++){
						if(!document.getElementById('spanOrdmki_'+ data.itemNo + '_' + i)){
							var n2Class = "";
							if(9 < i ){
								n2Class = "n2";
							}
							spanText += "<span class='input nms "+n2Class+"' id='spanOrdmki_" + data.itemNo + "_"+i+"'>";
							spanText += "	<i class='n'>" + i + ".</i><input type='text' name='inputOrdmki' id='inputOrdmki_" + data.itemNo + "_" + i + "' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onchange='javascript:fnCheckOrdmkiTextLength(this);'>";
							spanText += "</span>";
						}
					}
					var gudText = "<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>";
					$("#divOrdmki_"+data.itemNo).append(spanText + gudText);
				}
			}

			// 전체 동기화.
			console.log("itemNo : " + data.itemNo + ", buyQtyRight : " + buyQtyRight + ", saleAmt : " + data.saleAmt);
			fnClickPaksTotalCnt(data.itemNo, buyQtyRight, data.saleAmt);
		}else{
			$("#liOrdpanRight" + data.itemNo).remove();
			$("#btnPakSelected"+data.itemNo).removeClass("a sm");
			$("#btnPakSelected"+data.itemNo).addClass("c sm");
			fnClickPaksTotalCnt(data.itemNo, 1, data.saleAmt);
		}
	}
	
	function comma(num){
	    var len, point, str; 
	       
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    } 
	     
	    return str;
	 
	}
	
	

	function fnOrdpanRight(data){
		
		var rn = $("#artUiPdOrdPanRight li").length + 1;
		
		var dataImgPath = data.imgPath;
		// 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_340 >>>> frontConstants.IMG_OPT_QRY_500
		var imgPath = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images" + dataImgPath + "?type=f&w=259&h=259&quality=90&align=4";
		var noImgPath = "/_images/mall/common/default_image.jpg";
		var imgClass = "";
		if(data.goodsCstrtTpCd == "PAK"){
			imgClass = "gpic";	
		}
		
		var diffAmt = "";
		var saleAmt = Number(${dto.sale_rate});
		var orgSaleAmt = Number(${dto.item_price});
		if(saleAmt > orgSaleAmt){
			diffAmt = "(+" + comma((saleAmt*(1/100))-orgSaleAmt) + "원)";
		}else if(saleAmt < orgSaleAmt){
			diffAmt = "(-" + comma(orgSaleAmt-(saleAmt*(1/100))) + "원)";
		}
		
		var text = "";
		text += "<li id='liOrdpanRight"+data.itemNo+"'>                                                                		";
		text += "<input type='hidden' id='selected_itemNo_"+data.itemNo+"' name='itemNos' value='"+data.itemNo+"' />  		";
		text += "<input type='hidden' id='selected_subGoodsId_"+data.itemNo+"' name='goodsIds' value='"+data.subGoodsId+"' />";
		text += "	<div class='unitRes "+imgClass+"'>                                                                       ";
		text += "		<div class='box'>                                                                                	";
		text += "			<button type='button' class='bt del' onclick='fnOption.exPaksAdd(\"remove\", \""+data.rownum+"\", \""+data.itemNo+"\",\""+data.saleAmt+"\")'>삭제</button>	";
		if(data.goodsCstrtTpCd == "PAK"){
			text += "			<div class='thum'>                                                                           	";
			text += "				<div class='pic'><img class='img' src='"+imgPath+"' onerror='this.src=\""+noImgPath+"\"' alt='상품'></div>  						";
			text += "			</div>                                                                                        	";
		}
		text += "			<div class='infs'>                                                                           	";
		text += "				<div class='cate'>상품"+rn+"</div>                                                 	";
		if(data.goodsCstrtTpCd == "PAK"){
			text += "				<a href='javascript:;' class='lk'>"+data.cstrtShowNm + diffAmt+"</a> 									";
		} else {
			text += "				<a href='javascript:;' class='lk'>" + data.optionSelAttrVals + diffAmt + "</a> 									";
		}	
		text += "			</div>                                                                                       	";
		text += "		</div>                                                                                           	";
		text += "		<div class='cots'>                                                                               	";
		text += "			<div class='uispiner'>                                                                          ";
		/* text += "				<input type='text' value='1' name='buyQty' id='buyQty"+data.itemNo+"' class='amt'  disabled='disabled' onchange='javascript:fnChangebuyQty(this);'"; */
		text += "				<input type='text' value='"+data.minOrdQty+"' name='buyQty' id='buyQty"+data.itemNo+"' class='amt' onblur='fnChangebuyQty(this)'";
		text += " 					onkeyup='this.value=this.value.replace(/[^0-9]/g, \"\");'";
		text += "					   data-item-no='"+data.itemNo+"' 							";
		text += "					   data-min-ord-qty='"+data.minOrdQty+"' data-max-ord-qty='"+data.maxOrdQty+"'         	";
		text += "					   data-sale-amt='"+data.saleAmt+"' data-ordmki-yn='"+data.ordmkiYn+"'>         							";
		text += "				<button type='button' class='bt minus'>수량더하기</button>                                  	";
		text += "				<button type='button' class='bt plus'>수량빼기</button>                                     	";
		text += "			</div>                                                                                       	";
		text += "			<div class='price'>                                                                          	";

		if(data.salePsbCd == "00"){
			text += "				<em class='p' id='buyPriceRight"+data.itemNo+"'>"+data.saleAmt+"</em><i class='w'>원</i>	";	
		}
		if(data.salePsbCd == "10"){
			text += "<span class='bt sold'>판매중지</span>";
		}
		if(data.salePsbCd == "20"){
			text += "<span class='bt sold'>판매종료</span>";
		}
		if(data.salePsbCd == "30"){
			if(data.ioAlmYn == "Y"){
				text += "<button type='button' class='bt alim'>입고알림</button>";
			}else{
				text += "<span class='bt sold'>입고예정</span>";
			}
		}
		text += "				<input type='hidden' id='inputBuyPriceRight"+data.itemNo+"' name='itemNos' value='"+data.saleAmt+"' />  		";
		text += "			</div>                                                                                       	";
		text += "		</div>                                                                                           	";
		if(data.ordmkiYn == "Y"){
			text += "		<div class='msgs' id='divOrdmki_"+data.itemNo+"'>                                                                               	";
			for(var i = 1; i<= data.minOrdQty; i++){
				var n2Class = "";
				if(9 < i ){
					n2Class = "n2";
				}
				text += "			<span class='input nms "+n2Class+"' id='spanOrdmki_"+data.itemNo+"_" + i + "'><i class='n'>" + i + ".</i><input type='text' name='inputOrdmki' id='inputOrdmki_"+data.itemNo+"_" + i + "' placeholder='각인문구를 입력해주세요' title='각인문구' value='' maxlength='40' onkeydown='javascript:fnCheckOrdmkiTextLength(this);'></span>";
				if(i == data.minOrdQty){
					text += "			<div class='gud'>상품을 담기전에 입력하신 내용을 한번 더 확인해주세요.</div>                          	";	
				}
			}

			text += "		</div>                                                                                           	";
		}
		text += "	</div>                                                                                               	";
		text += "</li>";

		return text;
	}
</script>
			</div>

			<div class="tots">
				<div class="inr">
					<div class="amts">
						<i class="t">총 수량</i> <em class="amt"><i class="i"
							id="emPriceTotalCnt"> 1</i><i class="s">개</i> </em>
					</div>
					<div class="price">
						<i class="t">합계</i> <em class="prc"><i class="i"
							id="emPriceTotalAmt">
							<fmt:formatNumber pattern="#,###" value="${ dto.item_price * s_price  }"></fmt:formatNumber>
						</i>
						<i class="s">원</i></em>
					</div>
				</div>
			</div>
		</div>
	</div>
</article>
<script type="text/javascript">
</script>
<nav class="cartNavs" id="cartNavs">
	<div class="inr">
		<div class="pdinfo">
			<div class="box">
				<!-- 직사각형을 정사각형으로 변경함. frontConstants.IMG_OPT_QRY_210 >>>> frontConstants.IMG_OPT_QRY_500 -->
				<span class="pic"><img class="img" src="${dto.item_img }"
					onerror="this.src='/_images/mall/common/default_image.jpg'" alt=""></span>
				<div class="disc">
					<div class="names">${dto.item_name }</div>
					<div class="price">
						<c:set value="${ (100 - dto.sale_rate) / 100 }" var="s_price"></c:set>
						<em class="p"><fmt:formatNumber pattern="#,###"
								value="${ dto.item_price * s_price  }"></fmt:formatNumber></em><i
							class="w">원</i>
					</div>
				</div>
			</div>
		</div>
		<div class="btns">
			<div class="zims">
				<c:set var="doneLoop" value="false"></c:set>
				<c:if test="${ zzim ne null }">
					<c:forEach items="${ zzim }" var="zzim" varStatus="status">
						<c:if test="${ not doneLoop }">
							<c:if test="${ zzim.item_code eq item_code }">
								<button type="button" class="bt btZZim on" id="goodsWish"
									data-itemcode="${ item_code }" value="Y">
									<span class="t">찜하기</span>
								</button>
								<c:set var="doneLoop" value="true"></c:set>
							</c:if>
							<c:if test="${ status.last }">
								<c:if test="${ status.current.item_code ne item_code }">
									<button type="button" class="bt btZZim " id="goodsWish"
										data-itemcode="${ item_code }" value="N">
										<span class="t">찜하기</span>
									</button>
									<c:set var="doneLoop" value="true"></c:set>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${ zzim eq null }">
					<button type="button" class="bt btZZim " id="goodsWish"
						data-itemcode="${ item_code }" value="N">
						<span class="t">찜하기</span>
					</button>
				</c:if>
				<!-- .on class명 있으면 찜한 상태임 -->
			</div>
			<!-- soldOutYn 품절 여부 0보다 크면 Y -->
			<div class="obts">
				<button type="button" class="bt btCart" onclick="fnCartItems('N')">
					<span class="t">장바구니</span>
				</button>
				<!-- 판매가능 -->
				<!-- 판매가능 -->
				<button type="button" class="bt btOrde" onclick="fnBuyItem()">
					<span class="t">구매하기</span>
				</button>
			</div>
		</div>
	</div>
</nav>
<script>
	$(document).on("click", "button[id=goodsWish]", function() {
		<%if (session.getAttribute("num") == null) {%>
			alert("로그인 후 이용할 수 있습니다.")		
		<%} else {%>
		
		/* alert(document.querySelector("#btnZzim").dataset.itemcode) */

		var item_code = $(this).data("itemcode")
		var zzimcheck = $(this).val()
		var mem_code = "<%=mem_code%>"
		
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
					}
			})

		<%}%>
		
	})
</script>


<script type="text/javascript">
function fnBuyItem() {
	var totalCnt = $("#emPriceTotalCnt").html().trim();
	var totalPrice = $("#emPriceTotalAmt").html().trim().replace(',', '');		// 24,580 ? 콤마 왜 붙음??
	var isLogIn = <%=isLogin%>;
	var itemLists = ${item_code};
	
	var uiPdOrdPanClass = $("#uiPdOrdPan").attr("class");
	var productOptionClass = $("#productOption").attr("class");
	var setCartItemsCheck = false;
	if(uiPdOrdPanClass == undefined){
		// 상품 요약일때
		if(productOptionClass.indexOf("none") > -1){
			setCartItemsCheck = true;
		}
	}else{
		// 상품 상세일때
		if(uiPdOrdPanClass.indexOf("open") > -1){
			setCartItemsCheck = true;
		}
	}
	
	
	var newForm = document.createElement('form');
	
	newForm.name = 'newForm';
	newForm.method ='get';
	newForm.action ='itemOrder.do';
	
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
	var input4 = document.createElement('input');
	
	input1.setAttribute("type", "hidden");
	input1.setAttribute("name", "item_code");
	input1.setAttribute("value", itemLists);
	
	input2.setAttribute("type", "hidden");
	input2.setAttribute("name", "totalCnt");
	input2.setAttribute("value", totalCnt);
	
	input3.setAttribute("type", "hidden");
	input3.setAttribute("name", "totalPrice");
	input3.setAttribute("value", totalPrice);
	
	input4.setAttribute("type", "hidden");
	input4.setAttribute("name", "mem_code");
	input4.setAttribute("value", <%=mem_code%>);
	
	newForm.appendChild(input1);
	newForm.appendChild(input2);
	newForm.appendChild(input3);
	newForm.appendChild(input4);
	
	
	if (setCartItemsCheck) {
		if (isLogIn) {
		document.body.appendChild(newForm);		
		newForm.submit();
		}else{
			alert("로그인이 필요합니다");
			location.href="logon_input.jsp";
		}
		
	}
}


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
<!-- popup 내용 부분입니다. -->
<div class="layers" id="goodsLayers"></div>
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
			<li id="liTag_20" class="tv "><a href="/tv/home/" class="bt"><span>TV</span></a>
			</li>
			<li id="liTag_30" class="log "><a href="/log/home/" class="bt"><span>로그</span></a>
			</li>
			<li id="liTag_10" class="shop active"><a href="/shop/home/"
				class="bt"><span>샵</span></a></li>
			<li id="liTag_00" class="my "><a href="/mypage/indexMyPage/"
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
	
	$.ajax({
		url : "/AboutPet/Project/aboutPet/getGoodsCommentList.do"
		, type : "get"
		, dataType : "html"
		, data : {item_code : ${item_code}}
		,cache: false
		, success : function(html) {
			$('#commentListUl').html(html);
		}
	});
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
				<li><a href="/customer/notice/indexNoticeList">입점/제휴 문의</a></li>
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

<!-- <script type="text/javascript">
	$(document).ready(function() {
		$("li").children("a").;
	});
	</script> -->
</body>
</html>