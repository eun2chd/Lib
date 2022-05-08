package com.example.demo.web.Controller;

import java.lang.reflect.Method;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.book.BookShowInfo;
import com.example.demo.domain.user.BookInfoRepository;
import com.example.demo.service.BookBoardService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class BookShowController {
	
	private final BookBoardService bookBoardService;
	
	
	@GetMapping("/book/bookshow")
	public String BookShow(Model model, @RequestParam(value = "bookname")  String bookname) {
		
		System.out.println(bookname);
		
		BookShowInfo BookShowBoard = bookBoardService.getBookShowInfo(bookname);
		
		System.out.println(BookShowBoard);
	
		model.addAttribute("showbook",BookShowBoard);
		
		return "book/Bookshow";
	}
		
}
