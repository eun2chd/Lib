package com.example.demo.domain.book;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookShowInfo {
	
	private int KEY_NUM;
	private int STATUS_CD;	
	private String LOCATION;
	private String REF_ROOM;
	private String BOOK_NAME;
	private String AUTHOR;
	private String PUBLISHER;
	private String BOOK_IMG;
	private String YR_PUBLICATION;
	private String CALL_SIGN;
}
