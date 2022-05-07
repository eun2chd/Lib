package com.example.demo.domain.book;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class BookBorrowBoard {

	private String bookname;
	private String bookauthor;
	private String bookpublisher;
	private String booklocation;
	private int user_key;
	private LocalDateTime create_date;
	private LocalDateTime update_date;

}
