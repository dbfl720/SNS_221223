package com.sns.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component   // 특정한 역할을 하지 않은 조상 spring bean // 클래스를 Spring Bean으로 만드는 기본 어노테이션
public class FileManagerService {

	// 실제 업로드 된 이미지가 저장될 경로 (서버)
	public static final String FILE_UPLOAD_PATH = "/Users/hongyuri/Desktop/메가스터디 IT/Spring_project/sns/workspace/images/";


	// input: MultipartFile(이미지 파일), loginId(이미지 겹치지 않게 하기 위해)
	// output: image path(String)
	public String saveFile(String userLoginId, MultipartFile file) {
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName; //Users/hongyuri/Desktop/메가스터디 IT/Spring_project/memo/workspace///aaaa_167093485/
		
		// 디렉토리 생성
		File directory = new File(filePath); // 디렉토리명 +  // 한글문자 업로드되면 에러. 
		if (directory.mkdir() == false) {  // **breakpoint
			return null;  // 디렉토리 생성 시 실패하면 null을 리턴
		}
		
		
		// 파일 업로드 : byte 단위로 업로드, 파일명의 한글 깨짐을 방지
		try {
			byte[] bytes = file.getBytes();
			
			// 파일명 암호화
			String origName = new String(file.getOriginalFilename().getBytes("8859_1"),"UTF-8"); // 파일명의 한글 깨짐을 방지하기 위해 UTF-8로 바꿔준다.
			String ext = origName.substring(origName.lastIndexOf(".")); // 확장자
			String saveFileName = getUuid() + ext;   // 파일명을 암호화된 uuid + 확장자명으로 바꿔준다. 이렇게 하면 내 파일명이 랜덤하게 암호화된다.
			
			Path path = Paths.get(filePath + saveFileName);
			Files.write(path, bytes);  // 파일 업로드
			
			return "/images/" + directoryName + saveFileName;
	
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	  // uuid 생성
		public static String getUuid() {
			return UUID.randomUUID().toString().replaceAll("-", "");
		}
}





