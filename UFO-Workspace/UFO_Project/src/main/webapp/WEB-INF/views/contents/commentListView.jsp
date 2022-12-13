<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콘텐츠 코멘트 리스트 영역</title>
    <link href="resources/css/commentListView.css" rel="stylesheet">
     <!-- jQuery 라이브러리 -->
     <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

     <!-- 부트스트랩 -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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
	   		<jsp:include page="movieDetailView.jsp" />
	
		    <div id="commentArea">
		        <br>
		        	<c:choose>
					<c:when test="${ not empty loginUser }">
						<div id="starForm">
						<!-- 유저가 쓴 별점/코멘트가 없을 때: 별점 -->
						<br><br><br>
							
							<form id="starScoreArea">
								<div id="commentTitle"><b>${ loginUser.userNickname }</b> 님, 이 콘텐츠 어떠셨나요?</div>
								<span class="star">
										★★★★★
									<span>★★★★★</span>
									<input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
								</span>
							</form>
							<br>
							<!-- 유저가 쓴 별점/코멘트가 있을 때 -->	
							<form id="starScoreArea">
								<div id="commentTitle"><b>${ loginUser.userNickname }</b> 님의 평가입니다!</div>
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
	
					</c:when>
					<c:otherwise>
						<br><br>
						<div style="text-align:center; font-size:20px;"><a href="loginForm.me">로그인</a> 후에 별점 및 코멘트를 남기실 수 있습니다.</div>
					</c:otherwise>
					</c:choose>
						
					<script>
				        const drawStar = (target) => {
				        	
		                    var score = target.value * 10;
		
		                    $(".star span").css({ width: score + "%" });
		                    
		                    
		                    
		                    console.log(score);

				        }
				    </script>
		
		        <br>
		
		        <hr>
	            
	            <div id="commentContainer">
	                <div id="commentInfo">
	                	<c:choose>
		                	<c:when test="${ not empty Movie }">
		                		<input type="hidden" name="contentsId" id="contentsId" value="1427"> <!-- ${ Movie.movieId } 대신 테스트용으로 향수 번호 넣음 -->
		                	</c:when>
		                	<c:otherwise>
		                		<input type="hidden" name="contentsId" id="contentsId" value="1427"> <!-- ${ TV.tvId } 대신 테스트용으로 향수 번호 넣음 -->
		                	</c:otherwise>
	                	</c:choose>
						<div id="commentAll">&nbsp;&nbsp;&nbsp;현재 ${ listCount }명의 UFO 이용자가 코멘트를 남겼습니다.</div>
						<div id="commentRequestAll"><a href="commentListAll.co">더보기</a>&nbsp;&nbsp;&nbsp;</div>
					</div>
	                <br><br>
	                <c:forEach var="r" items="${ list }">
		                <div class="commentList">
							<table class="personalComment" width="100px;">
								<tr class="personalCommentTitle">
									<th class="commentTitle1">&nbsp;&nbsp;&nbsp;${ r.userNickname }</th>
									<c:if test="${ not empty loginUser }">
										<td class="commentTitle2">
							                <input type="hidden" name="commentUserNo" id="commentUserNo" value="${ r.userNo }">
							                <input type="hidden" name="reviewNo" id="reviewNo" value="${ r.reviewNo }">
											<input type="hidden" name="loginUserNo" id="loginUserNo" value="${ loginUser.userNo }">
											<button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button>
										</td>
									</c:if>
								</tr>
								<tr>
									<th colspan="2"><div class="personalCommentStar">★ ${ r.reviewStar } </div></th>
								</tr>
								<tr class="personalCommentContent">
									<th colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ r.reviewContent }</th>
								</tr>
							</table>
						</div>
					</c:forEach>
	            </div>
	
		        <form id="report-form" action="reportComment.co" method="post" name="reportForm">
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
                                    <option value="욕설, 비방, 차별, 혐오" name="욕설, 비방, 차별, 혐오" selected>욕설, 비방, 차별, 혐오</option>
                                    <option value="홍보, 영리 목적" name="홍보, 영리 목적">홍보, 영리 목적</option>
                                    <option value="불법 정보" name="불법 정보">불법 정보</option>
                                    <option value="음란, 청소년 유해" name="음란, 청소년 유해">음란, 청소년 유해</option>
                                    <option value="개인 정보 노출, 유포, 거래" name="개인 정보 노출, 유포, 거래">개인 정보 노출, 유포, 거래</option>
                                    <option value="도배, 스팸" name="도배, 스팸">도배, 스팸</option>
                                  </select>
                              </div>
                              
                              <!-- Modal footer -->
                              <div class="modal-footer">
                                 <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                 <button type="button" class="btn btn-info"  id="reportSubmitButton" onclick="reportComment();">신고</button>
                                 <input type="hidden" id="form_reviewNo" name="form_reviewNo" value="">
                                 <input type="hidden" id="form_commentUserNo" name="form_commentUserNo" value="">
                                 <input type="hidden" id="form_loginUserNo" name="form_loginUserNo" value="">
                              </div>
       
			                <script>
			                
			               		$("#commentContainer").on("click", "#commentReport", function() {
			
			                   		const reviewNo = $(this).siblings("#reviewNo").val();
			                   		const commentUserNo = $(this).siblings("#commentUserNo").val();
			                   		const loginUserNo = $(this).siblings("#loginUserNo").val();
			                   		
			                   		// console.log(reviewNo);
			                   		// console.log(commentUserNo);
			                   		// console.log(loginUserNo);
			                   		
			                   		// 자바스크립트로 뽑은 값을 신고 모달창의 input type="hidden"에 각각 넣어 주기 	
			                   		$('input[name=form_reviewNo]').attr('value', reviewNo);
			                   		$('input[name=form_commentUserNo]').attr('value', commentUserNo);
			                   		$('input[name=form_loginUserNo]').attr('value', loginUserNo);
			                   		
			                   		// 값 뽑힘 확인
			                   		// const a1 = $("#form_reviewNo").val();
			                   		// const a2 = $("#form_commentUserNo").val();
			                   		// const a3 = $("#form_loginUserNo").val();
			                   		
			                   		// console.log(a1);
			                   		// console.log(a2);
			                   		// console.log(a3);
			                   	
			               		});
			               		
		                        // 모달창의 신고 버튼 누르면 action 따라서 url 옮겨라
		                        $("#reportSubmitButton").on("click", function() {
		                        	
		                        	document.getElementById("report-form").submit();
		                        	
		                        });
			                </script>
                              
                          </div>
                          </div>
                      </div>
                </form> <!-- 코멘트 신고 모달창 끝 -->

		    </div>  <!-- 댓글 영역  끝 -->
		</div>
	    
	    <!-- 푸터 영역 -->
	   	<jsp:include page="../common/footer.jsp" />
	   	
    </div> <!-- 전체 영역 끝 -->

</body>
</html>