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


<style>

	#content_container {
		margin-left : 8%;
		margin-right : 8%;
	}
    #content_container a {
    	text-decoration: none;
    	color: gray;
    }
    
    /* 관리자 프로필 효과 */
	#admin_profile {
		margin-top: 2%;
		margin-bottom: 2%;
	}
	
	/* 관리탭 효과 */
    #admin_mypage_navi>div {
    	display: inline-block;
    	width: 19.7%;
    	margin-top: 25px;
    	font-size: 20px;
    	padding: 10px;
		text-align: center;
    }
    #admin_mypage_navi {
    	border-bottom: 1px solid gray;
    }
    /*
    #admin_mypage_navi>div:active {
    	border-bottom:3px solid #64FFDA;
    }
    */
    #admin_mypage_navi a:hover {
    	color: white;
    }
    #selected_tab {
    	border-bottom:3px solid #64FFDA;
    }
    #selected_tab a {
    	color: white;
    	font-weight: bold;
    }
    #notice-full{ /* 전체 요소를 담고 있는 div */
        width: 100%;
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
            <table id="admin_profile">
	            <tr>
	                <td width="220"><img src="resources/image/user/profile/admin.png" width="170" height="170"></td>
	                <td width="380" style="font-size:50px; font-weight:900;">관리자</td>
	            </tr>
	        </table>
	    	
	    	<!-- !!! 본인이 맡은 탭 div에 id="selected_tab" 붙어녛기 !!!-->
            <div id="admin_mypage_navi">
		        <div id="selected_tab"><a href="adminNoticeList.no">공지사항</a></div>
		        <div><a href="adminFAQ.no">FAQ</a></div>       
			</div>
			
			<br><br><br><br><br>

			<!-- 이곳부터 본인 화면 구현 -->
            <div class="notice">     
                            <!-- 공지사항 게시글 틀 시작 -->
					 	    <div id="notice-full">
						        <div id="notice-title">
                                    <div id="notice-title1">
                                    	<p>${ n.noticeTitle }</p>
                                    </div>
                                    <div id="notice-title2">
                                        <p>작성일 : ${ n.noticeRegisterDate } &emsp;|&emsp;조회수 : ${ n.noticeHit }</p>
                                    </div>
									
                                    <div class="form-button" style="margin-left: 1400px;">
								            <a href="adminNoticeUpdateForm.no?nno=${ n.noticeNo }" class="btn btn-warning" style="color:white">수정</a>
								            <a href="adminNoticeDelete.no?nno=${ n.noticeNo }" class="btn btn-danger" style="color:white">삭제</a>
								            <a href="adminNoticeList.no" class="btn btn-info" style="color:white">목록</a>
                                    </div>
						        </div>

                                <hr style="background:white; height:1px; border:0;">

						        <div id="notice-content" style="height:800px;">
						            <div id="notice-content-sm">
                                        <p>
											${ n.noticeContent }
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