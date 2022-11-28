<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header</title>

    <!-- Swiper 라이브러리 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

	<!-- CSS 스타일시트 -->
	<link rel="stylesheet" href="resources/css/common/headerFooterCss.css">

    <!-- JavaScript 파일 -->
    <script src="resources/js/common/headerFooterJs.js"></script>
</head>

<body>

    <!-- 헤더 영역 -->
    <div id="header_container">

        <!-- 로고 영역 -->
        <a id="header-logo_link" href="${ request.contextPath }">
            <div id="header-logo_container"></div>
        </a>

        <!-- 메인 메뉴 영역 -->
        <div id="header-mainmenu_container">
            <a class="header-mainmenu_link" href="list.con?category=tv">
                <div class="header-mainmenu_txt">TV 프로그램</div>
            </a>
            <a class="header-mainmenu_link" href="list.con?category=movie">
                <div class="header-mainmenu_txt">영화</div>
            </a>
            <a class="header-mainmenu_link" href="list.com">
                <div class="header-mainmenu_txt">커뮤니티</div>
            </a>
            <a class="header-mainmenu_link" id="header-mainmenu-cs_link" href="list.no">
                <div class="header-mainmenu_txt" id="header-mainmenu-cs_txt">고객센터</div>
            </a>
        </div>

        <!-- 서브 메뉴 영역 -->
        <div id="header-submenu-cs_container">
            <a class="header-submenu_link" href="list.no">
                <div class="header-submenu_txt notice">공지사항</div>
            </a>
            <a class="header-submenu_link" href="list.faq">
                <div class="header-submenu_txt faq">FAQ</div>
            </a>
        </div>

        <!-- 검색 영역 -->
        <div id="header-search_container">
            <div class="empty_container"></div>
            <button id="header-search_btn" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
            <input id="header-search_input" type="text" name="header-search" placeholder="제목 및 연출진 · 출연진으로 검색해보세요">
            <button id="header-search-esc_btn" type="button"><i class="fa-solid fa-x"></i></button>
        </div>

        <!-- 검색 결과 영역 -->
        <div id="header-search-result_container">
            <div id="header-search-result-content_container">
                <div class="swiper" id="header-search_swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000090072.jpg/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000094749.png/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caip/CAIP0900/P001583268.jpg/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000333234.jpg/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caip/CAIP0900/P000340459.jpg/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000150053.png/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caip/CAIP0900/P000895039.jpg/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000367961.jpg/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000319939.png/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caip/CAIP0900/P001065253.jpg/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caip/CAIP0900/P001585059.jpg/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000358633.png/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000183433.png/dims/resize/F_webp,400"></a>
                        </div>
                        <div class="swiper-slide">
                            <a href=""><img src="https://image.tving.com/upload/cms/caim/CAIM2100/M000362494.jpg/dims/resize/F_webp,400"></a>
                        </div>
                    </div>

                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>
        </div>

        <!-- 다크/라이트 모드 선택 영역 -->
        <div id="header-color-mode_container">
            <input id="header-color-mode_cb" type="checkbox">
            <button id="header-color-mode_btn" type="button"><i class="fa-solid fa-circle-half-stroke"></i></button>
        </div>

        <!-- 로그인 메인 메뉴 영역 -->
        <div id="header-mainmenu-login_container">
            <a class="header-mainmenu_link" id="header-mainmenu-login_link" href="loginForm.me">
                <div class="header-mainmenu_txt" id="header-mainmenu-login_txt">로그인</div>
            </a>
            <div id="header-profile_container">
                <img src="resources/image/member/profile1.png">
            </div>
        </div>

        <!-- 로그인 서브 메뉴 영역 -->
        <div id="header-submenu-login_container">
            <a class="header-submenu_link" href="loginForm.me">
                <div class="header-submenu_txt login">로그인</div>
            </a>
            <a class="header-submenu_link" href="payment.pay">
                <div class="header-submenu_txt payment">이용권</div>
            </a>
        </div>
        <div class="header-submenu-profile_container">
            <ul class="header-myprofile_ul">
                <li class="header-myprofile_li">
                    <img src="resources/image/member/profile1.png">
                    <span class="header-myinfo_container">
                        <p id="header-myinfo-name_txt">닉네임</p>
                        <a class="header-submenu_link" href="updateProfile.me">
                            <div class="header-myinfo-profile_txt">프로필 변경</div>
                        </a>
                    </span>
                </li>
            </ul>
            <a class="header-submenu_link" href="myContentsRecord.me">
                <div class="header-submenu_txt mypage">마이 페이지</div>
            </a>
            <a class="header-submenu_link" href="payment.pay">
                <div class="header-submenu_txt payment">이용권</div>
            </a>
            <a class="header-submenu_link" href="logout.me">
                <div class="header-submenu_txt logout">로그아웃</div>
            </a>
        </div>
        <div class="header-submenu-profile_container">
            <div class="header-myprofile_container">
                <img src="resources/image/member/profile0.png">
                <span class="header-nickname_txt">닉네임</span>
            </div>
            <a class="header-submenu_link" href="adminMemberList.ad">
                <div class="header-submenu_txt adminpage">관리자 페이지</div>
            </a>
            <a class="header-submenu_link" href="payment.pay">
                <div class="header-submenu_txt payment">이용권</div>
            </a>
            <a class="header-submenu_link" href="logout.me">
                <div class="header-submenu_txt logout">로그아웃</div>
            </a>
        </div>

    </div>

</body>
</html>