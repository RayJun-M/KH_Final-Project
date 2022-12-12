<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<!-- char.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"; type="text/javascript"></script>

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
    	margin-bottom: 3%;
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
    
	/* 관리 버튼탭 효과 */
	#admin_stat_navi button {
		height: 70px;
		border: 1px solid #64FFDA;
		background-color: rgb(23, 26, 33);
		color: white;
		font-weighr: bold;
		font-size: 20px;
		padding: 20px;
		margin-left: 50px;
	}
	
	/* 차트 효과 */
	#char1, #char2 {
		background-color: white;
		margin-left: 10%;
		margin-top: 50px;
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
	                <td width="220"><img src="resources/image/member/profile0.png" width="170" height="170"></td>
	                <td width="380" style="font-size:50px; font-weight:900;">관리자</td>
	            </tr>
	        </table>
	    	
		    <div id="admin_mypage_navi">
		        <div><a href="admin_list.me">회원 관리</a></div>
		        <div><a href="">콘텐츠 관리</a></div>
		        <div><a href="">코멘트 관리</a></div>
		        <div><a href="">이용권 관리</a></div>       
		        <div><a href="">신고 관리</a></div>
		        <div id="selected_tab"><a href="admin_stat.st">통계 관리</a></div>
			</div>
			
			<div id="admin_stat_navi">
				<button type="button" id="salesStat">매출 통계</button>
				<button type="button" id="viewsStat">시청 통계</button>
			</div>
			
			<div id="chartArea">
				<canvas id="char1" width="800" height="500"></canvas>
				<canvas id="char2" width="800" height="500"></canvas>
			</div>
			
			<script>
				$("#chartArea").hide();
				
				// 매출통계 버튼 클릭시..
				$("#salesStat").one("click", function() {
					$("#viewsStat").css("background-color", "rgb(23, 26, 33)");
					$("#salesStat").css("background-color", "gray");
					$("#chartArea").show();
					selectSalesPerMonth();
					selectSalesPerMonthOnce();
					selectSalesPerMonthSub();
					selectSalesPerYear();
					selectSalesPerYearOnce();
					selectSalesPerYearSub();
				});
				
				// 시청통계 버튼 클릭시..
				$("#viewsStat").one("click", function() {
					$("#salesStat").css("background-color", "rgb(23, 26, 33)");
					$("#viewsStat").css("background-color", "gray");
					$("#chartArea").show();
					selectViewsMovie();
					selectViewsTV();
				})
				
				// 월별 매출 합
				function selectSalesPerMonth() {
					$.ajax({
						url : "salesPerMonth.st",
						data : {},
						type : "get",
						success : function(result) {
							
							var labels = chartdataM.labels;
							var data = chartdataM.datasets[0].data;
							
							result.forEach(function(el) {
								
								labels.push(el.dateRange);
								data.push(el.total);
							});
							
							var chartBar = new Chart(ctxM, {
								type: "bar",
							    data: chartdataM,
							    options: chartOptionsM
							});
						},
						error : function() {
							console.log("ajax 통신 실패");
						}
					})
				}
				// 한달이용권
				function selectSalesPerMonthOnce() {
					$.ajax({
						url : "salesPerMonthOnce.st",
						data : {},
						type : "get",
						success : function(result) {
							
							var labels = chartdataM.labels;
							var data = Array.from({length: labels.length}, () => 0);
							console.log(labels);
							result.forEach(function(el) {
								console.log(el.dateRange);
								console.log(labels.indexOf(el.dateRange));
								console.log(el.total);
								data.splice(labels.indexOf(el.dateRange), 1, el.total);
							
							});
							chartdataM.datasets[1].data = data;
							
							var chartBar = new Chart(ctxM, {
								type: "bar",
							    data: chartdataM,
							    options: chartOptionsM
							});
						},
						error : function() {
							console.log("ajax 통신 실패");
						}
					})
				}
				// 월간구독권
				function selectSalesPerMonthSub() {
					$.ajax({
						url : "salesPerMonthSub.st",
						data : {},
						type : "get",
						success : function(result) {
							
							var labels = chartdataM.labels;
							var data = Array.from({length: labels.length}, () => 0);
							console.log(labels);
							result.forEach(function(el) {
								console.log(el.dateRange);
								console.log(labels.indexOf(el.dateRange));
								console.log(el.total);
								data.splice(labels.indexOf(el.dateRange), 1, el.total);
							});
							chartdataM.datasets[2].data = data;
							
							var chartBar = new Chart(ctxM, {
								type: "bar",
							    data: chartdataM,
							    options: chartOptionsM
							});
						},
						error : function() {
							console.log("ajax 통신 실패");
						}
					})
				}
				
				
				// 연도별 매출 합
				function selectSalesPerYear() {
					$.ajax({
						url : "salesPerYear.st",
						data : {},
						type : "get",
						success : function(result) {
							
							var labels = chartdataY.labels;
							var data = chartdataY.datasets[0].data;
							
							result.forEach(function(el) {
								
								labels.push(el.dateRange);
								data.push(el.total);
							});
							
							var chartBar = new Chart(ctxY, {
								type: "bar",
							    data: chartdataY,
							    options: chartOptionsY
							});
						},
						error : function() {
							console.log("ajax 통신 실패");
						}
					})
				}
				// 한달이용권
				function selectSalesPerYearOnce() {
					$.ajax({
						url : "salesPerYearOnce.st",
						data : {},
						type : "get",
						success : function(result) {

							var labels = chartdataY.labels;
							var data = Array.from({length: labels.length}, () => 0);
							console.log(labels);
							result.forEach(function(el) {
								console.log(el.dateRange);
								console.log(labels.indexOf(el.dateRange));
								console.log(el.total);
								data.splice(labels.indexOf(el.dateRange), 1, el.total);
							
							});
							chartdataY.datasets[1].data = data;
							
							var chartBar = new Chart(ctxY, {
								type: "bar",
							    data: chartdataY,
							    options: chartOptionsY
							});
						},
						error : function() {
							console.log("ajax 통신 실패");
						}
					})
				}
				// 월간구독권
				function selectSalesPerYearSub() {
					$.ajax({
						url : "salesPerYearSub.st",
						data : {},
						type : "get",
						success : function(result) {
							
							var labels = chartdataY.labels;
							var data = Array.from({length: labels.length}, () => 0);
							console.log(labels);
							result.forEach(function(el) {
								console.log(el.dateRange);
								console.log(labels.indexOf(el.dateRange));
								console.log(el.total);
								data.splice(labels.indexOf(el.dateRange), 1, el.total);
							});
							chartdataY.datasets[2].data = data;
							
							var chartBar = new Chart(ctxY, {
								type: "bar",
							    data: chartdataY,
							    options: chartOptionsY
							});
						},
						error : function() {
							console.log("ajax 통신 실패");
						}
					})
				}
				
				
				// MOVIE 시청 통계
				function selectViewsMovie() {
					
					var genre = ["SF", "TV 영화", "가족", "공포", "다큐멘터리", "드라마", "로맨스", "모험",
							  "미스터리", "범죄", "서부", "스릴러", "애니메이션", "액션", "역사", "음악", 
							  "전쟁", "코미디", "판타지"];
					
					$.ajax({
						url : "viewsOfMoviePerGenre.st",
						data : {
							genre: genre
						},
						type : "get",
						traditional: true,
						success : function(result) {
							console.log(result);
							
							var labels = chartdataMovie.labels;
							var data = chartdataMovie.datasets[0].data;
							
							Object.keys(result).forEach(function(el) {
								
								labels.push(el);
								data.push(result[el]);
							});
							
							var chartPie = new Chart(ctxMovie, {
								type: "pie",
								data: chartdataMovie,
								options: { responsive : false }
							});
						},
						error : function() {
							console.log("ajax 통신 실패");
						}
					});
				}
				
				// TV 시청 통계
				function selectViewsTV() {
					
					var genre = ["Action & Adventure", "Kids", "News", "Reality", "Sci-Fi & Fantasy", "Soap", "Talk",
						  		"War & Politics", "가족", "다큐멘터리", "드라마", "미스터리", "범죄", "서부", "애니메이션", "코미디"];
					
					$.ajax({
						url : "viewsOfTVPerGenre.st",
						data : {
							genre: genre
						},
						type : "get",
						traditional: true,
						success : function(result) {
							console.log(result);
							
							var labels = chartdataTV.labels;
							var data = chartdataTV.datasets[0].data;
							
							Object.keys(result).forEach(function(el) {
								
								labels.push(el);
								data.push(result[el]);
							});
							
							var chartPie = new Chart(ctxTV, {
								type: "pie",
								data: chartdataTV,
								options: { responsive : false }
							});
						},
						error : function() {
							console.log("ajax 통신 실패");
						}
					});
				}
				
				
				//------- 매출 통계 차트 -------
				var ctxM = document.getElementById("char1"); // 월별
				var ctxY = document.getElementById("char2") // 연도별
				// 차트데이터(월별)
				var chartdataM = {
					    labels: [],
					    datasets: [
					    	{
					        	label: "합계",
					        	type: "line",
					        	lineTension: 0.1,
					        	borderColor: "yellow",
					        	data: []
					        }, {
					            label: "한달이용권",
					            lineTension: 0.1,
					            borderColor: 'rgba(255, 99, 132, 0.1)',
					            backgroundColor: '#2196F3',
					            pointBorderColor: "rgba(75,192,192,1)",
					            pointBorderWidth: 1,
					            pointHoverRadius: 5,
					            pointHoverBackgroundColor: "rgba(75,192,192,1)",
					            pointHoverBorderColor: "rgba(220,220,220,1)",
					            pointHoverBorderWidth: 2,
					            data: []
					        }, {
					            label: "월간구독권",
					            lineTension: 0.1,
					            borderColor: 'rgba(255, 199, 132, 0.1)',
					            backgroundColor: '#4CAF50',
					            pointBorderColor: "rgba(75,192,192,1)",
					            pointBackgroundColor: "#fff",
					            pointBorderWidth: 1,
					            pointHoverRadius: 5,
					            pointHoverBackgroundColor: "rgba(75,192,192,1)",
					            pointHoverBorderColor: "rgba(220,220,220,1)",
					            pointHoverBorderWidth: 2,
					            data: []
					        }, 
					    ]
					};
					//차트 옵션 설정(월별)
					var chartOptionsM = {
					    scales: {
					        xAxes: [
					            {
					                ticks: {
					                    beginAtZero: true
					                },
					                scaleLabel: {
					                    display: true,
					                    labelString: "월",
					                    fontColor: "red"
					                },
					                stacked: true
					            }
					        ],
					        yAxes: [
					            {
					                scaleLabel: {
					                    display: true,
					                    labelString: "매출",
					                    fontColor: "red"
					                },
					                ticks: {
					                    min: 0,
					                    stepSize: 100000,
					                    autoSkip: true
					                },
					                stacked: true
					            }
					        ]
					    },
					    responsive: false
					};
					
					// 차트데이터(연도별)
					var chartdataY = {
					    labels: [],
					    datasets: [
					    	{
					        	label: "합계",
					        	type: "line",
					        	lineTension: 0.1,
					        	borderColor: "yellow",
					        	data: []
					        }, {
					            label: "한달이용권",
					            lineTension: 0.1,
					            borderColor: 'rgba(255, 99, 132, 0.1)',
					            backgroundColor: '#2196F3',
					            pointBorderColor: "rgba(75,192,192,1)",
					            pointBorderWidth: 1,
					            pointHoverRadius: 5,
					            pointHoverBackgroundColor: "rgba(75,192,192,1)",
					            pointHoverBorderColor: "rgba(220,220,220,1)",
					            pointHoverBorderWidth: 2,
					            data: []
					        }, {
					            label: "월간구독권",
					            lineTension: 0.1,
					            borderColor: 'rgba(255, 199, 132, 0.1)',
					            backgroundColor: '#4CAF50',
					            pointBorderColor: "rgba(75,192,192,1)",
					            pointBackgroundColor: "#fff",
					            pointBorderWidth: 1,
					            pointHoverRadius: 5,
					            pointHoverBackgroundColor: "rgba(75,192,192,1)",
					            pointHoverBorderColor: "rgba(220,220,220,1)",
					            pointHoverBorderWidth: 2,
					            data: []
					        }, 
					    ]
					};
					//차트 옵션 설정(연도별)
					var chartOptionsY = {
					    scales: {
					        xAxes: [
					            {
					                ticks: {
					                    beginAtZero: true
					                },
					                scaleLabel: {
					                    display: true,
					                    labelString: "년",
					                    fontColor: "red"
					                },
					                stacked: true
					            }
					        ],
					        yAxes: [
					            {
					                scaleLabel: {
					                    display: true,
					                    labelString: "매출",
					                    fontColor: "red"
					                },
					                ticks: {
					                    min: 0,
					                    stepSize: 100000,
					                    autoSkip: true
					                },
					                stacked: true
					            }
					        ]
					    },
					    responsive: false
					};
					
					// ------ 시청 통계 차트 ------
					var ctxMovie = document.getElementById("char1"); // 영화
					var ctxTV = document.getElementById("char2") // TV
					
					var chartdataMovie = {
						labels : [],
					  datasets: [{
					        	data: [],
					        	backgroundColor: ['#8B0000', '#FF6347', '#FF8C00', '#FFD700', '#BDB76B', '#9ACD32',
					        					  '#006400', '#00FA9A', '#20B2AA', '#00FFFF', '#B0E0E6', '#6495ED', 
					        					  '#0000CD', '#8A2BE2', '#FFB6C1', '#9370DB', '#EE82EE', '#F5DEB3', '#F5FFFA']
					        }]
					}
					
					var chartdataTV = {
						labels : [],
					  datasets: [{
					        	data: [],
					        	backgroundColor: ['#8B0000', '#FF6347', '#FF8C00', '#FFD700', '#BDB76B', '#9ACD32',
					        					  '#006400', '#00FA9A', '#20B2AA', '#00FFFF', '#B0E0E6', '#6495ED', 
					        					  '#0000CD', '#8A2BE2', '#FFB6C1', '#9370DB']
					        }]
					}
			</script>
			
			
        </div>


		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>