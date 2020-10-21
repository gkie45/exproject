package com.icia.memberboard.service;

import java.io.File;
import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.memberboard.dto.PageDTO;
import com.icia.memberboard.dao.CommentDAO;
import com.icia.memberboard.dao.BoardDAO;
import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.dto.CommentDTO;


@Service
public class BoardService {

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private CommentDAO cDAO;

	private ModelAndView mav;

	private static final int PAGE_LIMIT = 3;
	private static final int BLOCK_LIMIT = 5;

	public ModelAndView boardwrite(BoardDTO board) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile bfile = board.getBfile();
		String bfilename = bfile.getOriginalFilename();

		String savePath = "D:\\source\\spring\\Board201012\\src\\main\\webapp\\resources\\uploadFile\\" + bfilename;

		if (!bfile.isEmpty()) {
			bfile.transferTo(new File(savePath));
		}
		board.setBfilename(bfilename);
		int writeResult = bDAO.boardWrite(board);
		if (writeResult > 0)
			mav.setViewName("memberv/Main2");
		return mav;
	}

	public ModelAndView boardList(int page, String order, String keyword, String searchtype) {
		PageDTO paging = new PageDTO();
		paging.setKeyword(keyword);
		paging.setSearchtype(searchtype);
		mav = new ModelAndView();
		int listCount = bDAO.listConunt(paging);
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setOrder(order);
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		if(order.equals("BNUMBER")) {
		boardList = bDAO.boardList(paging);
		}else {
		boardList = bDAO.boardList2(paging);	
		}
		int maxPage = (int) (Math.ceil((double) listCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		mav.addObject("paging", paging);
		mav.addObject("boardList", boardList);
		mav.setViewName("boardv/BoardList");
		return mav;
	}

	public ModelAndView boardView(CommentDTO cTO, int bnumber, int page, String order, String keyword, String searchtype) {
		mav = new ModelAndView();
		BoardDTO boardView = bDAO.boardView(bnumber);
		List<CommentDTO> commentList = cDAO.commentlist(bnumber);
		mav.addObject("keyword",keyword);
		mav.addObject("searchtype",searchtype);
		mav.addObject("commentList",commentList);
		mav.addObject("order", order);
		mav.addObject("page", page);
		mav.addObject("boardView", boardView);
		mav.setViewName("boardv/BoardView");
		return mav;
	}

	public ModelAndView boardUpdate(int bnumber, String order, int page) {
		mav = new ModelAndView();
		BoardDTO boardUpdate = bDAO.boardUpdate(bnumber);
		mav.addObject("order",order);
		mav.addObject("page",page);
		mav.addObject("boardUpdate",boardUpdate);
		mav.setViewName("boardv/BoardUpdate");
		return mav;
	}

	public ModelAndView boardModify(BoardDTO board, String order, int page) {
		bDAO.boardModify(board);
		mav.setViewName("redirect://boardview?bnumber="+board.getBnumber()+"&page="+page+"&order="+order);
		return mav;
	}
	public ModelAndView boardSearch(String searchtype, String keyword, String order, int page) {
		PageDTO paging = new PageDTO();
		paging.setSearchtype(searchtype);
		paging.setKeyword(keyword);
		mav = new ModelAndView();
		int listCount = bDAO.listConunt(paging);
		int startRow = (page-1)*PAGE_LIMIT + 1;
		int endRow = page*PAGE_LIMIT;
		
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setOrder(order);
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		if(order.equals("BNUMBER")) {
			boardList = bDAO.boardSearch(paging);
		}else {
			boardList = bDAO.boardSearch2(paging);
		}
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		mav.addObject("paging",paging);
		mav.addObject("boardList",boardList);
		mav.setViewName("boardv/BoardList");
		return mav;
	}

}	
