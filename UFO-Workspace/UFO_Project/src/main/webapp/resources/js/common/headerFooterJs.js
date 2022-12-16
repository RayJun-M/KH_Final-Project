$(() => {

    /* ----- 기본 값 설정 ----- */

    // 다크 모드 적용
    $('html').attr("color-mode", "dark");


    /* ----- 브라우저 창 스크롤 이벤트 ----- */
    $(window).scroll(() => {

        if($(this).scrollTop() >= 200) {
            // 상단으로부터 100px 이상 스크롤 한 경우
            $('#header_container').css("background-color", "var(--headerBackColor1)");
        } else {
            // 상단으로부터 100px 미만 스크롤 한 경우
            $('#header_container').css("background", "linear-gradient(to bottom, var(--headerBackColor1), var(--headerBackColor2))");
        }
    });

    /* ----- 호버 이벤트 ----- */
    $('#header-mainmenu-cs_link').hover(() => {

        // 고객센터 메인 메뉴에 마우스 올린 경우 서브 메뉴 활성화
        $('#header_container').addClass("hover-cs");
    }, () => {

        // 고객센터 메인 메뉴에서 마우스 내린 경우 서브 메뉴 비활성화
        $('#header_container').removeClass("hover-cs");
    });
    $('#header-submenu-cs_container>a').hover(() => {

        // 고객센터 서브 메뉴에 마우스 올린 경우 메인 메뉴 효과 적용
        $('#header_container').addClass("hover-cs");
    }, () => {

        // 고객센터 서브 메뉴에서 마우스 내린 경우 메인 메뉴 효과 제거
        $('#header_container').removeClass("hover-cs");
    });
    $('#header-mainmenu-login_link').hover(() => {

        // 고객센터 메인 메뉴에 마우스 올린 경우 서브 메뉴 활성화
        $('#header_container').addClass("hover-login");
    }, () => {

        // 고객센터 메인 메뉴에서 마우스 내린 경우 서브 메뉴 비활성화
        $('#header_container').removeClass("hover-login");
    });
    $('#header-submenu-login_container>a').hover(() => {

        // 로그인 서브 메뉴에 마우스 올린 경우 메인 메뉴 효과 적용
        $('#header_container').addClass("hover-login");
    }, () => {

        // 로그인 서브 메뉴에서 마우스 내린 경우 메인 메뉴 효과 제거
        $('#header_container').removeClass("hover-login");
    });
    $('#header-profile_container').hover(() => {

        // 프로필 메인 메뉴에 마우스 올린 경우 서브 메뉴 활성화
        $('#header_container').addClass("hover-profile");
    }, () => {

        // 프로필 메인 메뉴에서 마우스 내린 경우 서브 메뉴 비활성화
        $('#header_container').removeClass("hover-profile");
    });
    $('.header-submenu-profile_container>a, .header-myprofile_ul').hover(() => {

        // 프로필 서브 메뉴에 마우스 올린 경우 서브 메뉴 유지
        $('#header_container').addClass("hover-profile");
    }, () => {

        // 프로필 서브 메뉴에서 마우스 내린 경우 서브 메뉴 비활성화
        $('#header_container').removeClass("hover-profile");
    });

    /* ----- 클릭 이벤트 ----- */
    $('#header-search_btn').click(() => {

        // 검색 버튼 클릭한 경우
        // 검색 활성화
        $('#header_container').addClass("search");

        // 스크롤바 비활성화
        $('html').addClass("search");
    });
    $('#header-search-esc_btn').click(() => {

        // 검색 취소 버튼 클릭한 경우
        // 검색 비활성화
        $('#header_container').removeClass("search");

        // 스크롤바 활성화
        $('html').removeClass("search");

        // 검색창 입력 값 초기화
        $('#header-search_input').val("");
    });
    $('#header-color-mode_btn').click(() => {

        // 다크/라이트 모드 선택 버튼 클릭한 경우
        if($('#header-color-mode_cb').is(":checked")) {
            // 현재 라이트 모드일 경우 다크 모드로 변경
            $('html').attr("color-mode", "dark");
            $('#header-color-mode_cb').prop("checked", false);
        } else {
            // 현재 다크 모드일 경우 라이트 모드로 변경
            $('html').attr("color-mode", "light");
            $('#header-color-mode_cb').prop("checked", true);
        }
    });

    /* ----- 검색 결과 슬라이드 ----- */
    var headerSearchSwiper = new Swiper('#header-search_swiper', {
        // 커서 형태 'grab'
        grabCursor: true,
        // 한 번에 넘길 슬라이드 수
        slidesPerGroup: 1,
        // 한 번에 표시할 슬라이드 수
        slidesPerView: 1,
        // 여러 줄 표시
        grid: {
            rows: 2,
            fill: 'row'
        },
        // 반응형
        breakpoints: {
            750: {
                slidesPerView: 2
            },
            1000: {
                slidesPerView: 3
            },
            1250: {
                slidesPerView: 4
            },
            1400: {
                slidesPerView: 5
            },
            1600: {
                slidesPerView: 6,
            }
        },
        // 페이징바
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },
        // 좌우 화살표
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        }
    });
});