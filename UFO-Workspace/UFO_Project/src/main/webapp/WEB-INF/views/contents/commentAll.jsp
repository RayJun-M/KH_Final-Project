<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콘텐츠 코멘트 전체 조회 영역(더보기 클릭 시)</title>
    <link href="resources/css/commentAll.css" rel="stylesheet">
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
        <br><br>
        <div id="commentArea">
            <div id="pageInfo"><b><i><콘텐츠이름></i></b>에 대한 코멘트입니다</div>

            <br><br>

            <div id="sortList">
                <select id="sortListTab">
                    <option>최신순</option>
                    <option>별점순</option>
                </select>
            </div>

            <br><br>

            <!-- commentList를 반복 돌릴 거고 페이징 처리 -->
            <div class="commentList">
                <table class="personalComment" width="100px;">
                    <tr class="personalCommentTitle">
                        <th class="commentTitle1">드라마광</th>
                        <td class="commentTitle2"><button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button></td>
                    </tr>
                    <tr>
                        <th colspan="2"><div class="personalCommentStar">★ 3.5</div></th>
                    </tr>
                    <tr class="personalCommentContentTR">
                        <th class="personalCommentContent" colspan="2">리뷰가 길어지면 어떻게 보일지 테스트를 하고 싶은데 아무것도 떠오르는 내용이 없어서 당황스럽다 이렇게 길게 적으면 어떻게 되나요 제대로 빠져나오나요 앤퍼센트앤비에스피로 띄웠더니 줄이 바뀌는 순간 이상해지네요 그냥 들여쓰기로 생각해도되려나요? 길어졌을 때 ㅂㄹ인가? 걍 padding을 줄까 고민하게 되네요</th>
                    </tr>
                </table>
            </div>

            <br>
            <div class="commentList">
                <table class="personalComment" width="100px;">
                    <tr class="personalCommentTitle">
                        <th class="commentTitle1">드라마광</th>
                        <td class="commentTitle2"><button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button></td>
                    </tr>
                    <tr>
                        <th colspan="2"><div class="personalCommentStar">★ 3.5</div></th>
                    </tr>
                    <tr class="personalCommentContentTR">
                        <th class="personalCommentContent" colspan="2">이 영화... 꽤 볼만해요</th>
                    </tr>
                </table>
            </div>

            <br>
            <div class="commentList">
                <table class="personalComment" width="100px;">
                    <tr class="personalCommentTitle">
                        <th class="commentTitle1">드라마광</th>
                        <td class="commentTitle2"><button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button></td>
                    </tr>
                    <tr>
                        <th colspan="2"><div class="personalCommentStar">★ 3.5</div></th>
                    </tr>
                    <tr class="personalCommentContentTR">
                        <th class="personalCommentContent" colspan="2">이 영화... 꽤 볼만해요</th>
                    </tr>
                </table>
            </div>

            <br>
            <div class="commentList">
                <table class="personalComment" width="100px;">
                    <tr class="personalCommentTitle">
                        <th class="commentTitle1">드라마광</th>
                        <td class="commentTitle2"><button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button></td>
                    </tr>
                    <tr>
                        <th colspan="2"><div class="personalCommentStar">★ 3.5</div></th>
                    </tr>
                    <tr class="personalCommentContentTR">
                        <th class="personalCommentContent" colspan="2">이 영화... 꽤 볼만해요</th>
                    </tr>
                </table>
            </div>

            <br>
            <div class="commentList">
                <table class="personalComment" width="100px;">
                    <tr class="personalCommentTitle">
                        <th class="commentTitle1">드라마광</th>
                        <td class="commentTitle2"><button type="button" id="commentReport" data-toggle="modal" data-target="#commentReportModal">신고</button></td>
                    </tr>
                    <tr>
                        <th colspan="2"><div class="personalCommentStar">★ 3.5</div></th>
                    </tr>
                    <tr class="personalCommentContentTR">
                        <th class="personalCommentContent" colspan="2">이 영화... 꽤 볼만해요</th>
                    </tr>
                </table>
            </div>

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

        

             <!-- 코멘트 신고 모달창 -->
             <form id="report-form" action="" method="post" name="reportForm">
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

    </div> <!-- 전체 영역 끝 -->

</body>
</html>