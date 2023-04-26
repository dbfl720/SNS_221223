<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="contents-box">

		<%-- 글쓰기 영역: 로그인 된 상태에서만 보여짐 --%>
			<c:if test="${not empty userId}">
				<div class="write-box border rounded m-3">
					<div class="textareaBox rounded border">
						<%-- border: 테투리 색깔 연하게. --%>
						<textarea id="writeTextArea" class="textareaTimeline w-100"
							placeholder="내용을 입력해주세요."></textarea>
						<div class="file-upload d-flex justify-content-between">
							<div class="d-flex">
								<%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
								<input type="file" id="file" multiple='multiple' class="d-none"
									accept=".gif, .jpg, .png, .jpeg , .webp"> <a href="#"
									id="fileUploadBtn"><img alt="이미지" width="40" height="40"
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAgVBMVEX///8BAQEAAAD6+vqsrKx1dXUFBQXU1NQxMTH5+fkJCQnh4eH09PTk5OTp6enLy8u+vr5bW1vb29uOjo7v7+9ubm5VVVV6enrExMRhYWE5OTlJSUmIiIi3t7exsbGjo6OZmZkjIyNCQkI4ODgWFhaVlZUaGhpPT08pKSmfn59wcHDr/F7EAAAOkElEQVR4nO1dh3bqOBDFI2Ji4wChhYQQSsim/P8HrmZUAVuWG+B3fPftK8EYXUvTR6LX69ChQ4cOHTp06NChQ4cOHTp06NChQ4cOHTr8G4hYSxAVosXo98HueQ8twuNiOyxAcT6Lbz3iMvjpM0+KM7w8hADCoCWgwYZ80BsffmPglyNB/pZbj9wXOBd8sHxiDnM3Oy6xv8SO3tYagkRP/Akw7jHnYp1pgi0EHzpfqquei+GOz3d7xO8cXBY5Qxg4CK74NYEi2KJVCuI/Gj2nmCWLrJeAvUbpebQDOC18/nBSuIaEQy9LFhecHc2gnO5WARnSxHCWHxmiOOSPQBEEWE6Gya29MV/Mp/0fJCkpAmQs01e8JBTW8HPqENe7xASHDVIW+6mTiFIYkLiG8Hr1AVZH8gNCd3AOb6lXfKhZFqJ65fHVgAhnSGhKSHXDX6UWDbPV7T2D4UKVtg5gm3aJsBS4mN9bOYXcQLxpZfOQckGiDGEIuVrmkv99PJG+8sfgJ+XVqZzDOFPXKoiIerjq72azXX/1VPtAS2Ogo4Y49VUVUqTxt8Cna/i7tI3tcz9pZMCFESlPM3WWBsLc86fwmHOf1Zp4kcgKwQV4HTcx4qKIpNfJB5QiNgNN38WQ9SY/oJ+U9nw5Di6X/kpgZg4dDAMnw/l3RgDJOS6iTI/3SqiB4Qe6PKkUabHeeqlWZ/hCHvwpQYpYFMdtr1jqsmZUZvgqNYwSQunGmsQOwKyHvn6TLFyoynBhzx2lO2TkCdbPZr0bmv+KDN9P5A90iBwEJrETZniEV0I1hhuQk6WYHV9nX1/vS0M0oPmEQUvncA6KIeVD4i8dn0zf+T/DWLNPc5iuhEoMvyG0Ujj9npY2/OPLGEnu1740RyEHVRhObJuwTDivE405+jS5R0gPP6+BKgyPNIWUB9Hh48lNnrUZCWHZyPA9UIHhRkbHYUwE08ApkixiKmt6I2VTgeFBxY6UpEof/o++e2qEfQ2UZ/ikNAkXwijLMRuJ25OjcyPfrTzDX20pSItmYKa1DaxqHHYBlGe41tbeZewSnGlhUm5kMEozZNraw2/27aPen0qsw77OcfujNMOpJMinaOT6gLE2mjcSxJIMGWVaxUv/OT8gAn3hbcoepedwp9/46jZ0j3ISASb1DbsASjPUSpKiPweeQYUfH3UNuhBKM3zXb8wJ/h40Q4dRaRDNM/zT+cqWMZzpl3JW6VJXRryak2pHaYZb/ZKrcsrINQ0Fw9s4NaUZTvRLDpeGnZQNWmUtGLf42pI7C00rUCXYtA+4Asr7pSBSGFyN7DJzhcxKN+aVr5pCeYbfyt90et5zE1tkRMlNoxxDvHQLyi912YsXk6ppXfQ0siLgedY6HZgpzKsiN4UKWYxv7azAGuOklEI+i+UNeBxyq3xiBYZjkw+FBd3r4pIDmL6yW6UTq2QT36x06OKCYNSL1hDqTEdOBNIcqjBcqdIE9mq8jc45TkMIY92P83Sr8lN5hoxcTmkxUBi/mE1i/kJdc4GcwhuZil71ykxsuocB3lVFOxo/6MZHInhskEIOKjCMaJ1qhqK/9vD38LJ4lN2rsmwDN6xaVFqlosCkWr+p/qv7hQK5OQNEZDhpbw2Y+hRkPpR+2f8DkeS/HOnGosMt/qSqMYyQIpdFq9Jtg1ZqWGONWwzxaTAZT717yqoxxLfssvebYF0Kag7tVwspCIdfP5JVVymjTVFqaZ7yI8HcD+uUwdVetmXLNhYP1NH1FWFPTaCEkUBNRDiKWW3sGAWbqND0I4TjMF8y62DIrzuA3MIBMioWT/m51j5T9obFSnuV+PSUVWfI6CkOZG+UrmpzvKAVrNFKrCEMbIL0JHNLy3XMoVgoyebP2mW6f1mxmo3gCy0T1U0mNRlAnr6pZ5UqJONJf7v9mAzq7g8WTffCi6dgTPpLXBae895aK8PTMdWKkWIVCF1jGudy/InaGeLarL0TkWEJC2K1QEFXZ4P8PGw75pBR9YPMD1nD5aMKTWmPqLP02hjD2sAiRruTdLxCXuD0qPoD+Hp9dj3QFjBkmGA3Ewa7Hp6XMFLRd8A9Q5fne/8MkeNRyCBaC1hK67QxaTxn/NkGhrgJUmgWZEMeBo71BYTvi+7FsdWrtNfX3biczMD8/JF6dSgVJPrOUmneP0MUQuNs23XkJ2U10B23ultPcf8MWWhlnq1qLDP7P8mQZIni/TP81r1X1LpjjRKtpLL88dlr1lV3zZBRM7WWwUvvZW88G/jLuMddMxSnqmircLmlfmRqW2FGv86dM4yMkgmp/HM+yA89fqocpHC4c4ZrU8HDKnmKR79QBPgcp9bR75kh671bSzS1IYLbwL1MEWWJ4j0zNH0cGBNmSBmea2GsSUrm8p4ZzkEe2wRUQs5yzPpgxYqXva73zPAg9uKIMzl66Wkf/NHCMiiXolgDQ/m+p8FgUNe5C5QkeJcxIQmh687sP92vjMcKnPmnNWQT8Teda39Z9TJ8iyLAG0xMTBg4z3libGqq6Zf9gbUw/DjKeigpdfepU77gtjwWBPnamzk22uIrfaGSRA3zbLprWKXJAaTACKUHr3Uw3Mt5wVGvU3tZFAN86VVU1KmW93n2erXaE3/PPIQAwPae4DGpNI343gcVE4LXsSrREaimQCN5OfXPq80h6yXxWXUNH/1PVZWz0Xf03O8+BMssTmznp3J17fHsqEGh+45VKDKKbfUNv7ze9GtWdcAnvS6GDI/oEU2Y8nQ00u64spzbTJwgT0yPym/jIqM9AfIteIqH0UyV+mmY6WcPRUWbnqM4fqpCi5DtTce+JZAkts4AsDygCnPI1/qHXPxmL6n8N/6tdIdJ346Ipi49ejZYS3jN7pVKq3QsbZZMWh5AdzzHOJMlDzYZgsWQcr2ea+HLfjJaEVRZpUN1sgBZWvQlfsF4WmHJQz9Q8avFlls6O8XSKmYc9DhLMuQXR//Zz0ywWVE4oP2Lwm3BollOrANUycUkGUVRx4rv0mSU7tVn3PVXy97aDzMA7SMGNLFFtc0O5EEpeJthobczPBPK9NlJUSy/Shd2WCZbDxkTFEESzMoOZWOgZBnXxUevgD6mC3f2U08qMGS4K0g+ayku+t3qfLBQKNhiDVEJiP44sjiLgl1eeOm3FSseKjBEt0r2juKMnb74JHZiKPa7IkNcq47bsFTQTcetmoVKK6skw5NaApxYLIaBj12F9qVIC0PJIJTyiphlwfAhrUoznFvtsSlJsPlRWX6aD7/+YC7DKzW6UESyxfsQKUlu/FPaJlGGYbQ3m5kuzllOuBOS/Bg15LsRgeY+jPMzT+6biByrOEBYHNhZmCFDcQ5k71Oc0TyafEJg0pi5R5+KLNNB1wkvwtgiSPTpyIDZAaZ3WvvPod7p43rWn0biqSrmnhF89d02P1Wir7FoURbjG5dYpb92PL9MVegYu6x1Oldc5+LIaPt7YJ5IhW3fXBZnoGqO2BWm+3B8GU7sHPOP6ty7/JhoST3gynqvnZNIQW+s64RVD0s9mNOd4DvW4uLHcKoNjvDgM5NgIjqWXgH/9SaeRPrIqSh/ZqorYK5mQTSBFlqliTkiIXa3PjLR8Brr+z/itVkP5EGPI85vN8yHKTsaeDL8UToSRMDk6GBjos1dWw3YzzMfyMZ2IOo4aXF2SdGP4VI2XtH0u1NEMssRWjsQj1n7FPVpPnhjv8yT+7Mp8oGCDJkYsMi8YuY3o25+ipnej0EUR5frFFfBXl2CmqE6QXyMIzhpmPacw63sIyeePud7R+LYNqN7s87UVsoLhbDErpE0TOAky+nFcAxKjwKF3/kDwfnZWtZFtFOcv69vy/YgWxsVAN7i/UwU80/ZHUpvSNkJvzZZ1bSl7OJlfmqqvCx8/depvHwh7vBmusXyGFKFkvKR0h8qlkfbKI9a5IzHZhaxjTKKhd6iiPq5zs7bkZVRyWf4iI6m1AZQ6KgZRm4QGLsIpsSIK13lqpHgscaDlvhS2FiaPJfh+k/XBchjL4bxySmRVn6KcS83Bq296j2Xj3F7HPvOYWD2OtARewW/1QwTTFoWQ5OZo+yY6UbY1iKEBugL6p26OZomENt8REU2/Ysi3Bhg+B6r3I3OTyWx3mcjep7qBRtp7ZhnLcxiLlArsT5JfJ2LFXXtxAtrK05xnxlWCiiKgSnYeDAMIaM3Kf+jzCkT4tMoefNn64Fmvm3gQUfiXgxF+r6krCRHZZ74guXP6uFPa3NcqR819HBcgA/1xy+LofSg8xTIPCSq70XWUi3tEzR3+OfK1DJ85LDCyQFYy3k08eLpbRvsuWJF5BAq+RxI8TPr/P3yRfE8JN4MoeKTZhQwHuAibsPPXjV39n7kl8WQVj/zpB1PcC9tebH1O2z2gCXPbKK4ovpxZJzi6ylFVM+NHs7jzRBCqN6UR++e2SENKtVf/VIT8GNI2n1rBln+41AaBzpziH8eGj4G24sheaN1GqzVs7KGzX/bji/DWhJEJ7fe9Puba3zRjq8c1muwWOpfm0EeQ5BaZl/7YNjJH80hj6EKrW66w7ISchnKVzuG94uOYcfw/tEx7BjePyLdVvuvMmSma8HBsM0+TWSq7E6vrYGE9JUw1F+S4vS8xTaUxr3k2kHnc3pVZoq3M98HZFOPF8OfKwQ6tUOUS9y6VEppqKtFrQKzTgJ2yqFIGd3ma2IqQWzM0hxSrhhZXTe3/a7N4iDFqNvlqEEm7TKr3QybhG793b7FwPr/WX11GVuMnk3uVpyW9v3QFize4KTbJGMNbk4z8C0DDViNPStdmHWAbvuQ3mvOqOfsn0DG6TU97JYAsce3vRB9MuldTlzjzsWhaGGYf6d7RYjbQtapBAnUv9tmgmQFMgniyk0+9fdQthG0X/cvy6mWP94K3ds+YQRh4Y6r3LAh2r7dzqpVxbPnofDz8abfQkwGfk0evpv+7xJtzE0Uwb/NrkOHDh06dOjQoUOHDh06dOjQoUOHDh06uPA/Ugaib0AxZz4AAAAASUVORK5CYII="></a>
	
								<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
								<div id="fileName" class="text-secondary ml-2 mt-2"></div>
							</div>
							<button id="writeBtn" type="button" name="timelineBtn"
								class="btn btn-light col-2">게시</button>
						</div>
					</div>
				</div>
				</c:if>

		<%-- 글쓰기 영역 끝 --%>



		<c:forEach items="${cardList}" var="card" varStatus="status">
			<%-- 타임라인 영역 --%>
			<div class="my-5 border-bottom">
				<%--y : y축 -> top , bottom --%>
				<div class=" rounded mt-2">
					<%-- 글쓴이, 더보기(삭제) --%>
					<div class="p-2 d-flex justify-content-between">
						<span class="font-weight-bold">${card.user.loginId}</span>



						<%-- 더보기(내가 쓴 글일 때만 노출) --%>
						<c:if test="${card.user.id eq userId}">
						<a href="#" class="more-btn " data-toggle="modal" data-target="#modal" data-post-id="${card.post.id}"> <img
							src="/static/img/more-icon.png" width="30">
						</a>
						</c:if>
					</div>






					<%-- 카드 이미지 --%>
					<div>
						<img class="w-100" height="450px" alt="본문 이미지"
							src="${card.post.imagePath}">
					</div>



					<%-- 좋아요 --%>

					<div class="mt-3 mb-3">
						<c:if test="${card.filledLike == false}">
							<%-- 좋아요가 안눌러졌을 때, 비로그인 일 때.  (빈 하트) --%>
							<a href="#" class="like-btn" data-post-id="${card.post.id}">
								<img width="18px" height="18px" alt="empty heart"
								src="/static/img/heart-icon.png">
							</a>
						</c:if>
						<c:if test="${card.filledLike == true}">
							<%-- 좋아요가 눌러졌을 때 (채워진 하트) --%>
							<a href="#" class="like-btn" data-post-id="${card.post.id}">
								<img width="18px" height="18px" alt="filled heart"
								src="/static/img/heart-icon (1).png">
							</a>
						</c:if>
						<small>${card.likeCount}명이 좋아합니다.</small>
					</div>


					<%-- 글 --%>
					<div class="mb-2">
						<span class="font-weight-bold">${card.user.loginId}</span> <span>${card.post.content}</span>
					</div>


					<%-- 댓글 --%>
					<div class="mb-2">
						<div>
							<div class="text-secondary">댓글</div>
						</div>
					</div>


					<%-- 댓글 목록 --%>
					<div>
						<c:forEach items="${card.commentList}" var="comments">
							<c:choose>
								<c:when test="${comments.comment.userId eq userId}">
									<div class="d-flex justify-content-between align-items-center">	
										<%-- 댓글 내용 --%>
										<div>
											<small class="font-weight-bold">${comments.user.loginId}</small>
											<small>${comments.comment.content}</small>
										</div>
										<%-- 댓글 삭제 버튼 --%>
											<div>
												<a href="#" data-comment-id="${comments.comment.id}" class="deleteBtn" >
												 <img
													class=" mr-3" width="15px" height="15px" alt="x-icon"
													src="/static/img/x-icon.png">
												</a>
											</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="d-flex justify-content-between align-items-center">	
										<%-- 댓글 내용 --%>
										<div>
											<small class="font-weight-bold">${comments.user.loginId}</small>
											<small>${comments.comment.content}</small>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						

						
						
						<%-- 댓글 쓰기 --%>
						<c:if test="${not empty userId}">
							<div class="d-flex mt-2 justify-content-between">
								<%-- border-top: 윗부분 경계 --%>
								<input type="text"
									class="commentBox commentInput border-0 form-control mt-2 mr-2 col-10"
									placeholder="댓글 달기..." />
								<button type="button" class="commentBtn btn btn-light mt-2"
									data-post-id="${card.post.id}">게시</button>
								<%-- id로하면 안됨. class로 해야됨. 계쏙 나오는 거라서.  --%>
							</div>
						</c:if>
					</div>
					<%-- 댓글 목록 --%>

				</div>
				<%-- 타임라인 영역 끝 --%>
			</div>
		</c:forEach>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="modal" >
	<%-- modal-dialog-centered : 모달 창을 수직 가운데 정렬 --%>
	<%-- modal-sm: small 모달 --%>
  	<div class="modal-dialog modal-dialog-centered modal-sm"> 
    	<div class="modal-content text-center">
      		<div class="py-3 border-bottom"> 
      			<a href="#" id="deletePostBtn" class="text-dark">삭제하기</a>
   			</div>
   			<div class="py-3">
   				<%-- data-dismiss="modal" => 모달창 닫힘 --%>
   				<a href="#" data-dismiss="modal" class="text-dark">취소하기</a>
   			</div>
    	</div>
  </div>
