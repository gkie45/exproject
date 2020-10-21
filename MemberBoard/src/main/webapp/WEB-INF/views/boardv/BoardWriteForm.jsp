<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰자</title>
<style>
.centered { display: table; margin-left: auto; margin-right: auto; }
</style>
</head>
<body class="centered">
	<form action="boardwrite" method="post" enctype="multipart/form-data">
		<label for="bwriter">WRITER</label><br>
		<input type="text" id="bwriter" name="bwriter" value="${sessionScope.ID}" readonly><br>
		<label for="btitle">TITLE</label><br>
		<input type="text" id="btitle" name="btitle"><br>
		<label for="bcontents">CONTENTS</label><br>
		<textarea rows="10" cols="30" id="bcontents" name="bcontents" style="resize: none;"></textarea><br>
		<label for="bfile">FILE</label><br>
		<input type="file" id="bfile" name="bfile"><br>
		<input type="submit" value="저장">
	</form>
</body>
</html>