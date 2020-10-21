<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회</title>
<style>
	table{
		text-align:center;
	}
	.centered { display: table; margin-left: auto; margin-right: auto; }
</style>
</head>
<body class="centered">
	<h1 style="text-align:center;">MemberList.jsp</h1>
	<table>
		<tr>
			<td>ID</td>
			<td>NAME</td>
			<td>BIRTH</td>
			<td>EMAIL</td>
			<td>ADDRESS</td>
			<td>PHONE</td>
		</tr>
	<c:forEach var="member" items="${memberList}">
		<tr>
			<td>${member.mid}</td>
			<td><a href="memberview?mid=${member.mid}">${member.mname}</a></td>
			<td>${member.mbirth}</td>
			<td>${member.memail}</td>
			<td>${member.maddress}</td>
			<td>${member.mphone}</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>