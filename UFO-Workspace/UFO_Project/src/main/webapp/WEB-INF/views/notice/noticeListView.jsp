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
    #notice { 
        width: 100%; 
        height: 100%; 
        margin: auto;
        border: solid white;
        border-radius: 45px; 
        padding: 30px 30px;
    }

    #notice>div { width: 100%; }

    #noticeBtn { height: 10%;}
    #noticeTable { height: 30%;}

    .table { text-align: center; height: 5px; margin-top: 5px;}

    thead>tr { font-weight: bolder; font-size: medium; }
    
    .form-group { margin: auto;}
	.input-group { margin-left: 50px; margin-top: 10px;}
	
	.table>tbody>tr:hover {
        opacity: 0.7;
        cursor: pointer;
    }
    
    /* 페이징 처리 */
	#pagingArea {
	    width : 1000px;
	    margin : auto;
	    text-align: center;
	}
	
	#pagingArea>button {
	    background-color: #64ffda;
	    border-radius : 5px;
	    margin-left : 5px;
	    margin-right : 5px;
	    width : 40px;
	    height : 40px;
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
            
			<br><br><br><br><br>
			
            <div class="notice">
                    <div id="notice">
                        <div id="noticeBtn">
                            <div class="form-group row">
                            <p class="main_text" style="font-size: 30px; margin-left:700px;">공지사항</p>             
                            </div>
                        </div>
                        <br>
                        <br>
                        
                        <div id="noticeTable" style="margin-top:10px;">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <td style=color:white;>번호</td>
                                        <td style=color:white;>글제목</td>
                                        <td style=color:white;>작성일</td>
                                        <td style=color:white;>조회수</td>
                                    </tr>
                                </thead>
                               
                                <tbody>
										<!-- 조회된 공지사항이 적어도 한 건 이상 있을 경우 -->
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr>
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr>	                                     	
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr>  	      
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr>
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr> 
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr>
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr>    
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr>
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr> 
	                                     	<tr>
	                                     		<td style=color:white;>1</td>
	                                     		<td style=color:white;>안녕하세요</td>
	                                     		<td style=color:white;>2022.01.02</td>
	                                     		<td style=color:white;>100</td>
	                                     	</tr>                               	
                                </tbody>
                            </table>
                            
                            
                    <br><br><br><br>        
                    <div id="pagingArea">
						<button>«</button>
						<button>1</button>
						<button>2</button>
						<button>3</button>
						<button>4</button>
						<button>5</button>
						<button>»</button>
					</div>
                        
                        	<script>
                        		$(function() {
                        			
                        			$(".table>tbody>tr").click(function() {

                        				let nno = $(this).children().eq(0).text(); // -> noticeNo (String 타입)
                        				location.href = "" + nno;
                        			});
                        		});
                        	</script>
                            
                            
                            <%--
                            <!-- 페이징 처리 -->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination" style="justify-content: center;"> <!-- justify-content: center; : 페이징 가운데 정렬-->
                                    <li class="page-item">
                                    <% if(pi.getCurrentPage() != 1) { %>
                                    <a class="page-link" href="<%= contextPath %>/list.no?currentPage=<%= pi.getCurrentPage() - 1 %>" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <% } %>
                                    </li>
                                    
                                     <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
	                                
	                                	<% if(p != pi.getCurrentPage()){ %>
	                                		<li class="page-item"><a class="page-link" href="<%= contextPath %>/list.no?currentPage=<%= p %>"><%= p %></a></li>
	                                	<% } else{ %>
	                                		<!-- 현재 내가 보고 있는 페이지일 경우 버튼 클릭 안됨 -->
	                                		<li class="page-item"><a class="page-link"><%= p %></a></li>
	                                	<% } %>
	                              	<% } %>
	                              	
	                                <li class="page-item">
	                                	<% if(pi.getCurrentPage() == 1) { %>
	                                    
	                                    <% } else if(pi.getCurrentPage() != pi.getMaxPage()){%>
	                                    	<a class="page-link" href="<%= contextPath %>/list.no?currentPage=<%= pi.getCurrentPage() + 1 %>" aria-label="Next">
		                                        <span aria-hidden="true">&raquo;</span>
		                                        <span class="sr-only">Next</span>
	                                    	</a>
	                                    <% } %>
	                                </li>
	                                
                                </ul>
                            </nav>
                            --%>
                            
                        </div>
                    </div>
           </div>
           

        </div>
        

		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
    

  
    

</body>
</html>