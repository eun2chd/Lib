package com.example.demo.web.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.Pagezing;
import com.example.demo.domain.user.BookInfoRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/book")
public class BookWrapListController {
	
	private final BookInfoRepository bookInfoRepository;
	
	
//	쿼리스트링은 소문자로 써야한다. 안그럼 값이 안담아짐 ;; 삽질의 결과
	@GetMapping("/booklist")
	public String WrapBookListForm(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int Page) {
		
			
		
			int startIndex = (Page - 1) * 12;
			int endindex = Page * 12;
			
		
			
				
			List<BookBoard> bookBoardslist = bookInfoRepository.getBookList(startIndex, endindex);
		

			int boardAll = bookInfoRepository.bookListTotalCount();	
			
			System.out.println(boardAll);
			
			List<BookBoard> boardList = new ArrayList<BookBoard>();
			
			for(int i = startIndex; i < endindex && i < boardAll; i++) {
				boardList.add(bookBoardslist.get(i));
			}
			
			model.addAttribute("list", boardList);
			
			
		
			
		return "/book/booklist";
	}
	

}
