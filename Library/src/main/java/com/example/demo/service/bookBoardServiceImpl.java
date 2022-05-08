package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.config.auth.PrincipalDetails;
import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.BookBorrowBoard;
import com.example.demo.domain.book.BookSearch;
import com.example.demo.domain.book.BookShowInfo;
import com.example.demo.domain.book.MyLibBoard;
import com.example.demo.domain.book.Paging;
import com.example.demo.domain.user.BookInfoRepository;
import com.example.demo.web.dto.board.BorrowReqDto;


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
	

	@Override
	public int insertBorrowBook(PrincipalDetails principalDetails, BorrowReqDto borrowReqDto) {
		// TODO Auto-generated method stub
		int code = 0;
		
		if(principalDetails != null) {
			
			BookShowInfo bookShowInfo = new BookShowInfo();
			
			int status = bookInfoRepository.selectBorrowBoard(borrowReqDto.getId());
			
			if(status != 0) {
				BookBorrowBoard borrowEntity = borrowReqDto.toEntity(principalDetails.getUser().getId());
				bookInfoRepository.insertBorrowBoard(borrowEntity);
				bookInfoRepository.updateBorrowBoard(borrowReqDto.getId());
				return  code = 200;
			}else {
				return  code = 400;
			}
		
			
		}else {
		     return code = 401;
		}
		

	}

	@Override
	public List<MyLibBoard> getLibBookBoard(String user_id,int page) {
		
		List<MyLibBoard> LibBoardList = new ArrayList<MyLibBoard>();
		List<MyLibBoard> LibList = bookInfoRepository.getMyLibBoard(user_id);
		
		
		int totalSize = LibList.size();
		int startIndex = (page - 1) * 10;
		int endindex = page * 10;
		
		for(int i = startIndex; i < endindex && i < totalSize; i++) {
			LibBoardList.add(LibList.get(i));
		}
		
		// TODO Auto-generated method stub
		return LibBoardList;
	}


}
