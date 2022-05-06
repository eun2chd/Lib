package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.BookSearch;
import com.example.demo.domain.book.BookShowInfo;
import com.example.demo.domain.book.Paging;
import com.example.demo.domain.user.BookInfoRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class bookBoardServiceImpl implements BookBoardService{
	
	private final BookInfoRepository bookInfoRepository;

	// 책 list 받아오기
	@Override
	public List<BookBoard> getBookBoard(int page) {
		
		Paging pag = new Paging();
		
		int totalPage = pag.TotalPage(bookInfoRepository.bookListTotalCount());
				
		// 사용자가 get 요청으로 페이지를 임의로 수정해도 끝페이지로 이동되게
		if(page > totalPage) {
			page = totalPage;
		}
		// 책 정보 조회 쿼리 날리기
		List<BookBoard> bookBoardslist = bookInfoRepository.getBookList();
		// 책 정보 db 전체 개수
		int BookTotalList = bookBoardslist.size();
		
		
		
		// list 배열에 담기
		List<BookBoard> boardList = new ArrayList<BookBoard>();
		
		
		
		// 한 페이지에 나올 게시물 수 : 14개 [ 몇개의 책 리스트를 보여줄건지 ]
		int startIndex = (page - 1) * 14;
		int endindex = page * 14;
	
		
		for(int i = startIndex; i < endindex && i < BookTotalList; i++) {
			boardList.add(bookBoardslist.get(i));
		}
		
	
		return boardList;
	}

	@Override
	public List<BookSearch> getBookSearch(String keyword, int page) {
		// TODO Auto-generated method stub
		List<BookSearch> BookSearchBoard = new ArrayList<BookSearch>();
		List<BookSearch> BookSearchList = bookInfoRepository.getBookSearchList(keyword);
	
		
//		keyword 가 "" 이라면 list 를 초기화 하고 return 해라 또는 bookSearchList 값이 없으면 초기화 후 리턴
		if(keyword == "" || BookSearchList.size() == 0) {
			
			BookSearchBoard.clear();
			return BookSearchBoard;
			
		}else {
			
			
			int BookTotalSize = BookSearchList.size();
			
		
			Paging pag = new Paging();
			
			int totalPage = pag.SearchTotal(bookInfoRepository.bookSearchTotalCount(keyword));
			
			if(page > totalPage) {
				page = totalPage;
			}
		
			int startIndex = (page - 1) * 10;
			int endindex = page * 10;
		
			
			for(int i = startIndex; i < endindex && i < BookTotalSize; i ++) {
				BookSearchBoard.add(BookSearchList.get(i));
			}
			
			return BookSearchBoard;
		}

	
	}

	@Override
	public BookShowInfo getBookShowInfo(String bookname) {
	
		BookShowInfo BookShowList = bookInfoRepository.BookShowInfoBoard(bookname);
		
		
		return BookShowList;
	}

	
		
	
}
