<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="h-100 d-flex justify-content-center align-items-center">
	<%-- logo --%>
	<div class="loginImg">
		<img id="loginImg" class="mb-5 " alt="이미지1" width="250" height="80"
			src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKnXdbpj6ls3U9mq6oO9EqeW_sWf-FVtWl-Q&usqp=CAU">
	</div>
</div>

<%-- 로그인 정보 --%>
<c:if test="${not empty userId}">
		<div class="d-flex justify-content-end">
			<div class=" d-flex justify-content-end LoginHeaderBox">
			
			
				<%-- 프로필 사진 --%>
				<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
				<input type="file" id="file2" multiple='multiple' class="d-none"
									accept=".gif, .jpg, .png, .jpeg , .webp">
				<a href="#" id="profileBtn">
				<img   alt="프로필 변경 이모티콘" width="30" height="30"	src="data:image/png;base64,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" >
				</a>
				
				<div class=" profileBox mr-3">
					<img id="profileImg" class=" profile" alt="프로필 사진"
						src="https://cdn.pixabay.com/photo/2016/03/23/04/01/woman-1274056__480.jpg"
						height="250" width="300">
				</div>
				<%-- 아이디, 이름 --%>
				<div class="LoginNames d-flex">
					<div class="createUserName font-weight-bold mt-1" >${userLoginId}</div>
					<div class="createUserName2 mt-2 ml-2">${userName}</div>
					<div class="LogOutText "><a href="/user/sign_out" class="text-dark " >Logout</a></div>
				</div>
			</div>
		</div>
	
</c:if>
<c:if test="${empty userId}">
	<div class="d-flex justify-content-end">
		<a href="/user/sign_in_view" class="LoginIcon">Login</a>
	</div>
</c:if>




<script>
 $(document).ready(function() {
	
	// 프로필 사진 변경
	$('#profileBtn').on('click', function(e) {
		e.preventDefault();
		$('#file2').click(); // input file을 클릭한 것과 같은 효과
	}); // profileBtn

	$("#file2").on('change', function(e) {
		let fileName = e.target.files[0].name; // amsterdam-7917858_1280.jpg  // target = this 같음. 즉, #file 가리킴.
		console.log(fileName);
		
		// 확장자 유효성 확인
		let ext = fileName.split(".").pop().toLowerCase();
		if (ext != "jpg" && ext != "png" && ext != "jpeg"
				&& ext != "gif" && ext != "webp") {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			return;
		} else {
			changeIMG(); // 성공시 프로필 사진 변경.
		}
		
	
	
	
	
	// 프로필 사진 변경.
	function changeIMG(){
    	//img 태그의 아이디로 변경 할 때
    	$("#profileImg").attr("src", $('#file2'));
   
    }
	
	
	
	// form태그를 자바스크립트에서 만든다.
	let formData = new FormData();
	formData.append("file", $('#file2')[0].files[0]); // $('#file')[0]은 첫번째 input file 태그를 의미, files[0]는 업로드된 첫번째 파일
	
	
	// AJAX
	$.ajax({
		// request
		type : "PUT",
		url : "/user/update",
		data : formData
		, enctype : "multipart/form-data" // 파일 업로드를 위한 필수 설정.   // **이미지를 보낼때는 반드시 있어야한다.  
	    , processData : false // 파일 업로드를 위한 필수 설정.     // string이 아니라는 정보 - false 
		, contentType : false // 파일 업로드를 위한 필수 설정.
		
		
		
		// response
		, success :  function(data) {
			if (data.code == 1) {
				// 성공
				alert("프로필 사진이 저장되었습니다.");
				location.reload();
			} else if (data.code == 500) { // 비로그인 일 때
				location.href = "/user/sign_in_view";
			} else {
				// 실패
				alert(data.errorMessage);
			}
		},
		error : function(request, status, error) { // 서버에서 에러가 발생했을 때 . 
			alert("사진을 변경하는 실패했습니다. 관리자에게 문의해주세요.");
		}
		
	}); // ajax // 프로필 사진 변경
	}); // file2
	
}); // ready 
</script>