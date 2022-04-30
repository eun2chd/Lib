package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.book.BookBoard;
import com.example.demo.web.dto.BookInfo.BookRespDto;

public interface BookBoardService {
	
	public List<BookBoard> getBookBoard(int page);
	
	

}
