<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
		
<!-- sidebar -->
<jsp:include page="sidebar.jsp" flush="false"/>


<!DOCTYPE html>
<html>

<head>
<title>장바구니</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<meta name="theme-color" content="#ffffff">
<link rel="canonical" href="">
<meta name="author" content="">
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
<meta property="og:image" content="https://aboutpet.co.kr/_images/common/aboutpet_logo@2x.png">
<meta property="og:image:url" content="https://aboutpet.co.kr/_images/common/aboutpet_logo@2x.png">
<meta property="og:image:type" content="image/jpeg">
<meta property="og:image:width" content="300">
<meta property="og:image:height" content="300">

<link href="https://aboutpet.co.kr/_images/common/favicon.ico" rel="shrtcut icon">
<link href="https://aboutpet.co.kr/_images/common/favicon.png" rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css2/jquery-ui.css">

<!-- googole Analytics --> 

<script type="text/javascript" async="" src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.sdk.js?timestemp=1625749753220" charset="UTF-8"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=UA-187433715-1&amp;l=dataLayer&amp;cx=c"></script><script async="" src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript" src="../js/googleAnalytics.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', "G-NR86F31079");
</script>


<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="../js/jquery.blockUI.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.number.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.form.min.js"></script>
<script type="text/javascript" src="../js/jquery.countdown.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/swiper.min.js"></script>
<script type="text/javascript" src="../js/clipboard.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/popup.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript" src="../js/deviceChk.js"></script>	<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- kakao map -->
<script type="text/javascript" src="/dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&amp;libraries=services"></script><script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/main/4.3.6/kakao.js"></script><script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
<script type="text/javascript" src="../js/kakao-map.js"></script>
<!-- app interface --> 
<script type="text/javascript" src="../js/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" src="../js/adbrix.js"></script>
<script type="text/javascript" src="../js/ui.mo.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&amp;submodules=geocoder"></script><script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
<script type="text/javascript">
//	const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
</script>

<script type="text/javascript">
	/*  order에서 공통으로 사용되는 js 영역입니다. */	
	
var orderCommon = {
	DLVRC_STD_10 : "10"	//무료 배송
	,DLVRC_STD_20 : "20"	//배송비 추가
	,DLVRC_CDT_10 : "10"	//개당 부여
	,DLVRC_CDT_20 : "20"	//주문당 부여
	,DLVRC_CDT_STD_10 : "10"	//유료배송
	,DLVRC_CDT_STD_20 : "20"	//조건부 무료배송(구매가격)
	,DLVRC_CDT_STD_30 : "30"	//조건부 무료배송(구매수량)
};
	
var orderPopup = {
	
	
	
	loadLayer : function(targetTag, url, params, popId, callBackFnOpen, callBackFnClose ) {
		
		waiting.start(); 	
		
		if (params == null) {
			params = {};
		}
	 	
		$("."+ targetTag).load(
			url,
			params,
			function(response, status, xhr) {
				waiting.stop();		
				
				if (status === "error") {
					if (xhr.status === 460) {												
						$("."+ targetTag).empty();						
					}
	
					ajax.error(xhr.status, xhr.responseText);  
				}else{
					
					ui.popLayer.open(popId, {
						ocb:function(){
							if (callBackFnOpen != null && callBackFnOpen !== "" && callBackFnOpen !== undefined) {
								eval(callBackFnOpen + "()");
							}
						},
						ccb:function(){
							if (callBackFnClose != null && callBackFnClose !== "" && callBackFnClose !== undefined) {
								eval(callBackFnClose + "()");
							}
							$("."+ targetTag).empty();
						}
					});
					
				}				
		}); 		
	}		
}


/*constants*/
const NO_MEMBER_NO = 0;
const CLM_TP_20 = "20";

/*message*/
const FRONT_WEB_VIEW_MYPAGE_ORDER_DETAIL_STATCD_UPDATE_CONFIRM = "구매를 확정하시겠습니까?";
const FRONT_WEB_VIEW_MYPAGE_ORDER_DETAIL_STATCD_UPDATE_SUCCESS = "구매확정이 완료되었습니다.";
const FRONT_WEB_VIEW_CLAIM_REFUND_CLAIM_PSB = "반품이 불가능한 상품입니다.";
const FRONT_WEB_VIEW_CLAIM_CONFIRM_CLAIM_REFUND = "반품 접수를 철회하시겠습니까?";
const FRONT_WEB_VIEW_CLAIM_CONFIRM_CLAIM_EXCHANGE = "교환 접수를 철회하시겠습니까?";
const FRONT_WEB_VIEW_CLAIM_CLAIM_REFUND_SUCCESS = "반품 접수가 철회되었습니다.";
const FRONT_WEB_VIEW_CLAIM_CLAIM_EXCHANGE_SUCCESS = "주문 취소가 완료되었습니다.";
/*
 * 주문/배송 상세 버튼
 */
