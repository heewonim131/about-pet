<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
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
		
<!-- sidebar -->
<jsp:include page="sidebar.jsp" flush="false"/>


<!DOCTYPE html>
<html>

<head>
<title>aboutPet</title>
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
<meta property="og:image" content="/_images/common/aboutpet_logo@2x.png">
<meta property="og:image:url" content="/_images/common/aboutpet_logo@2x.png">
<meta property="og:image:type" content="image/jpeg">
<meta property="og:image:width" content="300">
<meta property="og:image:height" content="300">

<link href="https://aboutpet.co.kr//_images/common/favicon.ico" rel="shrtcut icon">
<link href="https://aboutpet.co.kr//_images/common/favicon.png" rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css">
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&amp;libraries=services"></script><script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/main/4.3.6/kakao.js"></script><script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
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
    const ybt = "확인";
    const nbt = "취소";
    const message = "undefined Message";

    const messager = {
        alert : function(option){
            // 알럿창 띄우기
            const defaultAlertOption = {
                    ycb : function(){}
                ,	ybt : ybt
            };
            let alertMsg = option.txt ? option.txt : message;
            let alertConfig = $.extend(defaultAlertOption,option);
            ui.alert("<div id='alertContentDiv'>"+alertMsg+"</div>",{
                    ycb:function(){
                        alertConfig.ycb();
                        $(".popAlert").remove();
                    }
                ,   ybt:alertConfig.ybt
            });
        }
        ,	confirm : function(option){
                const defaultConfirmOption = {
                        ycb : function(){console.log("confirm-ok Callback");}
                    ,	ncb : function(){console.log("confirm-cancle Callback");}
                    ,	ybt : ybt
                    ,	nbt : nbt
                };
                let confirmMsg = option.txt ? option.txt : message;
                let confirmConfig = $.extend(defaultConfirmOption,option);
                ui.confirm(confirmMsg,{ // 컨펌 창 띄우기
                    ycb:confirmConfig.ycb,
                    ncb:confirmConfig.ncb,
                    ybt:confirmConfig.ybt,
                    nbt:confirmConfig.nbt
                });
        }
        , toast : function(option){	//toast 띄우기
        	ui.toast(option.txt,{
        		cls : 'abcd' , 
        		bot: option.bot ? option.bot : 74, //바닥에서 띄울 간격
        		sec:  option.sec ? option.sec : 3000 //사라지는 시간
        	})
        }
    };

    /*
     * 우편번호 팝업
     */

    //디폴트 콜백
    var defaultCbPostOption = {
        callBack : function(data){
            console.log(data);
        }
    }

    //콜백함수 set
    function setCbPostPopCallBack(callBack){
    	if(callBack != undefined){
    		defaultCbPostOption.callBack = callBack;
    	}	
    }
    
    //우편번호 콜백
    function cbPostPop(data){
    	defaultCbPostOption.callBack(data);
    }

    //레이어 팝업
    function layerPop(config){
        var option = {
                url : config.url
            ,   data : config.data != undefined ? config.data : {}
            ,   type : "GET"
            ,   dataType : "HTML"
            ,   done : function(html){
                    var alertConfg = {
                            txt : html
                    };
                    if(config.callBack != undefined){
                        alertConfg.ycb = config.callBack;
                    }
                    if(config.btnTxt != undefined){
                        alertConfg.ybt = config.btnTxt;
                    }
                    messager.alert(alertConfg);
            }
        };
        ajax.call(option);
    }
    
    
    //관심태그 정보 변경 시 액션로그 api호출 - 호출 예 : fncTagInfoLogApi({ url:"/join/indexTag", targetUrl:"/join/indexResult",callback:console.log(data) });
    function fncTagInfoLogApi(config){
 				
    	var option = {
                 url : "/commonTagAction"
               , type : "GET"
               , data : {
            	   	url : config.url,
            	   	targetUrl : config.targetUrl
            	 } 
               , done : function(data){
                     if(config.callback){
                         config.callback();
                     }else{
                         console.debug(data);
                     }
               }
		}; 
    	ajax.call(option);		
				
	}

    /*
     * SNS 로그인 ( 네이버, 카카오, 구글, 애플)
     */
    function snsLogin(snsLnkCd) {
    	 if('PC' == 'APP' &&  !(snsLnkCd == 40 && 'DEVICE_TYPE' == '10')  ){
            toNativeData.func = "onSnsLogin";
            if(snsLnkCd == 10) toNativeData.loginType ="N" //N : 네이버, K : 카카오톡, G :구글, A:애플
            else if(snsLnkCd == 20) toNativeData.loginType ="K"
            else if(snsLnkCd == 30) toNativeData.loginType ="G"
            else if(snsLnkCd == 40) toNativeData.loginType ="A"
            toNative(toNativeData);
        }else{
            var url = "";
            var options = {
                url : "/snsLogin",
                type:  'POST',
                data : {
                	snsLnkCd : snsLnkCd,
                    deviceTpCd  :$("#deviceTpCd").val(),
                    deviceToken : $("#appPushToken").val()
                },
                done : function(data){
                	
                	//로그인 app interface 호출 
					if('PC' == 'APP'){
						toNativeData.func = 'onLogin';
						toNative(toNativeData);
					}
                	
                    window.location.href = data.goUrl;
                    return;
                }
            };
            ajax.call(options);
        }
    }

    //입력 제한 유효성
    function validateTxtLength(selector,maxLength){
        var id = selector.id;
        var txt = $(selector).val();
        var errorId = "error-"+id;
        var length = txt.length;
        if(length>maxLength){
            var msg = maxLength + "자 이내로 입력해주세요.";
            var html ="<p class='validation-check' id='"+errorId+"'>"+msg + "</p>";
            if($("#"+errorId).length == -0){
                $(selector).parent().after(html);
            }
        }else{
            $("#"+errorId).remove();
        }

        $(selector).val(txt.substring(0,maxLength));
    }

    // 초점 벗어날 때 유효성 검사
    var validWhenBlur = {
               loginId : function(target,callBack1, callBack2){
                   $.ajax({
                       url : "/common/check-id"
                       ,   type : "POST"
                       ,   data : {loginId : target}
                       ,   dataType : "JSON"
                   }).done(function(result){
                       if(parseInt(result)){
                           if(callBack1){
                        	   callBack1();
                           }else{
                               console.debug("undefined callBack");
                           }
                       }else{
                           if(callBack2){
                               callBack2();
                           }
                       }
                   });
                } 
            ,    nickNm : function(target,callBack){
                    $.ajax({
                        url : "/common/check-nickNm"
                        ,   type : "POST"
                        ,   data : {nickNm : target}
                        ,   dataType : "JSON"
                    }).done(function(result){
                            if(callBack){
                                callBack(result);
                            }else{
                                console.debug("undefined callBack");
                            }
                   });
            }
            ,   email : function(target,callBack){
                    $.ajax({
                            url : "/common/check-email"
                        ,   type : "POST"
                        ,   data : {email : target}
                        ,   dataType : "JSON"
                    }).done(function(result){
//                         if(parseInt(result)){
                            if(callBack){
                                callBack(result);
                            }else{
                                console.debug("undefined callBack");
                            }
//                         }
                    });
            }
            ,   rcomCd : function(target,callBack){
                    var data = {};
                    if(valid.email.test(target)){
                        data.rcomLoginId = target;
                    }else{
                        data.rcomCd = target;
                    }
                    $.ajax({
                        url : "/common/check-rcom"
                        ,   type : "POST"
                        ,   data : data
                        ,   dataType : "JSON"
                    }).done(function(result){
                        var r = parseInt(result);
                        if(r != 1){
                            if(callBack){
                                callBack();
                            }else{
                                console.debug("undefined callBack");
                            }
                        }
                    });
        },banWord : function(target,callBack){
			$.ajax({
				url : "/common/check-banWord"
				,type : "POST"
				,data : {
					loginId : target.loginId
					, nickNm : target.nickNm
				}
				,dataType : "JSON"
			}).done(function(result){
				if(callBack){
					callBack(result.returnCode);
				}else{
					console.debug("undefined callBack");
				}
			});
	}
    };

    //점유 인증 -> 현재 사용 X
    function fnOtpManageDetail(){
        return;
        var options = {
            url : "/common/opt"
            ,   type : "GET"
            ,	data : {mobile : $("#mobile").val() }
            ,   dataType : "HTML"
            ,   done : function(result){
                $("#mobile-li-default").hide();
                $("#mobile-li-cert").empty().append(result);
                $("#tm").bind("input chage paste",function(){
                    $("#tm").val($("#tm").val().replace(/\D/g,'').substring(0,11));
                });
                $("#ctfKey").bind("input chage paste",function(){
                    $("#ctfKey").val($("#ctfKey").val().replace(/\D/g,''));
                });
            }
        };
        //ajax.call(options);
    }
