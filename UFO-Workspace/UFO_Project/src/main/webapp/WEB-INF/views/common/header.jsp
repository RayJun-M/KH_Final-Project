<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header</title>

    <!-- CSS 스타일시트 -->
    <link rel="stylesheet" href="resources/css/headerFooterCss.css">
</head>

<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

    <!-- 헤더 영역 -->
    <div id="header_container">

        <!-- 헤더 로고 -->
        <div id="header_logo_container">
            <a href="<%= request.getContextPath() %>">
                <img id="header_logo" src="resources/image/common/main-logo_dark.png">
            </a>
        </div>

        <!-- 헤더 메뉴 -->
        <div id="header_menu_container">
            <ul>
                <li class="main_menu">
                    <a href="">드라마</a>
                </li>
                <li class="main_menu">
                    <a href="">TV 프로그램</a>
                </li>
                <li class="main_menu">
                    <a href="">고객센터</a>
                    <ul class="sub_menu">
                        <li>
                            <a href="">공지사항</a>
                        </li>
                        <li>
                            <a href="">FAQ</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <div id="header_empty_container"></div>

        <!-- 헤더 검색 -->
        <div id="header_search_container">
            <form action="" id="header_search_form">
                <i class='fa-solid fa-magnifying-glass'></i>
                <input type="search" name="search" id="header_search_input" placeholder="제목, 감독 및 출연진으로 검색해보세요">
                <button type="button" id="header_search_btn">
                    <i class='fa-solid fa-magnifying-glass'></i>
                </button>
            </form>
        </div>

        <div id="header_theme_container">
            <input class="check" id="theme_cb" type="checkbox">
            <label for="theme_cb">
                <div id="theme_btn_container">
                    <i class="fa-solid fa-circle-half-stroke" id="theme_btn"></i>
                </div>
            </label>
        </div>
        
       <c:choose>
     	  <c:when test="${ empty loginUser }">
		      <!-- 로그인 전 임시 -->
		      <div id="header_profile_container">
		            <ul>
		                <li class="main_menu login_menu">
		                    <a href="">
		                        <img id="member_profile" src="resources/image/user/profile/login.png">
		                    </a>
		                    <ul class="sub_menu mypage_menu">
		                        <li id="header_userInfo">
		                            <a href="">
		                                <img id="member_profile" src="resources/image/user/profile/bonobono.png">
		                                <p> 로그인 임시</p>
		                            </a>
		                        </li>
		                        <li>
		                            <a href="loginForm.me">로그인</a>
		                        </li>
		                    </ul>
		                </li>
		            </ul>
		        </div>
          </c:when>
          <c:otherwise>
			<!-- 로그인 후 -->
	        <div id="header_profile_container">
	            <ul>
	                <li class="main_menu login_menu">
	                    <a href="">
	                        <img id="member_profile" src="resources/image/user/profile/profile1.jfif">
	                    </a>
	                    <ul class="sub_menu mypage_menu">
	                        <li id="header_userInfo">
	                            <a href="">
	                                <img id="member_profile" src="resources/image/user/profile/profile1.jfif">
	                                <p>${loginUser.userNickname} 님</p>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="myPage.me">마이페이지</a>
	                        </li>
	                        <li>
	                            <a href="payment.pay">이용권</a>
	                        </li>
	                        <li>
	                            <a href="logout.me">로그아웃</a>
	                        </li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	        </c:otherwise>
	     </c:choose>

    </div>

    <script>
        $(function() {

            // 검색 버튼 클릭 시
            $('#header_search_btn').click(function() {

                // 아이콘 변경
                $(this).children().toggleClass("fa-x");

                // 메뉴 숨김
                $('#header_empty_container').toggleClass("active");

                // 검색창 활성화
                $('#header_search_container').toggleClass("active");
            });
        });
    </script>

</body>
</html>