var orderDeliveryDetailBtn = {
	// 배송지 수정
	goAddressEdit : function(ordNo){
		var params = {
				ordNo : ordNo
			, callBackFnc : "orderDeliveryDetailBtn.reload"
		};

		pop.popupDeliveryAddressEdit(params);
	}
	
	, plgYn : "Y"
	, deviceGb : 'PC'
	, openGoodsComment : function(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, sGoodsEstmTP){
		
		if(sGoodsEstmNo == ""){
			if(orderDeliveryDetailBtn.deviceGb == 'APP' && orderDeliveryDetailBtn.plgYn == 'Y') {					
				$("#acSelect").remove();
				
				var layerCommentHtml = "";					
				layerCommentHtml += "<div class=\"acSelect t2\" id=\"acSelect\">";
				layerCommentHtml += "	<input type=\"text\" class=\"acSelInput\" readonly />";
				layerCommentHtml += "	<div class=\"head \">";
				layerCommentHtml += "		<div class=\"con\">";
				layerCommentHtml += "			<div class=\"tit\">후기작성</div>";
				layerCommentHtml += "			<a href=\"javascript:;\" class=\"close\" onClick=\"ui.selAc.close(this)\"></a>";
				layerCommentHtml += "		</div>";
				layerCommentHtml += "	</div>";
				layerCommentHtml += "	<div class=\"con\">";
				layerCommentHtml += "		<ul class=\"selReview\">";
				layerCommentHtml += "			<li onClick=\"orderDeliveryDetailBtn.openGoodsCommentNext('"+ sGoodsId +"', '"+ sOrdNo +"', '"+sOrdDtlSeq +"', '"+sGoodsEstmNo+"', 'NOR');\" name='norBtn'>";
				layerCommentHtml += "			<img src=\"../../_images/my/icon-review-normal@2x.png\">";
				layerCommentHtml += "			<span>일반 후기 작성</span>";
				layerCommentHtml += "			</li>";
				layerCommentHtml += "			<li onClick=\"orderDeliveryDetailBtn.openGoodsCommentNext('"+ sGoodsId +"', '"+ sOrdNo +"', '"+sOrdDtlSeq +"', '"+sGoodsEstmNo+"', 'PLG');\" name='plgBtn'>";
				layerCommentHtml += "			<img src=\"../../_images/my/icon-review-log@2x.png\">";
				layerCommentHtml += "			<span>펫로그 후기 작성</span>";
				layerCommentHtml += "			</li>";
				layerCommentHtml += "		</ul>";
				layerCommentHtml += "	</div>";
				layerCommentHtml += "</div>";
				
				$("#emptyLayers").append(layerCommentHtml);
				
				ui.selAc.open('#acSelect');
				
			}else{
				var norBtn = "NOR";
				orderDeliveryDetailBtn.openGoodsCommentNext(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, norBtn);
			}
		}else{			
			
			orderDeliveryDetailBtn.openGoodsCommentNext(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, sGoodsEstmTP);
		}	
			
	}
	, openGoodsCommentNext : function(sGoodsId, sOrdNo , sOrdDtlSeq, sGoodsEstmNo, sGoodsEstmTp){	
		
		//수정
		if(sGoodsEstmNo != ""){					
			if( sGoodsEstmTp == "PLG" && orderDeliveryDetailBtn.deviceGb != "APP"){					
				ui.alert('펫로그 후기는 <br>모바일 앱에서 수정 가능합니다.');
				return false;					
			}
			
		}
		
		var url = "/mypage/commentWriteView"
		var html = '';
		html += '<input type="hidden" name="goodsId" value="'+ sGoodsId +'">';
		html += '<input type="hidden" name="goodsEstmTp" value="'+ sGoodsEstmTp +'">';
		html += '<input type="hidden" name="ordNo" value="'+ sOrdNo +'">';
		html += '<input type="hidden" name="ordDtlSeq" value="'+ sOrdDtlSeq +'">';
		html += '<input type="hidden" name="goodsEstmNo" value="'+ sGoodsEstmNo +'">';
		var goform = $("<form>",
			{ method : "post",
			action : url,
			target : "_self",
			html : html
			}).appendTo("body");
		goform.submit();
	}

	// 재조회 */
	, reload : function(){
		location.reload();
	}
	// 옵션 변경 팝업
	, openOptionChange : function(ordNo, ordDtlSeq){
		var params = {
			ordNo : ordNo,
			ordDtlSeq : ordDtlSeq,
			mode : "order",
			callBackFnc : "orderDeliveryDetailBtn.cbOptionChange"
		};
		pop.orderOptionChange(params);
	}
	// 옵션 변경 CallBack
	, cbOptionChange : function(){
		location.reload();
	}
	// 구매확정
	/* , purchase : function(ordNo, ordDtlSeq){
		if(confirm(FRONT_WEB_VIEW_MYPAGE_ORDER_DETAIL_STATCD_UPDATE_CONFIRM)){
			var options = {
					   url : "mypage/order/purchaseProcess"
					, data : { ordNo : ordNo, ordDtlSeq : ordDtlSeq }
					, done : function(data){
						alert(FRONT_WEB_VIEW_MYPAGE_ORDER_DETAIL_STATCD_UPDATE_SUCCESS);
						orderDeliveryDetailBtn.reload();
					}
				};
			ajax.call(options);
		}
	} */
	, purchase : function(ordNo, ordDtlSeq, ordDtlStatCd){
		
		if(ordDtlStatCd == "150" ){
						
			ui.confirm('<div class="info-txt t3"><ul><li>구매확정 이후에는 반품/교환이 불가하므로 상품을 배송 받으신 후에 구매확정을 해주세요.</li><li>상품을 배송받지 않은 상태에서 구매확정을 하신 경우 상품 미수령에 대한 책임은 구매자에게 있습니다.</li></ul></div>',{ // 컨펌 창 띄우기	
				//tit:"상품이 아직 배송중입니다.<br>구매확정을 진행하시겠습니까?",
				tit:"아직 배송중인 상품이 있어요<br>구매를 확정할까요?",						
				ycb:function(){
					orderDeliveryDetailBtn.purchaseNext(ordNo, ordDtlSeq);
				},					
				ybt:'예',
				nbt:'아니요'	
			});
		}else{
			orderDeliveryDetailBtn.purchaseNext(ordNo, ordDtlSeq);
		}				
	}
	, purchaseNext : function(ordNo, ordDtlSeq){
		var action = "/mypage/order/indexPurchaseRequest";				
		
		$("#delivery_detail_ord_no").val(ordNo);
		$("#delivery_detail_ord_dtl_seq").val(ordDtlSeq);
		$("#claim_request_list_form").attr("target", "_self");
		$("#claim_request_list_form").attr("method", "post");
		$("#claim_request_list_form").attr("action", action);
		$("#claim_request_list_form").submit();
	}
	// 주문취소 신청
	, goCancelRequest : function(ordNo, ordDtlSeq){
		var action = "/mypage/order/indexCancelRequest";

		$("#delivery_detail_ord_no").val(ordNo);
		$("#delivery_detail_ord_dtl_seq").val(ordDtlSeq);
		$("#claim_request_list_form").attr("target", "_self");
		$("#claim_request_list_form").attr("method", "post");
		$("#claim_request_list_form").attr("action", action);
	
		$("#claim_request_list_form").submit();
	}
	// 주문취소 페이지 
	, goCancelAllRequest : function(ordNo){
		
		if(ordNo == null || ordNo == undefined || ordNo == ""){			
			ui.alert("주문번호 오류입니다.",{					
				ybt:'확인'	
			});
			return;
		}else{	
		
			var url = "/mypage/insertClaimCancelExchangeRefund";
			
			$("#delivery_detail_ord_no").val(ordNo);		
			$("#clm_tp_cd").val("10");
			$("#clm_rsn_cd").val("110");
			
			
			ui.confirm('<div class="info-txt t3"><ul><li>입금대기 중에는 <span>전체 취소만 할 수 있어요. </li><li>일부 상품만 구매를 원하시는 경우, 취소 후 다시 주문해주세요</li></ul></div>',{ // 컨펌 창 띄우기
				tit:"주문을 취소할까요?",
				ycb:function(){
					var options = {
						url : url
						, data : $("#claim_request_list_form").serializeArray()
						, done : function(data){					
							if(data != null){
								ui.toast('주문 취소가 완료되었어요.',{
									sec:3000,
									ccb:function(){  // 토스트 닫히면 실행할 함수
										location.href="/mypage/order/indexDeliveryList";
									}
								});
								
							}
						}
					};		
					
					ajax.call(options);
				},					
				ybt:'예',
				nbt:'아니요'	
			});	
		
		}			
		
	}	
	// 교환 신청
	, goExchangeRequest : function(ordNo ,ordDtlSeq, clmIngYn, rtnIngYn){
		
		if(clmIngYn === "Y"){
			if(rtnIngYn == "Y"){
				ui.alert("이미 반품 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
					ybt:'확인'
				});
			}else{
				ui.alert("이미 교환 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
					ybt:'확인'
				});
			}
			return;
		}
		
		var action = "/mypage/order/indexExchangeRequest";

		$("#delivery_detail_ord_no").val(ordNo);
		$("#delivery_detail_ord_dtl_seq").val(ordDtlSeq);
		$("#claim_request_list_form").attr("target", "_self");
		$("#claim_request_list_form").attr("method", "post");
		$("#claim_request_list_form").attr("action", action);
		$("#claim_request_list_form").submit();
	}
	// 반품 신청
	, goReturnRequest : function(ordNo, ordDtlSeq, clmIngYn, rtnIngYn, rtnPsbYn){
		if(clmIngYn === "Y"){
			if(rtnIngYn == "Y"){
				ui.alert("이미 반품 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
					ybt:'확인'
				});
			}else{
				ui.alert("이미 교환 진행중인 상품이 있어요<br>진행중인 상품 처리 완료 후 신청해주세요." ,{
					ybt:'확인'
				});
			}
			return;
		}

		if(rtnPsbYn !== "Y"){
			ui.alert(FRONT_WEB_VIEW_CLAIM_REFUND_CLAIM_PSB, {					
				ybt:'확인'
			});
			return;
		}

		var action = "/mypage/order/indexReturnRequest";

		$("#delivery_detail_ord_no").val(ordNo);
		$("#delivery_detail_ord_dtl_seq").val(ordDtlSeq);
		$("#claim_request_list_form").attr("target", "_self");
		$("#claim_request_list_form").attr("method", "post");
		$("#claim_request_list_form").attr("action", action);
		$("#claim_request_list_form").submit();
	}
	// 구매영수증 팝업
	, openPurchaseReceipt : function(ordNo){
		var params = {
				ordNo : ordNo
				}
		pop.purchaseReceipt(params);
	}
	// 현금영수증 팝업
	, openCashReceipt : function(ordNo){
		var params = {
				ordNo : ordNo
			}
		pop.cashReceipt(params);
	}
	// 신용카드 영수증
	, openCreditCard : function(tid){
		if("false"=="true") {
			/* var parameters = {
				"func" : "onOrderPage",
				"url" : "https://npg.nicepay.co.kr/issue/IssueLoader.do?TID="+tid+"&type=0",
				"title" : "카드영수증"
			};
			if("false"=="true") {
				// Android
				window.AppJSInterface.onOrderPage(JSON.stringify(parameters));
			} else {
				// iOS(Dictionary)
				window.webkit.messageHandlers.AppJSInterface.postMessage(parameters);
			} */
			toNativeData.func = "onTitleBarHidden";
			toNativeData.hidden = "N";
			toNativeData.title = "카드영수증";
			// 1. 팝업열기
			var status = "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=420,height=540";
			var url = "https://npg.nicepay.co.kr/issue/IssueLoader.do?TID="+tid+"&type=0";
			 //type 값 세팅 :: 매출전표: 0, 현금영수증: 1
			window.open(url,"popupIssue",status);
			
			toNative(toNativeData);
			
		} else {
			// 1. 팝업열기
			var status = "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=420,height=540";
			var url = "https://npg.nicepay.co.kr/issue/IssueLoader.do?TID="+tid+"&type=0";
			 //type 값 세팅 :: 매출전표: 0, 현금영수증: 1
			window.open(url,"popupIssue",status);
		}
	}
	, openClaimDetail : function(clmNo, clmDtlSeq){
		var params = { clmNo : clmNo
				, clmDtlSeq : clmDtlSeq
				, viewTitle : "상세정보"
		}
		pop.popupCancelRefundInfo(params);
	}
	, cancelClaim : function (clmNo, clmTpCd, memberNo){
		var url = "";
		if(memberNo !== NO_MEMBER_NO){
			url = "/mypage/refundExchangeCancelRequest";
		}else{
			url = "/mypage/noMemberRefundExchangeCancelRequest";
		}

		var confirmMsg = "";

		if(clmTpCd === CLM_TP_20){
			confirmMsg = FRONT_WEB_VIEW_CLAIM_CONFIRM_CLAIM_REFUND;
		}else{
			confirmMsg = FRONT_WEB_VIEW_CLAIM_CONFIRM_CLAIM_EXCHANGE;
		}

		if(confirm(confirmMsg)){
			var options = {
				   url : url
				, data : {clmNo : clmNo}
				, done : function(data){
					if(clmTpCd === CLM_TP_20){
						alert(FRONT_WEB_VIEW_CLAIM_CLAIM_REFUND_SUCCESS);
					}else{
						alert(FRONT_WEB_VIEW_CLAIM_CLAIM_EXCHANGE_SUCCESS);
					}
					orderDeliveryDetailBtn.reload();
				}
			};
			ajax.call(options);
		}
	}
	, openCashReceiptRequest: function(ordNo, payAmt, goodsNm){
		var popParam = {
			ordNo : ordNo,
			payAmt : payAmt,
			goodsNm : goodsNm
		}		
		var popUrl = "/mypage/order/popupCashReceiptRequest";
		
		orderPopup.loadLayer("layers", popUrl, popParam, "popReceipt");		
		
	}
	
	,goOrderClaimDetail : function(clmNo, clmTpCd){	
		if(clmNo == null || clmNo == undefined || clmNo == ""){			
			ui.alert("클레임번호 오류입니다.",{					
				ybt:'확인'	
			});
			return;
		}else{		
			
			var action = "/mypage/order/indexClaimDetail";				
			var inputs = "<input type=\"hidden\" name=\"clmNo\" value=\""+clmNo+"\"/>";
			if(clmTpCd != "" ){
				inputs += "<input type=\"hidden\" name=\"clmTpCd\" value=\""+clmTpCd+"\"/>";
			}				
			jQuery("<form action=\"/mypage/order/indexClaimDetail\" method=\"post\">"+inputs+"</form>").appendTo('body').submit();
		}
	}
};