</div>




<script>
	$(document).ready(
			function() {
				// 파일업로드 이미지 클릭 => 숨겨져 있는 file 태그를 동작 시킨다.
				$("#fileUploadBtn").on('click', function(e) { // e객체 꼭 있어야함.
					e.preventDefault(); // a 태그의 스크롤이 올라가는 현상 방지
					$('#file').click(); // input file을 클릭한 것과 같은 효과
				});

				// 사용자가 이미지를 선택했을 때 유효성 확인 및 업로드 된 파일명 노출
				$("#file").on(
						'change',
						function(e) { // e가 파일객체들고 있음.
							let fileName = e.target.files[0].name; // amsterdam-7917858_1280.jpg  // target = this 같음. 즉, #file 가리킴.
							console.log(fileName);

							// 확장자 유효성 확인
							let ext = fileName.split(".").pop().toLowerCase();
							if (ext != "jpg" && ext != "png" && ext != "jpeg"
									&& ext != "gif" && ext != "webp") {
								alert("이미지 파일만 업로드 할 수 있습니다.");
								$("#file").val(""); // 파일 태그에 파일 제거
								$("#fileName").text(""); // 파일 이름 비우기
								return;
							}

							// 유효성 통과한 이미지는 상자에 업로드 된 파일 이름 노출
							$("#fileName").text(fileName); // 태그 사이에 글자를 넣는 함수 : text()  
						}); // file

						
						
				// control + f   :    중복 체크하기. 
				// 글쓰기
				$("#writeBtn").on(
						'click',
						function() {
							// validation
							// 글내용, 이미지, 확장자 체크
							let content = $('#writeTextArea').val();
							console.log(content);

							/* if (content.length < 1) {
								alert("내용을 입력하세요.");
								return;
							}  */

							let file = $('#file').val(); // 이미지 경로
							if (file == '') {
								alert("파일을 업로드 해주세요.");
								return;
							}

							// 파일이 업로드 된 경우에만 확장자 체크
							let ext = file.split(".").pop().toLowerCase();
							// 확장자만 뽑아서 소문자로 변경한다.
							if ($.inArray(ext, [ 'jpg', 'jpeg', 'png', 'gif',
									'webp' ]) == -1) {
								alert("이미지 파일만 업로드 할 수 있습니다.");
								$('#file').val(''); // 파일을 비운다.
								return;
							}

							// form태그를 자바스크립트에서 만든다.
							let formData = new FormData();
							formData.append("content", content);
							formData.append("file", $('#file')[0].files[0]); // $('#file')[0]은 첫번째 input file 태그를 의미, files[0]는 업로드된 첫번째 파일

							
							
							// AJAX 전송
							$.ajax({
								// request
								type : "post",
								url : "/post/create",
								data : formData,
								enctype : "multipart/form-data" // 파일 업로드를 위한 필수 설정.   // **이미지를 보낼때는 반드시 있어야한다.  
								,
								processData : false // 파일 업로드를 위한 필수 설정.     // string이 아니라는 정보 - false 
								,
								contentType : false // 파일 업로드를 위한 필수 설정.

								
								// response
								,
								success : function(data) {
									if (data.code == 1) {
										// 성공
										alert("글이 저장되었습니다.");
										location.reload();
									} else if (data.code == 500) { // 비로그인 일 때
										location.href = "/user/sign_in_view";
									} else {
										// 실패
										alert(data.errorMessage);
									}
								},
								error : function(request, status, error) { // 서버에서 에러가 발생했을 때 . 
									alert("글을 저장하는데 실패했습니다. 관리자에게 문의해주세요.");
								}

							}); // ajax

						});

				
				
				
				// 댓글 쓰기
				$('.commentBtn').on('click', function() {
					let postId = $(this).data("post-id"); // *** jquery .data() 문법
					// alert(postId);

					// 1) 댓글 내용 가져오기
					/* let comment = $(this).prev().val();  // 근처에 value가져오기 .
					alert(comment); */

					// 2) 댓글 내용 가져오기
					let comment = $(this).siblings("input").val().trim(); // *** jquery .siblings() 문법 - 형제중에 input태그 가져온다. 
					// alert(comment);

					// validation
					if (!comment) {
						alert("댓글을 입력하세요.");
						return;
					}

					// ajax
					$.ajax({
						// request
						type : "POST",
						url : "/comment/create",
						data : {
							"comment" : comment,
							"postId" : postId
						}

						// response
						,
						success : function(data) { // jquery ajax 함수가 json string을 object로 파싱해줌
							if (data.code = 1) {
								alert(data.result);
								location.reload();
							} else {
								alert(data.errorMessage);
							}
						}

						,
						error : function(request, status, error) {
							alert("요청에 실패했습니다. 관리자에게 문의해주세요.");
						}

					}); // ajax

				}); // commentBtn

				
				
				// 좋아요/해제
				$('.like-btn').on('click', function(e) {
					e.preventDefault(); // 위로 올라가는 현상 방지

					let postId = $(this).data("post-id");
					//alert(postId);

					$.ajax({
						// req
						url : "/like/" + postId //    /post/13

						// res
						,
						success : function(data) {
							if (data.code == 1) {
								location.reload();
							} else if (data.code == 300) {
								alert(data.errorMessage);
								// 비로그인 시 로그인 페이지로 이동
								location.href = "/user/sign_in_view";
							}
						},
						error : function(request, status, error) {
							alert("좋아요/해제 실패했습니다.");
						}
					});
				});

				
				
				
				
				// 삭제
				$('.deleteBtn').on('click', function(e) {
					e.preventDefault(); // 위로 올라가는 현상 방지

					let commentId = $(this).data("comment-id");
					
					$.ajax({
						// request
						type : "POST",
						url : "/comment/delete",
						data : {
							"commentId" : commentId
						}

						// response
						,
						success : function(data) { // jquery ajax 함수가 json string을 object로 파싱해줌
							if (data.code == 1) {
								alert(data.result);
								location.reload();
							} else {
								alert(data.errorMessage);
							}
						}

						,
						error : function(request, status, error) {
							alert("요청에 실패했습니다. 관리자에게 문의해주세요.");
						}

					}); // ajax

				}); // 삭제

				
				
				
				
				// 글 삭제 (... 더보기 버튼 클릭) -- 글 삭제 위해서.
				$('.more-btn').on('click', function(e){  
					e.preventDefault();   // a태그 위로 올라감 방지.
					
					let postId = $(this).data('post-id');   // getting
					//alert(postId);
					// 모달 태그에 (재활용 되는) data-post-id를 심어줌
					$('#modal').data('post-id', postId);  // setting - modal태그에 세팅한 것임. 내부적으로 postId심어져있음 
				}); // 글 삭제
				
				
				// 모달 안에 있는 삭제하기 버튼 클릭 => 진짜 삭제
				$('#modal #deletePostBtn').on('click', function(e){   // modal 안에 있는 deletePostBtn  띄어쓰기. #modal 안써도 됨. 그냥 알아보기 쉬우라고..
					e.preventDefault();
					
				
					let postId = $('#modal').data('post-id');
					// alert(postId);
				
					
					
					
					
					
					// ajax 글 삭제 
					$.ajax({
						// request
						type : "DELETE",
						url : "/post/delete",
						data : {
							"postId" : postId
						}

						// response
						,
						success : function(data) { // jquery ajax 함수가 json string을 object로 파싱해줌
							if (data.code == 1) {
								alert(data.result);
								location.reload();
							} else {
								alert(data.errorMessage);
							}
						}

						,
						error : function(request, status, error) {
							alert("요청에 실패했습니다. 관리자에게 문의해주세요.");
						}
						
						
					}); // ajax 
				});
				
				
			}); // ready
</script>


