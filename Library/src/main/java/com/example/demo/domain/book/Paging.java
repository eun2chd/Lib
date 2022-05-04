package com.example.demo.domain.book;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
public class Paging {
//	페이징처리를 하기위한 함수들로 구성되어있습니다.
	
	
//	검색영역
	private String keyword;
	

//	
	// 시작페이지 
	private int startPage;
	// 페이지당 출력할 갯수
	private int endPage = 10;
	// 총 페이지 수 
	private int totalPage;
	
	private int total;
	
	// booklist 나올 데이터수
	private int BookBoardNumber = 14;

//	검색페이지에 나올 데이터수
	private int BookSearchBoard = 10;
	
	
	// 한 그룹에 나올 페이지수
	private int GroupPage = 10;
	// 현재 페이지
	private int currentPage;
	
	
	private boolean next;
	private boolean prev;
	
	// 총 나와야할 페이지 수  ( 한페이지에 14개 그룹 )
	public int TotalPage(int totalCount) {
		
		this.totalPage = totalCount / BookBoardNumber;
		
		if(totalCount % BookBoardNumber > 0) {
			totalPage++;
		}

		return this.totalPage;
	}
	
//	총 나와야할 페이지 수 ( 한페이지에 10개 그룹 )
	public int SearchTotal(int totalCount) {
		
		this.totalPage = totalCount / BookSearchBoard;


		if(totalCount % BookSearchBoard > 0) {
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
	
//	검색한 이름 넘겨주기
	public String BookName(String keyword) {
		
		this.keyword = keyword;
		
		return this.keyword;
		
	}
	
	public int BookSearchTotal(int totalCount) {
		return this.total = totalCount;
	}

}