</script>
<script type="text/javascript" src="./js/cart.js"></script>
<script type="text/javascript">
	

		$(function(){
			cartGoods.reloadCart(function(){
				ui.init();
			});
		});
		
		function goBack() {
			if("" != ""){
				//App & 펫TV 영상상세 화면에서 호출일때만 callParam값이 있다.
				var callParam = "";
				var params = callParam.split(".");
				var url = "";
				if(params.length == 3){
					url = "https://aboutpet.co.kr/tv/series/indexTvDetail?vdId="+params[0]+"&sortCd=&listGb="+params[1]+"-"+params[2];
				}else{
					url = "https://aboutpet.co.kr/tv/series/indexTvDetail?vdId="+params[0]+"&sortCd="+params[1]+"&listGb="+params[2]+"-"+params[3];
				}
				
				// 데이터 세팅
				toNativeData.func = "onNewPage";
				toNativeData.type = "TV";
				toNativeData.url = url;
				// 호출
				toNative(toNativeData);
			}
			
			storageHist.goBack();
		}
	</script>
	
<body class="body shop od cart isPc gnb_ac" style="">
<!-- Google Tag Manager (noscript) -->
<!-- For Analysis Container -->
<noscript>
<iframe src="//www.googletagmanager.com/ns.html?id=GTM-NKC9BFM"
height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>

<!-- For Campaign Container -->
<noscript>
<iframe src="//www.googletagmanager.com/ns.html?id=GTM-M82SBBJ"
height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->
<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData" value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">

<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
<!-- e : gnb 영역 -->			
					<!-- s : LNB 영역 -->
					<!-- e : LNB 영역 -->
				<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
				
		<!-- s : 본문영역 -->			
		<main class="container page shop od cart" id="container">
		<div class="pageHeadPc">
			<div class="inr">
				<div class="hdt">
					<h3 class="tit">장바구니</h3>
				</div>
			</div>
		</div>
		<div class="inr" style="min-height: 488px;">
			<!-- 본문 -->
			<div class="contents" id="contents"><script type="text/javascript">
	$(document).ready(function(){
			
		cartGoods.init();
		
		console.log("로그인 여부", "true");
		console.log("Session ID", "2AB1452526FDBBA76B4FE8CF9469E1ED");
		console.log("COOKIE", document.cookie);
		ui.spined.init();
		//전체 선택
		$("#chkAll").click(function() {
			var chk = $(this).prop("checked");
			var arrCart = new Array();
			
			$.each($("input[id^=chkCartId]").not(":disabled"), function(){
				if($(this).prop("checked") != chk){
					var data = {
						cartId : $(this).val()
						,buyQty : $("#buyQty"+$(this).val()).val()
						,goodsPickYn : chk ? "Y" : "N"
					}
					arrCart.push(data);
				}
			});
			
			$("input[id^=chkCompNo], input[id^=chkCartId]").not(":disabled").prop("checked", chk);
			
			cartGoods.setTotalCnt();
			
			cartGoods.updateCartBuyQtyAndCheckYn(arrCart, function(){
				cartGoods.changeCheckInfo(arrCart);
			});
		});
		
		//그룹핑 업체 선택
		$("input[id^=chkCompNo]").click(function() {
			var chk = $(this).prop("checked");
			
			var arrCart = new Array();
			var compNo = $(this).val();
			var $ul = $("#cartList"+compNo);
			
			$.each($ul.find("input[name=cartIds]").not(":disabled"), function(){
				if($(this).prop("checked") != chk){
					var data = {
						cartId : $(this).val()
						,buyQty : $("#buyQty"+$(this).val()).val()
						,goodsPickYn : chk ? "Y" : "N"
					}
					arrCart.push(data);
				}
			});
			
			
			$ul.find("input[name=cartIds]").not(":disabled").prop("checked", chk);
			
			var chkLen = $("input[id^=chkCompNo]").filter(function(){
				var compNo = $(this).val();
				if($("#cartList"+compNo).find("input[name=cartIds]").not(":disabled").length == 0){
					return false;
				}else{
					return $(this).prop('checked');
				}
			}).length;
			
			var compLen = $("input[id^=chkCompNo]").filter(function(){
				var compNo = $(this).val();
				if($("#cartList"+compNo).find("input[name=cartIds]").not(":disabled").length == 0){
					return false;
				}else{
					return true;
				}
			}).length;
			
			
			if(chkLen == compLen){
				$("#chkAll").prop("checked", true);
			}else{
				$("#chkAll").prop("checked", false);
			}
			
			cartGoods.setTotalCnt();
			
			cartGoods.updateCartBuyQtyAndCheckYn(arrCart, function(){
				cartGoods.changeCheckInfo(arrCart);
			});
		});
		
		//상품 선택			
		$("input[id^=chkCartId]").not(":disabled").change(function() {
			var obj = $(this);
			var compNo = $(this).closest(".cartlist").data("compNo");
			
			var $compUl = $(".cartlist").filter(function(){
				return $(this).data("compNo") == compNo;
			});
			
			var chkLen = $compUl.find("input[id^=chkCartId]").not(":disabled").filter(function(){
				return $(this).prop('checked');
			}).length;
			
			if(chkLen == $compUl.find("input[id^=chkCartId]").not(":disabled").length){
				$("#chkCompNo"+compNo).prop("checked", true);
				var chkCompNoLen = $("input[id^=chkCompNo]").filter(function(){
					var compNo = $(this).val();
					if($("#cartList"+compNo).find("input[name=cartIds]").not(":disabled").length == 0){
						return false;
					}
					return $(this).prop('checked');
				}).length;
				
				var compLen = $("input[id^=chkCompNo]").filter(function(){
					var compNo = $(this).val();
					if($("#cartList"+compNo).find("input[name=cartIds]").not(":disabled").length == 0){
						return false;
					}else{
						return true;
					}
				}).length;
				
				if(chkCompNoLen == compLen){
					$("#chkAll").prop("checked", true);
				}else{
					$("#chkAll").prop("checked", false);
				}
			}else{
				$("#chkCompNo"+compNo).prop("checked", false);
				$("#chkAll").prop("checked", false);
			}
			
			cartGoods.setTotalCnt();
			
			var arrCart = new Array();
			var data = {
				cartId : $(this).val()
				,buyQty : $("#buyQty"+$(this).val()).val()
				,goodsPickYn : $(this).prop('checked') ? "Y" : "N"
			}
			arrCart.push(data);
			
			cartGoods.updateCartBuyQtyAndCheckYn(arrCart, function(){
				cartGoods.changeCheckInfo(arrCart);
			});
		});
		
		
		var preValue;
		var preCartId;
		
		$(document).off("click",".uispined .bt.mod");
		$(document).off("change",".uispined select.slt");
		$(document).off("input",".uispined .amt");
		$(document).off("focus",".uispined .amt");
		$(document).off("blur",".uispined .amt");
		
		
		$(document).on("click",".uispined .bt.mod",function(e){
			e.preventDefault();				
			ui.spined.using(this,"inp");
		});
		
		$(document).on("change",".uispined select.slt",function(e){
			e.preventDefault();
			ui.spined.using(this,"slt");
			if(preValue != $(this).val() || preCartId != $(this).closest(".uispined").find(".amt").data("cartId")){
				changeQty($(this).parent(".sel").siblings(".amt"));
			}
			preValue = $(this).val();
			preCartId = $(this).closest(".uispined").find(".amt").data("cartId");
		});
		
		$(document).on("input keyup",".uispined .amt",function(e){
			e.preventDefault();
			$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
			// _this.using(this,"inp");
		});
		
		$(document).on("focus",".uispined .amt",function(e){
			e.preventDefault();
			$(this).closest(".uispined").addClass("bt");
			console.log(e);
			preValue = $(this).val();
			preCartId = $(this).closest(".uispined").find(".amt").data("cartId");
		});
		
		
		$(document).on("blur",".uispined .amt",function(e){
			e.preventDefault();
			var obj = $(this);
			var chgVal = $(this).val();
			$(this).closest(".uispined").removeClass("bt");
			ui.spined.using(this,"inp");
			if(preValue != chgVal){
				if(chgVal > $(this).data("maxOrdQty")){
					ui.toast("최대 "+$(this).data("maxOrdQty")+"개까지 구매할 수 있어요");
				}
				var minOrdQty = $(this).data("minOrdQty") ? $(this).data("minOrdQty") : 1;
				if(chgVal < minOrdQty){
					ui.toast("최소 "+minOrdQty+"개 이상 구매할 수 있어요");
					$(this).val(minOrdQty);
				}
				
				changeQty(obj);
			}
			preValue = $(this).val();
			preCartId = $(this).closest(".uispined").find(".amt").data("cartId");
		});
		
		function changeQty(obj){
			var $qtyObj = obj;
			
			console.log("plus", $(this));
			var cartQty =$qtyObj.val()
			
			var arrCart = new Array();
			var cartId = $qtyObj.data("cartId");
			var data = {
				cartId : cartId
				,buyQty : cartQty
				,goodsPickYn : $("#chkCartId"+cartId).prop('checked') ? "Y" : "N"
			}
			arrCart.push(data);
			
			cartGoods.updateCartBuyQtyAndCheckYn(arrCart, function(){
				cartGoods.changeQty(arrCart);
			});
		}
		
	});
