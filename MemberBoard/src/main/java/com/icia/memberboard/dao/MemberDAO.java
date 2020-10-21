package com.icia.memberboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.memberboard.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sql;
		
	public int memberJoin(MemberDTO member) {
		return sql.insert("Member.memberJoin", member);
	}

	public String idOverlap(String mid) {
		return sql.selectOne("Member.idOverlap",mid);
	}

	public String memberLogin(MemberDTO member) {
		return sql.selectOne("Member.memberLogin",member);
	}

	public List<MemberDTO> memberList() {
		return sql.selectList("Member.memberList");
	}

	public MemberDTO memberView(String mid) {
		return sql.selectOne("Member.memberView",mid);
	}

	public MemberDTO memberUpdate(String mid) {
		return sql.selectOne("Member.memberUpdate",mid);
	}

	public int memberModify(MemberDTO member) {
		return sql.update("Member.memberModify",member);
	}

}
