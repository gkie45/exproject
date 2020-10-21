<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.centered { display: table; margin-left: auto; margin-right: auto; }
</style>
</head>
<body class="centered">
	<h1>MemberLogin.jsp</h1>
	<form action="memberlogin" method="post" class="centered">
		<label for="mid">ID</label><br>
		<input type="text" id="mid" name="mid"><br>
		<label for="mpassword">PW</label><br>
		<input type="password" id="mpassword" name="mpassword"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>