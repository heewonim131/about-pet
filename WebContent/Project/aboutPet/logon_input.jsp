<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@
include file="./header.jsp"

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
var mbrState = "";
var mbrNo = "";
var bizNo = "";
var isTag = "";
var appReturnUrl = "";
var gsptStateCd = "";
var gsptUseYn = "";

	$(function() {
		
		if("" != null && "" != ''){
			$("#login_login_id").val("tenk0620");
			$("#keepYn").attr("checked","checked");
		}
		
		
		if("PC" != "PC"){
			$(".mo-heade-tit .tit").html("로그인");
			$(".mo-header-backNtn").attr("onclick", "goBack();");
//				$(".mode0").remove();
			$("#footer").remove();
			$(".menubar").remove();
		}else{
//				$(".mode7").remove();
		}
		
		storageHist.replaceHist();
		
		//sns 로그인 시 유효성 체크 실패한 경우 & app자동로그인 시 상태체크 실패한 경우
		if("" != null && "" != ''){
			if("" == "noInfoPBHR"){
				//기존 펫츠비 회원 중 폰번호,이메일 정보 둘다 없는 경우
				popAlert("기존 펫츠비회원은 고객센터(1644-9601)로 문의주세요");
				return;
			}
			if("" != 'LGN0007') fncCheckLoginResult("","")
		}
		
		//sns로그인 시 처음 로그인 페이지에서 갖고온 리턴 url로 보내주기 유효성체크 잘 통과한 경우
		if("" != null && "" != '' && "" == null ){
			var returnUrl = "";
			returnUrl = returnUrl.replace(/&amp;/gi, "&");
			location.href = returnUrl;
		}
		
		$("#login_login_id").focus();
		// Enter Key 이벤트
		$(".ipt").keyup(function() {
			if ( window.event.keyCode == 13 && $("#activeBtn").is(':visible')) {
				login();
			}
		});
		
		//푸쉬토큰 app interface 호출 
		if('PC' == 'APP'){
			toNativeData.func = 'onPushToken';
			toNativeData.callback= 'appPushToken';
			toNative(toNativeData); 
			
			//앱 설정정보 조회 
			toNativeData.func = "onSettingInfos";
			toNativeData.callback = "appSettingInfosCallBack";
			toNative(toNativeData);	
		}
	});
	
	//App 푸쉬토큰 콜백
	function appPushToken(data){
		var dataJson = JSON.parse(data);
		$("#appPushToken").val(dataJson.token);
	}

	//아이디 비번 입력 됐을 시 로그인 버튼 활성화
	$(document).on("keyup input paste",".ipt",function()  {
		if($("#login_login_id").val().length > 0 
				&& $("#login_password").val().length > 0 ){
			//버튼 활성화
			$("#activeBtn").show();
			$("#inactiveBtn").hide();
		}else{
			//버튼 비활성화
			$("#inactiveBtn").show();
			$("#activeBtn").hide();
		}
		
		if($("#newErrMsg").css("display") != "none" ){
			$("#newErrMsg").hide();
		}
	});

	//인풋 엑스 시 이벤트 안먹혀서 설정
	$(document).on("click",".btnDel",function(){
		$("#inactiveBtn").show();
		$("#activeBtn").hide();
		$("#newErrMsg").hide();
	});
	
	
	/*로그인*/
	function login(){
		$("#newErrMsg").hide();
		
		var login_id = $("#login_login_id").val();
		var login_pswd = $("#login_password").val();
		if(login_id == ""){
			popAlert("아이디 또는 비밀번호를 다시 확인해주세요");
			$("#login_login_id").focus();
			return;
		}
		//아이디 공백입력시 메시지 노출
		else if(login_id.search(/\s/g) !== -1){
			$("#newErrMsg").show();
			$("#newErrMsg").html("아이디 또는 비밀번호를 다시 확인해주세요");
			return;
		}

		if(login_pswd == ""){
			popAlert("아이디 또는 비밀번호를 다시 확인해주세요");
			$("#login_password").focus();
			return;
		}
		
		login_id = login_id.replace(/\s/gi,"");
		login_pswd = login_pswd.replace(/\s/gi,"");
		
		//
		 var params =$("#login_form").serialize();
			
		//var params=$("#join_login_id").val();
	              $.ajax({
	           url: "loginCheck.jsp"
	           , dataType:"json"
	           , type:"get"
	           , data: params
	           , cache:false
	           , success:function (data){
	              // json -> js Object 형 자동으로 변환
	              // alert( data.count );   { "count":1 }
	              if( data.count == 1){
	            	  submitLogin(login_id,login_pswd );

	              }else {
	            		$("#newErrMsg").show();
	        			$("#newErrMsg").html("아이디 또는 비밀번호를 다시 확인해주세요");
	            	  
	            	  
	              }
	              }
	         });     
		
		//
		//암호화 처리
		/*var rsa = new RSAKey();
		rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());
		var login_id_enc = rsa.encrypt(login_id);
		var login_pswd_enc = rsa.encrypt(login_pswd);
		$("#login_login_id").val(login_id_enc);
		$("#login_password").val(login_pswd_enc);*/
		
		/*var options = {
			url : "/login",
			data : $("#login_form").serialize(),
			done : function(data){
				var loginCd = data.resultCode;
				var loginMsg = data.resultMsg;
				mbrNo = data.mbrNo;
				bizNo = data.petLog;
				isTag = data.tags;

				gsptStateCd = data.gsptStateCd;
				gsptUseYn = data.gsptUseYn;
				
				fncCheckLoginResult(loginCd, loginMsg, data)
			}
		};*/
		
		
		/* var login_id = $("#login_login_id").val();
		var login_pswd = $("#login_password").val(); */
		
		
		ajax.call(options);
		$("#login_login_id").val(login_id);
		$("#login_password").val(login_pswd);
	}
	function submitLogin(login_id,login_pswd){
		$("#login_form").submit();
	}
	
	
	//로그인 결과 처리
	function fncCheckLoginResult(loginCd, loginMsg, data){
		//하루 펫츠비 최초로그인
		if(loginCd == "PBHR"){
			location.href = "/login/indexPBHRMember";
			return;
		}
		
		if(loginCd == "S"){
			//로그인 app interface 호출
			appLoginPost();
			return;
		}else{
			if(loginCd == 'LGN0007' || loginCd == 'LGN0006'){
				//아디, 비번 올바르지 않은 경우
				$("#newErrMsg").show();
				return;
			}
			else if(loginCd == 'LGN0106'){
				//휴면상태일 경우
				mbrState =  '30';
				ui.confirm('<p>'+loginMsg+'</p>',{ // 컨펌 창 띄우기
					ycb:function(){
						mbrState =  '30';
						fncUpdateStat("");
					},
					ybt:"확인",
					nbt:"취소"	
				}); 
			}else if(loginCd == 'LGN0107'){
				//번호 중복인 경우 
				mbrState =  '40';
				fncDuplicatedMember(loginMsg);
			}else if( loginCd == 'LGN0108'){
				//정지 상태인 경우 - 지금은 없는 상태
				mbrState =  '70';
				ui.alert('<p>'+loginMsg+'</p>',{
					ycb:function(){
						//okCertPopup("01", mbrNo);//본인인증 팝업창 open
					},
					ybt:"확인"	
				}); 
				return;
			}else if(loginCd == 'LGN0012'){
				//비번 오류횟수 초과인 경우
				popAlert(loginMsg, function(){location.href="/login/indexFindPswd";});
			}else if(loginCd == 'keyError'){
				popAlert('오류가 발생되었습니다. 다시 시도하여 주십시오.', function(){location.href="/indexLogin";});
				return;	
			}else{
				//부당거래정지 또는 다른 상태
				popAlert(loginMsg);
				return;
			}
		}
	}
	
	
	// 알럿창 띄우기
	var popAlert = function(msg, callback){
		ui.alert('<p>'+msg+'</p>',{
			ycb:callback,
			ybt:"확인"	
		});
	}

	/*휴면 해제 - 원래는 정지해제도 같이하는 함수였지만 정지상태는 지금은 없는 상태*/
	function fncUpdateStat(msg){
		$("#mbrNo").val(mbrNo);
		$("#mbrStatCd").val(mbrState);
		var options = {
			url : "login/memberUpdateState",
			data : $("#login_form").serialize(),
			done : function(data){
				var resultCd = data.resultCode;
				if(resultCd == "S")
				{
					if(msg != "" )popAlert(msg, function(){location.href="/indexLogin";});
					else  ui.toast("휴면 상태가 해제되었습니다." , {ccb:function(){appLoginPost()}}); //휴면인 경우
					return;
				}
				else if(resultCd == "existMemberInfo"){
					popAlert("기존 펫츠비 회원이시군요.<br>"
							+"<U>"+data.existid+"</U>"
							+"비밀번호 설정 후 어바웃펫을 시작하세요."); 
				}else if(resultCd == "N"){
					popAlert("인증정보가 회원정보와 일치하지 않습니다.");
				}else if(resultCd == "F"){
					popAlert("회원정보가 존재하지 않습니다. 고객센터로 문의해 주세요");
				}
			}
		};
		ajax.call(options);
	}
	
	//중복인 경우 처리
	function fncDuplicatedMember(msg){
		popAlert(msg, function(){
			var input1 = "<input type='hidden' name='deviceToken' value='"+$("#appPushToken").val()+"' />";
			var input2 = "<input type='hidden' name='deviceTpCd' value='"+$("#deviceTpCd").val()+"' />";
			jQuery("<form action=\"/mypage/info/updateDulicatedMember\" method=\"post\">"+input1+input2+"<input type=\"hidden\" name=\"mbrNo\" value='"+mbrNo+"' /></form>").appendTo('body').submit();
			//jQuery("<form action=\"/mypage/info/updateDulicatedMember\" method=\"post\">"+input1+input2+""</form>").appendTo('body').submit();
		});
	}
	
	//기존에 해제된 sns 계정 다시 연동하기
	/* function fncReconnectSns(){
		var options = {
			url : "login/reconnectSns",
			data : {
				snsUuid : mbrNo,
				deviceToken : $("#appPushToken").val(),
				deviceTpCd  : $("#deviceTpCd").val()
			},
			done : function(data){
				appLoginPost();
			}
		};
		ajax.call(options);
	} */
	
	
	/*	본인인증 콜백함수 -- 원래는 정지 ,중복상태 해제 시 본인인증이 필요했지만 현재는 제거*/
	/* function okCertCallback(result){
		var data = JSON.parse(result);
		
		var today = new Date();
		var yyyy = today.getFullYear();
		var mm = today.getMonth() < 9 ? "0" + (today.getMonth() + 1) : (today.getMonth() + 1); // getMonth()
		var dd  = today.getDate() < 10 ? "0" + today.getDate() : today.getDate();
		if(parseInt(yyyy+mm+dd) - parseInt(data.RSLT_BIRTHDAY) - 140000 < 0){
			popAlert("만 14세 이상만 이용 가능합니다.", function(){location.href ="/indexLogin";});
			return;
		}
		
		//본인 인증 성공 시
		if(data.RSLT_CD == "B000"){
			$("#authJson").val(JSON.stringify(data));
			fncUpdateStat("인증되었습니다. 다시 로그인 해주세요.");
		}				
	}*/
	 
	//app인 경우 로그인 처리
	function appLoginPost(){
		if('PC' == 'APP'){
			toNativeData.func = 'onLogin';
			toNative(toNativeData);
			
			toNativeData.func = 'onFirstLaunch';
			toNativeData.callback= 'firstLaunchCallback';
			toNative(toNativeData);
		}else{
			//google analytics 호출
			login_data.method = "ABOUTPET";
			sendGtag('login');
			
			setReturnUrl();
		}
		
	}
	
	//최초 로그인 여부 체크하여 메인페이지 설정
	function firstLaunchCallback(jsonData){
		var jdata = JSON.parse(jsonData);
		if(jdata.firstLaunch == "Y" && 'PC' == 'APP'){
			//실행
			var options = {
					url : "/setMainPathInApp",
					done : function(data){
						if(data != "F") {
							toNativeData.func = "onMainPage";
							toNativeData.type = data
							toNative(toNativeData);
							
							setReturnUrl();
						}
					}
			};
			ajax.call(options); 
		}else{
			setReturnUrl();
		}
	}
	
	function setReturnUrl(){
		var returnUrl = "/shop/home/";
		if(returnUrl == ''){
			returnUrl = "/shop/home";
		}
		
		returnUrl = returnUrl.replace(/&amp;/gi, "&");
		
		//로그인이 안된상태에서 로그인이 필요한 페이지 진입 후 로그인 시 exMessage 붙는거 제거 - 2021.07.02 by dslee
		if(returnUrl.indexOf("&exMessage") > -1){
			returnUrl = returnUrl.substring(0, returnUrl.indexOf("&exMessage")-1);
		}
		
		if(isTag != '' && isTag == "no_tag"){
			returnUrl='/join/indexTag?returnUrl='+returnUrl;   
		}
		
		if(bizNo != "" && bizNo > 0){
			returnUrl = "/log/home";
		}
		
		if( ( !gsptUseYn || gsptUseYn == "N" ) && gsptStateCd == null ){
			var config = {
				callBack : function(){
					//App이고 영상상세에서 진입시 onNewPage 호출로 수정
					var decodeReUrl = decodeURIComponent(returnUrl);
					if("false" == "true" && decodeReUrl.indexOf("/tv/series/indexTvDetail") > -1){
						var reUrl;
						if(decodeReUrl.indexOf("http") == -1){
							reUrl = "https://aboutpet.co.kr"+decodeReUrl;
						}else{
							reUrl = decodeReUrl;
						}
						// 데이터 세팅
						toNativeData.func = "onNewPage";
						toNativeData.type = "TV";
						toNativeData.url = reUrl;
						// 호출
						toNative(toNativeData);
						
						//history.go(-1);
						//storageHist.goBack();
						storageHist.getOut("/indexLogin");
					}else{
						//location.href = returnUrl;
						storageHist.goBack(decodeReUrl);
					}
				}
				,	okCertCallBack : function(data){
					//App이고 영상상세에서 진입시 onNewPage 호출로 수정
					var decodeReUrl = decodeURIComponent(returnUrl);
					if("false" == "true" && decodeReUrl.indexOf("/tv/series/indexTvDetail") > -1){
						var reUrl;
						if(decodeReUrl.indexOf("http") == -1){
							reUrl = "https://aboutpet.co.kr"+decodeReUrl;
						}else{
							reUrl = decodeReUrl;
						}
						// 데이터 세팅
						toNativeData.func = "onNewPage";
						toNativeData.type = "TV";
						toNativeData.url = reUrl;
						// 호출
						toNative(toNativeData);
						
						//history.go(-1);
						//storageHist.goBack();
						storageHist.getOut("/indexLogin");
					}else{
						//location.href = returnUrl;
						storageHist.goBack(decodeReUrl);
					}
				}
				,	ncb : function (){
					var decodeReUrl = decodeURIComponent(returnUrl);
					//App이고 영상상세에서 진입시 onNewPage 호출로 수정
					if("false" == "true" && decodeReUrl.indexOf("/tv/series/indexTvDetail") > -1){
						var reUrl;
						if(decodeReUrl.indexOf("http") == -1){
							reUrl = "https://aboutpet.co.kr"+decodeReUrl;
						}else{
							reUrl = decodeReUrl;
						}
						// 데이터 세팅
						toNativeData.func = "onNewPage";
						toNativeData.type = "TV";
						toNativeData.url = reUrl;
						// 호출
						toNative(toNativeData);
						
						//history.go(-1);
						//storageHist.goBack();
						storageHist.getOut("/indexLogin");
					}else{
						//location.href = returnUrl;
						storageHist.goBack(decodeReUrl);
					}
				}
			};
			gk.open(config);
		}else{
			//App이고 영상상세에서 진입시 onNewPage 호출로 수정
			var decodeReUrl = decodeURIComponent(returnUrl);
			if("false" == "true" && decodeReUrl.indexOf("/tv/series/indexTvDetail") > -1){
				var reUrl;
				if(decodeReUrl.indexOf("http") == -1){
					reUrl = "https://aboutpet.co.kr"+decodeReUrl;
				}else{
					reUrl = decodeReUrl;
				}
				// 데이터 세팅
				toNativeData.func = "onNewPage";
				toNativeData.type = "TV";
				toNativeData.url = reUrl;
				// 호출
				toNative(toNativeData);
				
				//history.go(-1);
				//storageHist.goBack();
				storageHist.getOut("/indexLogin");
			}else{
				//location.href = returnUrl;
				storageHist.goBack(decodeReUrl);
			}
		}
	}
	
	function appSettingInfosCallBack(result){
		var appSettingData = JSON.parse(result);
		var mainPage = appSettingData.mainPage;
		
		if(mainPage == "TV")		appReturnUrl = "/tv/home";
		else if(mainPage == "LOG")	appReturnUrl = "/log/home";
		else if(mainPage == "SHOP")	appReturnUrl = "/shop/home";
		
	}

	function goBack(){
		var returnUrl = "/shop/home/";
		
		//App이고 영상상세에서 진입시 onNewPage 호출로 수정
		var decodeReUrl = decodeURIComponent(returnUrl);
		if("false" == "true" && decodeReUrl.indexOf("/tv/series/indexTvDetail") > -1){
			var reUrl;
			if(decodeReUrl.indexOf("http") == -1){
				reUrl = "https://aboutpet.co.kr"+decodeReUrl;
			}else{
				reUrl = decodeReUrl;
			}
			// 데이터 세팅
			toNativeData.func = "onNewPage";
			toNativeData.type = "TV";
			toNativeData.url = reUrl;
			// 호출
			toNative(toNativeData);
			
			//storageHist.goBack();
			storageHist.getOut("/indexLogin");
		}else{
			if(returnUrl.indexOf("indexLive") > -1 ){
				storageHist.goBack(decodeReUrl);
			}else{
				//storageHist.goBack();
				storageHist.getOut("/indexLogin");
			}
		}
		
//			if(appReturnUrl != "") location.href = appReturnUrl;
//			else location.href = "/tv/home";
	}
	
	
