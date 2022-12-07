<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 코멘트 관리</title>

	<link href="resources/css/adminReported.css" rel="stylesheet">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<!--
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.css">
-->
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
		        <div><a href="admin_list.me">회원 관리</a></div>
		        <div><a href="">콘텐츠 관리</a></div>
				<div><a href="">코멘트 관리</a></div>
		        <div><a href="">이용권 관리</a></div>       
		        <div id="selected_tab"><a href="">신고 관리</a></div>
		        <div><a href="admin_stat.st">통계 관리</a></div>
			</div>

			<!-- 이곳부터 본인 화면 구현 -->
			<div id="reportManagement">
				<br>
				<div id="reportCategory">
					<!-- 구현하는 페이지 option에 옵션 selected 넣을 것 -->
					<select id="reportPageTab">
						<option>커뮤니티 글</option>
						<option>커뮤니티 댓글</option>
						<option selected>코멘트</option>
					</select>
				</div>

				<div id="commentListAll">
					<br>
					<table id="commentTable">
						<thead>
							<tr id="comment_head" class="line">
								<th class="comment_head1" width="10%;">작성자</th>
								<th class="comment_head1" width="10%;">작성일</th>
								<th class="comment_head1" width="35%;">코멘트 내용</th>
								<th class="comment_head1" width="20%;">신고사유</th>
								<th class="comment_head1" width="8%;">신고횟수</th>
								<th class="comment_head1" width="17%;">삭제상태</th>
							</tr>
						</thead>
						<tbody>
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-12-02</td>
								<td id="review_content">ㅅㅂ... 이걸 영화라고 만들었냐</td>
								<td id="reportedReason">지나친 욕설 및 비방</td>
								<td id="reportedCount">3</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<!-- tbody 안쪽에 위의 내용을 반복 돌릴 것! 10개 이후 페이징 여기서부터는 하드코딩 -->
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-12-02</td>
								<td id="review_content">응 별로 응 별로</td>
								<td id="reportedReason">도배</td>
								<td id="reportedCount">1</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-11-29</td>
								<td id="review_content">이 제품 사고 광명 찾았습니다 www.daiso.com</td>
								<td id="reportedReason">홍보 및 영리 목적</td>
								<td id="reportedCount">6</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-11-03</td>
								<td id="review_content">이 영화 공짜로 보는 법 알려 드림 토렌트...</td>
								<td id="reportedReason">불법적인 정보</td>
								<td id="reportedCount">6</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-12-01</td>
								<td id="review_content">대충 음란성 있는 내용임</td>
								<td id="reportedReason">음란성</td>
								<td id="reportedCount">28</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-12-02</td>
								<td id="review_content">ㅅㅂ... 이걸 영화라고 만들었냐</td>
								<td id="reportedReason">지나친 욕설 및 비방</td>
								<td id="reportedCount">3</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-12-02</td>
								<td id="review_content">응 별로 응 별로</td>
								<td id="reportedReason">도배</td>
								<td id="reportedCount">1</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-11-29</td>
								<td id="review_content">이 제품 사고 광명 찾았습니다 www.daiso.com</td>
								<td id="reportedReason">홍보 및 영리 목적</td>
								<td id="reportedCount">5</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-11-03</td>
								<td id="review_content">이 영화 공짜로 보는 법 알려 드림 토렌트...</td>
								<td id="reportedReason">불법적인 정보</td>
								<td id="reportedCount">100</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
							<tr class="personalComment">
								<td id="userMail">ufo@naver.com</td>
								<td id="commentDate">2022-12-01</td>
								<td id="review_content">대충 음란성 있는 내용임</td>
								<td id="reportedReason">음란성</td>
								<td id="reportedCount">90</td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
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

				</div> <!-- commentListAll 영역 끝 -->

			</div>
			
        </div>


		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>