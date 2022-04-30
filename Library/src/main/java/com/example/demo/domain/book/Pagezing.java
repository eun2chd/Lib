package com.example.demo.domain.book;

import lombok.Data;

@Data
public class Pagezing {
	
	// 시작페이지 
	private int startPage;
	// 페이지당 출력할 갯수
	private int endPage = 10;
	// 총 페이지 수 
	private int totalPage;
	
	// 한페이지에 나올 데이터수
	private int BookBoardNumber = 14;
	// 한 그룹에 나올 페이지수
	private int GroupPage = 10;
	// 현재 페이지
	private int currentPage;
	
	private boolean next;
	private boolean prev;
	
	// 총 나와야할 페이지 수
	public int TotalPage(int totalCount) {
		
		this.totalPage = totalCount / BookBoardNumber;
		
		if(this.totalPage % BookBoardNumber > 0) {
			totalPage++;
		}
			
		return this.totalPage;
	}
	
	// 시작 페이지 구하기 ( 현재 페이지 값을 받아서 계산함)
	public int StartPageNum(int page) {
		currentPage = page;
		this.startPage = ((currentPage - 1) / GroupPage) * GroupPage + 1;
		return this.startPage;
	}
	
	// 끝 페이지 구하기
	public int EndPageNum() {
		endPage = (startPage + GroupPage) - 1;
		
		if(totalPage < endPage) {
			endPage = totalPage;
		}
		
		return endPage;
	}
	
	// 이전 페이지 활성화 여부
	public boolean pagePrev() {
		
		prev = startPage == 1 ? false : true;

		return prev;

	}
	// 다음 페이지 활성화 여부
	public boolean pageNext(int totalCount) {
	

		next = endPage * BookBoardNumber >= totalCount ? false : true;
		return next;
	}
	

}
