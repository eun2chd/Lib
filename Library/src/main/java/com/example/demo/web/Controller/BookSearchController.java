package com.example.demo.web.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.book.BookSearch;
import com.example.demo.domain.book.Pagezing;
import com.example.demo.domain.user.BookInfoRepository;
import com.example.demo.service.BookBoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BookSearchController {
	
		private final BookBoardService bookBoardService;
		private final BookInfoRepository bookInfoRepository;
	
		@PostMapping("/book-search")
		public String SearchForm(Model model, @RequestParam(value = "keyword") String keyword) {
			
			List<BookSearch> BookSearchBoard = bookBoardService.getBookSearch(keyword);
			
			Pagezing BookPag = new Pagezing();
			
			BookPag.BookName(keyword);
			int total = bookInfoRepository.bookSearchTotalCount(keyword);
			
			BookPag.BookSearchTotal(total);

	
			model.addAttribute("Serch", BookSearchBoard);
			model.addAttribute("bookSerch", BookPag);
			

			return "/book/search";
		}		
	
}
