<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   	<div id="wrap" class="container text-center loginBox">
		<form id="loginForm" method="POST" action="/user/sign_in">
			<div class="loginImg"><img id="loginImg" class="mb-5" alt="이미지1"  width="100" height="100" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrSfzRTCQA_l6gh73ID8yTNU8igZDjSuJwDA&usqp=CAU"></div>
			<div class="justify-content-center d-flex"><input id="loginId" name="loginId"  type="text" class="form-control col-4 mb-3 " placeholder="아이디를 입력하세요."></div>
			<div class="justify-content-center d-flex"><input id="password" name="password" type="password" class="form-control col-4 mb-3" placeholder="비밀번호를 입력하세요."></div>
			<div><button id="loginBtn" name="loginBtn" type="button" class="btn btn-primary col-4 mb-3">LOGIN</button></div>
			<div><button id="joinBtn" name="joinBtn" type="button" class="btn btn-primary col-4">JOIN</button></div>
		</form>
	</div>
<script>
$(document).ready(function() {
	// 로그인
	$('#loginBtn').on('click', function() {
		// validation
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val();
		
		
		if (!loginId) {
			alert("아이디를 입력하세요");
			return;
		}
		
		if (!password) {
			alert("비밀번호를 입력하세요");
			return;
		}
		
		
		let url = $('#loginForm').attr("action");
		console.log(url);
		let params = $('#loginForm').serialize();
		console.log(params);
		
		
		
		$.post(url, params) // request
		.done(function(data) {  // response
			if (data.code == 1) {
				// 로그인 성공시 게시판 목록으로 이동
				location.href = "/timeline/timeline_view";
			} else {
				alert(data.errorMessage);
			}
		});
		
		
	});
	
});


</script>
	
