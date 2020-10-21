<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.centered { display: table; margin-left: auto; margin-right: auto; }
</style>
</head>
<body class="centered">
	<h1>MemberBoard</h1>
	<a href="memberview?mid=${sessionScope.ID}">${sessionScope.ID}</a> 님 환영합니다.<br>
	<button onclick="location.href='logout'">로그아웃</button>
	<c:if test="${sessionScope.ID eq 'admin'}">
	<button onclick="location.href='memberlist'">회원목록 조회</button>
	</c:if><br><br>
	<button onclick="location.href='boardwriteform'">글쓰기</button>
	<button onclick="location.href='boardlist?order=BNUMBER&searchtype=&keyword='">글목록 조회</button>
</body>
</html>