package com.example.demo.web.dto;

import lombok.Data;

@Data
public class pagination {
	
	// 한 페이지당 보여줄 게시글 수
	private int pageSize = 12;
	// 한 블럭당 페이지 수
	private int rangeSize = 10;
	// 현재 페이지
	private int curPage = 1;
	// 현재 블럭
	private int curRange = 1;
	// 총 게시글 수
	private int listCnt;
	// 총 페이지 수
	private int pageCnt;
	// 총 블럭 수
	private int rangeCtn;
	// 시작 페이지
	private int startPage;
	// 끝 페이지
	private int endPage;
	// 시작 index 
	private int startIndex = 0;
	// 이전 페이지
	private int prevPage;
	// 다음 페이지
	private int nextPage;
	
}
