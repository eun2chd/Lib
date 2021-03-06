package com.example.demo.service;

import org.springframework.validation.BindingResult;

import com.example.demo.web.dto.auth.SignupReqDto;
import com.example.demo.web.dto.auth.SignupRespDto;

public interface AuthService {
	// 회원가입 로직 처리
	public SignupRespDto<?> validCheck(SignupReqDto signupReqDto, BindingResult bindingResult);

}