</script>

<form id="cartForm">
<!-- 장바구니 비었으면 -->
<c:if test="${ empty ownItem && empty cpnItem }">
	<section class="nodata">
			<div class="inr">
				<div class="msg">장바구니에 담긴 상품이 <br> 없습니다.</div>
				<div class="bts">
					<a href="/shop/home/" class="btnGoShop" data-content="" data-url="/shop/home/">펫샵 쇼핑하러 가기</a>
				</div>
			</div>
	</section>
 </c:if>
 
 <!-- 장바구니 상품 있으면 -->
 <c:if test="${ not empty ownItem || not empty cpnItem }">
 <!-- 고정div) 올체크에 장바구니 상품 개수 바꿔주고 끝 label->span->i -->
	<div class="allcheck scroll_fixed">
			<div class="inr">
				<div class="box">
					<label class="checkbox"><input type="checkbox" id="chkAll" checked="checked"><span class="txt">전체 선택 <i class="i">(${ allCnt }/${ allCnt })</i></span></label>
					<a href="javascript:void(0);" class="lk" onclick="cartGoods.del()" data-content="" data-url="https://aboutpet.co.kr/order/deleteCart">선택 삭제</a>
				</div>
			</div>
		</div>
		
		
		<!--  -->
		<div class="cartWrap">
			<div class="cartPrds">
				<!-- 자사 -->
					<!-- 업체 -->
					<c:choose>
						<c:when test="${ latestType eq '자사' }">
						
						
						
<!-- 어바웃펫 배송 상품 -->			
					<!-- 자사 -->
			<c:if test="${ not empty ownList }">
			<c:forEach items="${ ownList }" var="ownDto">
					<section class="sect abt">
							<div class="frstat">
								<label class="checkbox"><input type="checkbox" id="chkCompNo912" value="912" checked="checked"><span class="txt"><span class="dt"><span class="t">어바웃펫 배송 상품</span></span></span></label>
								<div class="box">
									<div class="gage">
										<div class="inf">
											<input type="hidden" id="apetDlvrcBuyPrc" value="${ ownDto.free_fee }">
											<em class="pp" id="noneDlvrBar" style="display: none;">👀 <b class="p"><fmt:formatNumber value="${ ownDto.free_fee }"/></b><i class="w">원</i></em> <span class="tt" style="display: none;">이상 무료배송</span>
											<c:if test="${ ownDto.total_fee eq 0 }"><em class="pp" id="fullDlvrBar" >🚚 <b class="p">무료배송</b></em></c:if>
											<c:if test="${ ownDto.total_fee ne 0 }">
											<em class="pp" id="addDlvrBar" >💸 <b class="p">
												<fmt:formatNumber value="${ ownDto.free_fee - ownDto.total_price }"/>
											</b><i class="w">원 이상</i></em> <span class="tt" style="">추가하면 무료배송!</span>
											</c:if>
											
											
											<span class="prc"><em class="p"><fmt:formatNumber value="${ ownDto.free_fee }"/></em><i class="w">원</i></span>
										</div>
										<div class="bar">
											<em class="b" id="apetBar" style="width: ${ ownDto.total_price/ownDto.free_fee * 100 }%;"></em>
										</div>
									</div>
								</div>
							</div>
					<!-- 업체 -->
					<ui class="cartlist" id="cartList912" data-comp-no="912">
					
					<c:forEach items="${ ownItem }" var="owni">
					<script type="text/javascript">
	
	function directOrderFunc(cartId, goodsId, itemNo, pakGoodsId, mkiGoodsYn, mkiGoodsOptContent, isMiniCart, directGoodsNm, directGoodsOptNm ,isLogin){
		if(isLogin == 'false'){
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?', { // 컨펌 창 옵션들
				ycb: function () {
					var url = encodeURIComponent(document.location.href);
					console.log("url :"+url);
					if("false" == "true" && document.location.href.indexOf("/tv/series/indexTvDetail") > -1){
						fncAppCloseMoveLogin(url);
					}else{
						document.location.href = '/indexLogin?returnUrl=' + url;
					}
				},
				ncb: function () {
					return false;
				},
				ybt: '확인', // 기본값 "확인"
				nbt: '취소'  // 기본값 "취소"
			});
		}else{
			cartGoods.directOrder(cartId,goodsId, itemNo, pakGoodsId,mkiGoodsYn, mkiGoodsOptContent, isMiniCart, directGoodsNm, directGoodsOptNm);
		}
	}
	
