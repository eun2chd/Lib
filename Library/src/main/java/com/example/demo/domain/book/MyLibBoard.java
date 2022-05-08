package com.example.demo.domain.book;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MyLibBoard {
	
	private int id;
	private String book_name;
	private String lib_name;
	private String author;
	private String publisher;
	private String tb_user_key;
	private LocalDateTime create_date;
	private LocalDateTime updateTime;
}