</script><script type="text/javascript">
    var termsList = null;
    var kRst = {};

    //디폴트 kcb 콜백
    var defaultOkCertOption = {
        callBack : function(data){
            kRst = data;
        }
    };

    // default 콜백 set kcb 콜백 SET
    function setOkCeretCallBack(callBack){
        if(callBack != undefined){
            defaultOkCertOption.callBack = callBack;
        }
    }

    //GSR 약관 동의 후, KCB 콜백 호출 전 , 유효성 검증
    function setGsInsertAndOkCertCallBack(callBack){
        defaultOkCertOption.callBack = function(data){
            var resultCode = data['RSLT_CD'];
            if(resultCode == "B000"){
                //기존에 인증한 값이 있는지 확인
                var options = {
                    url :"/mypage/info/ci-check"
                    ,	data : {ciCtfVal : data['CI'] , mbrNm : data['RSLT_NAME'] }
                    ,	done : function(result){
                            //유효성 통과시
                            if(result.resultCode == "S"){
                                var mbrNm = data['RSLT_NAME'];
                                var mobile = data['TEL_NO'];
                                var birth = data['RSLT_BIRTHDAY'];
                                var ciCtfVal = data['CI'];
                                var diCtfVal = data['DI'];
                                var mobileCd = data['TEL_COM_CD'];
                                var ntnGbCd = "10";
                                var gdGbCd = "20";

                                //본인 인증 후, 마케팅 수신여부 체크 -> 080
                                var mkngRcvYn = result.mkngRcvYn;

                                //내,외국인 확인
                                if(data.RSLT_NTV_FRNR_CD == "F"){
                                    ntnGbCd = "20";
                                }
                                //성별 확인
                                if(data.RSLT_SEX_CD == "M"){
                                    gdGbCd = "10";
                                }

                                //내 정보 관리
                                $("#mobile , [name='mobile']").val(mobile);
                                $("#mbrNm , [name='mbrNm']").val(mbrNm);
                                $("[name='ciCtfVal']").val(ciCtfVal);
                                $("[name='ntnGbCd']").val(ntnGbCd);

                                var newData = {
                                        ciCtfVal : ciCtfVal
                                    ,   diCtfVal : diCtfVal
                                    ,   ntnGbCd : ntnGbCd
                                    ,   mobileCd : mobileCd
                                    ,   gdGbCd : gdGbCd
                                    ,   birth : birth
                                    ,   mbrNm : mbrNm
                                    ,   mobile : mobile
                                    ,   mkngRcvYn : mkngRcvYn
                                };

                                var options = {
                                    url : "/gsr/updateGsrConnectInfo"
                                    ,   data : newData
                                    ,   done : function(result){
                                            var gsptNo = result.gsptNo;
                                            if($("#gsptNo").length > 0){
                                                $("#gsptNo").val(gsptNo);
                                            }
                                            newData.custNo = gsptNo;
                                            callBack(newData);
                                    }
                                };
                                waiting.start();
                                ajax.call(options);
                            }else{
                                var txt = result.resultMsg;
                                var config = {
                                        txt : txt
                                    ,	ybt : "확인"
                                };
                                if(result.resultCode == "MBR0017"){
                                    config.ycb = function(){
                                        window.location.href = "/logout?returnUrl=/indexLogin";
                                    };
                                }
                                ui.alert(config.txt,{
                                        ycb : config.ycb
                                    ,   ybt : "확인"
                                });
                            }
                    }
                };
                ajax.call(options);
            }else{
                if(resultCode != "B123"){
                    ui.alert("<div id='alertContentDiv'>본인인증에 실패했습니다.</div>");
                }
            }
        }
    }

    //CI 인증 후, kcb 콜백 처리
    function okCertCallback(result){
        var data = JSON.parse(result);
        defaultOkCertOption.callBack(data);
    }

    /*
    option = {
            ciCtfVal : 회원 CI 값 ( 사용 X )
        ,   callBack : 본인 인증 없이 콜백 함수 -> 2021.05.27 : GS 정상 연동 되어있을 떄
        ,   okCertCallBack : 인증 후 콜백 -> 20210.05.27 : GS 정상 연동 안되어있을 떄 ( KCB 값 누락 || gspt_no 없을 때 || gspt 상태 혹은 사용 여부 N 일 떄)
    }
    변경 이력 :
    -최초 개발 : 최초에 CI 값으로 구분 지어서 callBack 호출
    -2021.05.26 -> GS 연동 이슈로 인해 서버에서 값 가져온 후 GS 관련 컬럼 및 KCB 관련 컬럼으로 분기 처리
     */
    var gk = {
        open : function(config) {
            var options = {
                    url : "/mypage/info/gsr-check"
                ,   done : function(result){
                        //GS 연계 관리 컬럼 확인(GSPT_NO null 체크 , GS 연동 여부, GS 상태 코드)
                        var gsptNoIsNotNull = result.gsptNo != null && result.gsptNo != '';

                        //현재 회원 의 GS 가입 필수 값 누락 여부 확인
                        var mbrNmNotNull = result.mbrNm != null && result.mbrNm != '';
                        var mobileNotNull = result.mobile != null && result.mobile != '';
                        var mobileCdNotNull = result.mobileCd != null && result.mobileCd != '';
                        var gdGbCdNotNull = result.gdGbCd != null && result.gdGbCd != '';
                        var birthNotNull = result.birth != null && result.birth != '';

                        //GS 가입 시 필수 정보 누락 여부
                        var isGsRequiredParamIsNotNull = (mbrNmNotNull && mobileNotNull && mobileCdNotNull && gdGbCdNotNull && birthNotNull);

                        //위 회원 정보 5개 컬럼 중 NULL 있지만 CI 값이 있을 경우, 최초 KCB 인증 후 업데이트 시 누락된 건
                        var ciCtfValNotNull = result.ciCtfVal != null && result.ciCtfVal != '';
                        var isCtfYnY = result.ctfYn == "Y";

                        //GS 연동 처리 관리 컬럼
                        var gsptStatusOk = result.gsptUseYn == "Y" && result.gsptStateCd == "10";

                        //gsptStatusOk true일 시 가입 된 회원 이거나 , 가입 당시 CRM서버가 죽어 가입 처리가 안된 회원들(후자인 경우 백단에서 자동으로 가입 시키고 API 호출 )
                        var check = isGsRequiredParamIsNotNull && ciCtfValNotNull && gsptStatusOk;

                        //GS 가입 혹은 연동해제 되어 재연동 해야하는 경우
                        if(!check){
                            var isShowGsTerm = false;

                            //GS 연동 해제 메세지 -> 약관 미노출
                            var txt = "GS 포인트 연동이 해제되어 본인인증이 필요합니다.<br/> 진행하시겠습니까?";
                            var ybt = "확인";
                            var nbt = "다음에 하기";

                            //CI 값이 없으면 최초 가입 해야 하는 회원 : GS 가입 메세지 -> 약관 노출
                            if(!ciCtfValNotNull){
                                txt = "GS리테일멤버십 회원으로 가입 후 이용할 수 있어요<br/>지금 가입 할까요?";
                                nbt = "취소";
                                isShowGsTerm = true;
                            }

                            //GS 가입 혹은 연동 해제 팝업
                            ui.confirm(txt,{
                                // 가입,연동해제알림 확인' 버튼 클릭 시
                                ycb:function(){
                                    //약관 노출 -> 어바웃펫 최초 가입인 회원 -> GS 약관 동의 및 KCB 처리
                                    if(isShowGsTerm){
                                        var opt = {
                                            url : "/introduce/terms/indexGsPointTerms"
                                            ,   dataType : "html"
                                            ,   done : function(html){
                                                $("#layers").html(html);

                                                $("#termsAgreeBtn").bind("click",function(){
                                                    setGsInsertAndOkCertCallBack(config.okCertCallBack);

                                                    $("#gsrPointTermsCloseBtn").trigger("click");
                                                    okCertPopup("02","954216");
                                                });

                                                ui.popLayer.open("popGsPoint");
                                            }
                                        }
                                        ajax.call(opt);
                                    }
                                    //약관 미노출 -> 연동 해제 된 사람, KCB만 진행
                                    else{
                                        setGsInsertAndOkCertCallBack(config.okCertCallBack);
                                        okCertPopup("02","954216");
                                    }
                                }
                                //가입 시에는 취소, 연동해제알림 일 때는 다음에 하기 버튼 클릭 시
                                ,   ncb : function(){
                                        //가입하기 취소시
                                        if(isShowGsTerm){
                                            if(config.ncb && typeof(config.ncb) == 'function'){
                                                config.ncb();
                                            }
                                        }
                                        //연동 해제 알림 - 다음에 하기 버튼 클릭 시
                                        else{
                                            var options = {
                                                    url : "/mypage/info/gsr-next-time"
                                                ,   done : function(result){
                                                        if(config.ncb && typeof(config.ncb) == 'function'){
                                                            config.ncb();
                                                        }
                                                }
                                            };
                                            ajax.call(options);
                                        }
                                }
                                ,   ybt:ybt
                                ,   nbt:nbt
                            });
                        }
                        //GS 가입 혹은 연동해제 되어 재연동 X -> 이미 가입되어잇는 사람
                        else{
                            config.callBack();
                        }

                }
            };
            ajax.call(options);
        }
    };

    function openTermsSetting(termsCd, settingYn){
        var options = {
            url : "/introduce/terms/indexGsPointTermsContents"
            , data : {
                termsCd : termsCd
                , settingYn : settingYn
            }
            , dataType : "json"
            , done : function(data){
                termsList = data.termsList;
                getTerms(0);
                selectTermsSet();
                ui.popLayer.open("termsContentPop");
            }
        }
        ajax.call(options)
    }

    function getTerms(index) {
        var terms = termsList[index];
        $("#termsLayers #termsNm").html(terms.termsNm);
        $("#termsLayers #selectTermsNm").val(index).prop("selected", true);
        $("#termsLayers #termsContents").html(terms.content);
    }

    function selectTermsSet() {
        var selectHtml = [];

        for(var intIndex = 0; intIndex < termsList.length; intIndex++) {
            var terms = termsList[intIndex];

            if(intIndex == 0) {
                selectHtml.push("<option value='" + intIndex + "' selected='selected'>현행 시행일자 : " + terms.termsStrtDt + "</option>");
            } else {
                selectHtml.push("<option value='" + intIndex + "'>" + terms.termsStrtDt + " ~ " + terms.termsEndDt + "</option>");
            }
        }
        $("#selectTermsNm").html(selectHtml);
    }

    $(function(){
        //약관 - 전문 보기 - select change 이벤트
        $(document).on("change","#selectTermsNm",function(){
            getTerms(this.value);
        });

        //약관 동의 체크박스 이벤트
        $(document).on("change","#allCheck",function(e){
            $("input[name=termsChk]").prop("checked", $(this).is(":checked"));
            $("#termsAgreeBtn").prop("disabled",!$(this).is(":checked"));
        }).on("change","input[name='termsChk']",function(){
            var isAllCheck = $("input[name='termsChk']").length == $("input[name='termsChk']:checked").length;
            $("#allCheck").prop("checked", isAllCheck);
            if(isAllCheck) $("#allCheck").trigger("change");
            else $("#termsAgreeBtn").prop("disabled",true);
        });
    })
