<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ur Favorite OTT</title>

    <!-- Swiper 라이브러리 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

	<!-- CSS 스타일시트 -->
	<link rel="stylesheet" href="resources/css/mainCss.css">
</head>

<body>

    <!-- 전체 영역 -->
	<div class="wrap">

		<!-- 플로팅 버튼 영역 -->
		<jsp:include page="common/floatingButton.jsp" />

		<!-- 헤더 영역 -->
		<jsp:include page="common/header.jsp" />

		<!-- 컨텐츠 영역 -->
		<div class="content_container">

			<!-- 평균 별점 TOP 5 콘텐츠 영역 -->
			<div id="main-top-rating_container">
				<div class="swiper" id="main-top-rating_swiper">
					<div class="swiper-wrapper"></div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>
			<div class="shadow"></div>

            <!-- 실시간 인기 TOP 20 콘텐츠 영역 -->
            <h3 class="main_txt first">실시간 인기 TV 프로그램 TOP 20</h3>
            <div id="main-top-views-tv_container">
				<div class="swiper" id="main-top-views-tv_swiper">
					<div class="swiper-wrapper"></div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>
			<h3 class="main_txt">실시간 인기 영화 TOP 20</h3>
            <div id="main-top-views-movie_container">
				<div class="swiper" id="main-top-views-movie_swiper">
					<div class="swiper-wrapper"></div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>

			<!-- 시청하는 콘텐츠 영역 -->
			<c:if test="${ not empty loginUser }">
				<h3 class="main_txt record">${ loginUser.userNickname }님이 시청하는 콘텐츠</h3>
				<div id="main-record_container">
					<div class="swiper" id="main-record_swiper">
						<div class="swiper-wrapper"></div>
					</div>
				</div>
			</c:if>

            <!-- 새로 승선한 신작 모아보기 영역 -->
            <h3 class="main_txt">새로 승선한 신작 모아보기</h3>
			<div id="main-new_container">
				<div class="swiper" id="main-new_swiper">
					<div class="swiper-wrapper"></div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>

		</div>

		<!-- 푸터 영역 -->
		<jsp:include page="common/footer.jsp" />

		<input id="main-userno_input" type="hidden" name="userNo" value="${ loginUser.userNo }">

	</div>


	<script>
		$(() => {

			/* ----- 처음 로딩 시 콘텐츠 조회 함수 실행 ----- */
			$(document).ready(() => {
				topRating();
				topViewsTv();
				topViewsMovie();
				newContents();

				// 로그인 후에만 실행
				if($('#main-userno_input').val() != "") {
					contentsRecord();
				}
			});

			/* ----- 1분마다 콘텐츠 조회 함수 실행 ----- */
			var topRatingTimer = setInterval(topRating, 60000);
			var topViewsTvTimer = setInterval(topViewsTv, 60000);
			var topViewsMovieTimer = setInterval(topViewsMovie, 60000);
			var newContentsTimer = setInterval(newContents, 60000);

			// 로그인 후에만 실행
			if($('#main-userno_input').val() != "") {
				var contentsRecordTimer = setInterval(contentsRecord, 60000);
			}


			/* ----- 평균 별점 TOP 5 콘텐츠 조회 함수 ----- */
			function topRating() {

				// 조회 결과 표시할 슬라이드 영역
				const $topRatingWrapper = $('#main-top-rating_swiper .swiper-wrapper');

				$.ajax({
					url: "topRating.con",
					type: "GET",
					success: result => {

						// 조회 결과 표시할 슬라이드 영역 초기화
						$topRatingWrapper.empty();

						// 조회 결과 하나씩 슬라이드 생성
						$.each(result, (i, item) => {
							if(item.movieId == null) {

								// TV 프로그램일 경우
								if(item.backdropPath === "resources/image/contents/backdrop_default.png") {
									$topRatingWrapper.append('<div class="swiper-slide"><a href="detail.con?category=tv&id=' + item.tvId +
															 '"><img src=' + item.backdropPath + '></a></div>');
								} else {
									$topRatingWrapper.append('<div class="swiper-slide"><a href="detail.con?category=tv&id=' + item.tvId +
															 '"><img src=https://image.tmdb.org/t/p/original' + item.backdropPath + '></a></div>');
								}
							} else {

								// 영화인 경우
								if(item.backdropPath === "resources/image/contents/backdrop_default.png") {
									$topRatingWrapper.append('<div class="swiper-slide"><a href="datail.con?category=movie&id=' + item.movieId +
															 '"><img src=' + item.backdropPath + '></a></div>');
								} else {
									$topRatingWrapper.append('<div class="swiper-slide"><a href="detail.con?category=movie&id=' + item.movieId +
															 '"><img src=https://image.tmdb.org/t/p/original' + item.backdropPath + '></a></div>');
								}
							}

						});

						const $topRatingSwiper = new Swiper('#main-top-rating_swiper', {
							// 슬라이드 효과
							effect: 'fade',
							// 무한 반복
							loop: true,
							// 한 번에 넘길 슬라이드 수
							slidesPerGroup: 1,
							// 한 번에 표시할 슬라이드 수
							slidesPerView: 1,
							// 자동 재생
							autoplay: {
								delay: 5000,
								pauseOnMouseEnter: true
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
					}
				});
			};

			/* ----- 실시간 인기 TOP 20 콘텐츠 조회 함수 : TV 프로그램 ----- */
			function topViewsTv() {

				// 조회 결과 표시할 슬라이드 영역
				const $topViewsTvWrapper = $('#main-top-views-tv_swiper .swiper-wrapper');

				$.ajax({
					url: "topViewsTv.con",
					type: "GET",
					success: result => {

						// 조회 결과 표시할 슬라이드 영역 초기화
						$topViewsTvWrapper.empty();

						// 조회 결과 하나씩 슬라이드 생성
						$.each(result, (i, item) => {

							if(item.posterPath === "resources/image/contents/poster_default.png") {
								$topViewsTvWrapper.append('<div class="swiper-slide"><a href="detail.con?category=tv&id=' + item.tvId +
														  '"><img src=' + item.posterPath +
														  '></a><span><img src=resources/image/contents/' + (i + 1) +
														  '.png></span><span class="name">' + item.name + '</span></div>');
							} else {
								$topViewsTvWrapper.append('<div class="swiper-slide"><a href="detail.con?category=tv&id=' + item.tvId +
														  '"><img src=https://image.tmdb.org/t/p/w500' + item.posterPath +
														  '></a><span><img src=resources/image/contents/' + (i + 1) +
														  '.png></span><span class="name">' + item.name + '</span></div>');
							}

						});

						const $topViewsTvSwiper = new Swiper('#main-top-views-tv_swiper', {
							// 커서 형태 'grab'
							grabCursor: true,
							// 무한 반복
							loop: true,
							// 한 번에 넘길 슬라이드 수
							slidesPerGroup: 1,
							// 한 번에 표시할 슬라이드 수
							slidesPerView: 1,
							// 자동 재생
							autoplay: {
								delay: 5000,
								pauseOnMouseEnter: true
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
					}
				});
			};

			/* ----- 실시간 인기 TOP 20 콘텐츠 조회 함수 : 영화 ----- */
			function topViewsMovie() {

				// 조회 결과 표시할 슬라이드 영역
				const $topViewsMovieWrapper = $('#main-top-views-movie_swiper .swiper-wrapper');

				$.ajax({
					url: "topViewsMovie.con",
					type: "GET",
					success: result => {

						// 조회 결과 표시할 슬라이드 영역 초기화
						$topViewsMovieWrapper.empty();

						// 조회 결과 하나씩 슬라이드 생성
						$.each(result, (i, item) => {

							if(item.posterPath === "resources/image/contents/poster_default.png") {
								$topViewsMovieWrapper.append('<div class="swiper-slide"><a href="detail.con?category=movie&&id=' + item.movieId +
															 '"><img src=' + item.posterPath +
															 '></a><span><img src=resources/image/contents/' + (i + 1) +
															 '.png></span><span class="name">' + item.title + '</span></div>');
							} else {
								$topViewsMovieWrapper.append('<div class="swiper-slide"><a href="detail.con?category=movie&id=' + item.movieId +
															 '"><img src=https://image.tmdb.org/t/p/w500' + item.posterPath +
															 '></a><span><img src=resources/image/contents/' + (i + 1) +
															 '.png></span><span class="name">' + item.title + '</span></div>');
							}
						});

						const $topViewsMovieSwiper = new Swiper('#main-top-views-movie_swiper', {
							// 커서 형태 'grab'
							grabCursor: true,
							// 무한 반복
							loop: true,
							// 한 번에 넘길 슬라이드 수
							slidesPerGroup: 1,
							// 한 번에 표시할 슬라이드 수
							slidesPerView: 1,
							// 자동 재생
							autoplay: {
								delay: 5000,
								pauseOnMouseEnter: true
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
					}
				});
			};

			/* ----- 시청하는 콘텐츠 조회 함수 ----- */
			function contentsRecord() {

				// 조회 결과 표시할 슬라이드 영역
				const $contentsRecordWrapper = $('#main-record_swiper .swiper-wrapper');

				$.ajax({
					url: "contentsRecord.con",
					type: "GET",
					data: {
						userNo: $('#main-userno_input').val()
					},
					success: result => {

						// 조회 결과 표시할 슬라이드 영역 초기화
						$contentsRecordWrapper.empty();

						// 조회 결과 없으면 해당 영역 숨김
						if(result.length === 0) {
							$('h3.record').hide();
							$('#main-record_container').hide();
						}

						// 조회 결과 하나씩 슬라이드 생성
						$.each(result, (i, item) => {
							if(item.movieId == null) {

								// TV 에피소드일 경우
								if(item.posterPath === "resources/image/contents/poster_default.png") {
									$contentsRecordWrapper.append('<div class="swiper-slide"><a href="detail.con?category=episode&id=' + item.episodeId +
																'"><img src' + item.stillPath +
																'><span class="play"><i class="fa-regular fa-circle-play"></i></span></a><br><span class="name">' + item.tvId +
																'</span><br><span class="name">' + item.episodeNumber + '화</span></div>');
								} else {
									$contentsRecordWrapper.append('<div class="swiper-slide"><a href="detail.con?category=episode&id=' + item.episodeId +
																'"><img src=https://image.tmdb.org/t/p/w500' + item.stillPath +
																'><span class="play"><i class="fa-regular fa-circle-play"></i></span></a><br><span class="name">' + item.tvId +
																'</span><br><span class="name">' + item.episodeNumber + '화</span></div>');
								}
							} else {

								// 영화일 경우
								if(item.posterPath === "resources/image/contents/poster_default.png") {
									$contentsRecordWrapper.append('<div class="swiper-slide"><a href="detail.con?category=movie&id=' + item.movieId +
																'"><img src' + item.posterPath +
																'><span class="play"><i class="fa-regular fa-circle-play"></i></span></a><br><span class="name">' + item.title + '</span></div>');
								} else {
									$contentsRecordWrapper.append('<div class="swiper-slide"><a href="detail.con?category=movie&id=' + item.movieId +
																'"><img src=https://image.tmdb.org/t/p/w500' + item.posterPath +
																'><span class="play"><i class="fa-regular fa-circle-play"></i></span></a><br><span class="name">' + item.title + '</span></div>');
								}
							}
						});

						const $contentsRecordSwiper = new Swiper('#main-record_swiper', {
							// 커서 형태 'grab'
							grabCursor: true,
							// 한 번에 넘길 슬라이드 수
							slidesPerGroup: 1,
							// 한 번에 표시할 슬라이드 수
							slidesPerView: 1,
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
							}
						});
					},
				});
			};

			/* ----- 새로 승선한 신작 조회 함수 ----- */
			function newContents() {

				// 조회 결과 표시할 슬라이드 영역
				const $newContentsWrapper = $('#main-new_swiper .swiper-wrapper');

				$.ajax({
					url: "newContents.con",
					type: "GET",
					success: result => {

						// 조회 결과 표시할 슬라이드 영역 초기화
						$newContentsWrapper.empty();

						// 조회 결과 하나씩 슬라이드 생성
						$.each(result, (i, item) => {
							if(item.movieId == null) {

								// TV 프로그램일 경우
								if(item.posterPath === "resources/image/contents/poster_default.png") {
									$newContentsWrapper.append('<div class="swiper-slide"><a href="detail.con?category=tv&id=' + item.tvId +
															   '"><img src' + item.posterPath +
															   '></a><br><span class="name">' + item.name + '</span></div>');
								} else {
									$newContentsWrapper.append('<div class="swiper-slide"><a href="detail.con?category=tv&id=' + item.tvId +
															   '"><img src=https://image.tmdb.org/t/p/w500' + item.posterPath +
															   '></a><br><span class="name">' + item.name + '</span></div>');
								}
							} else {

								// 영화일 경우
								if(item.posterPath === "resources/image/contents/poster_default.png") {
									$newContentsWrapper.append('<div class="swiper-slide"><a href="detail.con?category=movie&id=' + item.movieId +
															   '"><img src' + item.posterPath +
															   '></a><br><span class="name">' + item.title + '</span></div>');
								} else {
									$newContentsWrapper.append('<div class="swiper-slide"><a href="detail.con?category=movie&id=' + item.movieId +
															   '"><img src=https://image.tmdb.org/t/p/w500' + item.posterPath +
															   '></a><br><span class="name">' + item.title + '</span></div>');
								}
							}
						});

						const $newContentsSwiper = new Swiper('#main-new_swiper', {
							// 커서 형태 'grab'
							grabCursor: true,
							// 무한 반복
							loop: true,
							// 한 번에 넘길 슬라이드 수
							slidesPerGroup: 1,
							// 한 번에 표시할 슬라이드 수
							slidesPerView: 1,
							// 자동 재생
							autoplay: {
								delay: 5000,
								pauseOnMouseEnter: true
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
					}
				});
			};
		});
	</script>

</body>
</html>