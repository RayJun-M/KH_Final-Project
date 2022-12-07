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
		margin-left : 650px;
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
                                	<c:choose>
										<c:when test="${ empty list }">
											<tr>
	                                     		<td style=color:white; colspan="4">존재하는 공지사항이 없습니다.</td>
	                                     	</tr>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<c:forEach var="n" items="${ list }">
	                                    	<tr>
	                                     		<td style=color:white;>${ n.noticeNo }</td>
	                                     		<td style=color:white;>${ n.noticeTitle }</td>
	                                     		<td style=color:white;>${ n.noticeRegisterDate }</td>
	                                     		<td style=color:white;>${ n.noticeHit }</td>
	                                     	</tr>
	                                     	</c:forEach>
	                                    </c:otherwise>
	                                 </c:choose> 	                            	
                                </tbody>
                            </table>
                            
                  			<br><br><br><br>        
				            <div id="pagingArea">
				                <ul class="pagination">
				                   <c:choose>
				                      <c:when test="${ pi.currentPage eq 1 }">
				                         <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				                      </c:when>
				                      <c:otherwise>
				                         <li class="page-item"><a class="page-link" href="noticeList.no?cpage=${ pi.currentPage-1 }">Previous</a></li>
				                      </c:otherwise>
				                   </c:choose>
				                    
				                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				                       <li class="page-item"><a class="page-link" href="noticeList.no?cpage=${p}">${p}</a></li>
				                    </c:forEach>
				                    
				                    <c:choose>
				                      <c:when test="${ pi.currentPage eq pi.maxPage }">
				                         <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				                      </c:when>
				                      <c:otherwise>
				                         <li class="page-item"><a class="page-link" href="noticeList.no?cpage=${ pi.currentPage+1 }">Next</a></li>
				                      </c:otherwise>
				                   </c:choose>
				                </ul>
				            </div>                                        
                                         
                        	<c:if test="${ not empty list }">
                        	<script>
                        		$(function() {
                        			
                        			$(".table>tbody>tr").click(function() {
                        				
                        				location.href = "noticeDetail.no?nno=" + $(this).children().eq(0).text();
                        			});
                        		});
                        	</script>
                            </c:if>     
                            
                        </div>
                    </div>
           </div>
           

        </div>
        

		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
    

  
    

</body>
</html>