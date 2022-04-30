package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.Pagezing;

public interface bookBoardServiceImpl {
	
	public List<BookBoard> getBookBoardList(Pagezing pagezing);

}
