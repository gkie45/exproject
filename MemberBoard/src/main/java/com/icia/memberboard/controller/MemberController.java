package com.icia.memberboard.controller;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.service.MemberService;






@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	// 메인 페이지
	@RequestMapping(value = "/")
	public String home() {
		return "Main";
	}
	
	// 회원가입 폼으로
	@RequestMapping(value = "memberjoinform")
	public String memberjoin() {
		return "memberv/MemberJoinForm";
	}
	
	// 회원가입
	@RequestMapping(value = "/memberjoin")
	public ModelAndView memberJoin(@ModelAttribute MemberDTO member,
			@RequestParam("sample6_address") String address1,
			@RequestParam("sample6_detailAddress") String address2)
			throws IllegalStateException, IOException {
		member.setMaddress(address1+""+address2);
		System.out.println(member.toString());
		mav = memberService.memberJoin(member);
		return mav;
	}
	
	// 아이디 중복확인
	@RequestMapping(value="/idoverlap")
	public @ResponseBody String idOverlap(@RequestParam("mid") String mid) {
		System.out.println("전달받은 값"+mid);
		String resultMsg = memberService.idOverlap(mid);
		return resultMsg;
	}
	
	// 로그인 폼으로
	@RequestMapping(value = "memberloginform")
	public String memberloginform() {
		return "memberv/MemberLoginForm";
	}
	
	// 로그인
	@RequestMapping(value = "memberlogin")
	public ModelAndView memberLogin(@ModelAttribute MemberDTO member) {
		mav = memberService.memberLogin(member);
		return mav;
	}	
	// 로그아웃

	@RequestMapping(value="/logout")
	public String memberLogout() {
		session.invalidate();
		return "Main";
	}
	// 회원 목록 조회 (관리자)
	@RequestMapping(value = "/memberlist")
	public ModelAndView memberList() {
		mav = memberService.memberList();
		return mav;
	}
	// 멤버 상세 조회
	@RequestMapping(value = "/memberview")
	public ModelAndView memberView(@ModelAttribute MemberDTO member) {
		String mid = member.getMid();
		mav = memberService.memberView(mid);
		return mav;
	}
	
	// 회원 정보 수정창 띄우기
	@RequestMapping(value="/memberupdate")
	public ModelAndView memberUpdate(@ModelAttribute MemberDTO member) {
		String mid = member.getMid();
		mav = memberService.memberUpdate(mid);
		return mav;
	}
	// 회원 정보 수정처리
		@RequestMapping(value = "/membermodify")
		public ModelAndView memberModify(@ModelAttribute MemberDTO member,
				@RequestParam("sample6_address") String address1,
				@RequestParam("sample6_detailAddress") String address2) 
						throws IllegalStateException, IOException {
			member.setMaddress(address1+""+address2);
			mav = memberService.memberModify(member);
			return mav;
		}
	
	// 메인으로
	@RequestMapping(value="/goMain")
	public String goMain() {
		return "memberv/Main2";
	}
}