</script><script type="text/javascript">

	//GSR 포인트 인증
	function fnGetGsrPoint(){
	   var config = {
	        callBack : function(){
	            var option = {
						url :  "/gsr/getGsrMemberPoint"
					,	done : function(result){
						var separateNotiMsg = result.separateNotiMsg;
						//분리보관 해제 시
						if(separateNotiMsg && separateNotiMsg != ''){
							//분리보관 해제 noti
							ui.alert("<div id='alertContentDiv'>"+separateNotiMsg+"</div>",{
								ycb:function(){
									var gsrPoint = result.totRestPt === '' || result.totRestPt == null ? '0' : result.totRestPt;
									$("#searchPoint").hide();
									$("#gsPointTit").after('<em class="blue" id="gsPoint">'+fnComma(gsrPoint)+'</em>P');
									$(".popAlert").remove();
								}
								,   ybt:"확인"
							});
						}else{
							var gsrPoint = result.totRestPt === '' || result.totRestPt == null ? '0' : result.totRestPt;
							$("#searchPoint").hide();
							$("#gsPointTit").after('<em class="blue" id="gsPoint">'+fnComma(gsrPoint)+'</em>P');
						}
	               }
	            };
	            ajax.call(option);
	      }
	      ,  okCertCallBack : function(data){
	            var option = {
					  url :  "/gsr/getGsrMemberPoint"
	               ,  data : data
	               ,  done : function(result){
						var gsrPoint = result.totRestPt === '' || result.totRestPt == null ? '0' : result.totRestPt;
						$("#searchPoint").hide();
						$("#gsPointTit").after('<em class="blue" id="gsPoint">'+fnComma(gsrPoint)+'</em>P');
	               }
	            };
	            ajax.call(option);
	      }
	   };
	   gk.open(config);
	}
	
	function fncGoPetList(){
		location.href="myPetList.do";
	}
	
	function fncGoPetInsert(){
		location.href="petInsertView.do";
	}
	
	function fncGoPetView(petNo){
		location.href="myPetView.do?petNo="+petNo;
	}
	
	/*
	 * 주문상세 페이지 이동
	 */
	/* function goOrderDetail(ordNo){
		var inputs = "<input type=\"hidden\" name=\"ordNo\" value=\""+ordNo+"\"/>";
		jQuery("<form action=\"/mypage/order/indexDeliveryDetail\" method=\"get\">"+inputs+"</form>").appendTo('body').submit();
	} */
