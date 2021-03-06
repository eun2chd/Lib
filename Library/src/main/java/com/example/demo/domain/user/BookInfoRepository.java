package com.example.demo.domain.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.BookBorrowBoard;
import com.example.demo.domain.book.BookSearch;
import com.example.demo.domain.book.BookShowInfo;
import com.example.demo.domain.book.MyLibBoard;
import com.example.demo.domain.book.Paging;

@Mapper
public interface BookInfoRepository {
	
	// 책정보 목록을 list로 담아오기
	public List<BookBoard> getBookList();
	// 책정보 테이블 총 갯수
	public int bookListTotalCount();
	
//	책이름 클릭시 해당 책에대한 정보 조회
	public BookShowInfo BookShowInfoBoard(String bookname);
	
	
//	빌린책 삽입 쿼리 날리기
	public int insertBorrowBoard(BookBorrowBoard bookBorrowBoard);
//  빌린책 TBLIB STATUS 코드 업데이트 대출여부
	public int updateBorrowBoard(int id);
//  빌린책 status 코드 조회
	public int selectBorrowBoard(int id);
	
//	대출이력 조회
	public List<MyLibBoard> getMyLibBoard(String user_id);
//  총 갯수 조회
	public int getMyLibTotal(int userkey);
	
	
	// 책 검색 list 로 담아오기
	public List<BookSearch> getBookSearchList(String keyword);
	// 사용자가 검색한 책 갯수 담아오기
	public int bookSearchTotalCount(String keyword);

}