</script>
<li>
	<div class="untcart " id="untcart${ owni.cart_code }">
	<input type="hidden" name="salePrc" value="8400">
	<input type="hidden" name="prmtDcAmt" value="0">
	<input type="hidden" name="salePsbCd" value="00">
	<input type="hidden" name="selMbrCpNo" value="">
	<input type="hidden" name="totCpDcAmt" value="0">
	<input type="hidden" name="cpDcAmt" value="0">
	<input type="hidden" name="dlvrcPlcNo" value="1">
	<input type="hidden" name="compGbCd" value="10">
	<input type="hidden" name="goodsId" value="${ owni.item_code }">
	<input type="hidden" name="itemNo" value="385497">
	<input type="hidden" name="pakGoodsId" value="">
	<input type="hidden" name="freeDlvrYn" value="N">
	
	
	<label class="checkbox">
		<input type="checkbox" id="chkCartId${ owni.cart_code }" name="cartIds" value="${ owni.cart_code }" checked="checked">
		<span class="txt"></span>
	</label>
	<button type="button" class="bt del" onclick="cartGoods.del('${ owni.cart_code }', )" data-content="${ owni.cart_code }" data-url="https://aboutpet.co.kr/order/deleteCart">삭제</button>
	<div class="box">
		<div class="tops">
			<a href="itemDetail.do?item_code=${ owni.item_code }" class="pic" data-content="${ owni.item_code }" data-url="itemDetail.do?item_code=${ owni.item_code }">
				<img src="${ owni.item_img }" alt="${ owni.item_name }" class="img">
				</a>
			<div class="name">
				<a href="itemDetail.do?item_code=${ owni.item_code }" class="tit" data-content="${ owni.item_code }" data-url="itemDetail.do?item_code=${ owni.item_code }">${ owni.item_name }</a>
				</div>
		</div>
		
		<c:if test="${ owni.opt_name ne null }">
			<!-- 옵션있는거랑 없는거(null) cif 구분,.. -->
			<ul class="opts">
			<li class="opt">
					<!-- 묶음상품 옵션 명  -->
					<em class="tt">옵션</em>
					<span class="dt">${ owni.opt_name }</span>
				</li>
			</ul>
		</c:if>
		
		<div class="amount">
			<span class="uispined st load" data-max="39" data-min="">
						<input type="number" class="amt" id="buyQty${ owni.cart_code }" name="buyQty" value="${ owni.cart_cnt }" data-cart-id="${ owni.cart_code }" data-min-ord-qty="" data-max-ord-qty="39" autofocus="autofocus" title="수량입력">
					<div class="bx sel">	<select class="val slt" title="수량선택"><option type="button" value="1">1</option><option type="button" value="2">2</option><option type="button" value="3">3</option><option type="button" value="4">4</option><option type="button" value="5">5</option><option type="button" value="6">6</option><option type="button" value="7">7</option><option type="button" value="8">8</option><option type="button" value="9">9</option><option type="button" value="10">+10</option></select></div><div class="bx num">	<button type="button" class="bt mod">변경</button></div></span>
				<div class="prcs">
				<em class="st" style="display:none">쿠폰적용가</em>
				<span class="prc"><em class="p"><fmt:formatNumber value="${ owni.item_price }"/></em><i class="w">원</i></span>
			</div>
			<div class="free">
							<fmt:formatNumber value="${ owni.item_fee }"/>원 (<fmt:formatNumber value="${ owni.free_fee }"/>원 이상 무료배송)
									</div>
					</div>
		<div class="btns">
			<a href="javascript:;" class="btn sm a buy" onclick="directOrderFunc('${ owni.cart_code }','${ owni.item_code }', '385497', '', 'N', '', '', '${ owni.item_name }', '','true'
					);" data-content="${ owni.cart_code }" data-url="https://aboutpet.co.kr/order/indexOrderPayment">바로구매</a>
				</div>
	</div>
	</div>
</li>
</c:forEach>
</ui>

<!-- 합계금액 요약 -->
						
						<div class="totset">
							<div class="ptt">
								<em class="p" id="compTotalGoodsAmt912"><fmt:formatNumber value="${ ownDto.total_price }"/></em><i class="w">원</i>
								<i class="e">+</i>
								<b class="t">배송비</b><em class="p" id="compTotalDlvrAmt912"><fmt:formatNumber value="${ ownDto.total_fee }"/></em><i class="w">원</i>
								<i class="e q">=</i>
								<em class="prc"><em class="p" id="compTotalAmt912"><fmt:formatNumber value="${ ownDto.total_price + ownDto.total_fee }"/></em><i class="w">원</i></em>
							</div>
							<div class="gud">장바구니에 담은 상품의 합계금액 입니다.</div>
						</div>
						
<!-- 무료배송 채우지 못하면 추천상품.... -->
	<c:if test="${ ownDto.total_fee ne 0 }">
						<div class="recoms" style="display: none;">
								<div class="hdts">
									<span class="tit">🚚<em class="p"><fmt:formatNumber value="${ ownDto.free_fee - ownDto.total_price }"/></em><i class="w">원 이상</i>추가하면 무료배송!</span>
									<span class="txt">지금 함께 구매하면 무료로 배송해드려요.</span>
								</div>
								<div class="cdts">
									<div class="ui_cartrcm_slide"><script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>

<div class="swiper-container slide">
	<ul class="swiper-wrapper list">
		</ul>
</div>
<div class="sld-nav">
	<button type="button" class="bt prev">이전</button>
	<button type="button" class="bt next">다음</button>
</div></div>
								</div>
							</div>
		</c:if>
						</section>
</c:forEach>
</c:if>
						
						<!-- 업체 -->
						<c:if test="${ not empty cpnList }">
						<section class="sect etc">
							<div class="hdd">
								<div class="dt t02"><span class="t">업체 배송 상품</span></div>
							</div>
						<!-- 업체반복안에 물건반복 할거임 -->
						<!-- 업체 하나당 (store div, cartlist ui, totset div) 반복 -->
					<c:forEach items="${ cpnList }" var="cpnDto">
					
						<div class="store">
							<label class="checkbox"><input type="checkbox" id="chkCompNo875" value="875" data-comp-no="875" checked="checked"><span class="txt"><span class="t">위탁_${ cpnDto.cpn_name }</span></span></label>
						</div>
						<!-- 같은업체 여러상품은 ui 안에 반복, 상품 하나당 (script + li) - 스크립트는 아예 똑같음 -->
					<ui class="cartlist" id="cartList875" data-comp-no="875">
					
					<c:forEach items="${ cpnItem }" var="cpni">
						
					<script type="text/javascript">
	
	function directOrderFunc(cartId, goodsId, itemNo, pakGoodsId, mkiGoodsYn, mkiGoodsOptContent, isMiniCart, directGoodsNm, directGoodsOptNm ,isLogin){
		if(isLogin == 'false'){
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?', { // 컨펌 창 옵션들
				ycb: function () {
					var url = encodeURIComponent(document.location.href);
					console.log("url :"+url);
					if("false" == "true" && document.location.href.indexOf("/tv/series/indexTvDetail") > -1){
						fncAppCloseMoveLogin(url);
					}else{
						document.location.href = '/indexLogin?returnUrl=' + url;
					}
				},
				ncb: function () {
					return false;
				},
				ybt: '확인', // 기본값 "확인"
				nbt: '취소'  // 기본값 "취소"
			});
		}else{
			cartGoods.directOrder(cartId,goodsId, itemNo, pakGoodsId,mkiGoodsYn, mkiGoodsOptContent, isMiniCart, directGoodsNm, directGoodsOptNm);
		}
	}
	
