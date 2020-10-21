<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.centered { display: table; margin-left: auto; margin-right: auto; }
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function idOverlap() {
		var inputId = document.getElementById("mid").value;
		// ajax(Asynchronous javascript and XML)
		// JSON(JavaScript Object Notation)
		$.ajax({
			type : "post",
			url : "idoverlap",
			data : {
				"mid" : inputId
			},
			dataType : "text",
			success : function(result) {
				if (result == "OK") {
					idch.style.color = "green";
					idch.innerHTML = "사용가능한 ID 입니다.";
				} else {
					idch.style.color = "red";
					idch.innerHTML = "이미 사용된 ID 입니다.";
				}
			},
			error : function() {
				alert("ajax 실패");
			}
		});
	}
	function disappear() {
		document.getElementById("idch").innerHTML = "";
	}
	function chkPW(){

		var pw = $("#mpassword").val();
		console.log(pw);
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		 
		if(false === reg.test(pw)) {
			pwch.style.color = "red";
			document.getElementById("pwch").innerHTML = "비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다";
		}else if(/(\w)\1\1\1/.test(pw)){
			pwch.style.color = "red";
			document.getElementById("pwch").innerHTML = "같은 문자를 4번 이상 사용하실 수 없습니다.";
		 return false;
		 }else if(pw.search(/\s/) != -1){
			 pwch.style.color = "red";
			 document.getElementById("pwch").innerHTML = "비밀번호는 공백 없이 입력해주세요.";
		 return false;
		 }else if(hangulcheck.test(pw)){
			 pwch.style.color = "red";
			 document.getElementById("pwch").innerHTML = "비밀번호에 한	글을 사용 할 수 없습니다.";
		 }else {
			 pwch.style.color = "green";
			 document.getElementById("pwch").innerHTML = "사용 가능한 PW 입니다.";
		 console.log("통과");
		 }

	}
	function disappear2() {
		document.getElementById("pwch").innerHTML = "";
	}
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	function phonech(){
		var regExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		var phone = $("#mphone").val();
		if(phone.match(regExp)){
			pch.style.color="green";
			pch.innerHTML="Ok";
		}else{
			pch.style.color="red";
			pch.innerHTML="No";
		}
	}
	function disappearph() {
		document.getElementById("pch").innerHTML = "";
	}
	function submit(){
		memberjoinform.submit();
	}
	function chkpwch(){
		var pw = $("#mpassword").val();
		var pwch = $("#mpwch").val();
		if(pw == pwch){
			chkpwch2.style.color="green";
			chkpwch2.innerHTML = "비밀번호가 일치합니다.";
		}else{
			chkpwch2.style.color="red";
			chkpwch2.innerHTML = "비밀번호가 틀립니다.";
		}
	}
	function disappearpwch(){
		document.getElementById("chkpwch2").innerHTML = "";
	}
</script>
</head>
<body class="centered">
	<h1>MemberJoinForm</h1>
	<form action="memberjoin" method="post" name="memberjoinform" enctype="multipart/form-data">
	<label for="mid">ID</label><br>
	<input type="text" id="mid" name="mid" onkeyup="idOverlap()" onblur="disappear()"><span id="idch"></span><br>
	<label for="mpassword">PW</label><br>
	<input type="password" id="mpassword" name="mpassword" onkeyup="chkPW()" onblur="disappear2()"><span id="pwch"></span><br>
	<label for="mpwch">PWCH</label><br>
	<input type="password" id="mpwch" name="mpwch" onkeyup="chkpwch()" onblur="disappearpwch()"><span id="chkpwch2"></span><br>
	<label for="mname">NAME</label><br>
	<input type="text" id="mname" name="mname"><br>
	<label for="mbirth">BIRTH</label><br>
	<input type="date" id="mbirth" name="mbirth"><br>
	<label for="memail">EMAIL</label><br>
	<input type="email" id="memail" name="memail"><br>
	<label for="maddress">ADDRESS</label><br>
	<input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호"><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" id="sample6_address" name="sample6_address" placeholder="주소"><br>
    <input type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소">
    <input type="text" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목"><br>
	<label for="mphone">PHONE</label><br>
	<input type="text" id="mphone" name="mphone" onkeyup="phonech()" onblur="disappearph()"><span id="pch"></span><br>
	<label for="mprofile">PROFILE</label><br>
	<input type="file" id="mfile" name="mfile"><br>
	</form>
	<button onclick="submit()">저장</button>
</body>
</html>