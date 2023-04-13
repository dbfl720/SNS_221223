<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   	<div id="wrap" class="container text-center loginBox">
		<form id="signInForm" method="POST" action="/user/sign_in">
			<div class="loginImg"><img id="loginImg" class="mb-5" alt="이미지1"  width="100" height="100" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrSfzRTCQA_l6gh73ID8yTNU8igZDjSuJwDA&usqp=CAU"></div>
			<div class="justify-content-center d-flex"><input id="loginId" name="loginId"  type="text" class="form-control col-4 mb-3 " value="아이디"></div>
			<div class="justify-content-center d-flex"><input id="loginPassword" name="loginPassword" type="text" class="form-control col-4 mb-3" value="비밀번호"></div>
			<div><button id="logInBtn" name="longInBtn" type="button" class="btn btn-primary col-4 mb-3">LOGIN</button></div>
			<div><button id="joinBtn" name="joinBtn" type="button" class="btn btn-primary col-4">JOIN</button></div>
		</form>
	</div>