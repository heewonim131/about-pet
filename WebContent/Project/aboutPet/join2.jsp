<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <title>aboutPet</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
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

    <link href="/_images/common/favicon.ico" rel="shrtcut icon">
    <link href="/_images/common/favicon.png" rel="apple-touch-icon-precomposed">

    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <link rel="stylesheet" type="text/css" href="./css2/jquery-ui.css">

    <!-- googole Analytics -->

    <script type="text/javascript" async=""
            src="https://storage.googleapis.com/cloud-gate-cdn/sdk/Twc.sdk.js?timestemp=1625749753220"
            charset="UTF-8"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async=""
            src="https://www.googletagmanager.com/gtag/js?id=UA-187433715-1&amp;l=dataLayer&amp;cx=c"></script>
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
    <script type="text/javascript" src="./scriptAll/googleAnalytics.js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', "G-NR86F31079");
    </script>


    <script type="text/javascript" src="./scriptAll/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="./scriptAll/jquery-ui.min.js"></script>
    <script type="text/javascript" src="./scriptAll/jquery.ui.datepicker-ko.js"></script>
    <script type="text/javascript" src="./scriptAll/jquery.blockUI.js" charset="utf-8"></script>
    <script type="text/javascript" src="./scriptAll/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="./scriptAll/jquery.number.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="./scriptAll/jquery.form.min.js"></script>
    <script type="text/javascript" src="./scriptAll/jquery.countdown.js"></script>
    <script type="text/javascript" src="./scriptAll/jquery.cookie.js"></script>
    <script type="text/javascript" src="./scriptAll/swiper.min.js"></script>
    <script type="text/javascript" src="./scriptAll/clipboard.min.js"></script>
    <script type="text/javascript" src="./scriptAll/common.js"></script>
    <script type="text/javascript" src="./scriptAll/popup.js"></script>
    <script type="text/javascript" src="./scriptAll/ui.js"></script>
    <script type="text/javascript" src="./scriptAll/deviceChk.js"></script>
    <!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
    <!-- kakao map -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&amp;libraries=services"></script>
    <script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/main/4.3.6/kakao.js"></script>
    <script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
    <script type="text/javascript" src="./scriptAll/kakao-map.js"></script>
    <!-- app interface -->
    <script type="text/javascript" src="./scriptAll/app-interface.js"></script>
    <!-- adbrix -->
    <script type="text/javascript" src="./scriptAll/adbrix.js"></script>
    <script type="text/javascript" src="./scriptAll/ui.mo.js"></script>
    <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&amp;submodules=geocoder"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
    <script type="text/javascript">
        //	const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* 안드로이드 계열에서 저장되는 것 막음 / javascript Ready Function에 추가 */
            /*$(document).bind("contextmenu", function(e) {
                return false;
            });*/

            document.addEventListener("contextmenu", e => {
                e.target.matches("img") && e.preventDefault()
                e.target.matches("video") && e.preventDefault()
                e.target.className == "thumb-img" && e.preventDefault()
            })
        });

        // mw/pc 자동 로그아웃 30분
        var checkActionTimeOut;
        if ('0' != '0' && 'PC' != 'APP') {
            resetLoginTimeOut();
            $(document).on('click keypress', 'body', function () {
                resetLoginTimeOut();
            });
        }

        function resetLoginTimeOut() {
            if ('0' != '0' && 'PC' != 'APP') {
                window.clearTimeout(checkActionTimeOut);
                checkActionTimeOut = setTimeout(function () {
                    location.href = "/logout/";
                }, 30 * 60 * 1000);
            }
        }


        // 설정 -> 앱 푸시 설정 토글시
        // 앱에서 호출하기 위해 공통으로 푸출
        function updateInfoRcyYn(checkYn) {
            if ("" != null && "" != "") {
                var toastText = (checkYn == "Y") ? "설정" : "해제";

                var options = {
                    url: "/updateInfoRcvYn"
                    , data: {mbrNo: "0", infoRcvYn: checkYn}
                    , done: function (result) {
                        if (result == "S") {
                            if (checkYn != "Y") {
                                ui.toast("앱 푸시 알림이" + " " + toastText + "되었어요");
                            }
                        }
                    }
                }
                ajax.call(options);
            }
        }
    </script>
    <style type="text/css">
        /* 아이폰 계열에서 저장되는 것 막음 / css 에 추가 */
        img, video {
            /* 화면을 길게 누르고 있을때 뜨는 팝업이나 액션시트를 제어 */
            -webkit-touch-callout: none;
            /* 텍스트나 이미지를 선택할 수 있게 하는 여부를 제어 */
            /*-webkit-user-select:none;*/
            /* 링크를 터치했을때 나오는 기본 영역의 색상을 제어 */
            /*-webkit-tap-highlight-color:transparent;*/
        }
    </style>

    <script>
        // 히스토리 관련 함수( 모바일 < 버튼을 위함 )
        var storageHist = {
            histCnstn: "StorageHistory",		// storage 저장 상수
            isApp: ("PC" == "APP") ? true : false,
            cnvrtFullUrl: function (url) {
                var fullUrl = url;
                if (url.indexOf('aboutpet.co.kr') < 0 && url.indexOf('localhost') < 0) {
                    fullUrl = "https://aboutpet.co.kr" + ((url.indexOf("/") != 0) ? "/" : "") + url;
                }
                return fullUrl;
            },
            sendApp: function (func, url) {		// 앱 정보 전달
                try {
                    // 데이터 세팅
                    toNativeData.func = func;
                    if (url != null && url != undefined && url != "") {
                        toNativeData.url = storageHist.cnvrtFullUrl(url);
                    } else {
                        toNativeData.url = null;
                    }
                    // 호출
                    toNative(toNativeData);
                } catch (e) {

                }
            },
            getHist: function () { 	// sessionStorage에 저장된 history 목록 확인
                var hist = sessionStorage.getItem(storageHist.StorageHistory);
                return (hist == null) ? new Array() : JSON.parse(hist);
            },
            setHist: function () {	//sessionStorage에 history 저장
                /* var sessionStorageCnt = 30; */
                var thisHistory = {
                    url: window.location.href,
                    histLength: window.history.length
                }
                var sessionHistory = storageHist.getHist();
                if (sessionHistory == null || sessionHistory.length == 0) {				// 처음 셋팅
                    var histArray = new Array();
                    histArray.push(thisHistory);
                    if (storageHist.isApp) storageHist.sendApp("onAddHistory", thisHistory.url);
                    sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(histArray));
                } else { 									// 추가
                    if (sessionHistory[sessionHistory.length - 1].histLength >= thisHistory.histLength) {	// 브라우저 뒤로가기 고려하여 히스토리 조정(뒤로가기시 해당 페이지까지 히스토리 삭제)
                        var theUrlIdx;
                        sessionHistory.forEach(function (item, index, array) {
                            if (item.url == thisHistory.url) {
                                theUrlIdx = index;
                            }
                        });
                        if (theUrlIdx != null && theUrlIdx != undefined) {
                            var removeCnt = sessionHistory.length - theUrlIdx;
                            sessionHistory.splice(theUrlIdx, removeCnt);
                            sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
                        }
                    }

                    if (sessionHistory[sessionHistory.length - 1].url != thisHistory.url) {
                        sessionHistory.push(thisHistory);
                        if (storageHist.isApp) storageHist.sendApp("onAddHistory", thisHistory.url);
                        sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
                    }
                }
            },
            replaceHist: function (url) {		// sessionStorage의 hisory 목록 replace또는 remove
                var sessionHistory = storageHist.getHist();
                sessionHistory.pop();	// remove
                if (url) {				// url 추가
                    var thisHistory = {
                        url: storageHist.cnvrtFullUrl(url),
                        histLength: window.history.length
                    }
                    sessionHistory.push(thisHistory.url);
                }
                if (storageHist.isApp) storageHist.sendApp("onReplaceHistory", url);
                sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
                return (sessionHistory.length == 0) ? "/" : sessionHistory[sessionHistory.length - 1].url;
            },
            goBack: function (url) { 		// 이전페이지 / 페이지 이동
// 		if(storageHist.isApp){
// 			storageHist.sendApp("onHistoryBack", url);
// 		}else 
                if (url) {	// url로 이동(해당 url 이후 삭제)
                    var fullUrl = storageHist.cnvrtFullUrl(url);
                    storageHist.clearUp(fullUrl);
                    location.href = fullUrl;
                } else {		// 이전페이지
                    var lastUrl = storageHist.replaceHist();
                    location.href = lastUrl;
                }
            },
            getOut: function (url) {		// 진입페이지로 이동(url을 포함하지 않는 최근 목록으로 이동)
                var lastUrl = storageHist.clearUp(url, true);
                location.href = lastUrl;
            },
            clearUp: function (url, part) {					// 해당 url까지 히스토리 목록 삭제하기 (part가 true이면 해당 url포함 목록 삭제)
                var sessionHistory = storageHist.getHist();
                var theUrlIdx;
                if (part) {		// url을 포함하고 있으면 삭제
                    sessionHistory.forEach(function (item, index, array) {
                        if (item.url.indexOf(url) == -1) {
                            theUrlIdx = index + 1;
                        }
                    });
                } else {			// 해당 url까지 삭제
                    sessionHistory.forEach(function (item, index, array) {
                        if (item.url == url) {
                            theUrlIdx = index + 1;
                        }
                    });
                }

                if (theUrlIdx != null && theUrlIdx != undefined) {
                    var removeCnt = sessionHistory.length - theUrlIdx;
                    sessionHistory.splice(theUrlIdx, removeCnt);
                    sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
                }
                return (sessionHistory.length == 0) ? "/" : sessionHistory[sessionHistory.length - 1].url;
            },
            clearHist: function () {			// history 전체 삭제
                sessionStorage.removeItem(storageHist.StorageHistory);
                if (storageHist.isApp) storageHist.sendApp("onClearHistory");
            }
        }

        // sessionStorage 저장 호출 / 메인은 clear
        var thisUrl = window.location.href;
        if (thisUrl.indexOf('/tv/home') > 0 || thisUrl.indexOf('/log/home') > 0 || thisUrl.indexOf('/shop/home') > 0 || thisUrl.indexOf('/mypage/indexMyPage') > 0) {  // history clear
            storageHist.clearHist();
            storageHist.setHist();
        } else {	// history 저장
            storageHist.setHist();
        }
        console.log("storageHist", storageHist.getHist());
    </script><!--라이브 앱과 연동을위한 JS -->
    <script src="https://sgr.aboutpet.co.kr/web/runInit/v1.js"></script>
    <script type="text/javascript">
        //검색API 클릭 이벤트(사용자 액션 로그 수집)
        function userActionLog(contId, action, url, targetUrl) {
            var mbrNo = "0";
            if (mbrNo != "0") {
                $.ajax({
                    type: 'POST'
                    , url: "/common/sendSearchEngineEvent"
                    , async: false
                    , dataType: 'json'
                    , data: {
                        "logGb": "ACTION"
                        , "mbr_no": mbrNo
                        , "section": "shop"
                        , "content_id": contId
                        , "action": action
                        , "url": (url != null && url) != '' ? url : document.location.href
                        , "targetUrl": (targetUrl != null && targetUrl != '') ? targetUrl : document.location.href
                        , "litd": ""
                        , "lttd": ""
                        , "prclAddr": ""
                        , "roadAddr": ""
                        , "postNoNew": ""
                        , "timestamp": ""
                    }
                });
            }
        }
    </script>
    <script type="text/javascript">
        function loadCornerGoodsList(dispClsfNo, dispCornNo, dispClsfCornNo, dispType, timeDeal) {
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
            if (dispType != undefined) {
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "dispType");
                hiddenField.setAttribute("value", dispType);
                form.appendChild(hiddenField);
                document.body.appendChild(form);
            }
            if (timeDeal != undefined) {
                hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "timeDeal");
                hiddenField.setAttribute("value", timeDeal);
                form.appendChild(hiddenField);
                document.body.appendChild(form);
            }
            form.submit();
        }

        function goLink(url) {
            var viewDispClsfNo = '300000173';
            if (url.indexOf("?") > -1) {
                url += "&dispClsfNo=" + viewDispClsfNo;
            } else {
                url += "?dispClsfNo=" + viewDispClsfNo;
            }
            location.href = url;
        }

        /**
         * 금액 콤마 처리
         * @param x
         * @returns {string}
         */
        function numberWithCommas(x) {
            x = String(x);
            var pattern = /(-?\d+)(\d{3})/;
            while (pattern.test(x))
                x = x.replace(pattern, "$1,$2");
            return x;
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

            if ("PC" != "PC") {
                $(".mode0").remove();
                $("#footer").remove();
            } else {
                $(".mode7").remove();
            }

            /* 완료 버튼 활성화/비활성화 */
            $(".tagBtn").click(function (e) {
                var isSelected = false;
                //선택된 버튼 하나라도 있으면 활성화
                $(".tagBtn").each(function () {
                    if ($(this).hasClass("active")) {
                        isSelected = true;
                        return;
                    }
                });

                //활성화
                if (isSelected) {
                    $("#activeBtn").show();
                    $("#inactiveBtn").hide();
                } else {
                    $("#inactiveBtn").show();
                    $("#activeBtn").hide();
                }
            });

        });

        /* 선택한 태그 맵핑 insert */
        function fncTagSelect() {
            var tagArray = "";
            $(".tagBtn").each(function () {
                //if($(this).hasClass("active")) tagArray += $(this).attr("value") +",";
                if ($(this).hasClass("active")) tagArray += $(this).text() + "/";
            });

            console.log(tagArray);
            <%	int mem_code =(int)session.getAttribute("num");%>

            var options = {
                url: "mtag.jsp"
                , type: "get"
                , data: {"itag": tagArray, "mem_code":<%=mem_code%>}
                , cache: false
                , done: function (data) {


                    location.href = "join3.jsp";
                }
            }
            /*  session
               $.ajax({
                                   url: "duplicationCheck.jsp"
                                   , dataType:"json"
                                   , type:"get"
                                   , data: params
                                   , cache:false
                                   , success:function (data){
                                      // json -> js Object 형 자동으로 변환
                                      // alert( data.count );   { "count":1 }
                                      if( data.count == 1){

                                          $("#join_login_id_error").html("이미 사용 중인 아이디에요.");
                                      }
                                      }
                                 });
            */
            ajax.call(options);
        }

        //뒤에서 오기 방지
        function noBack() {
            window.history.forward();
        }

    </script>
