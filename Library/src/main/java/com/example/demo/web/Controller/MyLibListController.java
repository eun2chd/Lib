package com.example.demo.web.Controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.config.auth.PrincipalDetails;
import com.example.demo.domain.book.MyLibBoard;
import com.example.demo.domain.book.Paging;
import com.example.demo.domain.user.BookInfoRepository;
import com.example.demo.service.BookBoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MyLibListController {

	private final BookBoardService bookBoardService;
	private final BookInfoRepository bookInfoRepository;
	
	@GetMapping("/user/lib/{userid}")
	public String MyLibForm(Model model,@AuthenticationPrincipal PrincipalDetails principalDetails, @PathVariable String userid, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		List<MyLibBoard> libBoards = bookBoardService.getLibBookBoard(userid, page);
		
		
		if(principalDetails != null) {
			Paging BookPag = new Paging();
			int total = bookInfoRepository.getMyLibTotal(principalDetails.getUser().getId());
			//총 검색 갯수 count
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
			
			model.addAttribute("bookSerch", BookPag);
		}
		

		model.addAttribute("Lib", libBoards);
	
		
		return "/user/myLib";
	}

}
