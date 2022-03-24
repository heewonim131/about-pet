<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {

        })

    </script>
    <script type="text/javascript">
        $(function () {
            if ("PC" != "PC") {
                $("#header_pc").hide();
            }
        });

        //홈 url설정
        function fncHomeBtn() {

            var joinPath = "30";
            /* var returnUrl = "/tv/home"; */
            var returnUrl = "shop_home.do";

            if (joinPath == '20') returnUrl = 'shop_home.do' //펫샵 url 붙여주기!!!

            location.href = returnUrl;
            return;
        }

    </script>
</head>
<body>
<% int mem_code = 0;
    if (session.getAttribute("num") != null) {
        mem_code = (int) session.getAttribute("num");
    }
%>
<c:set var="mem_code" value="<%=mem_code%>"></c:set>
<c:if test='${ mem_code eq 0 }'>
    <c:import url="header.jsp"/>
</c:if>
<c:if test='${ mem_code ne 0 }'>
    <c:import url="loginheader.jsp"/>
</c:if>

<%@
        include file="./sidebar.jsp"
%>

<div class="wrap" id="wrap">
    <!-- 바디 - 여기위로 템플릿 -->
    <main class="container login srch" id="container">

        <div class="inr complete-wrap" style="min-height: 354px;">
            <div class="complete-area">
                <div class="complete">
                    <p class="txt">
                        축하합니다! <br>
                        회원가입이 완료되었습니다.<!-- <span class="sub">이제 어바웃펫을 시작해보세요!</span> -->
                    </p>

                    <div class="btn-area">
                        <a href="javascript:fncHomeBtn();" class="btn round" data-content="" data-url="">홈 바로가기<span
                                class="arrow"></span></a>
                    </div>
                </div>
                <div class="bottom">
                    <div class="item">
                        <div class="box">
                            <p class="big-txt">
                                반려동물과 <br>
                                함께하고 계신가요?</p>
                            <button class="btn add" data-content="" onclick="location.href='/my/pet/petInsertView'"
                                    data-url="/my/pet/petInsertView">마이펫 등록하기
                            </button>
                        </div>

                        <p class="sub-txt">펫 정보를 등록하시면 <span class="block">딱 맞는 콘텐츠와 상품을 추천해드릴게요.</span></p>
                    </div>
                </div>


            </div>
        </div>
    </main>
</div>

<%@
        include file="./footer.jsp"
%>
</body>
</html>