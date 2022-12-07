<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지 별점 및 코멘트 내역</title>

	<link href="resources/css/myPageComment.css" rel="stylesheet">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
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
        	
	        <table id="user_profile">
	            <tr>
	                <td rowspan="2" width="220"><img src="" width="170" height="170"></td>
	                <td colspan="2" width="380" style="font-size:35px; font-weight:900;">//이용자닉네임//</td>
	                <td>
	                	<button type="button" onclick="location.href='updateForm.me'">회원정보 수정</button>
	                	<button type="button" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
	                </td> 
	            </tr>
	            <tr>
	                <td style="font-size:20px; color:gray; font-weight:900;">나의 이용권</td>
	                <!-- 
			                    이용권 구독을 하지 않은 경우 '사용 중인 이용권이 없습니다'
			                    라는 멘트와 함께 이용권 구독 페이지로 가는 a태그
	                -->
	                <td style="font-size:20px; font-weight:900;">사용 중인 이용권이 없습니다</td>
	                <td><button onclick="location.href='##'">이용권 구독</button></td>
	            </tr>
	        </table>
	    	
		    <!-- 이용권 구독하지 않은 경우만 나타는 구독 유도탭 -->
		    <div align="center" id="subscribe_tab">이용권을 구독하고 인기 TV프로그램과 다양한 영화를 자유롭게 시청하세요!  이용권 구독하기></div>
		    
		    <!-- !!! 본인이 맡은 탭 div에 id="selected_tab" 붙어녛기 !!!-->
		    <div id="mypage_navi">
		        <div><a href="">시청 내역</a></div>
		        <div><a href="">볼래요</a></div>
		        <div><a href="">이용권 내역</a></div>       
		        <div id="selected_tab"><a href="">별점 및 코멘트 내역</a></div>
		        <div><a href="">커뮤니티 글 내역</a></div>
		        <div><a href="">커뮤니티 댓글 내역</a></div>
			</div>

			<br>

			<div id="myComment">
				<table id="myCommentTable">
					<thead>
						<tr id="comment_head" class="line">
							<th class="comment_head1"width="5%;">선택</th>
							<th class="comment_head1" width="30%;">콘텐츠명</th>
							<th class="comment_head1" width="15%;">별점</th>
							<th class="comment_head1" width="50%">코멘트 내용</th>
						</tr>
					</thead>
					<tbody>
						<tr class="personalComment">
							<td><input type="checkbox" name="selectContent" id="selectContent"><label for="selectContent"></label></td>
							<td id="ContentName">짱구</td>
							<td id="reviewStar">★ 3.0</td>
							<td id="review_content">이 영화... 꽤 볼만해요</td>
						</tr>
						<!-- tbody 안쪽에 위의 내용을 반복 돌릴 것! 10개 이후 페이징 여기서부터는 하드코딩 -->
						<tr  class="personalComment">
							<td><input type="checkbox" name="selectContent" id="selectContent"><label for="selectContent"></label></td>
							<td id="ContentName">헤어질 결심</td>
							<td id="reviewStar">★ 2.0</td>
							<td id="review_content">이 영화... 나만 별론가</td>
						</tr>
						<tr  class="personalComment">
							<td><input type="checkbox" name="selectContent" id="selectContent"><label for="selectContent"></label></td>
							<td id="ContentName">탑건:매버릭</td>
							<td id="reviewStar">★ 5.0</td>
							<td id="review_content">이 영화보다 엄청난 영화는 없습니다</td>
						</tr>
						<tr  class="personalComment">
							<td><input type="checkbox" name="selectContent" id="selectContent"><label for="selectContent"></label></td>
							<td id="ContentName">안녕하세요</td>
							<td id="reviewStar">★ 0.5</td>
							<td id="review_content">0.5가 아깝다</td>
						</tr>
						<tr  class="personalComment">
							<td><input type="checkbox" name="selectContent" id="selectContent"><label for="selectContent"></label></td>
							<td id="ContentName">555</td>
							<td id="reviewStar">★ 5.0</td>
							<td id="review_content">이 영화는...더보기</td>
						</tr>
						<tr  class="personalComment">
							<td><input type="checkbox" name="selectContent" id="selectContent"><label for="selectContent"></label></td>
							<td id="ContentName">666</td>
							<td id="reviewStar">★ 5.0</td>
							<td id="review_content">뭐죠 이건?</td>
						</tr>
						<tr><th colspan="4" style="text-align: right;"><button type="button" class="btn btn-danger">삭제</button></th></tr>
					</tbody>
				</table>
				
				<br><br>

				<div id="pagingArea">
					<button>«</button>
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button>4</button>
					<button>5</button>
					<button>»</button>
				</div>

			</div>

        </div>


		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>

</body>
</html>