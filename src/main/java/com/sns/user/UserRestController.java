package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sns.common.EncryptUtils;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user") // 클라이언트가 요청한 URL path와 일치하는 메소드가 수행된다.
@RestController // 웹 주소로 요청하면, 웹사이트 View 화면이 아닌 json 같은 데이터를 응답값으로 보내준다.
public class UserRestController {

	
	@Autowired
	private UserBO userBO;
	
	
	
	/**
	 * 아이디 중복 확인 API
	 * @param loginId
	 * @return
	 */
	
	
	// 중복 체크
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId){
				
		
		Map<String, Object> result = new HashMap<>();
		
		// select
		User user = userBO.getUserByLoginId(loginId);  // @Controller + @ResponseBody (@RestController) 있어서, model 안씀.**
		
		if(user != null) {
			result.put("code", 1);
			result.put("result", true);
		} else {
			result.put("code", 1);
			result.put("result", false);
		}
		return result;
		
				
	}
	
	
	
	
	
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email){
		
		// 비밀번호 해싱
		String hashedPassword = EncryptUtils.md5(password);
		
		// db insert
		userBO.addUser(loginId, hashedPassword, name, email);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	
	
	
	
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
		@RequestParam("loginId") String loginId,
		@RequestParam("password") String password,
		HttpServletRequest request) {
	
		// password hashing
		String hashedPassword = EncryptUtils.md5(password);
		
		// select null or 1행   // ** select - hashedPassword로 해야함.
		User user = userBO.getUserByLoginIdPassword(loginId, hashedPassword);
		
		// 로그인 처리
		Map<String, Object> result = new HashMap<>();
		if (user != null) {   // 로그인
			result.put("code", 1);
			result.put("result", "성공");
			
			
			// ** 질문!! : 왜 getId, getName, getLoginId만 담나요????????????????
			// 세션에 유저 정보 담기 (로그인 상태 유지) - 로그인만 담아라.  - 서버에 정보 담는 것.  setAttribute(속성명,속성값);속성 추가 하기
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("profileImagePath", user.getProfileImagePath());
			
		}  else {  // 로그인 불가
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자 입니다.");  // 로직상 에러임. 				
		}
				
		return result;
			
		
	}
	
	
	
	
	@PutMapping("/update")
	public Map<String, Object> create (
		@RequestParam("file") MultipartFile file,
		HttpSession session) {
		
		// session에서 유저 정보 꺼내옴.
		int userId = (int)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		// db insert
		int rowCount = userBO.updateProfileUser(userId,userLoginId,file);
				
		
		// 응답
		Map<String, Object> result = new HashMap<>();
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "메모를 저장하지 못했습니다.");
		}
		return result;
		
		
	}
		
	
}
