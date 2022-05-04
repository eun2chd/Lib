package com.example.demo.web.Controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.config.auth.PrincipalDetails;
import com.example.demo.domain.book.BookSearch;
import com.example.demo.service.BookBoardService;
import com.example.demo.web.dto.board.BorrowReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class BookBorrowController {
	
	private final BookBoardService bookBoardService;
	
	@PostMapping("book-search/borrow")
	public boolean BookBorrowInsert(@AuthenticationPrincipal PrincipalDetails principalDetails,BorrowReqDto borrowReqDto) {
		
		System.out.println(principalDetails);
		System.out.println(borrowReqDto);
		return true;
	}
	


}
