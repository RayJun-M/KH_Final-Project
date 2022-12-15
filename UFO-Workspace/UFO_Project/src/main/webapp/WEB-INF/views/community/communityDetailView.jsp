<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ur Favorite OTT</title>

    <!-- jQuery 라이브러리 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- Bootstrap 프레임워크 연결 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS 스타일시트 -->
    <link rel="stylesheet" href="resources/css/noticeCss.css">

<style>
    #community-full{ /* 전체 요소를 담고 있는 div */
        width: 80%;
        height: 100%;
        margin: auto;
        border: solid white;
        border-radius: 45px; 
    }

    #community-title{ /* 제목을 담고 있는 div Id */
        width: 100%;
        height: 15%;
    }

    #community-title1 { width: 100%; height: 60%; float: left; }
    #community-title2 { width: 100%; height: 20%; float: left; }


    #community-content { /* 뉴스 기사를 담고 있는 div Id */
        width: 100%;
        height: 85%;
    }

    #community-content-sm { /* #news-content안의 뉴스 기사만 담을 수 있는 div */
        width: 75%;
        height: 100%;
        margin: auto;
        padding-top: 50px;
        font-size: 20px;
        word-spacing: 7px;
        letter-spacing: 1px;
    }

    #community-title1>p {  /* 뉴스 제목 글씨와 관련된 CSS */
        width: 100%;
        height: 100%;
        font-size: 40px;
        text-align: center;
        line-height: 135px;
    }

    #community-title2>p { /* 작성일 & 조회수 글씨와 관련된 CSS */
        width: 100%;
        height: 100%;
        text-align: left;
        font-size: medium;
        margin-left: 50px;
        margin-top: 30px;
    }

    /* 모달창 */
    #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: #48edc6;
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 450px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        #modal .title h2 {
            display: inline;
            font-size: 40px;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
            font-size: 25px;
        }
</style>
</head>

<body>

    <!-- 전체 영역 -->
    <div class="wrap">

     <!-- 플로팅 버튼 영역 -->
        <jsp:include page="../common/floatingButton.jsp" />

        <!-- 헤더 영역 -->
        <jsp:include page="../common/header.jsp" />

      
        <!-- 컨텐츠 영역 (개별 구현 구역) -->
        <div id="content_container">

            <!-- 최신 게임 -->
            <br><br><br><br><br><br><br><br>
            <div class="community">
                            <!-- 커뮤니티 게시글 틀 시작 -->
                       <div id="community-full">
                          <div id="community-title">
                                    <div id="community-title1">
                                       <p>인생 영화 등극</p>
                                    </div>
                                    <div id="community-title2">
                                        <p>작성일 : 2022-05-10 &emsp;|&emsp; 작성자 : 황혜진  &emsp;|&emsp; 조회수 : 100</p>
                                    </div>
                           
                                    <div class="form-button" style="margin-left: 1300px;">
                                    <a href="" class="btn btn-danger" id="btn-modal">신고</a>
                                    <a href="" class="btn btn-info">목록</a>
                                    </div>
                          </div>

                                <hr style="background:white; height:1px; border:0;">

                          <div id="community-content" style="height:800px;">
                              <div id="community-content-sm" style="border: 1px solid red;">
                                        <p>
                                               무조건 보세요 두 번 보세요 전 내일 또 볼 거예요
                                               <br>
                                               안 보면 후회함
                                        </p>
                              </div>
                          </div>
                      </div>
                            <!-- 커뮤니티 게시글 틀 종료 -->
           </div>
        </div>

		<!--  모달창 시작  -->
        <div id="container">
        </div>
        <div id="modal" class="modal-overlay" >
            <div class="modal-window">
                <div class="title">
                    <h2>신고 사유</h2>
                </div>
                <div class="close-area">X</div>
                <div class="content">
                <!-- 라디오 버튼 -->
                    <div class="form-check">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
					  <label class="form-check-label" for="flexRadioDefault1">
					    욕설, 비방
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
					  <label class="form-check-label" for="flexRadioDefault2">
					   홍보
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
					  <label class="form-check-label" for="flexRadioDefault2">
					   불법 정보 
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
					  <label class="form-check-label" for="flexRadioDefault2">
					   음란, 청소년 유해 
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
					  <label class="form-check-label" for="flexRadioDefault2">
					   도배, 스팸
					  </label>
					</div>
				<!-- 라디오버튼 종료 -->
                </div>
            </div>
        </div>
        <!-- 모달창 종료 -->
        
  	<script>
			const modal = document.getElementById("modal")
			
			function modalOn() {
			    modal.style.display = "flex"
			}
			
			function isModalOn() {
			    return modal.style.display === "flex"
			}
			
			function modalOff() {
			    modal.style.display = "none"
			}
			
			const btnModal = document.getElementById("btn-modal")
			
			btnModal.addEventListener("click", e => {
			    modalOn()
			})
			
			const closeBtn = modal.querySelector(".close-area")
			
			closeBtn.addEventListener("click", e => {
			    modalOff()
			})
			
			modal.addEventListener("click", e => {
			    const evTarget = e.target
			    
			    if(evTarget.classList.contains("modal-overlay")) {
			        modalOff()
			    }
			})
			
			window.addEventListener("keyup", e => {
			    if(isModalOn() && e.key === "Escape") {
			        modalOff()
			    }
			})
	</script>

      <!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>
