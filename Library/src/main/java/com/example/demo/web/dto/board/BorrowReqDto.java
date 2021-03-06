package com.example.demo.web.dto.board;

import com.example.demo.domain.book.BookBorrowBoard;

import lombok.Data;

@Data
public class BorrowReqDto {
	
	private int id;
	private String bookname;
	private String bookauthor;
	private String bookpublisher;
	private String booklocation;

	
	public BookBorrowBoard toEntity(int userkey) {
		return BookBorrowBoard.builder()
				.id(id)
				.bookname(bookname)
				.bookauthor(bookauthor)
				.bookpublisher(bookpublisher)
				.booklocation(booklocation)
				.user_key(userkey)
				.build();
			
	}
}
