<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>

	<!-- CSS 스타일시트 -->
	<link rel="stylesheet" href="resources/css/admin/adminPageCss.css">

    <!-- JavaScript 파일 -->
    <script src="resources/js/admin/adminPageJs.js"></script>
</head>

<body>

    <table id="admin_profile">
        <tr>
            <td width="220"><img src="resources/image/member/profile${ loginUser.userProfile }.png" width="170" height="170"></td>
            <td width="380" class="nickname" style="font-size:50px; font-weight:900;">${ loginUser.userNickname }</td>
        </tr>
    </table>

    <div id="admin_mypage_navi" class="${ active }">
        <div class="member"><a href="adminMemberList.ad">회원 관리</a></div>
        <div class="contents"><a href="adminContentsList.ad">콘텐츠 관리</a></div>
        <div class="review"><a href="adminReviewList.ad">별점 · 코멘트 관리</a></div>
        <div class="payment"><a href="adminPaymentList.ad">이용권 관리</a></div>
        <div class="community"><a href="adminCommunityList.ad">커뮤니티 관리</a></div>
        <div class="notice"><a href="adminNoticeList.ad">고객센터 관리</a></div>
        <div class="sales"><a href="adminSalesList.ad">통계 관리</a></div>
	</div>

</body>
</html>