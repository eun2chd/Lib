package com.example.demo.domain.book;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookBoard {
	
	private int KEY_NUM;
	private String LOCATION;
	private String REF_ROOM;
	private String KEYS_NUM;
	private String BOOK_NAME;
	private String AUTHOR;	
	private String PUBLISHER;
	private int YR_PUBLICATION;

}
