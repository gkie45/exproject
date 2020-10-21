<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 상세 조회</title>
<style>
	input{
		text-align:center;
		width:400px;
		border:none;
	}
	fieldset{
		width:430px;
	}
	.centered { display: table; margin-left: auto; margin-right: auto; }
</style>
<script>
	function goupdate(pw){
		var s = prompt("비밀번호를 입력하시오.");
		if(pw == s){
			memberupdate.submit();
		}else{
			alert("비밀번호가 틀렸습니다.");
		}
	}
</script>
</head>
<body class="centered">
	<h1>MembmerView.jsp</h1>
	<form action="memberupdate" name="memberupdate" method="post">
	<fieldset>
		<input type="text" id="mid" name="mid" value="${memberView.mid}" readonly><br>
		<input type="hidden" id="mpassword" name="mpassword" value="${memberView.mpassword}" readonly>
		<input type="text" id="mname" name="mname" value="${memberView.mname}" readonly><br>
		<input type="text" id="memail" name="memail" value="${memberView.memail}" readonly><br>
		<input type="text" id="mbirth" name="mbirth" value="${memberView.mbirth}" readonly><br>
		<input type="text" id="maddress" name="maddress" value="${memberView.maddress}" readonly><br>
	</fieldset>
	</form>
	<c:if test="${sessionScope.ID eq memberView.mid}">
	<button type="button" onclick="goupdate('${memberView.mpassword}')">수정</button>
	</c:if>
	<c:if test="${sessionScope.ID eq 'admin' or sessionScope.ID eq memberView.mid}">
	<button onclick="memberdelete">삭제</button>
	</c:if>
</body>
</html>