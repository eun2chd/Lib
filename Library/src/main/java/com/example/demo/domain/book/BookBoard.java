package com.example.demo.domain.book;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookBoard {
//	book list 보여줄 데이터를 저장합니다.
	private int KEY_NUM;
	private String LOCATION;
	private String REF_ROOM;
	private String BOOK_NAME;
	private String AUTHOR;	
	private String PUBLISHER;
	private String BOOK_IMG;
	private int YR_PUBLICATION;

}
