<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콘텐츠 코멘트 리스트 영역</title>
    <link href="resources/css/commentListView.css" rel="stylesheet">
     <!-- jQuery 라이브러리 -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

     <!-- 부트스트랩 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
     <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>

	<div class="wrap">
		
		<!-- 플로팅 버튼 영역 -->
	    <jsp:include page="../common/floatingButton.jsp" />
	
		<!-- 헤더 영역 -->
	   	<jsp:include page="../common/header.jsp" />
	   	
	   	<div id="contentsArea">
	   		여기는 콘텐츠 영역입니다
	   	</div>
	   	<div>
	   	<span>회차</span>
	   	<span>코멘트</span>
	   	</div>
	
	    <div id="commentArea">
	        <br>
			<div id="starForm">
				<!-- 유저가 쓴 별점/코멘트가 없을 때: 별점 -->
				<br>
				<form id="starScoreArea">
					<div id="commentTitle"><b>유저닉네임</b> 님, 이 콘텐츠 어떠셨나요?</div>
					<span class="star">
							★★★★★
						<span>★★★★★</span>
						<input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
					</span>
				</form>
				<br>
				<!-- 유저가 쓴 별점/코멘트가 있을 때 -->	
				<form id="starScoreArea">
					<div id="commentTitle"><b>유저닉네임</b> 님의 평가입니다!</div>
					<span class="star"> ★★★★★
						<span>★★★★★</span>
						<input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
					</span>
					<br><br>
					<div id="loginUserCommentArea">
						<div id="loginUserComment">
							<textarea id="myCommentTextarea" readonly>이 영화... 대박적이다 대박적이긴 대박적인데 이것도 엄청 길게 테스트를 해 봐야 해서 무슨 말이든 해야 한다 왜냐면 그래야 길게 적었을 때 예쁘게 보일지 알 수 있고 얘도 padding을 줘야 하는 놈인지 알 수 있기 때문이다... 이렇게 코멘트를 길게 쓰는 사람이 있냐고요? 잇을수도 있지 왜 그러세요...</textarea>
						</div>
						<br>
						<button>수정</button>&nbsp;&nbsp;&nbsp;&nbsp;<button>삭제</button>
					</div>
				</form>
			</div>
	
	        <br>
	        
			<script>
		        const drawStar = (target) => {
		        	
                    var score = target.value * 10;

                    $(".star span").css({ width: score + "%" });
		        }
		    </script>
	
	        <hr>
            
            <div id="commentContainer">
                <div id="commentInfo">
					<div id="commentAll">&nbsp;&nbsp;&nbsp;현재 xx명의 UFO 이용자가 코멘트를 남겼습니다.</div>
					<div id="commentRequestAll">더보기&nbsp;&nbsp;&nbsp;</div>
				</div>
                <br><br>
                <!-- 이 div를 반복 돌릴 것! -->
                <div class="commentList">
					<table class="personalComment" width="100px;">
						<tr class="personalCommentTitle">
							<th class="commentTitle1">&nbsp;&nbsp;&nbsp;드라마광</th>
							<td class="commentTitle2"><button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button></td>
						</tr>
						<tr>
							<th colspan="2"><div class="personalCommentStar">★ 3.5</div></th>
						</tr>
						<tr class="personalCommentContent">
							<th colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 영화... 꽤 볼만해요</th>
						</tr>
					</table>
				</div>
                <div class="commentList">
					<table class="personalComment" width="100px;">
						<tr class="personalCommentTitle">
							<th class="commentTitle1">&nbsp;&nbsp;&nbsp;드라마광</th>
							<td class="commentTitle2"><button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button></td>
						</tr>
						<tr>
							<th colspan="2"><div class="personalCommentStar">★ 3.5</div></th>
						</tr>
						<tr class="personalCommentContent">
							<th colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 영화... 꽤 볼만해요</th>
						</tr>
					</table>
				</div>
                <div class="commentList">
					<table class="personalComment" width="100px;">
						<tr class="personalCommentTitle">
							<th class="commentTitle1">&nbsp;&nbsp;&nbsp;드라마광</th>
							<td class="commentTitle2"><button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button></td>
						</tr>
						<tr>
							<th colspan="2"><div class="personalCommentStar">★ 3.5</div></th>
						</tr>
						<tr class="personalCommentContent">
							<th colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 영화... 꽤 볼만해요</th>
						</tr>
					</table>
				</div>
            </div>


	
	        <form id="report-form" action="" method="post" name="reportForm">
	                         <!-- 코멘트 신고 모달창 -->
	                         <div class="modal" id="commentReportModal">
	                             <div class="modal-dialog modal-dialog-centered">
	                             <div class="modal-content">
	                             
	                                 <!-- Modal Header -->
	                                 <div class="modal-header">
	                                 <h5 class="modal-title">코멘트 신고</h5>
	                                 <button type="button" class="close" data-dismiss="modal">&times;</button>
	                                 </div>
	                                 
	                                 <!-- Modal body -->
	                                 <div class="modal-body">
	                                     <b>신고 사유</b><br>
	                                     <select name="reportReason">
	                                      <option value="사유1" selected>사유1</option>
	                                      <option value="사유2">사유2</option>
	                                      <option value="사유3">사유3</option>
	                                      <option value="사유4">사유4</option>
	                                      <option value="기타">기타</option>
	                                     </select>
	                                     
	                                 </div>
	                                 
	                                 <!-- Modal footer -->
	                                 <div class="modal-footer">
	                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                                    <button type="submit" class="btn btn-info"  id="reportSubmitButton">신고</button>
	                                 </div>
	                                 
	                                 <script>                                       
	                                       // 모달창의 신고 버튼 누르면 action 따라서 url 옮겨라
	                                       $("#reportSubmitButton").on("click", function() {
	                                           
	                                           document.getElementById("report-form").submit();
	                                       });
	                                 </script>
	                                 
	                             </div>
	                             </div>
	                         </div>
	                   </form>
	                         
	           <!-- 코멘트 신고 모달창 끝 -->
	     
	    </div>  <!-- 댓글 영역  끝 -->
	    
	    <!-- 헤더 영역 -->
	   	<jsp:include page="../common/footer.jsp" />
	   	
    </div> <!-- 전체 영역 끝 -->

</body>
</html>