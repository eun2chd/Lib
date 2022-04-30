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
		
			
		
			
			bookBoardService.BoardPagzing(Page);
			Pagezing Pag = new Pagezing();
			int totalPage = Pag.TotalPage(bookInfoRepository.bookListTotalCount());
		
			Pag.StartPageNum(Page);
			Pag.EndPageNum();
			System.out.println(Pag.getCurrentPage());
			
			if(Page > totalPage) {
				Page = totalPage;
			}
			
		
//			한페이지에 나올 List 책정보 갯수 [ 한 페이지당 몇개의 책 리스트를 보여줄건지 정함 ] 
			int startIndex = (Page - 1) * 14;
			int endindex = Page * 14;
			
		
			// db 데이터에 Limit 로 갯수를 조회하기위해서 시작번호와 끝번호를 넘겨줌
			// 일단 코드 수정 할것 Limit로 안들고 와도 될거같음
			List<BookBoard> bookBoardslist = bookInfoRepository.getBookList(startIndex, endindex);
		
			// 책정보 db 전체 데이터 갯수를 구함
			int boardAll = bookInfoRepository.bookListTotalCount();	
			
			
			
			List<BookBoard> boardList = new ArrayList<BookBoard>();
			
			for(int i = startIndex; i < endindex && i < boardAll; i++) {
				boardList.add(bookBoardslist.get(i));
			}
			
			model.addAttribute("list", boardList);
			model.addAttribute("pagelist", Pag);
			
			
		return "/book/booklist";
	}
	

}
