package com.example.demo.domain.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.BookSearch;
import com.example.demo.domain.book.Paging;



@Mapper
public interface BookInfoRepository {
	
	// 책정보 목록을 list로 담아오기
	public List<BookBoard> getBookList();
	// 책정보 테이블 총 갯수
	public int bookListTotalCount();
	
	// 책 검색 list 로 담아오기
	public List<BookSearch> getBookSearchList(String keyword);
	// 사용자가 검색한 책 갯수 담아오기
	public int bookSearchTotalCount(String keyword);

}
