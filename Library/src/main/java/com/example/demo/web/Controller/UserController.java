package com.example.demo.web.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@ResponseBody
@Controller
public class UserController {
	
	
	private final UserService userService;
	
//	아이디 체크
	@PostMapping("/auth/idcheck")
	public int idCheck(@RequestParam("id") String id) {
		
		int cnt = userService.idCheck(id);
		
		return cnt;
	}
	
	@PostMapping("/auth/emailCheck")
	public int emailCheck(@RequestParam("email") String email) {
		
		int emailFlag = userService.emailCheck(email);
		
		return emailFlag;
	}
	
}
