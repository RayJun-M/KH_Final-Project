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
	
	/* 질문 스타일 */
	.question {
		cursor: pointer;
		color: white;
		font-size: 28px;
		font-weight: bold;
	}
	
	/* 답변 스타일 */
	.question>div {
		margin: 10px;
		padding: 10px;
		border-radius : 20px;
		box-sizing : border-box;
		display: none;
		/* background-color: rgb(200, 239, 252); */
		line-height: 35px;
		font-size: 17px;
		height: 150px;
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
		        <div><a href="">공지사항</a></div>
		        <div id="selected_tab"><a href="">FAQ</a></div>       
			</div>
			
            <p class="main_text" style="margin-top:100px; font-size: 50px;">FAQ</p>
            <div class="FAQ" id="FAQ">
            		<hr>
            		<div class="question" id="question1" onclick="answer1()">요금결제 / urfavoriteott 라이트 이용권이 무엇인가요?</div>
            		<hr>
            		<div id="answer1" style= display:none><p>urfavoriteott 라이트 이용권은 KT 통신사 요금제 혜택으로 제공되는 KT 전용 상품으로, 티빙 서비스 내에서 별도 구매는 어려우시며, <br> 해당되는 KT요금제 상품 안내와 적용 시점 등의 자세한 내용은 KT 홈페이지를 참고해주시기 바랍니다.</p></div> <!-- 답변 -->
            		
            		<hr>
            		<div class="question" id="question2" onclick="answer2()">요금결제 / urfavoriteott 라이트 이용권은 어떻게 등록하나요?</div>
            		<hr>
            		<div id="answer2" style= display:none><p>urfavoriteott 라이트 이용권은 KT 통신사 요금제 혜택으로 제공되는 이용권으로 관련 요금제를 사용하고 계시다면 제공받으실 수 있습니다. <br> urfavoriteott 라이트 이용권의 경우 urfavoriteott에서 별도 구매나 등록하는 방법이 아닌 KT 통신사 사이트에서 등록이 필요하신 점 참고하시어 이용에 불편 없으시길 바랍니다. </p></div> <!-- 답변 -->
            		
            		<hr>
            		<div class="question" id="question3" onclick="answer3()">회원로그인 / 이메일을 잊어버렸을경우 어떻게 해나요?</div>
            		<hr>
            		<div id="answer3" style= display:none><p>저희는 회원가입을 이메일 주소로 받기 때문에 이메일을 잊어버리셨을 경우 urfavoriteott 홈페이지에서는 찾으실수가 없습니다.</p></div> <!-- 답변 -->
            		
            		<hr>
            		<div class="question" id="question4" onclick="answer4()">요금결제 / 정기결제권 구독취소는 어떻게 해야 하나요?</div>
            		<hr>
            		<div id="answer4" style= display:none><p> 마이페이지에서 하면 됨</p></div> <!-- 답변 -->
            		
            		<hr>
            		<div class="question" id="question5" onclick="answer5()">요금결제 / 정기결제와 일반결제의 차이점은 무엇인가요?</div>
            		<hr>
            		<div id="answer5" style= display:none><p> 정기는 매달 갱신 일반결제는 한번 결제후 한달권 사용 이런식으로~~</p></div> <!-- 답변 -->
            		
            		<hr>
            		<div class="question" id="question6" onclick="answer6()">회원로그인 / 로그인이 안될경우 고객문의를 남길 수 있는 방법이 있나요?</div>
            		<hr>
            		<div id="answer6" style= display:none><p> 없음</p></div> <!-- 답변 -->
            		
            		<hr>
            		<div class="question" id="question7" onclick="answer7()">기타 / 챗봇의 기능은 무엇인가요?</div>
            		<hr>
            		<div id="answer7" style= display:none><p> 고객센터의 역할을 대신~~~~</p></div> <!-- 답변 -->
            		
            		<hr>
            		<div class="question" id="question8" onclick="answer8()">요금결제 / 일반결제도 중간에 취소가 가능한가요?</div>
            		<hr>
            		<div id="answer8" style= display:none><p> 안됨</p></div> <!-- 답변 -->
            		
            		<hr>
            		<div class="question" id="question9" onclick="answer9()">회원로그인 / 회원탈퇴를 하려는데 어떻게 해야 하나요?</div>
            		<hr>	
            		<div id="answer9" style= display:none><p> 회원관리 -> 회원탈퇴 ~~~</p></div> <!-- 답변 -->	
            		
            		<hr>
            		<div class="question" id="question10" onclick="answer10()">VOD / 영상 재생이 안되는데 어떻게 해야 하나요?</div>
            		<hr>	
            		<div id="answer10" style= display:none><p> 저도몰라유~~</p></div> <!-- 답변 -->	
           </div>
           

        </div>
        
		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
    <script>
	// 질문 클릭시 아코디언 함수
    $(function() {
        $("#question1").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer1");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
	
    $(function() {
        $("#question2").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer2");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
    
    $(function() {
        $("#question3").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer3");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
    
    $(function() {
        $("#question4").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer4");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
    
    $(function() {
        $("#question5").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer5");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
    
    $(function() {
        $("#question6").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer6");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
    
    $(function() {
        $("#question7").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer7");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
    
    $(function() {
        $("#question8").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer8");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
    
    $(function() {
        $("#question9").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer9");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
    
    $(function() {
        $("#question10").click(function() {

        	// 답변 변수 지정
            let $answer = $("#answer10");

        	// 답변 스타일 none if 문
            if($answer.css("display") == "none") { // 답변 접혀있을 때

                $(this).parent().nextAll("tr").children().children("p").slideUp(100); // 아래에 다른 답변 접기
                $(this).parent().prevAll("tr").children().children("p").slideUp(100); // 위에 다른 답변 접기
                $answer.slideDown(100); // 답변 펴기
            } else {
                $answer.slideUp(100); // 답변 다시 접기
            }
        });
    });
    </script>
    

     
    

</body>
</html>