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
			<div class="createUserName font-weight-bold">${userLoginId}</div>
			<div class="createUserName2 mt-2 ml-2">${userName}</div>
			<a href="/user/sign_out" class="ml-5 mr-5 LogoutIcon">Logout</a>
		</div>
	</div>
</c:if>
<c:if test="${empty userId}">
	<div class="d-flex justify-content-end">
		<a href="/user/sign_in_view" class="LoginIcon">Login</a>
	</div>
</c:if>
