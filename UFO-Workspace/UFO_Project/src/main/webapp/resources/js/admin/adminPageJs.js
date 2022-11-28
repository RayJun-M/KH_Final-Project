$(() => {

    if($('#admin_mypage_navi').hasClass("member")) {

        // 회원 관리 탭 선택한 경우 효과 적용
        $('#admin_mypage_navi .member').addClass("active");
        $('#admin_mypage_navi>div:not(.member)').removeClass("active");

    } else if($('#admin_mypage_navi').hasClass("contents")) {

        // 콘텐츠 관리 탭 선택한 경우 효과 적용
        $('#admin_mypage_navi .contents').addClass("active");
        $('#admin_mypage_navi>div:not(.contents)').removeClass("active");

    } else if($('#admin_mypage_navi').hasClass("review")) {

        // 별점 · 코멘트 관리 탭 선택한 경우 효과 적용
        $('#admin_mypage_navi .review').addClass("active");
        $('#admin_mypage_navi>div:not(.review)').removeClass("active");

    } else if($('#admin_mypage_navi').hasClass("payment")) {

        // 이용권 관리 탭 선택한 경우 효과 적용
        $('#admin_mypage_navi .payment').addClass("active");
        $('#admin_mypage_navi>div:not(.payment)').removeClass("active");

    } else if($('#admin_mypage_navi').hasClass("community")) {

        // 커뮤니티 관리 탭 선택한 경우 효과 적용
        $('#admin_mypage_navi .community').addClass("active");
        $('#admin_mypage_navi>div:not(.community)').removeClass("active");

    } else if($('#admin_mypage_navi').hasClass("notice")) {

        // 고객센터 관리 탭 선택한 경우 효과 적용
        $('#admin_mypage_navi .notice').addClass("active");
        $('#admin_mypage_navi>div:not(.notice)').removeClass("active");

    } else {

        // 통계 관리 탭 선택한 경우 효과 적용
        $('#admin_mypage_navi .sales').addClass("active");
        $('#admin_mypage_navi>div:not(.sales)').removeClass("active");
    }
});