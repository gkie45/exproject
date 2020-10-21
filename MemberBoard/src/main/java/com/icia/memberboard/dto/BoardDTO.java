package com.icia.memberboard.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	private int bnumber; // 글번호
	private String bwriter; // 작성자
	private String bpassword; // 글 비밀번호
	private String btitle; // 글제목
	private String bcontents; // 글내용
	private String bdate; // 작성일
	private int bhits; // 조회수
	
	private MultipartFile bfile;
	private String bfilename;
}
