<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>콘텐츠 전체보기 | UFO</title>

    <!-- Swiper 라이브러리 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

	<!-- CSS 스타일시트 -->
	<link rel="stylesheet" href="resources/css/contents/contentsListViewCss.css">
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

            <!-- 장르 영역 -->
            <h3 class="main_txt">장르</h3>
            <div class="genre-list_container">
                <div class="swiper genre-list_swiper">
					<div class="swiper-wrapper">
                        <c:forEach var="g" items="${ genreList }">
                            <div class="swiper-slide">
                                <c:choose>
                                    <c:when test="${ genre eq g }">
                                        <button type="button" class="active" onclick="location.href='list.con?category=${ category }&genre=${ g }'">${ g }</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" onclick="location.href='list.con?category=${ category }&genre=${ g }'">${ g }</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
            </div>

            <!-- 전체 콘텐츠 영역 -->
            <h3 class="main_txt">${ categoryName } 전체보기</h3>
            <div class="contents-tab_container">
                <c:choose>
                    <c:when test="${ sort eq 'top' }">
                        <a class="contents-tab_link top active" href="list.con?category=${ category }&sort=top">
                            <div class="contents-tab_txt">인기순</div>
                        </a>
                        <span>|</span>
                        <a class="contents-tab_link new" href="list.con?category=${ category }&sort=new">
                            <div class="contents-tab_txt">최신순</div>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a class="contents-tab_link top" href="list.con?category=${ category }&sort=top">
                            <div class="contents-tab_txt">인기순</div>
                        </a>
                        <span>|</span>
                        <a class="contents-tab_link new active" href="list.con?category=${ category }&sort=new">
                            <div class="contents-tab_txt">최신순</div>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="contents-list_container">
                <div class="swiper contents-list_swiper">
                    <div class="swiper-wrapper">
                        <c:choose>
                            <c:when test="${ category eq 'tv' }">
                                <c:forEach var="t" items="${ tvList }">
                                    <div class="swiper-slide">
                                        <a href="detail.con?category=${ category }&id=%{ t.tvId }">
                                            <c:choose>
                                                <c:when test="${ t.posterPath eq 'resources/image/contents/poster_default.png' }">
                                                    <img src="${ t.posterPath }">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="https://image.tmdb.org/t/p/w500${ t.posterPath }">
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                        <br>
                                        <span class="name">${ t.name }</span>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="m" items="${ movieList }">
                                    <div class="swiper-slide">
                                        <a href="detail.con?category=${ category }&id=%{ m.movieId }">
                                            <c:choose>
                                                <c:when test="${ t.posterPath eq 'resources/image/contents/poster_default.png' }">
                                                    <img src="${ m.posterPath }">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="https://image.tmdb.org/t/p/w500${ m.posterPath }">
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                        <br>
                                        <span class="name">${ m.title }</span>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
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
        $(() => {

            /* ----- 장르 슬라이드 ----- */
            const $genreListSwiper = new Swiper('.genre-list_swiper', {
                // 커서 형태 'grab'
                grabCursor: true,
                // 한 번에 넘길 슬라이드 수
                slidesPerGroup: 1,
                // 한 번에 표시할 슬라이드 수
                slidesPerView: 1,
                // 반응형
                breakpoints: {
                    1200: {
                        slidesPerView: 5
                    },
                    1600: {
                        slidesPerView: 6
                    },
                    1800: {
                        slidesPerView: 7
                    },
                    2000: {
                        slidesPerView: 8
                    }
                },
                // 페이징바
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                    dynamicBullets: true,
                    dynamicMainBullets: 3
                },
                // 좌우 화살표
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                }
            });

            /* ----- 전체 콘텐츠 슬라이드 ----- */
            const $contentsListSwiper = new Swiper('.contents-list_swiper', {
                // 커서 형태 'grab'
                grabCursor: true,
                // 한 번에 넘길 슬라이드 수
                slidesPerGroup: 1,
                // 한 번에 표시할 슬라이드 수
                slidesPerView: 1,
                // 여러 줄 표시
                grid: {
                    rows: 3,
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
                    clickable: true,
                    dynamicBullets: true,
                    dynamicMainBullets: 3
                },
                // 좌우 화살표
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                }
            });
        });
    </script>

</body>
</html>