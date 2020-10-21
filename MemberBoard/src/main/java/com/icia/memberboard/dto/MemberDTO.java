package com.icia.memberboard.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.*;

@Getter
@Setter
@ToString
public class MemberDTO {
	private String mid;
	private String mpassword;
	private String mname;
	private String mphone;
	private String memail;
	private String mbirth;
	private String maddress;
	private String kakaoId;
	private String naverId;
	
	private MultipartFile mfile;
	private String mprofile;
}
