<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script>
	function boardModify(){
		boardmodify2.submit();
	}
</script>
</head>
<body>
	<h1>BoardUpdate.jsp</h1>
	<fieldset style="text-align: center; width:500px;">
		<legend>
			<strong>${boardUpdate.bnumber}번글</strong>
		</legend>
		<form action="boardmodify" method="post" name=boardmodify2>
			<input type="hidden" name="bnumber" value="${boardUpdate.bnumber}">
			<label for="bwriter">WRITER</label><br> <input type="text" id="bwriter" name="bwriter" value="${boardUpdate.bwriter}" readonly style="text-align:center;"><br>
			<label for="btitle">TITLE</label><br> <input type="text" id="btitle" name="btitle" value="${boardUpdate.btitle}" style="text-align:center;"><br>
			<label for="bcontents">CONTENTS</label><br>
			<textarea rows="10" cols="30" id="bcontents" name="bcontents" style="resize: none;">${boardUpdate.bcontents}</textarea><br>
			<input type="hidden" name="order" value="${order}">
			<input type="hidden" name="page" value="${page}">
		</form>
			<button onclick="boardModify()">저장</button>
	</fieldset>
</body>
</html>