</script>





</head>
<body>
<%@
include file="./sidebar.jsp"

%>



<!--  <form action="/jspPro/AboutPet/logon.pet">
id:<input type="text"  name="id"/><br>
passwd:<input type="text"  name="passwd"/><br>
<input type="submit" /><br>
</form>
<p></p>  -->

 <main class="container page login srch" id="container">

			<div class="inr" style="min-height: 354px;">
				<!-- 본문 -->
				<div class="contents" id="contents">
					<!-- PC 타이틀 모바일에서 제거  -->
					<div class="pc-tit">
						<h2>로그인</h2>
					</div>
					<!-- // PC 타이틀 모바일에서 제거  -->
					<div class="fake-pop">
						<form action="logon.do" id="login_form">
						<div class="pct">
							<div class="poptents">
							
								<!-- 회원 정보 입력 -->
								<input type="hidden" name="mbrNo" id="mbrNo"> 
								<input type="hidden" name="mbrStatCd" id="mbrStatCd"> 
								<input type="hidden" name="authJson" id="authJson"> 
								<input type="hidden" name="deviceToken" id="appPushToken"> 
								<input type="hidden" id="deviceTpCd" name="deviceTpCd" value="DEVICE_TYPE">
				
								<input type="hidden" id="RSAModulus" value="b103f8b789a584aa1c4eaae0a29982142935a891ffc3df5f027b197da64ce7c9456f31de64f7c13ca97d5452d17c38e323184f86589cc69241648eca4035153b8fba1a6952d7331541fa6e1af97f1ce2fa1e2cfbb69e2dd8f31c3095914ad928551f568ca2800e18d54853ed9e171cadf2d415a2324012e92af8876c20ab72b9">
								<input type="hidden" id="RSAExponent" value="10001">


							
								<div class="member-input">
									<ul class="list">
										<li>
										
											<div class="input">
												
												<input type="text" class="ipt" name="id" id="login_login_id" placeholder="아이디" autocomplete="new-password" maxlength="40" style="padding-right: 29px;">
											    
											</div>
										</li>
										<li>
											<div class="input">											
												<input type="password" class="ipt" name="passwd" id="login_password" placeholder="비밀번호" autocomplete="new-password" maxlength="15">
											</div>
											
											<p class="validation-check" id="newErrMsg" style="display: none;">아이디 또는 비밀번호를 다시 확인해주세요</p>
										</li>
									</ul>
								</div>
								
								<!-- // 회원 정보 입력 -->
							</div>
						</div>
						<div class="check-wrap">
							<label class="checkbox">
								<input type="checkbox" name="keepYn" id="keepYn" value="Y" checked="checked"><span class="txt">아이디 저장</span>
							</label>
						</div>
						</form>
						<div class="pbt pull">
							<div class="btnSet" id="inactiveBtn">
								<a href="javascript:;" class="btn lg gray">로그인</a>
							</div>
							<div class="btnSet" id="activeBtn" style="display:none;">
								<a href="javascript:login();" class="btn lg a" data-content="" data-url="">로그인</a>
							</div>
							
						</div>
						
						<div class="lnk-set">
							<a href="/login/indexFindId" data-content="" data-url="/login/indexFindId">아이디 찾기</a>
							<a href="/login/indexFindPswd" data-content="" data-url="/login/indexFindId">비밀번호 찾기</a>
							<a href="sign_up.jsp" data-content="" data-url="/login/indexFindId">회원가입</a>
						</div>
						<dl class="sns-set mt50">
							<dt>간편 로그인</dt>
							<dd>
								<span><a class="naver" href="javascript:snsLogin(10);" data-content="" data-url="">네이버</a></span>
								<span><a class="kakao" href="javascript:snsLogin(20);" data-content="" data-url="">카카오톡</a></span>
								<span><a class="google" href="javascript:snsLogin(30);" data-content="" data-url="">구글</a></span>
								<span><a class="apple" href="javascript:snsLogin(40);" data-content="" data-url="">애플</a></span>
							</dd>
						</dl>
					</div>
				</div>

			</div>
		</main>


<%@
include file="./footer.jsp"

%>

<script>
if ('<%= request.getParameter("logon")%>'=='fail') {
	history.replaceState({}, null, location.pathname);
	$("#newErrMsg").show();
	
}


</script>

</body>
</html>