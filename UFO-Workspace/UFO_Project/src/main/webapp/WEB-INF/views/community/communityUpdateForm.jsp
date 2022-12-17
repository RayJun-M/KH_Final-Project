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
    #news-full{ /* 전체 요소를 담고 있는 div */
        width: 80%;
        height: 100%;
        margin: auto;
        border: solid white;
        border-radius: 45px; 
    }

    #news-title{ /* 제목을 담고 있는 div Id */
        width: 100%;
        height: 15%;
    }

    #news-title1 { width: 100%; height: 60%; float: left; }
    #news-title2 { width: 100%; height: 20%; float: left; }


    #news-content { /* 뉴스 기사를 담고 있는 div Id */
        width: 100%;
        height: 85%;
    }

    #news-content-sm { /* #news-content안의 뉴스 기사만 담을 수 있는 div */
        width: 75%;
        height: 100%;
        margin: auto;
        padding-top: 50px;
        font-size: 20px;
        word-spacing: 7px;
        letter-spacing: 1px;
    }

    #news-title1>p {  /* 뉴스 제목 글씨와 관련된 CSS */
        width: 100%;
        height: 100%;
        font-size: 40px;
        text-align: center;
        line-height: 135px;
    }

    #news-title2>p { /* 작성일 & 조회수 글씨와 관련된 CSS */
        width: 100%;
        height: 100%;
        text-align: left;
        font-size: medium;
        margin-left: 50px;
        margin-top: 30px;
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
            <div class="notice">
                            <!-- 공지사항 게시글 틀 시작 -->
                       <div id="news-full">
                          <div id="news-title">
                                    <div id="news-title1">
                                       <p>인생 영화 등극</p>
                                    </div>
                                    <div id="news-title2">
                                        <p>작성일 : 2022-05-10 &emsp;|&emsp; 작성자 : 황혜진  &emsp;|&emsp; 조회수 : 100</p>
                                    </div>
                           
                                    <div class="form-button" style="margin-left: 1300px;">
                                    <a href="" class="btn btn-warning">수정</a>
                                    <a href="" class="btn btn-danger">삭제</a>
                                    <a href="" class="btn btn-info">목록</a>
                                    </div>
                          </div>

                                <hr style="background:white; height:1px; border:0;">

                          <div id="news-content" style="height:800px;">
                              <div id="news-content-sm" style="border: 1px solid red;">
                                        <p>
                                               무조건 보세요 두 번 보세요 전 내일 또 볼 거예요
                                               <br>
                                               안 보면 후회함
                                        </p>
                              </div>
                          </div>
                      </div>
                            <!-- 공지사항 게시글 틀 종료 -->
           </div>
        </div>

      <!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>
