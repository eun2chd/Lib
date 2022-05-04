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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.domain.user.BookInfoRepository;
import com.example.demo.service.UserService;

import lombok.RequiredArgsConstructor;


@Controller
public class PageController {
	


	
	@GetMapping({"/","/index"})
	public String indexForm() {
		return "index";
	}
	
	@GetMapping("/auth/signin")
	public String signForm(@RequestParam(value = "error", required = false)String error,
						   @RequestParam(value = "exception", required = false)String exception, Model model) {
		
		model.addAttribute("error",error);
		model.addAttribute("exception", exception);
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
	
	
	@GetMapping("/user/myinter")
	public String myInterFrom() {
		return "/user/myInterest";
	}
	
	@GetMapping("/auth/signup-terms")
	public String SignupTermsForm() {
		return "auth/signup-terms";
	}
	
	@GetMapping("/auth/signup")
	public String SignupForm() {
		return "auth/signup";
	}
	
	@GetMapping("/user/user-edit")
	public String accountsEdit() {
		return "accounts/accounts-edit";
	}
	
	@GetMapping("/user/password-edit")
	public String accountsPassword() {
		return "accounts/accounts-password";
	}

	
	
}	
