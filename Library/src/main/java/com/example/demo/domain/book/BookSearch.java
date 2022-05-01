package com.example.demo.domain.book;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookSearch {
	
	private String BOOK_NAME;
	private String AUTHOR;	
	private String PUBLISHER;
	private String LOCATION;
	private String CALL_SIGN;

}