</script></head>

<body class="body lnb my home isPc gnb_ac isTalk isFoot">
<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData" value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">
		
		<!-- s : header 영역 -->
					<script type="text/javascript">
	//개발자도구에서의 console.[log, debug] control	
	logger("prd");
	
	$(document).ready(function(){
		//IE 진입 시 edge로 연결
		if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
			
			document.body.innerHTML = '';
		
			function edgeAlert(){
				alert("어바웃펫은 Internet Explorer를 지원하지 않습니다. \n크롬, 엣지 브라우저에 최적화 되어있습니다.")
				location.href = "microsoft-edge:" + location.href;
			}
			function closeIE(){
				open("","_self").close();
			}
			setTimeout(edgeAlert);
	        setTimeout(closeIE,200);
		}
		
		if(document.cookie.indexOf("DEVICE_GB") == -1){
			ipadCheck();
		}
		chcekLoginTagInfo(); 
		checkURL();
		
		setCartCnt();
		
		
		// 검색창 문구
		getSearchInputAutoComplete();
		
		$("li[id^=liTag_]").one('click', function(){
			$("li[id^=liTag_]").removeClass("active");
			$(this).addClass("active");
	    });
		
		$(document).on("click" , "#alertBtn" , function(){
			getAlertList();
		});
	});
	
	function getAlertList(){
		var options = {
				url : "/alertList"
				, dataType : "html"
				, done : function(html){
					$("#alertBtn").removeClass("on");
					if("PC" == "PC"){
						$("#alertDiv").html(html);	
					}else{
						location.href="/alertList"	
					}
				}
		}
		ajax.call(options);
	}
	
	// ipad check logic
	function ipadCheck(){
		const iPad = (navigator.userAgent.match(/(iPad)/) /* iOS pre 13 */ ||  (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1) /* iPad OS 13 */);
		if(iPad){
			setCookie("DEVICE_GB", "MO" , 24 );
			window.location.reload();
		}
	}
	
	//회원 관심태그 등록 여부 체크
	function chcekLoginTagInfo(){
		if("Y" != "Y" && "954216" > 0 && "" == ""){
			location.href = "/join/indexTag?isPBHR=Y&returnUrl="+location.pathname+location.search;
		}
	}
	
	function setCookie( name, value, expirehours ) {
		var todayDate = new Date();
		todayDate.setHours( todayDate.getHours() + expirehours );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	// 하루동안 열지않기
	function todaycloseWin(pNo) {
		setCookie("#popDispClsfNo"+pNo, "done" , 24 );
	}
	
	$(function() {
		$('.category_wrap').on('show', function(e, param1) {
			if (param1 == "cate") {
				$('.right_btn_wrap').hide();
				
				var options = {
					url : "/brand/listStyleBrand",
					done : function(data) {
						var html = "";
						for (var i=0; i<data.brandStyleList.length; i++) {
							var brand = data.brandStyleList[i];
							html += '<li><a href="/brand/indexBrandDetail?bndNo=' + brand.bndNo + '">' + brand.bndNm + '</a></li>';
						}
						$('.dep_box.style ul').html(html);
					}
				};
				ajax.call(options);
			}
		});
		
		$('.category_wrap').on('hide', function(e, param1) {
			if (param1 == "cate")
				$('.right_btn_wrap').show();
		});
	});	
	
	// 검색
	function goSearch(dispClsfNo){
		
		var searchWord = $("#srchWord").val();
		var srchShopWord = $("#srchShopWord").val();
		if( srchShopWord != "" &&  srchShopWord != undefined){
			searchWord = srchShopWord;
		}
		var srchShopDispClsfNo = convertDispClsfNo((dispClsfNo == "" || dispClsfNo == undefined) ? "300000173" : dispClsfNo);
		// google Analytics 정보 전송
		search_data.search_term = searchWord;
		sendGtag('search');
		// 마지막 검색 페이지 진입 url 저장
		var lastUrl = window.location.href;
		if(lastUrl.indexOf("commonSearch") == -1){
			$.cookie("searchLastUrl", lastUrl, {path:'/'});
			$.cookie("searchLastFocus", "40", {path:'/'});
			location.href = "/commonSearch?focus=40"+((searchWord.trim() == "")? "":"&srchWord="+encodeURIComponent(searchWord.trim()))+"&cateCdL="+srchShopDispClsfNo;
		}else{
			var searchLastFocus = $.cookie("searchLastFocus");
			location.href = "/commonSearch?"+((searchLastFocus == "" || searchLastFocus == undefined )?"":"focus="+searchLastFocus)+((searchWord.trim() == "")? "":"&srchWord="+encodeURIComponent(searchWord.trim()))+"&cateCdL="+srchShopDispClsfNo;
		}
	}
	
	// 메뉴 활성화	
	function checkURL() {
		var pathname = location.pathname;
		
		//펫로그회원(bizNo이 있는 회원)이 펫로그가 아닌 다른 페이지에 접속하면 alert
		if(pathname.indexOf("/log/") < 0 && "" != "" && "" > 0 && pathname.indexOf("/my/pet/") < 0 && pathname.indexOf("/commonSearch") < 0){
			if(confirm("로그아웃 됩니다. 로그아웃 하시겠습니까?")){
				location.href="/logout";
			}else{
				history.back(-1);
			}
		}
		
		var menu = $('.top_area .nav').children("li");
		
		for (var i=0; i<menu.length; i++) {
			var url = $(menu[i]).find("a").attr("href");
			if (url == location.pathname)
				$(menu[i]).addClass("active");
		}
	}
	
	// 위시리스트 추가 - 상품상세제외
	function insertWish(obj, goodsId){
		if( $(".popToast").is(":visible") ) return;

		var options = {
			url : "/goods/insertWish",
			data : {goodsId : goodsId},
			done : function(data){
				if(data.actGubun =='login'){
					//비로그인 시 처리 기획 없음.
					document.location.href = '/indexLogin?returnUrl='+encodeUriComponent(document.location.href);
				}else if(data.actGubun =='add'){
					$(obj).addClass("on");
					let msg = '<div class="link"><p class="tt">찜리스트에 추가되었어요</p><a href="/mypage/shop/myWishList" class="lk" data-content="" data-url="/mypage/shop/myWishList">바로가기</a></div>';
					ui.toast(msg,{
						bot:77
					});
					//if (confirm("위시리스트에 담겼습니다.\n확인하시겠습니까?")) location.href = "/mypage/interest/indexWishList";
				}else if(data.actGubun =='remove'){
					$(obj).removeClass("on");
					ui.toast("찜리스트에서 삭제되었어요", {
						bot:77
					})
					//alert("위시리스트에서 삭제되었습니다.");
				}else{
					let act = $(obj).hasClass("on") ? "취소" : "추가";
					ui.toast("찜 "+act+" 요청을 실패하였습니다", {
						bot:77
					});
					//alert('위시리스트 등록 또는 삭제에 실패하였습니다.');
				}
			}
		};
		ajax.call(options);
	}
	
	function insertWishS(obj, goodsId, query) {
		var options = {
			url : "/goods/insertWish",
			data : {goodsId : goodsId, search : "Y", returnUrl : document.URL+"?searchQuery="+query },
			done : function(data) {
				$(obj).addClass("click");
			}
		};
		ajax.call(options);
	}

	function goEvent(){
		var id = $(".tmenu .list .active").prop("id");
		var url = "";
		var eventGb2Cd = "10";
		//펫샵
		if(id =="liTag_10"){
			eventGb2Cd = "40";
		}
		//펫tv
		else if(id =="liTag_20"){
			eventGb2Cd = "20";
		}
		//펫로그
		else if(id =="liTag_30"){
			eventGb2Cd = "30";
		}

		window.location.href = "/event/main";
	}
	
	$(function () {
		// 검색 메뉴
		$(".searchMenuContent").hide();
		$(".searchMenuContent:first").show();

		$("ul.searchMenu li").click(function () {
			$("ul.searchMenu li").removeClass("active");
			$(this).addClass("active");
			$(".searchMenuContent").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
		
		//검색 : 카테고리
		$(".categorySub").hide();
		$(".categorySub:first").show();

		$("ul.searchCate li").click(function () {
			$("ul.searchCate li").removeClass("active");
			$(this).addClass("active");
			$(".categorySub").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});

		//검색 : 브랜드
		$(".brandSub").hide();
		$(".brandSub:first").show();

		$("ul.searchBrand li").click(function () {
			$("ul.searchBrand li").removeClass("active");
			$(this).addClass("active");
			$(".brandSub").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});

		//검색어 : 최근/인기검색어
		$(".searchKindSub").hide();
		$(".searchKindSub:first").show();

		$("ul.searchKind li").click(function () {
			$("ul.searchKind li").removeClass("active");
			$(this).addClass("active");
			$(".searchKindSub").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
		
		// 검색 아이콘 클릭 시
		$(".btnSch").on("click", function(){
			goSearch();
		});
		// 검색 이벤트
		var thisUrl = window.location.href;
		if(thisUrl.indexOf("commonSearch") == -1){
			$("#srchWord, #srchShopWord").on("click", function(){
				goSearch();
			});
		}else{
			$(document).on("keypress","#srchWord, #srchShopWord",function(e){
				if ( event.keyCode == 13 ) {
					goSearch();
				}
			});
		}
	
		// 스크롤시 검색 포커스 해제
		$(window).scroll(function(){
			if(document.activeElement.name == 'srchWord'){
				$("#srchWord").blur();
			}
		});
		
		// 네이버 AI 데이터 관리
		let mbrNo, section, contentId, baseUrl, targetUrl, litd, lttd, agent = "";
		$("a, button").on("click", function(){
			// 회원번호
			mbrNo = "CB1A9462F55260603DB262E4564A0CBC";
			if("" != "954216"){
				mbrNo = "954216";
			}
			
			// 요청구분
			section = "40";
			if("10" == section){
				section = "shop";
			} else if("20" == section){
				section = "tv";
			} else if("30" == section){
				section = "log";
			} else {
				section = "member";
			}
			
			// 콘텐츠/상품 번호/회원번호/태그번호(data-content)
			contentId = $(this).data("content");
			
			// 현재 URL
			if("" != $(this)[0].baseURI){
				baseUrl = $(this)[0].baseURI;
			}
			
			// 타겟 URL
			if("" != $(this).data("url") && "undefined" != typeof  $(this).data("url")){
				targetUrl = $(this).data("url");
			} else if("" != $(this)[0].href && "#" != $(this)[0].href){
				targetUrl = $(this)[0].href;
			} else if("" != $(this)[0].onclick){
				targetUrl = $(this)[0].onclick;
			}
			
			// Device, Device OS, 위도, 경도 추가
			if("PC" == "APP"){
				agent = "APP_" + jscd.typeOs;
				
				// 위치정보 약관동의 여부
				var headerPstInfoAgrYn = "N";
				
					headerPstInfoAgrYn = "Y";
				
				
				// APP ibricks Interface
				var data = {
					      "mbr_no" : mbrNo
						, "section" : section
						, "content_id" : contentId
						, "action" : "etc"
						, "url" : baseUrl
						, "target_url" : targetUrl
						, "agent" : agent
						, "prclAddr" : ""
						, "roadAddr" : ""
						, "postNoNew" : ""
						, "timestamp" : ""
						, "pstInfoAgrYn" : headerPstInfoAgrYn
				};
				toNativeData.func = "onIbrixClick";
				toNativeData.parameters = JSON.stringify(data);
				toNative(toNativeData);
			} else {
				agent = "WEB_" + jscd.typeOs; 
		
				$.ajax({
					url : "/common/sendSearchEngineEvent"
					, data : {
						  "mbr_no" : mbrNo
						, "section" : section
						, "content_id" : contentId
						, "action" : "etc"
						, "url" : baseUrl
						, "targetUrl" : targetUrl
						, "agent" : agent
						, "prclAddr" : ""
						, "roadAddr" : ""
						, "postNoNew" : ""
						, "timestamp" : ""
					}
				});
			}
			// Device, Device OS, 위도, 경도 추가
		});
	});
	
	// APP용 ibricks Callback function
	function interfaceIbricksCallback(responseData){
		var response = $.parseJSON(responseData);
		$.ajax({
			url : "/common/sendSearchEngineEvent"
			, data :{
			      "mbr_no" : response.mbrNo
					, "section" : response.section
					, "content_id" : response.contentId
					, "action" : response.action
					, "url" : response.baseUrl
					, "target_url" : response.targetUrl
					, "agent" : response.agent
					, "litd" : response.litd
					, "lttd" : response.lttd
					, "prclAddr" : response.prclAddr
					, "roadAddr" : response.roadAddr
					, "postNoNew" : response.postNoNew
					, "timestamp" : ""
			}
		});
	}
	
	// APP용 Device, Device OS, 위도, 경도 추가
	function onCurrentLocCallBackIbricks(resultJson){
		var result = $.parseJSON(resultJson);
		agent = "APP_" + jscd.typeOs;
		if( result.authYn !== undefined && result.authYn == 'Y'){
			appLocAuthYn = "Y";
			lttd = result.latitude;
			litd = result.longitude;
			
			$.ajax({
				url : "/common/sendSearchEngineEvent"
				, data : {
					  "mbr_no" : mbrNo
					, "section" : section
					, "content_id" : contentId
					, "action" : "etc"
					, "url" : baseUrl
					, "target_url" : targetUrl
					, "litd" : litd
					, "lttd" : lttd
					, "agent" : agent
					, "timestamp" : ""
				}
			});
		}
	}
	// APP용 Device, Device OS, 위도, 경도 추가
	
	// 메인으로 가기
	function goPetShopMain() {
		var form = document.createElement("form");
		document.body.appendChild(form);
		var url = "/shop/home/";
		form.setAttribute("method", "POST");
		form.setAttribute("action", url);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "lnbDispClsfNo");
		hiddenField.setAttribute("value", '');
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
	
	// 분류번호 보내기
	function sendDispClsfNo(dispClsfNo){
		var lnbDispClsfNo = dispClsfNo
		var cateCdL = dispClsfNo
		cateCdL = convertDispClsfNo(dispClsfNo);
		
		var form = document.createElement("form");
		document.body.appendChild(form);
		var url = "/mypage/indexMyPage/";
		if("/mypage/indexMyPage/" == "/event/indexSpecialExhibitionZone"){
			url = "/shop/home";
		}
		
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lnbDispClsfNo');
		hiddenField.setAttribute('value', lnbDispClsfNo);
		form.appendChild(hiddenField);
		
		if("/mypage/indexMyPage/" == "/shop/indexCategory"||
			"/mypage/indexMyPage/" == "/event/indexExhibitionZone") {
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "cateCdL");
			hiddenField.setAttribute("value", cateCdL);	// 12564
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/mypage/indexMyPage/" == "/shop/indexNewCategory" ||
				 "/mypage/indexMyPage/" == "/shop/indexBestGoodsList") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/mypage/indexMyPage/" == "/pet/event/petshopEventList" ||
			"/mypage/indexMyPage/" == "/shop/indexLive" ){				
			form.setAttribute("method", "GET");
		}else if("/mypage/indexMyPage/" == "/event/shop/main"){
			form.setAttribute("method", "GET");
			form.removeChild(hiddenField);

			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispClsfNo");
			hiddenField.setAttribute("value", lnbDispClsfNo);
			form.appendChild(hiddenField);
		}
		else {
			form.setAttribute("method", "POST");
		}
		form.setAttribute("action", url);
		document.body.appendChild(form);
		form.submit();
	}
	
	function convertDispClsfNo(dispClsfNo) {
		var cateCdL = '12564';
		
		if('300000174' == dispClsfNo ) {	// 고양이
			cateCdL = '12565'
		} else if('300000175' == dispClsfNo ) {	// 관상어
			cateCdL = '14111'
		} else if('300000176' == dispClsfNo ) {	// 소동물
			cateCdL = '14196'
		}
		
		return cateCdL;	
	}
	
	function getSearchInputAutoComplete() { 
		$.post( "/shop/getSearchInputAutoComplete",	function( data ) {
			var srchText = "검색어를 입력해주세요.";
			if(data.searchBox != null && data.searchBox.bnrText != null && data.searchBox.bnrText != ''){
				srchText = data.searchBox.bnrText;
			}
			// 모바일 검색창
			$("#srchWordMO").text(srchText);
			// pc 검색창
			$("#srchWord").attr("placeholder", srchText);
			$("#srchShopWord").attr("placeholder", srchText);
		});
	}
	
	function clickLogin(){
		location.href = "/indexLogin?returnUrl="+location.pathname+location.search;
	}
	
	
	//장바구니 수 set, 캐시 이슈로 ajax 호출
	function setCartCnt(){
		$.ajax({
			url : "/order/getCartCnt"
			, dataType : "json"
			, type : "POST"
			, success : function(data){
				var $cartCntObj = $('.header .menu .cart').find('em');
				if($cartCntObj.length == 0){
					if(data.cartCnt != 0){
						var html = '<em class="n">'+data.cartCnt+'</em>';
						$('.header .menu .cart').html(html);
					}
				}else{
					if(data.cartCnt == 0){
						$cartCntObj.remove();
					}else{
						$cartCntObj.text(data.cartCnt);
					}
				}
			}
		});
	}

    
  	//등급 레이어팝업 스크립트 추가 2021.05.13
	var rankBox = function(){
		ui.popLayer.open('popLank',{
			ocb:function(){
				// console.log("popLank 열림");
			},
			ccb:function(){
				// console.log("popLank 닫힘");
			}
		});

		if("PC" == "PC") {
			$(".rank_pc").addClass("on");
		}else {										
			$(".rank_mo").addClass("on");
		}
	}
  	
</script>


<div class="layers tv seriesHome" id="srisListPopup"></div>
<!-- e : gnb 영역 -->			
					<!-- s : LNB 영역 -->
					<script type="text/javascript">
</script>
<body class="body lnb my home isPc gnb_ac isTalk isFoot">
<nav class="lnb my" id="lnb">
	<div class="inr" style="bottom: 40px;">
		<div class="myCate">
			<ul class="menu">
				<li class="open">
					<a class="bt " href="myPage.do" data-url="myPage.do" data-content="954216"><b class="t">내 활동</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="myPetList.do" data-url="myPetList.do" data-content="954216"><b class="t">마이펫 관리</b></a></li>
						<li class=""><a class="bt" href="myWishTv.do" data-url="myWishTv.do" data-content="954216"><b class="t">마이 찜리스트</b></a></li>
						<li class=""><a class="bt" href="myRecentTv.do" data-url="myRecentTv.do" data-content="954216"><b class="t">최근 본 영상</b></a></li>
						<li class=""><a class="bt" href="myRecentShop.do" data-url="myRecentShop.do" data-content="954216"><b class="t">최근 본 상품</b></a></li>
					</ul>
				</li>
				<li class="open">
					<a class="bt " href="javascript:;"><b class="t">나의 쇼핑정보</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="orderList.do" data-url="orderList.do" data-content="954216"><b class="t">주문/배송</b></a></li>
						<li class=""><a class="bt" href="/mypage/order/indexClaimList" data-url="/mypage/order/indexClaimList" data-content="954216"><b class="t">취소/반품/교환</b></a></li>
						<li class=""><a class="bt" href="myAlarmList.do" data-url="myAlarmList.do" data-content="954216"><b class="t">재입고 알림</b></a></li>
						<li class=""><a class="bt" href="myCouponList.do" data-url="myCouponList.do" data-content="954216"><b class="t">내 쿠폰</b></a></li>
						<li class=""><a class="bt" href="/customer/inquiry/inquiryView" data-url="/customer/inquiry/inquiryView" data-content="954216"><b class="t">1:1 문의</b></a></li>
						<li class=""><a class="bt" href="/mypage/goodsCommentList" data-url="/mypage/goodsCommentList" data-content="954216"><b class="t">상품 후기</b></a></li>
						<li class=""><a class="bt" href="/mypage/service/indexAddressList" data-url="/mypage/service/indexAddressList" data-content="954216"><b class="t">배송지 관리</b></a></li>
						<li class=""><a class="bt" href="/mypage/order/indexBillingCardList" data-url="/mypage/order/indexBillingCardList" data-content="954216"><b class="t">결제 카드 관리</b></a></li>
					</ul>
				</li>
				<li class="open">
					<a class="bt " href="javascript:;"><b class="t">내 정보 관리</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="pswdUpdate.jsp" data-url="pswdUpdate.jsp" data-content="954216"><b class="t">비밀번호 설정</b></a></li>
						<li class=""><a class="bt" href="manageCheck.jsp"><b class="t" data-url="manageCheck.jsp" data-content="954216">회원정보 수정</b></a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav><!-- e : LNB 영역 -->
				<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
				
		<!-- s : 본문영역 -->			
		<!-- 바디 - 여기위로 템플릿 -->
		<main class="container lnb page my home" id="container">
			
			<div class="inr" style="min-height: 479px;">			

				<!-- 본문 -->
				<div class="contents" id="contents" style="min-height: 651px;">

					<!-- 회원정보  -->
					<section class="sect top">
	<dl>
		<dt class="pic">
			<img class="thumb" src="${ memberDTO.mem_img }" onclick="">
</dt>
		<dd class="info-bx">
			<p>
				<span class="nm" onclick="">${ memberDTO.nickname }님</span> <!-- mong2mom -->
				<button class="btn re" onclick="location.href='manageCheck.jsp'" data-content="" data-url="manageCheck.jsp">수정</button>
			</p>
			<ul class="data">
				<li>
					<span>등급</span>
					<a class="rank_icon" href="javascript:rankBox();" ><i class="label welcome">${ memberDTO.gr_name }</i></a>
						</li>
				<li>
					<span id="gsPointTit">GS&amp;POINT</span>
					<c:if test="${ memberDTO.mem_point eq 0 }">
						<a href="javascript:fnGetGsrPoint();" id="searchPoint" class="bt point">포인트조회</a>
					</c:if>
					<c:if test="${ memberDTO.mem_point ne 0 }">
						<em class="blue" id="gsPoint">${ memberDTO.mem_point } </em>P
					</c:if>
					
					</li>
			</ul>
		</dd>
	</dl>
</section><section class="myinfo">
						<!-- 마이펫관리 -->
						<div class="sect line">
	<dl class="my">
		<dt>
			<span>마이펫 관리</span>
			<a href="#" onclick="fncGoPetList(); return false;" class="next" data-content="953741" data-url="myPetList.do"></a>
			</dt>
		<dd>
			<c:if test="${ empty petlist }">
				<div class="pet">
					<p class="ex">마이펫 등록하고&nbsp;<span>예방접종 내역을 관리하세요.</span></p>
					<button class="btn add" onclick="fncGoPetInsert();" data-content="954275" data-url="petInsertView.do">마이펫 등록하기</button>
				</div>
			</c:if>
			
			<c:if test="${ not empty petlist }">
				<ul class="img-set">
					<c:forEach items="${ petlist }" var="petDTO">
						<li>
							<img src="${ petDTO.pet_img }"  onclick="fncGoPetView(${ petDTO.pet_code });" style="cursor: pointer;height: 100%;width: 100%;" data-url="myPetView.do?petNo=${ petDTO.pet_code }" data-content="953741" />
						</li>
					</c:forEach>
				</ul>
			<button class="btn re" onclick="fncGoPetList();" data-url="myPetList.do" data-content="953741">설정</button>
			</c:if>
		</dd>
	</dl> 
</div><dl class="zzim">
							<dt>
								<span>마이 찜리스트</span>
							</dt>
							<dd>
								<a href="/mypage/myWishList" class="allmore" data-url="/mypage/myWishList" data-content="953741">전체보기</a>
								<ul class="zzim-list">
									<li>
										<b>TV</b>
										<a href="myWishTv.do" data-url="myWishTv.do" data-content="953741">${ tvMark }</a>
									</li>
									<li>
										<b>로그</b>
										<a href="myWishLog.do" data-url="myWishLog.do" data-content="953741">${ logMark }</a>
									</li>
									<li>
										<b>샵</b>
										<a href="myWishShop.do" data-url="myWishShop.do" data-content="953741">${ itemMark }</a>
									</li>
								</ul>
							</dd>
						</dl>
						
						<!-- 최근 본 영상  -->
						<dl class="sect watch">
	<dt>
				<a href="myRecentTv.do" data-url="myRecentTv.do" data-content="953741">
				<span>최근 본 영상</span>
				<c:if test="${ empty mtlist }">
					<span class="next all">펫TV 바로가기</span>
				</c:if>
				<c:if test="${ not empty mtlist }">
					<span class="next all">전체보기</span>
				</c:if>
				</a>
			</dt>
			<dd class="recent">
				<c:if test="${ empty mtlist }">
					<p class="nodata">최근 시청한 영상이 없습니다. 반려동물과 함께하는 펫TV를 시청해보세요.</p>
				</c:if>
				<c:if test="${ not empty mtlist }">
				<div class="swiper-div">
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
						<ul class="swiper-wrapper">
							<c:set var="flag" value="false" />
							<c:forEach items="${ mtlist }" var="mtDTO" varStatus="status">
							<c:if test="${ not flag }">
								<li class="swiper-slide swiper-slide-active" style="margin-right: 18px;">
									<div class="thumb-box">
										<div class="circular">
	                                    		<a href="<!-- 영상링크 경로?v_code= -->" data-content="N2021053103242" data-url="">
												<div class="inner" style="background-image:url(${ mtDTO.v_img });"></div>
	                                        	</a>
												<!-- <div class="inner" style="background-image:url(../../_images/tv/@temp01.jpg);"></div> -->
												<div class="circlePie" data-p="0"><canvas width="100" height="100"></canvas></div>
											</div>
											<div class="info">
												<div class="tlt">${ mtDTO.v_name }</div>
											</div>
										</div>
									</li>
								<c:if test="${ status.count ge 6 }">
								<c:set var="flag" value="true" />
								</c:if>
							</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
					
				</c:if>
			</dd>
		</dl><!-- 나의 쇼핑 정보 -->
						<dl class="sect shop line">
	<dt>
		<span>내 쇼핑정보</span>
	</dt>
	<dd>
		<ul class="coupon">
			<li>
				<a class="my1" href="myCouponList.do" data-url="myCouponList.do" data-content="953741">
					<c:if test="${ couponCnt ne 0 }">
						<em>${ couponCnt }</em>
					</c:if>
					<span>내쿠폰</span>
				</a>
			</li>
			<li>
				<a class="my2" href="myRecentShop.do" data-url="myRecentShop.do" data-content="953741">
				<span>최근본상품</span></a>
			</li>
			<li>
				<a class="my3" href="myWishShop.do" data-url="myWishShop.do" data-content="953741">
				<c:if test="${ itemMark ne 0 }">
					<em>${ itemMark }</em>
				</c:if>
				<span>찜한상품</span></a>
			</li>
			<li>
				<a class="my4" href="cartList.do">
				<c:if test="${ cartCnt ne 0 }">
					<em>${ cartCnt }</em>
				</c:if>
				<span>장바구니</span></a>
			</li>
		</ul>
		<div class="barwrap">
			<ul class="bar">
				<li>
					<a href="orderList.do" data-url="orderList.do" data-content="953741">
					<span class="tit">주문/배송</span>   
					<span class="next"></span>
					</a>
				</li>
				<li>
					<!-- <span class="tit new">취소/반품/교환</span> -->
					<a href="/mypage/order/indexClaimList" data-url="/mypage/order/indexClaimList" data-content="953741">
					<span class="tit">취소/반품/교환</span>
					<span class="next"></span>
					</a>
				</li>
				<li>
					<a href="myAlarmList.do" data-url="myAlarmList.do" data-content="953741">
					<span class="tit">재입고 알림</span>
					<span class="next"></span>
					</a>
				</li>
				<li>
					<a href="/mypage/service/coupon" data-url="/mypage/service/coupon" data-content="953741">
					<span class="tit">쿠폰존</span>
					<span class="next"></span>
					</a>
				</li>
			</ul>
			<ul class="bar line">
				<li>
					<a href="/customer/inquiry/inquiryView" data-url="/customer/inquiry/inquiryView" data-content="953741">
					<span class="tit">1:1 문의</span>
					<span class="next"></span>
					</a>
				</li>
				<li>
					<a href="/mypage/goodsCommentList" data-url="/mypage/goodsCommentList" data-content="953741">
					<span class="tit">상품 후기</span>
					<span class="next"></span>
					</a>
				</li>
				<li>
					<a href="/mypage/service/indexAddressList" data-url="" data-content="953741">
					<span class="tit">배송지 관리</span>
					<span class="next"></span>
					</a>
				</li>
				<li>
					<a href="/mypage/order/indexBillingCardList" data-url="/mypage/order/indexBillingCardList" data-content="953741">
					<span class="tit">결제 카드 관리</span>
					<span class="next"></span>
					</a>
				</li>
			</ul>
		</div>
		<div class="line mt25" onclick="location.href='/mypage/info/indexInvitePage'" data-content="953741" data-url="/mypage/info/indexInvitePage">
			<div class="invite">
				<span class="ex">어바웃펫에 <em>친구를 초대 </em>하고<span class="block">친구와 함께 혜택을 받아보세요</span></span>
			</div>
		</div>
	</dd>
</dl>
</section>
				</div>

			</div>
		</main>
		
		<!-- 플로팅 영역 -->
		<!-- TWC chatbot Scripts -->
<script src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.plugin.js"></script>

<script type="text/javascript">
	(function() {
	 Twc('init', {
	   brandKey: "OEV1nVeHcnzgQtklwEXksg",
	   channelType: "chat",
	   appId: "",
	   UserNo: "954216",
	   buttonOption: {
	     showLauncher: false,
	     zIndex: 500,
	     bottom: $("#cartNavs").length > 0 ? 95 : 25
	    }
	  })
	})();
	
	function twcChatOpen() {
		if ("954216" == "0") {
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

<nav class="floatNav on">
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
</nav><script>

	// Swiper 최근
	var swiperRecent = new Swiper('.recent .swiper-container', {
	    slidesPerView: "auto",
	    spaceBetween: 18,  
	    navigation: {
	        nextEl: '.recent .swiper-button-next',
	        prevEl: '.recent .swiper-button-prev',
	    }
	});
	
		// Swiper 최근
	var swiperFit = new Swiper('.zzim .swiper-container', {
	    slidesPerView: "auto",
	    spaceBetween: 7, 
	    navigation: {
	        nextEl: '.zzim .swiper-button-next',
	        prevEl: '.zzim .swiper-button-prev',
	    }
	});
	
	// progress
	var wTimer = null;
	if($(".circlePie").length && $(".recent").css("display") !== "none"){
	    $(document).ready(function(){
	        if(wTimer !== null) clearTimeout(wTimer);
	        wTimer = setTimeout(function(){
	            price = $(".circlePie").width();
	            createPie();
	        },1000);
	    });
		var price = $(".circlePie").width();
		//createPie();   프로그레스바 두번 채워짐.
		function createPie(p){
			$(".circlePie").each(function(i,n){
				var can = document.createElement("canvas");
				var ctx = can.getContext("2d");
				var p = ($(n).data("p") !== undefined)?$(n).data("p"):100;
				can.width = price;
				can.height = price;
				ctx.beginPath();
				ctx.fillStyle = "black";
				ctx.moveTo((price / 2),(price / 2));
				ctx.translate((price / 2),(price / 2));
				ctx.arc(0,0,60,Math.PI * 0, Math.PI * 0.1,false);
				ctx.fill();
				ctx.font = 'bold 20px serif';
				$(n).html("").append(can);
				drowC(p,can,ctx);
			});
	
			function drowC(angle,can,ctx){
				var n = 0;
				var max = 30;
				var angle = (angle * 3.6) * (2 / 36);
				var add = (angle / max);
				var timer = setInterval(function(){
					n += add;
					if(n >= angle) n = angle;
					ctx.translate(-10,-10);
					ctx.clearRect(0,0,can.width,can.height);
					ctx.translate(10,10);
					ctx.rotate(Math.PI * -0.5);
					ctx.beginPath();
					ctx.fillStyle="#669aff";
					ctx.moveTo(0,0);
					ctx.arc(0,0,(price / 2),Math.PI*0,Math.PI*(n * 0.1),false);
					ctx.fill();
					ctx.closePath();
					ctx.beginPath();
					ctx.arc(0,0,((price / 2) - 4),0,Math.PI*2);
					ctx.fillStyle="#ffffff";
					ctx.fill();
					ctx.closePath();
					ctx.textAlign = "center";
					ctx.fillStyle ="#ffffff";
					ctx.rotate(Math.PI * 0.5);
					if(n >= max){
						clearInterval(timer);
					};
				},50)
			};
		};
	};
</script><!-- location 영역 포함  -->			
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
		<li id="liTag_20" class="tv ">
					<a href="/tv/home/" class="bt"><span>TV</span></a>
				</li>
				<li id="liTag_30" class="log ">
					<a href="/log/home/" class="bt"><span>로그</span></a>
				</li>
				<li id="liTag_10" class="shop ">
					<a href="/shop/home/" class="bt"><span>샵</span></a>
				</li>
				<li id="liTag_00" class="my active">
					<a href="myPage.do" class="bt"><span>MY</span></a>
				</li>
			</ul>
	</div>
</nav><!-- e : menubar 영역 -->
<!-- footer -->
<jsp:include page="footer.jsp" flush="false"/>


<div id="layers">
</div><!-- e : footer 영역 -->
	</div>

<style type="text/css">
            #twc-chat-plugin #chat-icon {box-sizing: border-box;position:fixed;bottom:25px;right:25px; z-index:500;display:none;width:60px;height:60px;background: url(https://storage.googleapis.com/cloud-gate-cdn/image/icon_webchat_bg_v2.png) no-repeat top left;-webkit-transition: 0.3s cubic-bezier(0.25, 0.8, 0.5, 1);transition: 0.3s cubic-bezier(0.25, 0.8, 0.5, 1);border-radius:50%;overflow:hidden; }
            #twc-chat-plugin #chat-icon img { width:100%;-webkit-transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1);transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1); }
            #twc-chat-plugin #chat-frame-box { box-sizing: border-box; position:fixed;bottom:-150%;right:25px;z-index:510;border-radius: 10px;overflow:hidden;background-color:#fff;-webkit-transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1);transition: 0.4s cubic-bezier(0.25, 0.8, 0.5, 1); box-shadow: 2px 2px 25px rgba(94, 94, 94, 0.5); }
            #twc-chat-plugin #chat-frame-box iframe{ width:410px;height:767px;border:0;vertical-align: top; }
            #twc-chat-plugin .loader, #twc-chat-plugin .loader:after {box-sizing: border-box;border-radius: 50%;width: 30px;height: 30px;}
            #twc-chat-plugin .loader {box-sizing: border-box;font-size: 10px;position:absolute; top:14px;left:14px;text-indent: -9999em;border-top: 4px solid rgba(255, 255, 255, 1);border-right: 4px solid rgba(255, 255, 255, 1);border-bottom: 4px solid rgba(255, 255, 255, 0);border-left: 4px solid #ffffff;-webkit-transform: translateZ(0);-ms-transform: translateZ(0);transform: translateZ(0);-webkit-animation: load8 1.1s infinite linear;animation: load8 1.1s infinite linear;display:none;}
            @-webkit-keyframes load8 { 0% {-webkit-transform: rotate(0deg);transform: rotate(0deg);} 100% {-webkit-transform: rotate(360deg);transform: rotate(360deg);}}
            @keyframes load8 { 0% {-webkit-transform: rotate(0deg);transform: rotate(0deg);} 100% {-webkit-transform: rotate(360deg);transform: rotate(360deg);}}
            #twc-chat-plugin.on img { -ms-transform: scale(0);-moz-transform: scale(0);-o-transform: scale(0);-webkit-transform: scale(0);transform: scale(0); }
            #twc-chat-plugin.on .loader {display:block;opacity:1;}
        </style><div id="twc-chat-plugin"><div id="chat-icon"><img src="https://storage.googleapis.com/cloud-gate-cdn/image/icon_webchat_v2.png"><div class="loader">Loading...</div></div><div id="chat-frame-box"><iframe id="chat-frame" style="height: 730px;"></iframe></div></div>
        </body></html>