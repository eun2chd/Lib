package com.example.demo.web.Controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.config.auth.PrincipalDetails;
import com.example.demo.service.AccountsService;
import com.example.demo.web.dto.auth.AccountsEditReqDto;
import com.example.demo.web.dto.auth.PasswordReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class AccountsController {

	private final AccountsService accountsService;
	
	@PutMapping("/accounts/edit")
	public boolean accountsEdit(@AuthenticationPrincipal PrincipalDetails principalDetails, AccountsEditReqDto accountsEditReqDto) {
		
		if(principalDetails != null) {
			return accountsService.updateUser(principalDetails, accountsEditReqDto);	
		}else {
			return false;
		}

	
	}
	
	@PutMapping("/accounts/password/change")
	public Object passwordChange(@AuthenticationPrincipal PrincipalDetails principalDetails, PasswordReqDto passwordReqDto) {
	
		System.out.println(passwordReqDto);
		return accountsService.updatePassword(principalDetails, passwordReqDto);
	}
	
	
}
