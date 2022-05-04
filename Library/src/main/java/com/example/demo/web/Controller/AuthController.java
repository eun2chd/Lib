package com.example.demo.web.Controller;

import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.AuthService;
import com.example.demo.web.dto.auth.SignupReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class AuthController {
	
	private final AuthService authService;
	
	@PostMapping("/auth/signup")
	public Object signup(@Valid SignupReqDto signupReqDto, BindingResult bindingResult) {
		
		
		return authService.validCheck(signupReqDto, bindingResult);
	}
	

}
