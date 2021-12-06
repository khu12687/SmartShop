<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	/*
	function check_id() {
		const form = document.getElementById("signup_form");
		
		const xhr = new XMLHttpRequest();
		
		xhr.open("GET", "checkId?id=" + form.id.value, false);
		
		xhr.send();
		
		const result = xhr.responseText;
		
		alert(result);
	}
	*/

	function check_id_Async() {
		const form = document.getElementById("signup_form");
		const xhr = new XMLHttpRequest();
		
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == XMLHttpRequest.DONE) {
				if(xhr.status == 200) {
					const result = xhr.responseText;
					
					if(result == "OK")
						alert(`[Async] \${form.id.value}는 사용 가능한 아이디 입니다`);
					else
						alert(`[Async] \$(form.id.value)는 이미 사용 중인 아이디 입니다`);
				}
			}
		}
		
		xhr.open("GET", `checkId?id=\${form.id.value}`, true);
		xhr.send();
		
	}
	
	function signup() {
		const form = document.getElementById("signup_form");
		
		var regx = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		
		if(!regx.test(form.passwd.value)) {
			alert("비밀번호 형식을 확인해주세요");
			return;
		}
		
		if(form.passwd.value != form.passwd_confirm.value) {
			alert("비밀번호가 일치하지 않습니다");
			form.passwd.value = "";
			form.passwd_confirm.value = "";
			return;
		}
		
		if(form.id.value == "") {
			alert("아이디를 입력해주세요");
			form.id.focus();
			return;
		}
		
		if(form.passwd.value == "") {
			alert("비밀번호를 입력해주세요");
			form.passwd.focus();
			return;
		}
		
		if(form.passwd_confirm.value == "") {
			alert("비밀번호를 한 번 더 입력해주세요");
			form.passwd_confirm.focus();
			return;
		}
		
		if(form.address.value == "") {
			alert("주소를 입력해주세요");
			form.address.focus();
			return;
		}
		
		if(form.tel.value == "") {
			alert("전화번호를 입력해주세요");
			form.tel.focus();
			return;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<form id="signup_form" method="post">
			 <div>
			 	<label>아이디</label>
			 	<input type="text" name="id"><button type="button" onclick="check_id_Async()">중복확인</button>
			 </div>
			 <div>
			 	<label>비밀번호</label>
			 	<input type="password" name="passwd">
			 </div>
			 <div>
			 	<label>비밀번호 확인</label>
			 	<input type="password" name="passwd_confirm">
			 </div>
			 <div>
			 	<label>주소</label>
			 	<input type="text" name="address">
			 </div>
			 <div>
			 	<label>전화번호</label>
			 	<input type="text" name="tel">
			 </div>
			 <div>
			 	 <button type="button" onclick="signup()">회원가입</button>
			 </div>
		</form>
		<div>
			<a href="#">이전</a>
		</div>
	</div>
</body>
</html>