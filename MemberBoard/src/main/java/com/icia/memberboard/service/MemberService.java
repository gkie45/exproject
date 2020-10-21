package com.icia.memberboard.service;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.memberboard.dao.MemberDAO;
import com.icia.memberboard.dto.MemberDTO;




@Service
public class MemberService {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	
	public ModelAndView memberJoin(MemberDTO member) throws IllegalStateException, IOException  {
		mav = new ModelAndView();
		System.out.println(member.toString());
		MultipartFile mfile = member.getMfile();
		String mprofile = mfile.getOriginalFilename();
		
		String savePath = "D:\\source\\spring\\MemberBoard\\src\\main\\webapp\\resources\\uploadFile\\"+mprofile;
		
		if(!mfile.isEmpty()) {
			mfile.transferTo(new File(savePath));
		}
		member.setMprofile(mprofile);
		System.out.println(member.toString());
		int joinResult = mDAO.memberJoin(member);
		
		 if(joinResult > 0) { 
			 // 회원가입 성공시 MemberLogin.jsp 출력
			 mav.setViewName("memberv/MemberLoginForm"); 
			 }
		 
		return mav;
	}

	public String idOverlap(String mid) {
		String checkResult = mDAO.idOverlap(mid);
		String resultMsg = null;
		if(checkResult == null) {
			resultMsg = "OK";
		}else {
			resultMsg ="NO";
		}
		return resultMsg;
	}

	public ModelAndView memberLogin(MemberDTO member) {
		mav = new ModelAndView();
		String loginId = mDAO.memberLogin(member);
		if(loginId != null) {
			// 로그인 성공시 Home.jsp 출력
			session.setAttribute("ID", loginId);
			mav.setViewName("memberv/Main2");
		} else{
			// 로그인 실패시 memberLogin.jsp 출력
			mav.setViewName("LoginFail");
		}
		return mav;
	}

	public ModelAndView memberList() {
		mav = new ModelAndView();
		List<MemberDTO> memberList = mDAO.memberList();
		mav.addObject("memberList",memberList);
		mav.setViewName("memberv/MemberList");
		return mav;
	}

	public ModelAndView memberView(String mid) {
		mav = new ModelAndView();
		MemberDTO memberView = mDAO.memberView(mid);
		mav.addObject("memberView",memberView);
		mav.setViewName("memberv/MemberView");
		return mav;
	}

	public ModelAndView memberUpdate(String mid) {
		mav = new ModelAndView();
		MemberDTO memberUpdate = mDAO.memberUpdate(mid);
		mav.addObject("memberUpdate",memberUpdate);
		mav.setViewName("memberv/MemberUpdate");
		return mav;
	}

	public ModelAndView memberModify(MemberDTO member) {
		int modifyResult = mDAO.memberModify(member);
		
		 if(modifyResult > 0) { 
			 mav.setViewName("redirect://memberview?mid="+member.getMid()); 
			 }
		 
		return mav;
	}
}
