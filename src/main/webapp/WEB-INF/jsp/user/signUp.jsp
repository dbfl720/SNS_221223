<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
<div class="d-flex justify-content-center align-items-center">
	<div class="sign-up-box">
		<form id="signUpForm" method="post" action="/user/sign_up" >
			<table class="sign-up-table table table-bordered">	
				<tr>
					<td>
					<h5 class="mb-4 text-secondary">친구들의 사진과 동영상을 보려면 가입하세요.</h5>
						<%-- 인풋박스 옆에 중복확인을 붙이기 위해 div를 하나 더 만들고 d-flex --%>
						<div class="d-flex">
							<input type="text" id="loginId" name="loginId"
								class="form-control col-9" placeholder="아이디">
							<button type="button" id="loginIdCheckBtn" class="btn btn-primary ml-2 ">중복확인</button>
							<br>
						</div> <%-- 아이디 체크 결과 --%> <%-- d-none 클래스: display none (보이지 않게) --%>
						<div id="idCheckLength" class="small text-danger d-none">ID를
							4자 이상 입력해주세요.</div>
						<div id="idCheckDuplicated" class="small text-danger d-none">이미
							사용중인 ID입니다.</div>
						<div id="idCheckOk" class="small text-success d-none">사용 가능한
							ID 입니다.</div>
					</td>
				</tr>
				<tr>
				
					<td><input type="password" id="password" name="password"
						class="form-control" placeholder="비밀번호"></td>
				</tr>
				<tr>
					
					<td><input type="password" id="confirmPassword"
						class="form-control" placeholder="비밀번호 재입력"></td>
				</tr>
				<tr>
					
					<td><input type="text" id="name" name="name"
						class="form-control" placeholder="사용자 이름"></td>
				</tr>
				<tr>
					
					<td><input type="text" id="email" name="email"
						class="form-control" placeholder="이메일 주소"></td>
				</tr>
			</table>
			<br>

			<button type="submit" id="signUpBtn"
				class="btn btn-primary float-right col-12">가입</button>
		</form>
	</div>
</div>
	
	
	
	
	
<script>
$(document).ready(function() {
	// 중복 확인 버튼 클릭
	$('#loginIdCheckBtn').on('click', function(){
		// 경고 문구 초기화
		$('#idCheckLength').addClass("d-none");
		$('#idCheckDuplicated').addClass("d-none");
		$('#idCheckOk').addClass("d-none");
		
		
		let loginId = $('#loginId').val().trim();
		
		// 4자 미만이면 경고 문구 노출
		if (loginId.length < 4) {
			$('#idCheckLength').removeClass('d-none');
			return;
		}
		
		
		
		// AJAX 통신 - 중복확인
		$.ajax({
			// request
			url:"/user/is_duplicated_id"
			, data:{"loginId":loginId}
			
			// response
			, success:function(data) {
				if(data.result) {
					//중복
					$("#idCheckDuplicated").removeClass("d-none");
				} else {
					// 사용 가능
					$("#idCheckOk").removeClass("d-none");
				}
			}
		}); // AJAX
		
		
	}); // longinIdCheckBtn
	
	
});  // ready

</script>