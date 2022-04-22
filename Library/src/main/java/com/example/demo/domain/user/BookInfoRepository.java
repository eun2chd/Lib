package com.example.demo.domain.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.web.dto.bookList;

@Mapper
public interface BookInfoRepository {
	
	// 책정보 목록을 list로 담아오기
	public List<bookList> getBookList();
	// 책정보 테이블 총 갯수
	public int bookListTotalCount();

}
