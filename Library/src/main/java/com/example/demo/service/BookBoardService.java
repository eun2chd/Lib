package com.example.demo.service;

import java.util.List;

import com.example.demo.config.auth.PrincipalDetails;
import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.BookSearch;
import com.example.demo.domain.book.BookShowInfo;
import com.example.demo.domain.book.MyLibBoard;
import com.example.demo.web.dto.board.BorrowReqDto;


public interface BookBoardService {
	
	public List<BookBoard> getBookBoard(int page);
	public List<BookSearch> getBookSearch(String keyword, int page);
	public BookShowInfo getBookShowInfo(String bookname);
	
//	대출이력 조회
	public List<MyLibBoard> getLibBookBoard(String user_id,int page);
	
//	대여책
	public int insertBorrowBook(PrincipalDetails principalDetails,BorrowReqDto borrowReqDto);
	
	
	
	
}
