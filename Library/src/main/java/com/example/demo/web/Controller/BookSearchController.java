package com.example.demo.web.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.book.BookSearch;
import com.example.demo.domain.book.Paging;
import com.example.demo.domain.user.BookInfoRepository;
import com.example.demo.service.BookBoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BookSearchController {
	
		private final BookBoardService bookBoardService;
		private final BookInfoRepository bookInfoRepository;
	
		@GetMapping("/book-search")
		public String SearchForm(Model model, @RequestParam(value = "keyword") String keyword, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
			int total = 0;
			List<BookSearch> BookSearchBoard = bookBoardService.getBookSearch(keyword,page);
			
			Paging BookPag = new Paging();
//			사용자가 입력한 key값을 넘겨주기
			BookPag.BookName(keyword);
			
//			키워드에 값이 빈값인지 체크해서 총 갯수를 total 로 가져옴
			if(keyword != "") {
				total = bookInfoRepository.bookSearchTotalCount(keyword);			
			}else {
				total = 0;
			}
//			총 검색 갯수 count
			BookPag.BookSearchTotal(total);
//			총페이지 수
			BookPag.SearchTotal(total);
//			시작페이지
			BookPag.StartPageNum(page);
//			끝페이지
			BookPag.EndPageNum();
//			이전버튼 활성화 여부
			BookPag.pagePrev();
//			다음버튼 활성화 여부
			BookPag.pageNext(total);
		
			

			model.addAttribute("Serch", BookSearchBoard);
			model.addAttribute("bookSerch", BookPag);
			

			return "/book/search";
		}		
	
}
