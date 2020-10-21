package com.icia.memberboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.dto.PageDTO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate sql;

	public int boardWrite(BoardDTO board) {
		return sql.insert("Board.boardWrite",board);
	}
	
	public int listConunt(PageDTO paging) {
		return sql.selectOne("Board.boardListCount",paging);
	}

	public List<BoardDTO> boardList(PageDTO paging) {
		return sql.selectList("Board.boardListPaging",paging);
	}
	
	public List<BoardDTO> boardList2(PageDTO paging) {
		return sql.selectList("Board.boardListPaging2",paging);
	}

	public BoardDTO boardView(int bnumber) {
		sql.update("Board.bhitsup",bnumber);
		return sql.selectOne("Board.boardView",bnumber);
	}

	public BoardDTO boardUpdate(int bnumber) {
		return sql.selectOne("Board.boardUpdate",bnumber);
	}
	
	public int boardModify(BoardDTO board) {
		System.out.println(board.toString());
		return sql.update("Board.boardModify",board);
	}

	public List<BoardDTO> boardSearch(PageDTO paging) {
		return sql.selectList("Board.boardSearch",paging);
	}

	public List<BoardDTO> boardSearch2(PageDTO paging) {
		return sql.selectList("Board.boardSearch2",paging);
	}

	
}
