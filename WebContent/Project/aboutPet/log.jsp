<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<meta name="theme-color" content="#ffffff">
<link rel="canonical" href="">
<meta name="author" content="" />
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
<meta property="og:image" content="/_images/common/aboutpet_logo@2x.png" />
<meta property="og:image:url" content="/_images/common/aboutpet_logo@2x.png" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="300" />
<meta property="og:image:height" content="300" />

<link href="https://aboutpet.co.kr/_images/common/favicon.ico" rel="shrtcut icon">
<link href="https://aboutpet.co.kr/_images/common/favicon.png" rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>aboutPet</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="../scriptAll/jquery-ui.css"><script async src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript"    src="../scriptAll/googleAnalytics.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', "G-NR86F31079");
</script>

<script type="text/javascript" src="../scriptAll/jquery-3.3.1.min.js" ></script>
<script type="text/javascript" src="../scriptAll/jquery-ui.min.js"></script>
<script type="text/javascript" src="../scriptAll/jquery.ui.datepicker-ko.js" ></script>
<script type="text/javascript" src="../scriptAll/jquery.blockUI.js" charset="utf-8"></script>
<script type="text/javascript" src="../scriptAll/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../scriptAll/jquery.number.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../scriptAll/jquery.form.min.js" ></script>
<script type="text/javascript" src="../scriptAll/jquery.countdown.js" ></script>
<script type="text/javascript" src="../scriptAll/jquery.cookie.js" ></script>
<script type="text/javascript" src="../scriptAll/swiper.min.js"></script>
<script type="text/javascript" src="../scriptAll/clipboard.min.js"></script>
<script type="text/javascript" src="../scriptAll/common.js" ></script>
<script type="text/javascript" src="../scriptAll/popup.js" ></script>
<script type="text/javascript" src="../scriptAll/ui.js"></script>
<script type="text/javascript" src="../scriptAll/deviceChk.js"></script>   <!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- 상담톡 -->
<script src="../scriptAll/Twc.plugin.js"></script>

<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&libraries=services"></script>
<script type="text/javascript" src="../scriptAll/kakao-map.js"></script>
<!-- app interface --> 
<script type="text/javascript" src="../scriptAll/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" src="../scriptAll/adbrix.js"></script>
<script type="text/javascript" src="../scriptAll/ui.mo.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&submodules=geocoder"></script>
<script type="text/javascript">
//   const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
</script>

</head>
<body>

<% int mem_code=0;
if(session.getAttribute("num")!=null){
   mem_code=(int)session.getAttribute("num");
}
%>
<c:set var="mem_code" value="<%=mem_code%>"></c:set> 
<c:if test='${ mem_code eq 0 }'>
<c:import url="header.jsp" />
<c:import url="log_logout.jsp"/>
</c:if>
<c:if test='${ mem_code ne 0 }'>
<c:import url="loginheader.jsp" />
<c:import url="log_login.jsp"></c:import>
</c:if>
<%@
include file="./sidebar.jsp"

%>

<%@
include file="./footer.jsp"

%>

</body>
</html>