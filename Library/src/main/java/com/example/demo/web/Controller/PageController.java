package com.example.demo.web.Controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.domain.user.BookInfoRepository;
import com.example.demo.web.dto.bookList;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class PageController {
	
	private final BookInfoRepository bookInfoRepository;
	
	@GetMapping({"/","/index"})
	public String indexForm() {
		return "index";
	}
	
	@GetMapping("/auth/signin")
	public String signForm() {
		return "auth/signin";
	}
	
	@GetMapping("/user/myLib")
	public String MyLibForm() {
		return "user/myLib";
	}
	
	@GetMapping("/user/myhistory")
	public String MyLibHistory() {
		return "user/myLibHistory";
	}
	
	@GetMapping("/book/booklist")
	public String WrapBookListForm(Model model) {
		return "/book/booklist";
	}
	
	@GetMapping("/user/myinter")
	public String myInterFrom() {
		return "/user/myInterest";
	}
	
	@PostMapping("/book-search")
	public String searchForm() {
		return "/book/search";
	}
	

	
}	
