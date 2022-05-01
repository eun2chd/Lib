package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.BookSearch;


public interface BookBoardService {
	
	public List<BookBoard> getBookBoard(int page);
	public List<BookSearch> getBookSearch(String keyword, int page);
	

}
