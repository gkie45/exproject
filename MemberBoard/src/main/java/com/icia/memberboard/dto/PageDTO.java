package com.icia.memberboard.dto;

import lombok.*;

@Getter
@Setter
@ToString
public class PageDTO {
	private String order;
	private String searchtype;
	private String keyword;
	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int startRow;
	private int endRow;
}
