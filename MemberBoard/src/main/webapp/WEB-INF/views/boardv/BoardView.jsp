<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$("#commentWriteBtn").click(function(){
			var cwriter = $("#cwriter").val();
			var ccontents = $("#ccontents").val();
			var cbnumber = "${boardView.bnumber}";
			$.ajax({
				type : "post",
				url : "comment/commentwrite",
				data : {
						"cwriter" : cwriter,
						"ccontents" : ccontents,
						"cbnumber" : cbnumber},
				dataType : "json",
				success : function(result){
					console.log("댓글 등록 성공");
					console.log(result);
					var output = "<table>";
					for(var i in result){
						output += "<tr>";
						output += "<td>"+result[i].cwriter+" :"+"</td>";
						output += "<td>"+result[i].ccontents+"</td>";
						output += "</tr>";
					}
					output += "</table>";
						$("#commentArea").html(output);
						$("#ccontents").val("");
				},
				error : function(){
					console.log("댓글 등록 실패");
				}
			});
		});
	});
</script>
<script>
	function goupdatech(){
			boardViewform.submit();
	}
	function boarddelete(bnumber){
		console.log(bnumber);
		
		location.href="boarddelete?bnumber="+bnumber;

	}
</script>
<style>
	.centered { display: table; margin-left: auto; margin-right: auto; }
</style>
</head>
<body class="centered">
	<h1 style="text-align:center;">BoardView.jsp</h1>
	<fieldset style="text-align: center; width:500px;">
		<legend>
			<strong>${boardView.bnumber}번글</strong>
		</legend>
		<form action="boardViewform" method="post" name=boardViewform>
			<label for="bwriter">WRITER</label><br> <input type="text"
				id="bwriter" name="bwriter" value="${boardView.bwriter}" readonly style="text-align:center;"><br>
			<label for="btitle">TITLE</label><br> <input type="text"
				id="btitle" name="btitle" value="${boardView.btitle}" readonly style="text-align:center;"><br>
			<label for="bcontents">CONTENTS</label><br>
			<textarea rows="10" cols="30" id="bcontents" name="bcontents"
				style="resize: none;" readonly>${boardView.bcontents}</textarea>
			<br>
			<c:if test="${!empty boardView.bfilename}">
				<img
					src="${pageContext.request.contextPath}/resources/uploadFile/${boardView.bfilename}" style="width:300px;">
				<input type="hidden" id="bfilename" name="bfilename"
					value="${boardView.bfilename}" readonly>
				<br>
				<br>
			</c:if>
			<input type="hidden" name="order" value="${order}">
			<input type="hidden" name="page" value="${page}">
			HITS<input type="text" value="${boardView.bhits}"
				style="width: 20px;text-align:center;" readonly>DATE<input type="text"
				value="${boardView.bdate}" style="width: 110px;text-align:center;" readonly> <input
				type="hidden" id="bnumber" name="bnumber"
				value="${boardView.bnumber}"> <input type="hidden"
				id="bpassword" name="bpassword" value="${boardView.bpassword}">
		</form>
		<button onclick="location.href='boardlist?page=${page}&order=${order}&searchtype=${searchtype}&keyword=${keyword}'">목록으로</button>
		<c:if test="${sessionScope.ID eq boardView.bwriter}">
		<button onclick="goupdatech()">수정</button>
		</c:if>
		<c:if test="${sessionScope.ID eq 'admin' or sessionScope.ID eq boardView.bwriter}">
		<button onclick="boarddelete('${boardView.bnumber}')">삭제</button>
		</c:if>
		<br>
	</fieldset>
	<fieldset style="text-align: center;">
		<legend>
			<h1>댓글</h1>
		</legend>
		<div id="commentArea">
			<table>
		<c:forEach var="commentList" items="${commentList}">
				<tr>
					<td>${commentList.cwriter} :</td>
					<td>${commentList.ccontents}</td>
				</tr>
		</c:forEach>
			</table>
		</div>
		<div id="commentwrite">
			작성자 : <input type="text" id="cwriter" value="${sessionScope.ID}" readonly><br> 
			내용 : <input type="text" id="ccontents"><br>
			<button id="commentWriteBtn">댓글입력</button>
		</div>
	</fieldset>
</body>
</html>