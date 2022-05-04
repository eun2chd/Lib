package com.example.demo.domain.book;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookSearch {
//	사용자가 책을 검색한 결과를 표시하기 위해 데이터를 저장합니다.
	private String BOOK_NAME;
	private String AUTHOR;	
	private String PUBLISHER;
	private String LOCATION;
	private String CALL_SIGN;

}
