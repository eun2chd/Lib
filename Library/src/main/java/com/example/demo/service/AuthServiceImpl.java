package com.example.demo.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.example.demo.domain.user.User;
import com.example.demo.domain.user.UserRepository;
import com.example.demo.web.dto.auth.SignupReqDto;
import com.example.demo.web.dto.auth.SignupRespDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class AuthServiceImpl implements AuthService{
	
	private final UserRepository userRepository;

	@Override
	public SignupRespDto<?> validCheck(SignupReqDto signupReqDto, BindingResult bindingResult) {
		// TODO Auto-generated method stub
//		hashmap(key,value) 형태로 저장 map.put("ao1","김포공항정문")
//		데이터 다음과 같이 저장 = {a01 = 김포공항정문}
		
		if(bindingResult.hasErrors()) { // 결과값이 true 일때
			
			Map<String, String> errorMap = new HashMap<String, String>();
			
			for (FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
			
			SignupRespDto<Map<String, String>> signupRespDto = new SignupRespDto<Map<String,String>>();
			signupRespDto.setCode(400);
			signupRespDto.setData(errorMap);
			
			
			return signupRespDto; // 에러정보를 넘겨줌
		} else {
			int usereEmail = userRepository.UserEmailCheck(signupReqDto.getEmail());
			int userid = userRepository.IdCheck(signupReqDto.getUserid());
	
			SignupRespDto<String> signupRespDto = new SignupRespDto<String>();
			if(usereEmail == 0 && userid == 0) {
				// 사용가능한 이메일
				User userEntity = signupReqDto.toEntity();
				userRepository.insertUser(userEntity);
				signupRespDto.setCode(200);
				signupRespDto.setData("회원가입 정상적으로 완료");
			}else {
				// 아이디 중복
				signupRespDto.setCode(401);
				signupRespDto.setData("아이디 또는 이메일이 중복되었습니다.");
				
			}
			
			return signupRespDto; // 사용자 정보를 넘겨줌 
			
		}
			
	}
}