</script>
<li>
<!-- 나중에 히든 value 값, 상품코드값들 수정 -->
	<div class="untcart " id="untcart${ cpni.cart_code }">
	<input type="hidden" name="salePrc" value="18900">
	<input type="hidden" name="prmtDcAmt" value="0">
	<input type="hidden" name="salePsbCd" value="00">
	<input type="hidden" name="selMbrCpNo" value="">
	<input type="hidden" name="totCpDcAmt" value="0">
	<input type="hidden" name="cpDcAmt" value="0">
	<input type="hidden" name="dlvrcPlcNo" value="978">
	<input type="hidden" name="compGbCd" value="20">
	<input type="hidden" name="goodsId" value="${ cpni.item_code }">
	<input type="hidden" name="itemNo" value="387153">
	<input type="hidden" name="pakGoodsId" value="">
	<input type="hidden" name="freeDlvrYn" value="N">
	
	
	<label class="checkbox">
		<input type="checkbox" id="chkCartId${ cpni.cart_code }" name="cartIds" value="${ cpni.cart_code }" checked="checked">
		<span class="txt"></span>
	</label>
	<button type="button" class="bt del" onclick="cartGoods.del('${ cpni.cart_code }', )" data-content="${ cpni.cart_code }" data-url="https://aboutpet.co.kr/order/deleteCart">삭제</button>
	
	<!-- 이 부분이 데이터로 수정 필요 -->
	<div class="box">
		<div class="tops">
			<a href="itemDetail.do?item_code=${ cpni.item_code }" class="pic" data-content="${ cpni.item_code }" data-url="itemDetail.do?item_code=${ cpni.item_code }">
				<img src="${ cpni.item_img }" alt="${ cpni.item_name } " class="img">
				</a>
			<div class="name">
				<a href="itemDetail.do?item_code=${ cpni.item_code } class="tit" data-content="${ cpni.item_code }" data-url="itemDetail.do?item_code=${ cpni.item_code }">${ cpni.item_name }</a>
				</div>
		</div>
		
		<c:if test="${ cpni.opt_name ne null }">
			<!-- 옵션있는거랑 없는거(null) cif 구분,.. -->
			<ul class="opts">
			<li class="opt">
					<!-- 묶음상품 옵션 명  -->
					<em class="tt">옵션</em>
					<span class="dt">${ cpni.opt_name }</span>
				</li>
			</ul>
		</c:if>
		
		<div class="amount">
			<span class="uispined st load" data-max="999" data-min="1">
						<input type="number" class="amt" id="buyQty${ cpni.cart_code }" name="buyQty" value="${ cpni.cart_cnt }" data-cart-id="${ cpni.cart_code }" data-min-ord-qty="1" data-max-ord-qty="999" autofocus="autofocus" title="수량입력">
					<div class="bx sel">	<select class="val slt" title="수량선택"><option type="button" value="1">1</option><option type="button" value="2">2</option><option type="button" value="3">3</option><option type="button" value="4">4</option><option type="button" value="5">5</option><option type="button" value="6">6</option><option type="button" value="7">7</option><option type="button" value="8">8</option><option type="button" value="9">9</option><option type="button" value="10">+10</option></select></div><div class="bx num">	<button type="button" class="bt mod">변경</button></div></span>
				<div class="prcs">
				<em class="st" style="display:none">쿠폰적용가</em>
				<span class="prc"><em class="p"><fmt:formatNumber value="${ cpni.item_price }"/></em><i class="w">원</i></span>
			</div>
			<div class="free">				
				<c:if test="${ cpni.item_fee ne 0 }"><fmt:formatNumber value="${ cpni.item_fee }"/>원 (<fmt:formatNumber value="${ cpni.free_fee }"/>원 이상 무료배송)</c:if>
				<c:if test="${ cpni.item_fee eq 0 }">무료 배송</c:if>
									</div>
					</div>
		<div class="btns">
			<a href="javascript:;" class="btn sm a buy" onclick="directOrderFunc('${ cpni.cart_code }','${ cpni.item_code }', '387153', '', 'N', '', '', '${ cpni.item_name }', '','true'
					);" data-content="${ cpni.cart_code }" data-url="https://aboutpet.co.kr/order/indexOrderPayment">바로구매</a>
				</div>
		</div>
		</div>
	</li>
</c:forEach>
</ui>
						<!-- 상품가격 배송비 합계금액 -->
						<div class="totset">
							<div class="ptt">
								<em class="p" id="compTotalGoodsAmt875"><fmt:formatNumber value="${ cpnDto.total_price }"/></em><i class="w">원</i>
								<i class="e">+</i>
								<b class="t">배송비</b><em class="p" id="compTotalDlvrAmt875">
									<fmt:formatNumber value="${ cpnDto.total_fee }"/>
								</em><i class="w">원</i>
								<i class="e q">=</i>
								<em class="prc"><em class="p" id="compTotalAmt875"><fmt:formatNumber value="${ cpnDto.total_price + cpnDto.total_fee }"/></em><i class="w">원</i></em>
							</div>
							<div class="gud">장바구니에 담은 상품의 합계금액 입니다.</div>
						</div>
					</c:forEach>
						</section>
</c:if>
						</c:when>
						
						
						
						<c:when test="${ latestType eq '업체' }">
						<c:if test="${ not empty cpnList }">
											<section class="sect etc">
							<div class="hdd">
								<div class="dt t02"><span class="t">업체 배송 상품</span></div>
							</div>
						<!-- 업체반복안에 물건반복 할거임 -->
						<!-- 업체 하나당 (store div, cartlist ui, totset div) 반복 -->
					<c:forEach items="${ cpnList }" var="cpnDto">
					
						<div class="store">
							<label class="checkbox"><input type="checkbox" id="chkCompNo875" value="875" data-comp-no="875" checked="checked"><span class="txt"><span class="t">위탁_${ cpnDto.cpn_name }</span></span></label>
						</div>
						<!-- 같은업체 여러상품은 ui 안에 반복, 상품 하나당 (script + li) - 스크립트는 아예 똑같음 -->
					<ui class="cartlist" id="cartList875" data-comp-no="875">
					
					<c:forEach items="${ cpnItem }" var="cpni">
						
					<script type="text/javascript">
	
	function directOrderFunc(cartId, goodsId, itemNo, pakGoodsId, mkiGoodsYn, mkiGoodsOptContent, isMiniCart, directGoodsNm, directGoodsOptNm ,isLogin){
		if(isLogin == 'false'){
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?', { // 컨펌 창 옵션들
				ycb: function () {
					var url = encodeURIComponent(document.location.href);
					console.log("url :"+url);
					if("false" == "true" && document.location.href.indexOf("/tv/series/indexTvDetail") > -1){
						fncAppCloseMoveLogin(url);
					}else{
						document.location.href = '/indexLogin?returnUrl=' + url;
					}
				},
				ncb: function () {
					return false;
				},
				ybt: '확인', // 기본값 "확인"
				nbt: '취소'  // 기본값 "취소"
			});
		}else{
			cartGoods.directOrder(cartId,goodsId, itemNo, pakGoodsId,mkiGoodsYn, mkiGoodsOptContent, isMiniCart, directGoodsNm, directGoodsOptNm);
		}
	}
	
</script>
<li>
<!-- 나중에 히든 value 값, 상품코드값들 수정 -->
	<div class="untcart " id="untcart${ cpni.cart_code }">
	<input type="hidden" name="salePrc" value="18900">
	<input type="hidden" name="prmtDcAmt" value="0">
	<input type="hidden" name="salePsbCd" value="00">
	<input type="hidden" name="selMbrCpNo" value="">
	<input type="hidden" name="totCpDcAmt" value="0">
	<input type="hidden" name="cpDcAmt" value="0">
	<input type="hidden" name="dlvrcPlcNo" value="978">
	<input type="hidden" name="compGbCd" value="20">
	<input type="hidden" name="goodsId" value="${ cpni.item_code }">
	<input type="hidden" name="itemNo" value="387153">
	<input type="hidden" name="pakGoodsId" value="">
	<input type="hidden" name="freeDlvrYn" value="N">
	
	
	<label class="checkbox">
		<input type="checkbox" id="chkCartId${ cpni.cart_code }" name="cartIds" value="${ cpni.cart_code }" checked="checked">
		<span class="txt"></span>
	</label>
	<button type="button" class="bt del" onclick="cartGoods.del('${ cpni.cart_code }', )" data-content="${ cpni.cart_code }" data-url="https://aboutpet.co.kr/order/deleteCart">삭제</button>
	
	<!-- 이 부분이 데이터로 수정 필요 -->
	<div class="box">
		<div class="tops">
			<a href="itemDetail.do?item_code=${ cpni.item_code }" class="pic" data-content="${ cpni.item_code }" data-url="itemDetail.do?item_code=${ cpni.item_code }">
				<img src="${ cpni.item_img }" alt="${ cpni.item_name } " class="img">
				</a>
			<div class="name">
				<a href="itemDetail.do?item_code=${ cpni.item_code }" class="tit" data-content="${ cpni.item_code }" data-url="itemDetail.do?item_code=${ cpni.item_code }">${ cpni.item_name }</a>
				</div>
		</div>
		
		<c:if test="${ cpni.opt_name ne null }">
			<!-- 옵션있는거랑 없는거(null) cif 구분,.. -->
			<ul class="opts">
			<li class="opt">
					<!-- 묶음상품 옵션 명  -->
					<em class="tt">옵션</em>
					<span class="dt">${ cpni.opt_name }</span>
				</li>
			</ul>
		</c:if>
		
		<div class="amount">
			<span class="uispined st load" data-max="999" data-min="1">
						<input type="number" class="amt" id="buyQty${ cpni.cart_code }" name="buyQty" value="${ cpni.cart_cnt }" data-cart-id="${ cpni.cart_code }" data-min-ord-qty="1" data-max-ord-qty="999" autofocus="autofocus" title="수량입력">
					<div class="bx sel">	<select class="val slt" title="수량선택"><option type="button" value="1">1</option><option type="button" value="2">2</option><option type="button" value="3">3</option><option type="button" value="4">4</option><option type="button" value="5">5</option><option type="button" value="6">6</option><option type="button" value="7">7</option><option type="button" value="8">8</option><option type="button" value="9">9</option><option type="button" value="10">+10</option></select></div><div class="bx num">	<button type="button" class="bt mod">변경</button></div></span>
				<div class="prcs">
				<em class="st" style="display:none">쿠폰적용가</em>
				<span class="prc"><em class="p"><fmt:formatNumber value="${ cpni.item_price }"/></em><i class="w">원</i></span>
			</div>
			<div class="free">				
				<c:if test="${ cpni.item_fee ne 0 }"><fmt:formatNumber value="${ cpni.item_fee }"/>원 (<fmt:formatNumber value="${ cpni.free_fee }"/>원 이상 무료배송)</c:if>
				<c:if test="${ cpni.item_fee eq 0 }">무료 배송</c:if>
									</div>
					</div>
		<div class="btns">
			<a href="javascript:;" class="btn sm a buy" onclick="directOrderFunc('${ cpni.cart_code }','${ cpni.item_code }', '387153', '', 'N', '', '', '${ cpni.item_name }', '','true'
					);" data-content="${ cpni.cart_code }" data-url="https://aboutpet.co.kr/order/indexOrderPayment">바로구매</a>
				</div>
		</div>
		</div>
	</li>
