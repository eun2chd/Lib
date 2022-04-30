package com.example.demo.domain.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.Pagezing;



@Mapper
public interface BookInfoRepository {
	
	// 책정보 목록을 list로 담아오기
	public List<BookBoard> getBookList();
	// 책정보 테이블 총 갯수
	public int bookListTotalCount();

}
