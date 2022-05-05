package com.example.demo.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.config.auth.PrincipalDetails;
import com.example.demo.domain.user.User;
import com.example.demo.domain.user.UserDtl;
import com.example.demo.domain.user.UserRepository;
import com.example.demo.web.dto.auth.AccountsEditReqDto;
import com.example.demo.web.dto.auth.PasswordReqDto;
import com.example.demo.web.dto.auth.PasswordRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AccountsServiceImpl implements AccountsService{
	
	private final UserRepository userRepository;

	@Override
	public boolean updateUser(PrincipalDetails principalDetails, AccountsEditReqDto accountsEditReqDto) {

		int id = principalDetails.getUser().getId();
		String password = principalDetails.getUser().getUserPw(); // 패스워드 
		String userid = principalDetails.getUser().getUserid(); // id 
		String username = principalDetails.getUser().getUsername(); // username	
		
		User userEntity = accountsEditReqDto.toUserEntity(id, password,userid,username); 
		UserDtl userDtl = accountsEditReqDto.toUserDtlEntity(id);
	
		
		int result = 0;
		
//		insert 가 완료되면 1 을 받아줌 두개다 완료되면 true 반환
		result += userRepository.updateUserById(userEntity);
		result += userRepository.updateUserDtlById(userDtl);
		

		
		if(result == 2) {
			principalDetails.setUser(userEntity);
			principalDetails.setUserDtl(userDtl);
			return true;
		}else {
			return false;
		}
	
	}
	
//	전 비밀번호가 일치하는지 db랑  체크
	public boolean passwordCheck(String principalPassword, String password) {
		
		System.out.println(principalPassword);
		System.out.println(password);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(password, principalPassword); // 매개변수 순서 암호화 안한값 / 암호화 된값
	}
	

	@Override
	public PasswordRespDto updatePassword(PrincipalDetails principalDetails, PasswordReqDto passwordReqDto) {
		// 전 비밀번호
		boolean prePasswordCheckFlag = passwordCheck(principalDetails.getPassword(), passwordReqDto.getPrePassword()); 
		// 새 비밀번호
		boolean newPasswordCheckFlag = passwordCheck(principalDetails.getPassword(), passwordReqDto.getNewPassword());
		PasswordRespDto passwordRespDto = new PasswordRespDto();
		
		if(prePasswordCheckFlag == false) {
			// 이전 비밀번호 일치하지 않음
			passwordRespDto.setCode(450);
			passwordRespDto.setMessage("이전 비밀번호가 일치하지 않습니다.");
		}else if(newPasswordCheckFlag == true) {
			passwordRespDto.setCode(451);
			passwordRespDto.setMessage("새 비밀번호가 일치하지 않습니다.");
		}else {
			User userEntity = passwordReqDto.toEntity(principalDetails.getUser().getId());
			int result = userRepository.updatePasswordById(userEntity);
			if(result == 1) {
				passwordRespDto.setCode(200);
				passwordRespDto.setMessage("새 비밀번호로 변경되었습니다.");
				principalDetails.getUser().setUserPw(userEntity.getUserPw());
			}
		}
	
		return passwordRespDto;
	}
	

}
