package com.example.demo.web.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.domain.book.BookBoard;
import com.example.demo.domain.book.Pagezing;
import com.example.demo.domain.user.BookInfoRepository;
import com.example.demo.service.BookBoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/book")
public class BookWrapListController {
	
	private final BookInfoRepository bookInfoRepository;
	private final BookBoardService bookBoardService;
	
//	쿼리스트링은 소문자로 써야한다. 안그럼 값이 안담아짐 ;; 삽질의 결과
	@GetMapping("/booklist")
	public String WrapBookListForm(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int Page) {
			
			List<BookBoard> boardList = bookBoardService.getBookBoard(Page);	
			Pagezing BookPage = new Pagezing();
			
			int totalCount = bookInfoRepository.bookListTotalCount();
			// 전체 페이지 수 가져오기
			int totalPage = BookPage.TotalPage(bookInfoRepository.bookListTotalCount());
			// 시작 페이지
			BookPage.StartPageNum(Page);
			// 끝 페이지
			BookPage.EndPageNum();
			// 이전버튼 활성화 여부
			BookPage.pagePrev();
			// 다음버튼 활성화 여부
			BookPage.pageNext(totalCount);
			


			model.addAttribute("list", boardList);
			model.addAttribute("pagelist", BookPage);
			
		return "book/booklist";
	}
	

}
