$(() => {

    /* ----- 브라우저 창 스크롤 이벤트 ----- */
    $(window).scroll(() => {

        if($(this).scrollTop() >= 300) {

            // 상단으로부터 300px 이상 스크롤 한 경우 상단 이동 스크롤 버튼 표시
            $('#scroll-top-btn_container').css("background-color", "var(--scrollbarBtnThumbBackColor)");
            $('#scroll-top-btn_container').css("color", "var(--ufoColor)");
        } else {

            // 상단으로부터 300px 미만 스크롤 한 경우 상단 이동 스크롤 버튼 숨김
            $('#scroll-top-btn_container').css("background-color", "transparent");
            $('#scroll-top-btn_container').css("color", "transparent");
        }

        if($(this).scrollTop() <= (document.documentElement.scrollHeight - 1300)) {

            // 하단으로부터 300px 이상 위치에서만 하단 이동 스크롤 버튼 표시
            $('#scroll-bottom-btn_container').css("background-color", "var(--scrollbarBtnThumbBackColor)");
            $('#scroll-bottom-btn_container').css("color", "var(--ufoColor)");
        } else {

            // 하단으로부터 300px 미만 위치에서는 하단 이동 스크롤 버튼 숨김
            $('#scroll-bottom-btn_container').css("background-color", "transparent");
            $('#scroll-bottom-btn_container').css("color", "transparent");
        }
    });


    /* ----- 클릭 이벤트 ----- */
    $('#scroll-top-btn_container').click(() => {

        // 상단 이동 스크롤 버튼 클릭 시 상단으로 이동
        $('html').animate({ scrollTop: 0 });
    });
    $('#scroll-bottom-btn_container').click(() => {

        // 하단 이동 스크롤 버튼 클릭 시 하단으로 이동
        $('html').animate({ scrollTop: document.documentElement.scrollHeight });
    });
});