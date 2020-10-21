<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<script>
	function boardSearch(){
		searchform.submit();
	}
</script>
<style>
	.centered { display: table; margin-left: auto; margin-right: auto; }
</style>
</head>
<body class="centered">

	<h1 style="text-align:center;">BoardList.jsp</h1>
	<form action="boardsearch" method="get" name="searchform">
		<select id="searchtype" name="searchtype">
			<option value="searchtitle">제목</option>
			<option value="searchwriter">작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어립력">
		<input type="hidden" name="page" value="${paging.page}">
		<input type="hidden" name="order" value="${paging.order}">
		<input type="button" onclick="boardSearch()" value="검색">
	</form>
	<p><a href="boardlist?page=${paging.page}&order=BNUMBER&searchtype=${paging.searchtype}&keyword=${paging.keyword}">글번호</a> / 
	<a href="boardlist?page=${paging.page}&order=BHITS&searchtype=${paging.searchtype}&keyword=${paging.keyword}">조회수</a></p>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>작성자</td>
			<td>글제목</td>
			<td>작성일자</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="board" items="${boardList}" >
			<tr>
				<td>${board.bnumber}</td>
				<td><a
					href="memberview?mid=${board.bwriter}" onclick="popup('${board.bwriter}')">${board.bwriter}</a></td>
				<td><a
					href="boardview?bnumber=${board.bnumber}&page=${paging.page}&order=${paging.order}&searchtype=${paging.searchtype}&keyword=${paging.keyword}">${board.btitle}</a></td>
				<td>${board.bdate}</td>
				<td>${board.bhits}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><button onclick="location.href='boardwriteform'">글쓰기</button><button onclick="location.href='goMain'">메인으로</button> </td>
		</tr>
	</table>

	<!-- 페이징 처리 -->
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="boardlist?page=${paging.page-1}&order=${paging.order}&searchtype=${paging.searchtype}&keyword=${paging.keyword}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="boardlist?page=${i}&order=${paging.order}&searchtype=${paging.searchtype}&keyword=${paging.keyword}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${paging.page>=paging.maxPage}">
		[다음]
	</c:if>
	
	<c:if test="${paging.page<paging.maxPage}">
		<a href="boardlist?page=${paging.page+1}&order=${paging.order}&searchtype=${paging.searchtype}&keyword=${paging.keyword}">[다음]</a>
	</c:if>

</body>
</html>