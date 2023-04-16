<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="contents-box">
		

		<%-- 타임라인 영역 --%>
		<div class="my-5"> <%--y : y축 -> top , bottom --%>
			<div class="border rounded mt-3">
				<%-- 글쓴이, 더보기(삭제) --%>
				<div class="p-2 d-flex justify-content-between">
					<span class="font-weight-bold">사용자</span>
					
					<%-- 더보기(내가 쓴 글일 때만 노출) --%>
					<a href="#" class="more-btn">
						<img src="/static/img/more-icon.png" width="30">
					</a>
				</div>
				
				
				<%-- 카드 이미지 --%>
				<div>
					<img class="w-100" height="500px" alt="본문 이미지" src="https://cdn.pixabay.com/photo/2022/08/16/02/08/birds-7389157_1280.jpg">			
				</div>
				
				
				<%-- 좋아요 --%>
				<div class="m-3">
					<a href="#">
						<img width="18px" height="18px" alt="filled heart" src="/static/img/heart-icon (1).png">
					</a>
					좋아요 10000개
				</div>
				
				
				<%-- 글 --%>
				<div class="m-3">
					<span class="font-weight-bold">사용자</span>
					<span>아름다운 새들의 부리와 몸통</span>
				</div>
				
				
				<%-- 댓글 --%>
				<div class="m-2 border-bottom border-top mt-2 ">
				<div class="">
					<div class="ml-2 mb-2 font-weight-bold">댓글</div>
				</div>
				</div>
				
				<%-- 댓글 목록 --%>
				<div class="m-2">
					<div class="d-flex justify-content-between align-items-center">
						<%-- 댓글 내용 --%>
						<div class="m-2">
							<span class="font-weight-bold">댓글 사용자: </span>
							<span>댓글 내용</span>
						</div>
							
						<%-- 댓글 삭제 버튼 --%>
						<div>
							<a href="#">
								<img  class="mr-3" width="15px" height="15px" alt="x-icon" src="/static/img/x-icon.png">
							</a>
						</div>
					</div>
				
				<%-- 댓글 쓰기 --%>	
				<div class="d-flex mt-2 border-top justify-content-between" > <%-- border-top: 윗부분 경계 --%>
					<input type="text" class="commentInput border-0 form-control mt-2" placeholder="댓글 달기" />
					<button type="button" class="btn btn-light mt-2 ">게시</button>
				</div>
					
				</div><%-- 댓글 목록 --%>
		
			</div> <%-- 타임라인 영역 끝 --%>
			
			
			
				<%-- 글쓰기 영역: 로그인 된 상태에서만 보여짐 --%>
			<div class="write-box border rounded m-3">
				<div class="textareaBox rounded">
					 <textarea class="textareaTimeline w-100"   placeholder="내용을 입력해주세요."></textarea>
					 	<div class="file-upload d-flex justify-content-between">
					 		 <%-- file태그는 숨겨두고 이미지를 클릭하면 file태그를 클릭한 것처럼 이벤트 줌. --%>
					 		 <input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
							 <a href="#" id="fileUploadBtn"><img alt="이미지" width="40" height="40" src="data:image/png;base64,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"></a>
						 	 <button type="button" id="timelineBtn" name="timelineBtn" class="btn btn-info col-2">게시</button>		   			
			   			</div>
			    </div>
			</div> <%-- 글쓰기 영역 끝 --%>
		</div> 	
	</div> 
</div>



