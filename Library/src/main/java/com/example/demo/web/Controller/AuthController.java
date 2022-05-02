package com.example.demo.web.Controller;

import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.web.dto.auth.SignupReqDto;

@RestController
public class AuthController {

	@PostMapping("/auth/signup")
	public Object signup(@Valid SignupReqDto signupReqDto, BindingResult bindingResult) {
		
		System.out.println(signupReqDto);
		
		System.out.println(bindingResult.hasErrors());
		
		if(bindingResult.hasErrors()) {
			System.out.println("벨리데이션 체크 오류");
		}else {
			System.out.println("벨리데이션 체크 성공");
		}
		
		return signupReqDto;
	}
	
	

}