</c:forEach>
</ui>
						<!-- 상품가격 배송비 합계금액 -->
						<div class="totset">
							<div class="ptt">
								<em class="p" id="compTotalGoodsAmt875"><fmt:formatNumber value="${ cpnDto.total_price }"/></em><i class="w">원</i>
								<i class="e">+</i>
								<b class="t">배송비</b><em class="p" id="compTotalDlvrAmt875">
									<fmt:formatNumber value="${ cpnDto.total_fee }"/>
								</em><i class="w">원</i>
								<i class="e q">=</i>
								<em class="prc"><em class="p" id="compTotalAmt875"><fmt:formatNumber value="${ cpnDto.total_price + cpnDto.total_fee }"/></em><i class="w">원</i></em>
							</div>
							<div class="gud">장바구니에 담은 상품의 합계금액 입니다.</div>
						</div>
					</c:forEach>
						</section>
</c:if>

						
						
						
						
<!-- 반복구간......
	<div class="untcart " id="untcart933908162839322509">
	<input type="hidden" name="salePrc" value="27000">
	<input type="hidden" name="prmtDcAmt" value="0">
	<input type="hidden" name="salePsbCd" value="00">
	<input type="hidden" name="selMbrCpNo" value="">
	<input type="hidden" name="totCpDcAmt" value="0">
	<input type="hidden" name="cpDcAmt" value="0">
	<input type="hidden" name="dlvrcPlcNo" value="1032">
	<input type="hidden" name="compGbCd" value="20">
	<input type="hidden" name="goodsId" value="GI251018762">
	<input type="hidden" name="itemNo" value="381463">
	<input type="hidden" name="pakGoodsId" value="GP251019289">
	<input type="hidden" name="freeDlvrYn" value="N">
	
반복구간...... -->


						
<!-- 어바웃펫 배송 상품 -->			
					<!-- 자사 -->
			<c:if test="${ not empty ownList }">
			<c:forEach items="${ ownList }" var="ownDto">
					<section class="sect abt">
							<div class="frstat">
								<label class="checkbox"><input type="checkbox" id="chkCompNo912" value="912" checked="checked"><span class="txt"><span class="dt"><span class="t">어바웃펫 배송 상품</span></span></span></label>
								<div class="box">
									<div class="gage">
										<div class="inf">
											<input type="hidden" id="apetDlvrcBuyPrc" value="30000">
											<em class="pp" id="noneDlvrBar" style="display: none;">👀 <b class="p"><fmt:formatNumber value="${ ownDto.free_fee }"/></b><i class="w">원</i></em> <span class="tt" style="display: none;">이상 무료배송</span>
											<c:if test="${ ownDto.total_fee eq 0 }"><em class="pp" id="fullDlvrBar" >🚚 <b class="p">무료배송</b></em></c:if>
											<c:if test="${ ownDto.total_fee ne 0 }">
											<em class="pp" id="addDlvrBar" >💸 <b class="p">
												<!-- fmt.. -->
												<fmt:formatNumber value="${ ownDto.free_fee - ownDto.total_price }"/>
											</b><i class="w">원 이상</i></em> <span class="tt" style="">추가하면 무료배송!</span>
											</c:if>
											
											
											<span class="prc"><em class="p"><fmt:formatNumber value="${ ownDto.free_fee }"/></em><i class="w">원</i></span>
										</div>
										<div class="bar">
											<em class="b" id="apetBar" style="width: ${ ownDto.total_price/ownDto.free_fee * 100 }%;"></em>
										</div>
									</div>
								</div>
							</div>
					<!-- 업체 -->
					<ui class="cartlist" id="cartList912" data-comp-no="912">
					
					<c:forEach items="${ ownItem }" var="owni">
					<script type="text/javascript">
	
	function directOrderFunc(cartId, goodsId, itemNo, pakGoodsId, mkiGoodsYn, mkiGoodsOptContent, isMiniCart, directGoodsNm, directGoodsOptNm ,isLogin){
		if(isLogin == 'false'){
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?', { // 컨펌 창 옵션들
				ycb: function () {
					var url = encodeURIComponent(document.location.href);
					console.log("url :"+url);
					if("false" == "true" && document.location.href.indexOf("/tv/series/indexTvDetail") > -1){
						fncAppCloseMoveLogin(url);
					}else{
						document.location.href = '/indexLogin?returnUrl=' + url;
					}
				},
				ncb: function () {
					return false;
				},
				ybt: '확인', // 기본값 "확인"
				nbt: '취소'  // 기본값 "취소"
			});
		}else{
			cartGoods.directOrder(cartId,goodsId, itemNo, pakGoodsId,mkiGoodsYn, mkiGoodsOptContent, isMiniCart, directGoodsNm, directGoodsOptNm);
		}
	}
	
