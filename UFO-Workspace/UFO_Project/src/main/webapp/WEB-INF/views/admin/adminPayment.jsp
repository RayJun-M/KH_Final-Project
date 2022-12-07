<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.css">
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
    	width: 16%;
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
    
	/* 박성현씨가 먹인 style */
	
	#paymentTable {
	margin:auto;
	margin-top:100px;
	}
	#paymentTable th, #paymentTable td {
		text-align: center;
	}
	.active :hover {
		cursor: pointer;
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
		        <div><a href="admin_list.me">회원 관리</a></div>
		        <div><a href="">콘텐츠 관리</a></div>
				<div><a href="">코멘트 관리</a></div>
		        <div id="selected_tab"><a href="adminPayment.pay">이용권 관리</a></div>       
		        <div><a href="">신고 관리</a></div>
		        <div><a href="admin	_stat.st">통계 관리</a></div>
			</div>

			<!-- 이곳부터 본인 화면 구현 -->

			<table id="paymentTable">
				<thead>
					<tr>
						<th width="5%">결제번호</th>
						<th colspan="2">유형</th>
						<th>사용자 아이디</th>
						<th>결제금액</th>
						<th>결제수단</th>
						<th>결제일</th>
						<th>만료일</th>
						<th>해지</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>20220711subsuser01</td>
						<td colspan="2">정기구독권&emsp;</td>
						<td>user01</td>
						<td>5,900원</td>
						<td>카드</td>
						<td>2022.07.11</td>
						<td>2022.08.10</td>
						<td><button class="btn btn-sm btn-outline-dark" style="background-color: #64FFDA;">해지</button></td>
					</tr>
					<tr>
						<td>20220711subsuser01</td>
						<td colspan="2">정기구독권&emsp;</td>
						<td>user01</td>
						<td>5,900원</td>
						<td>카드</td>
						<td>2022.07.11</td>
						<td>2022.08.10</td>
						<td><button class="btn btn-sm btn-outline-dark" style="background-color: #64FFDA;">해지</button></td>
					</tr>
					<tr>
						<td>20220711subsuser01</td>
						<td colspan="2">정기구독권&emsp;</td>
						<td>user01</td>
						<td>5,900원</td>
						<td>카드</td>
						<td>2022.07.11</td>
						<td>2022.08.10</td>
						<td><button class="btn btn-sm btn-outline-dark" style="background-color: #64FFDA;">해지</button></td>
					</tr>

					<!-- 페이징 처리 할 영역 -->





					<script>
						onload = () => { 
							let btn = document.querySelectorAll('.btn');
							let abledBtn = [];
							btn.forEach((el) => {
								if(el.disabled == false){
									abledBtn.push(el);
								}
							})
							abledBtn.forEach((el) => {
								console.log(el);
								el.addEventListener('mouseenter', () => {
									el.style.cursor = 'pointer';
								})
								el.addEventListener('mouseout', () => {
									el.style.cursor= '';
								})
								el.addEventListener('click', () => { // 해지 누르면 모달창으로 진짜 해지할건지 확인받고 ok하면 비동기처리
									if(confirm('정말 해지하시겠습니까?')){
										$.ajax({
											url: 'delete.pay',
											data: {},
											type: 'post',
											success: () => {
											},
											error: () => {
												console.log('AJAX 호출 에러 발생');
											}
										});
									}
								})
							})
						}
						
					</script>
				</tbody>
			</table>			
        </div>


		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>

</body>
</html>