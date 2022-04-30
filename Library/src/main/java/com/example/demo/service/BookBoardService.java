package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.domain.book.Pagezing;
import com.example.demo.domain.user.BookInfoRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BookBoardService implements bookBoardServiceImpl{

	private final BookInfoRepository bookInfoRepository;
	
	
	@Override
	public int BoardPagzing(int page) {
		
		Pagezing PageMak = new Pagezing();
		
		int totalCount = bookInfoRepository.bookListTotalCount();
		int currentPage = page;
		
		
		PageMak.setTotalPage(totalCount);
		PageMak.setStartPage(currentPage);
		PageMak.setEndPage(currentPage);
		
		System.out.println(page);
		
		return page;
	}
	
	

}