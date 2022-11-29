<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Floating Button</title>

    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- AlertifyJS 라이브러리 -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

    <!-- Google Fonts 라이브러리 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">

    <!-- Font Awesome 라이브러리 -->
    <script src="https://kit.fontawesome.com/d57af49dc3.js" crossorigin="anonymous"></script>

	<!-- CSS 스타일시트 -->
	<link rel="stylesheet" href="resources/css/common/floatingButtonCss.css">

    <!-- JavaScript 파일 -->
    <script src="resources/js/common/floatingButtonJs.js"></script>
</head>

<body>

    <c:if test="${ not empty alertMsg }">
        <script>
            alertify.alert("Ur Favorite OTT", "${ alertMsg }");
        </script>
        <c:remove var="alertMsg" scope="session" />
    </c:if>


    <!-- 플로팅 버튼 영역 -->
    <div id="floating_container">

        <!-- 상하단 이동 스크롤 버튼 영역 -->
        <div id="scroll-button_container">
            <div id="scroll-top-btn_container">
                <i class="fa-solid fa-caret-up"></i>
            </div>
            <div id="scroll-bottom-btn_container">
                <i class="fa-solid fa-caret-down"></i>
            </div>
        </div>

    </div>


    <script>

        /* ----- HappyTalk 연결 ----- */
        var ht = null;

        (function(id, scriptSrc, callback) {
            var d = document,
                tagName = 'script',
                $script = d.createElement(tagName),
                $element = d.getElementsByTagName(tagName)[0];

            $script.id = id;
            $script.async = true;
            $script.src = scriptSrc;

            if (callback) {
                $script.addEventListener('load', function (e) {
                    callback(null, e);
                }, false);
            }

            $element.parentNode.insertBefore($script, $element);
        })('happytalkSDK', 'https://design.happytalkio.com/sdk/happytalk.chat.v2.min.js', function() {
            ht = new Happytalk({
                siteId: '4000002558',
                siteName: 'Ur Favorite OTT',
                categoryId: '154913',
                divisionId: '154914'
            });
        });
    </script>

</body>
</html>