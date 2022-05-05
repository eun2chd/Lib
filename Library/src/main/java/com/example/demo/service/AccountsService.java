package com.example.demo.service;

import com.example.demo.config.auth.PrincipalDetails;
import com.example.demo.web.dto.auth.AccountsEditReqDto;
import com.example.demo.web.dto.auth.PasswordReqDto;
import com.example.demo.web.dto.auth.PasswordRespDto;

public interface AccountsService {
	
	public boolean updateUser(PrincipalDetails principalDetails, AccountsEditReqDto accountsEditReqDto);
	
	public PasswordRespDto updatePassword(PrincipalDetails principalDetails, PasswordReqDto passwordReqDto);

}
