<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
    #notice-full{ /* 전체 요소를 담고 있는 div */
        width: 80%;
        height: 100%;
        margin: auto;
        border: solid white;
        border-radius: 45px; 
    }

    #notice-title{ /* 제목을 담고 있는 div Id */
        width: 100%;
        height: 15%;
    }

    #notice-title1 { width: 100%; height: 60%; float: left; }
    #notice-title2 { width: 100%; height: 20%; float: left; }


    #notice-content { /* 공지사항 내용를 담고 있는 div Id */
        width: 100%;
        height: 85%;
    }

    #notice-content-sm { /* #notice-content안의 공지사항 내용만 담을 수 있는 div */
        width: 70%;
        height: 100%;
        margin: auto;
        padding-top: 50px;
        font-size: 20px;
        word-spacing: 7px;
        letter-spacing: 1px;
    }

    #notice-title1>p {  /* 공지사항 제목 글씨와 관련된 CSS */
        width: 100%;
        height: 100%;
        font-size: 40px;
        text-align: center;
        line-height: 135px;
    }

    #notice-title2>p { /* 작성일 & 조회수 글씨와 관련된 CSS */
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
                       <div id="notice-full">
                          <div id="notice-title">
                                    <div id="notice-title1">
                                       <p>안녕하세요</p>
                                    </div>
                                    <div id="notice-title2">
                                        <p>작성일 : 2022-05-10 &emsp;|&emsp;조회수 : 100</p>
                                    </div>
                           
                                    <div class="form-button" style="margin-left: 1300px;">
                                    <a href="" class="btn btn-warning">수정</a>
                                    <a href="" class="btn btn-danger">삭제</a>
                                    <a href="" class="btn btn-info">목록</a>
                                    </div>
                          </div>

                                <hr style="background:white; height:1px; border:0;">

                          <div id="notice-content" style="height:800px;">
                              <div id="notice-content-sm">
                                        <p>
                                               내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용
                                               <br>
                                               내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용내용이 들어갈 자리용
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