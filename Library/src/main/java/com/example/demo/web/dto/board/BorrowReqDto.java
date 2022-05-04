package com.example.demo.web.dto.board;

import com.example.demo.domain.book.BookBorrowBoard;

import lombok.Data;

@Data
public class BorrowReqDto {
	
	private String bookname;
	private String bookauthor;
	private String bookpublisher;
	private String booklocation;
	
	
	public BookBorrowBoard toEntity(int userkey) {
		return BookBorrowBoard.builder()
				.bookname(bookname)
				.bookauthor(bookauthor)
				.bookpublisher(bookpublisher)
				.user_key(userkey)
				.build();
			
	}
}
