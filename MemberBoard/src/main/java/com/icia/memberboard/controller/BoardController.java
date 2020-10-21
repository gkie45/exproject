package com.icia.memberboard.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.memberboard.dto.CommentDTO;
import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.service.BoardService;



@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	private ModelAndView mav;
	
	// 글쓰기 폼으로
	@RequestMapping(value = "/boardwriteform")
	public String boardwrite() {
		return "boardv/BoardWriteForm";
	}
	// 글쓰기
	@RequestMapping(value = "boardwrite") 
	public ModelAndView boardWriteFile(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
		mav = boardService.boardwrite(board);
		return mav;
	}
	// 글 목록 조회
	@RequestMapping(value = "/boardlist")
	public ModelAndView boardList(@RequestParam(value="page",required=false,defaultValue="1") int page,
			@RequestParam (value="order") String order,
			@RequestParam (value="keyword") String keyword,
			@RequestParam("searchtype") String searchtype) {
		mav = boardService.boardList(page,order,keyword,searchtype);
		return mav;
	}
	// 글 상세 조회
		@RequestMapping(value = "/boardview")
		public ModelAndView boardview(@ModelAttribute CommentDTO cTO,@ModelAttribute BoardDTO board,@RequestParam(value="page",required=false,defaultValue="1") int page,@RequestParam (value="order") String order,@RequestParam (value="keyword") String keyword,@RequestParam("searchtype") String searchtype) {
			int bnumber = board.getBnumber();
			mav = boardService.boardView(cTO,bnumber,page,order,keyword,searchtype);
			return mav;
	}
		@RequestMapping(value = "/boardsearch")
		public ModelAndView boardSearch(@RequestParam("searchtype") String searchtype, @RequestParam("keyword") String keyword,@RequestParam("order") String order,@RequestParam(value="page",required=false,defaultValue="1") int page) {
			mav = boardService.boardSearch(searchtype,keyword,order,page);
			return mav;
		}
	// 글 수정창
		@RequestMapping(value = "/boardViewform")
		public ModelAndView boardudatech(@ModelAttribute BoardDTO board,
				@RequestParam("order") String order,
				@RequestParam(value="page",required=false,defaultValue="1") int page) {
			int bnumber = board.getBnumber();
			mav = boardService.boardUpdate(bnumber,order,page);
			return mav;
		}
	// 글 수정처리
		@RequestMapping(value = "/boardmodify")
		public ModelAndView boardModify(@ModelAttribute BoardDTO board,
				@RequestParam("order") String order,
				@RequestParam(value="page",required=false,defaultValue="1") int page) {
				mav = boardService.boardModify(board,order,page);
				return mav;
		}
	
}