</script>
<li>
	<div class="untcart " id="untcart${ owni.cart_code }">
	<input type="hidden" name="salePrc" value="8400">
	<input type="hidden" name="prmtDcAmt" value="0">
	<input type="hidden" name="salePsbCd" value="00">
	<input type="hidden" name="selMbrCpNo" value="">
	<input type="hidden" name="totCpDcAmt" value="0">
	<input type="hidden" name="cpDcAmt" value="0">
	<input type="hidden" name="dlvrcPlcNo" value="1">
	<input type="hidden" name="compGbCd" value="10">
	<input type="hidden" name="goodsId" value="${ owni.item_code }">
	<input type="hidden" name="itemNo" value="385497">
	<input type="hidden" name="pakGoodsId" value="">
	<input type="hidden" name="freeDlvrYn" value="N">
	
	
	<label class="checkbox">
		<input type="checkbox" id="chkCartId${ owni.cart_code }" name="cartIds" value="${ owni.cart_code }" checked="checked">
		<span class="txt"></span>
	</label>
	<button type="button" class="bt del" onclick="cartGoods.del('${ owni.cart_code }', )" data-content="${ owni.cart_code }" data-url="https://aboutpet.co.kr/order/deleteCart">삭제</button>
	<div class="box">
		<div class="tops">
			<a href="itemDetail.do?item_code=${ owni.item_code }" class="pic" data-content="${ owni.item_code }" data-url="itemDetail.do?item_code=${ owni.item_code }">
				<img src="${ owni.item_img }" alt="${ owni.item_name }" class="img">
				</a>
			<div class="name">
				<a href="itemDetail.do?item_code=${ owni.item_code }" class="tit" data-content="${ owni.item_code }" data-url="itemDetail.do?item_code=${ owni.item_code }">${ owni.item_name }</a>
				</div>
		</div>
		
		<c:if test="${ owni.opt_name ne null }">
			<!-- 옵션있는거랑 없는거(null) cif 구분,.. -->
			<ul class="opts">
			<li class="opt">
					<!-- 묶음상품 옵션 명  -->
					<em class="tt">옵션</em>
					<span class="dt">${ owni.opt_name }</span>
				</li>
			</ul>
		</c:if>
		
		<div class="amount">
			<span class="uispined st load" data-max="39" data-min="">
						<input type="number" class="amt" id="buyQty${ owni.cart_code }" name="buyQty" value="${ owni.cart_cnt }" data-cart-id="${ owni.cart_code }" data-min-ord-qty="" data-max-ord-qty="39" autofocus="autofocus" title="수량입력">
					<div class="bx sel">	<select class="val slt" title="수량선택"><option type="button" value="1">1</option><option type="button" value="2">2</option><option type="button" value="3">3</option><option type="button" value="4">4</option><option type="button" value="5">5</option><option type="button" value="6">6</option><option type="button" value="7">7</option><option type="button" value="8">8</option><option type="button" value="9">9</option><option type="button" value="10">+10</option></select></div><div class="bx num">	<button type="button" class="bt mod">변경</button></div></span>
				<div class="prcs">
				<em class="st" style="display:none">쿠폰적용가</em>
				<span class="prc"><em class="p"><fmt:formatNumber value="${ owni.item_price }"/></em><i class="w">원</i></span>
			</div>
			<div class="free">
							<fmt:formatNumber value="${ owni.item_fee }"/>원 (<fmt:formatNumber value="${ owni.free_fee }"/>원 이상 무료배송)
									</div>
					</div>
		<div class="btns">
			<a href="javascript:;" class="btn sm a buy" onclick="directOrderFunc('${ owni.cart_code }','${ owni.item_code }', '385497', '', 'N', '', '', '${ owni.item_name }', '','true'
					);" data-content="${ owni.cart_code }" data-url="https://aboutpet.co.kr/order/indexOrderPayment">바로구매</a>
				</div>
	</div>
	</div>
</li>
</c:forEach>
</ui>

<!-- 합계금액 요약 -->
						
						<div class="totset">
							<div class="ptt">
								<em class="p" id="compTotalGoodsAmt912"><fmt:formatNumber value="${ ownDto.total_price }"/></em><i class="w">원</i>
								<i class="e">+</i>
								<b class="t">배송비</b><em class="p" id="compTotalDlvrAmt912"><fmt:formatNumber value="${ ownDto.total_fee }"/></em><i class="w">원</i>
								<i class="e q">=</i>
								<em class="prc"><em class="p" id="compTotalAmt912"><fmt:formatNumber value="${ ownDto.total_price + ownDto.total_fee }"/></em><i class="w">원</i></em>
							</div>
							<div class="gud">장바구니에 담은 상품의 합계금액 입니다.</div>
						</div>
						
<!-- 무료배송 채우지 못하면 추천상품.... -->
	<c:if test="${ ownDto.total_fee ne 0 }">
						<div class="recoms" style="display: none;">
								<div class="hdts">
									<span class="tit">🚚<em class="p"><fmt:formatNumber value="${ ownDto.free_fee - ownDto.total_price }"/></em><i class="w">원 이상</i>추가하면 무료배송!</span>
									<span class="txt">지금 함께 구매하면 무료로 배송해드려요.</span>
								</div>
								<div class="cdts">
									<div class="ui_cartrcm_slide"><script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>

<div class="swiper-container slide">
	<ul class="swiper-wrapper list">
		</ul>
</div>
<div class="sld-nav">
	<button type="button" class="bt prev">이전</button>
	<button type="button" class="bt next">다음</button>
</div></div>
								</div>
							</div>
		</c:if>
						</section>
</c:forEach>
</c:if>
<!-- 왼쪽끝 -->
						</c:when>
					</c:choose>




<!-- 최종결제금액............ -->
					<input type="hidden" name="dlvrcPlcAmt" data-dlvrc-plc-no="978" data-comp-no="875" id="dlvrcPlcAmt978" value="5000">
				<input type="hidden" name="dlvrcPlcChkAmt" data-dlvrc-plc-no="978" data-comp-no="875" id="dlvrcPlcChkAmt978" value="5000">
				<input type="hidden" name="dlvrcPlcAmt" data-dlvrc-plc-no="1032" data-comp-no="733" id="dlvrcPlcAmt1032" value="0">
				<input type="hidden" name="dlvrcPlcChkAmt" data-dlvrc-plc-no="1032" data-comp-no="733" id="dlvrcPlcChkAmt1032" value="0">
				<input type="hidden" name="dlvrcPlcAmt" data-dlvrc-plc-no="1" data-comp-no="912" id="dlvrcPlcAmt1" value="2500">
				<input type="hidden" name="dlvrcPlcChkAmt" data-dlvrc-plc-no="1" data-comp-no="912" id="dlvrcPlcChkAmt1" value="2500">
				<div class="cartOrdr">
					<div class="ctinr">
						<div class="odbox">
							<div class="hdt"><span class="tit">결제 금액</span></div>
							<ul class="prcset">
								<li>
									<div class="dt">상품금액</div>
									<div class="dd">
										<span class="prc"><em class="p" id="totalChkGoodsAmt"><fmt:formatNumber value="${ allPr }"/></em><i class="w">원</i></span>
									</div>
								</li>
								<!-- <li>
									<div class="dt">할인금액</div>
									<div class="dd">
										<span class="prc dis"><em class="p" id="totalChkDcAmt">-0</em><i class="w">원</i></span>
									</div>
								</li> -->
								<li>
									<div class="dt">배송비</div>
									<div class="dd">
										<span class="prc"><em class="p" id="totalChkDlvrAmt"><fmt:formatNumber value="${ allFee }"/></em><i class="w">원</i></span>
									</div>
								</li>
							</ul>
							<div class="tot">
								<div class="dt">최종 결제금액</div>
								<div class="dd">
									<span class="prc"><em class="p" id="totalChkAmt"><fmt:formatNumber value="${ allPr + allFee }"/></em><i class="w">원</i></span>
								</div>
							</div>
						</div>
						<div class="btntot">
							<div class="inr">
								<a href="#" class="btn lg a btnOrder" onclick="order.select();" data-content="" data-url="https://aboutpet.co.kr/order/indexOrderPayment">
									<em class="p">총</em> <i class="i" id="goodsOrdCntText">${ allCnt }</i><em class="s">개</em>
									<em class="prc"><i class="i" id="totalChkAmtText"><fmt:formatNumber value="${ allPr + allFee }"/></i><i class="s">원</i></em>
									<em class="p" id="orderBtnText">주문하기</em>
								</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>


		</div>
		</c:if>
		</form></div>
		</div>
	</main><!-- location 영역 포함  -->			
		<!-- e : 본문영역 -->
				
		<!-- s : layerPop 영역 -->
		<article class="popLayer a popCoupon" id="popCoupon">
	</article><!-- e : layerPop 영역 -->
		
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
		<li id="liTag_20" class="tv ">
					<a href="#" onclick="location.href='tv_main.do'" class="bt"><span>TV</span></a>
				</li>
				<li id="liTag_30" class="log ">
					<a href="#" onclick="location.href='log.do'" class="bt"><span>로그</span></a>
				</li>
				<li id="liTag_10" class="shop ">
					<a href="#" onclick="location.href='shop_home.do'" class="bt"><span>샵</span></a>
				</li>
				<li id="liTag_00" class="my ">
					<a href="#" onclick="location.href='myPage.do'" class="bt"><span>MY</span></a>
				</li>
			</ul>
	</div>
</nav><!-- e : menubar 영역 -->


<jsp:include page="footer.jsp" flush="false"/>

<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","294635025485174");fbq("track","PageView");</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=294635025485174&amp;ev=PageView&amp;noscript=1"></noscript>
<script type="text/javascript" id="" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script> 
<script type="text/javascript" id="" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript" id="">kakaoPixel("1040077214249338373").pageView();</script> 
<script type="text/javascript" id="">if(!wcs_add)var wcs_add={};wcs_add.wa="s_1427fe4473b3";if(!_nasa)var _nasa={};window.wcs&&(wcs.inflow(),wcs_do(_nasa));</script>
</body></html>