</head>

<body class="body login srch isPc gnb_ac" onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
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
    <input type="hidden" id="viewJsonData"
           value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">

    <!-- s : 검색 영역 -->
    <!-- e : 검색 영역 -->

    <!-- s : 본문영역 -->

    <div class="wrap" id="wrap">
        <!-- 바디 - 여기위로 템플릿 -->
        <main class="container page login srch" id="container">
            <div class="inr" style="min-height: 705px;">
                <!-- 본문 -->
                <div class="contents" id="contents">
                    <div class="pc-tit">
                        <!-- 	<h2>회원가입</h2> -->
                    </div>
                    <div class="fake-pop">
                        <div class="tag-choise">
                            <h2>
                                <span>관심 태그 선택</span> 후 어바웃펫을 시작하세요!</h2>
                            <p class="sub-txt">콘텐츠 맞춤추천을 받을 수 있어요.</p>
                            <p class="tag-txt">* 중복 선택 가능</p>
                            <div class="filter-area t2">
                                <div class="filter-item">
                                    <div class="tag">
                                        <button class="tagBtn" id="T000000001" data-content="" data-url="">강아지</button>
                                        <button class="tagBtn" id="T000000106" data-content="" data-url="">재미</button>
                                        <button class="tagBtn" id="T000000172" data-content="" data-url="">귀여움</button>
                                        <button class="tagBtn" id="T000000002" data-content="" data-url="">고양이</button>
                                        <button class="tagBtn" id="T000000308" data-content="" data-url="">다이어트</button>
                                        <button class="tagBtn" id="T000000153" data-content="" data-url="">힐링</button>
                                        <button class="tagBtn" id="T000000179" data-content="" data-url="">행동교정</button>
                                        <button class="tagBtn" id="T000000174" data-content="" data-url="">감동</button>
                                        <button class="tagBtn" id="T000000176" data-content="" data-url="">구조</button>
                                        <button class="tagBtn" id="T000000252" data-content="" data-url="">훈련</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pbt pull">
                            <div class="bts" id="inactiveBtn">
                                <a href="javascript:;" id="finbtn" class="btn lg gray" data-content=""
                                   data-url="">완료</a>
                            </div>
                            <div class="bts" id="activeBtn" style="display:none;">
                                <a href="javascript:fncTagSelect();" id="finbtn" class="btn lg a" data-content=""
                                   data-url="">완료</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

    </div>

    <!-- e : 본문영역 -->

    <!-- s : layerPop 영역 -->
    <!-- e : layerPop 영역 -->

    <!-- s : menubar 영역 -->
    <!-- e : menubar 영역 -->

    <!-- s : footer 영역 -->
    <!-- e : footer 영역 -->
</div>

</body>
</html>