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

			<button type="button" id="signUpBtn" name="signUpBtn"
				class="btn btn-primary float-right col-12">가입</button>
		</form>
	</div>
</div>
	
	
	
	
	
<script>
$(document).ready(function() {
	// 중복 확인 버튼 클릭
	$('#loginIdCheckBtn').on('click', function(){
		// validation
		let loginId = $('#loginId').val().trim();
		
		// 4자 미만이면 경고 문구 노출
		if (loginId.length < 4) {
			$('#idCheckLength').removeClass('d-none'); // 경고문구 노출
			$('#idCheckDuplicated').addClass("d-none");   // 숨김
			$('#idCheckOk').addClass("d-none");   // 숨김
			return;
		}
		
		
		// 화면을 이동시키지 않고 ajax 통신으로 중복여부 확인하고 동적으로 문구 노출
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
					$('#idCheckLength').addClass("d-none");   // 숨김
					$('#idCheckOk').addClass("d-none");   // 숨김
				} else {
					// 사용 가능
					$("#idCheckOk").removeClass("d-none");
					$('#idCheckLength').addClass('d-none'); // 경고문구 노출
					$('#idCheckDuplicated').addClass("d-none");   // 숨김
				}
			}
			
			,error: function(error) {
				alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		}); // AJAX
		
		
	}); // longinIdCheckBtn
	
	
	
	
	
	
	
		// 회원가입
		$('#signUpBtn').on('click', function() {
			//e.prevenDefault();  // submit 기능 중단  // submit을 쓰면 다음페이지로 넘어감.
			// $('#signUpBtn').on('click', function()
			
			
			// validation
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val();
			let confirmPassword = $('#confirmPassword').val();
			let name = $('#name').val().trim();
			let email = $('#email').val().trim();
			
			if (!loginId) {
				alert("아이디를 입력하세요.")
				return false;  // form일 때는 false를 해야지 동작안함.
			}
			
			if (!password || !confirmPassword) {
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			
			if (!name) {
				alert("이름을  입력하세요.");
				return false;
			}
			
			if(!email) {    // 이메일 형식에 맞는지 정규식 확인하는거 필요! 
				alert("이메일을 입력하세요.");
				return false;
			}
			
			
			// 아이디 중복확인 완료 됐는지 확인 - idCheckOk d-none이 있으면 alert 띄우기 
			if ($("#idCheckOk").hasClass("d-none")) {
				alert("아이디 중복확인을 다시 해주세요.");
				return false;
			}
			
			
			// 서버로 보내는 방법
			// 2) AJAX + form태그 활용 case   // RestController 
			let url = $("#signUpForm").attr("action");  //action="/user/sign_up" 인가..?????
			console.log(url);
			let params = $("#signUpForm").serialize();  // 폼태그에 있는 *** name 속성값들로  파라미터 구성  // Query Ajax로 호출하기 전에 serialize를 해주면 form안에 값들을 한 번에 전송 가능한 data로 만들 수 있어 많은 data를 보낼 때 유용
			console.log(params);
			
			
			// ** $.post~ 방식은 간단하고 작은 파일 할 때만 사용.
			$.post(url, params)	// request  
			.done(function(data) {  // success와 똑같음. ajax 호출을 만드는 함수의 옵션으로 성공 함수를 전달하는 대신, 함수 자체에서 $.ajax를 반환하고 콜백을 done, fail, then 등으로 바인딩할 수 있다  // ***질문: data는 RestController에서 온 return 값???
				// response
				if (data.code == 1) {  // 성공
					alert("가입을 환영합니다! 로그인을 해주세요.")
					location.href = "/user/sign_in_view";    // 절대경로로 써야됨.
				} else { // 실패
					alert(data.errorMessage);
					
				}
			});  
			
		}); //signUpForm
	
	
	
});  // ready

</script>