<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UFO | 콘텐츠 등록</title>

    <!-- Swiper 라이브러리 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

	<!-- CSS 스타일시트 -->
	<link rel="stylesheet" href="resources/css/admin/adminPageContentsCss.css">
	<link rel="stylesheet" href="resources/css/admin/contentsEnrollFormCss.css">
</head>

<body>

    <!-- 전체 영역 -->
	<div class="wrap">

		<!-- 플로팅 버튼 영역 -->
		<jsp:include page="../common/floatingButton.jsp" />

		<!-- 헤더 영역 -->
		<jsp:include page="../common/header.jsp" />

        <!-- 컨텐츠 영역 -->
		<div class="content_container">

            <!-- 관리자 페이지 프로필 영역 -->
            <jsp:include page="adminPage.jsp" />

            <!-- 콘텐츠 관리 탭 영역 -->
            <div id="admin-contents-tab_container">
                <a class="admin-contents-tab_link list" href="contentsList.ad">
                    <div class="admin-contents-tab_txt">전체 콘텐츠</div>
                </a>
                <span>|</span>
                <a class="admin-contents-tab_link enroll active" href="contentsEnrollForm.ad">
                    <div class="admin-contents-tab_txt">콘텐츠 등록</div>
                </a>
            </div>

            <!-- 콘텐츠 등록 영역 -->
            <div id="admin-contents-enroll-form_container">

                <!-- 콘텐츠 검색 영역 -->
                <div id="admin-contents-search_container">
                    <h3>콘텐츠 검색</h3>
                    <input id="admin-contents-search_input" type="text" onkeyup="adminSearchContents();" name="keyword">
                </div>

                <!-- TV 프로그램 등록 영역 -->
                <div id="admin-tv-enroll_container">
                    <h3>TV 프로그램 ID 입력</h3>
                    <form action="insertTv.ad" method="get">
                        <input type="number" name="tvId" required> <br>
                        <button type="submit">등록</button>
                    </form>
                </div>

                <!-- 영화 등록 영역 -->
                <div id="admin-movie-enroll_container">
                    <h3>영화 ID 입력</h3>
                    <form action="insertMovie.ad" method="get">
                        <input type="number" name="movieId" required> <br>
                        <button type="submit">등록</button>
                    </form>
                </div>

            </div>

            <!-- 콘텐츠 검색 결과 영역 -->
            <div id="admin-contents-search-result_container">
                <div class="swiper" id="admin-contents-search-result_swiper">
                    <div class="swiper-wrapper"></div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>

        </div>

		<!-- 푸터 영역 -->
		<jsp:include page="../common/footer.jsp" />

	</div>


    <script>

        /* ----- 관리자 콘텐츠 검색 함수 ----- */
        function adminSearchContents() {

            // 검색어 인코딩 후 저장
            let keyword = encodeURIComponent($('#admin-contents-search_input').val());
            // 검색 결과 표시할 슬라이드 영역
            const $adminSearchResultWrapper = $('#admin-contents-search-result_swiper .swiper-wrapper');

            // 검색어 입력했을 때만 요청
            if(keyword.length != 0) {
                $.ajax({
                    url: "searchContentsDb.ad",
                    type: "GET",
                    data: {
                        keyword: keyword
                    },
                    success: result => {

                        // 검색 결과 표시할 슬라이드 영역 초기화
                        $adminSearchResultWrapper.empty();

                        if(result.length === 0) {

                            // 검색 결과가 없을 경우
                            $adminSearchResultWrapper.append('<p class="empty">검색 결과가 없습니다.</p>');
                        } else {

                            // 검색 결과 있을 경우 하나씩 슬라이드 생성
                            $.each(result, (i, item) => {
                                if(item.movieId == null) {

                                    // TV 프로그램인 경우
                                    $adminSearchResultWrapper.append('<div class="swiper-slide"><img src=' + item.posterPath +
                                                                     '><p>' + item.name + '</p><p>TV 프로그램</p><p>' +
                                                                     item.tvId + '</p></div>');

                                } else {

                                    // 영화인 경우
                                    $adminSearchResultWrapper.append('<div class="swiper-slide"><img src=' + item.posterPath +
                                                                     '><p>' + item.title + '</p><p>영화</p><p>' +
                                                                      item.movieId + '</p></div>');
                                }

                                const $adminSearchResultSwiper = new Swiper('#admin-contents-search-result_swiper', {
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
                        }
                    },
                    error: () => {

                        // 요청 실패한 경우 검색 결과 표시할 슬라이드 영역 초기화
                        $adminSearchResultWrapper.empty();
                    }
                });
            } else {

                // 검색어 전부 지운 경우 검색 결과 표시할 슬라이드 영역 초기화
                $adminSearchResultWrapper.empty();
            }
        }
    </script>

</body>
</html>