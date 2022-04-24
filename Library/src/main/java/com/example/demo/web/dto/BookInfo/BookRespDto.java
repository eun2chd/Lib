package com.example.demo.web.dto.BookInfo;

import java.util.List;

import com.example.demo.domain.book.BookBoard;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookRespDto {

	private List<List<BookBoard>> bookGroup;
	
}
