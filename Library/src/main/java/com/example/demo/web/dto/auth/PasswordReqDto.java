package com.example.demo.web.dto.auth;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.demo.domain.user.User;

import lombok.Data;

@Data
public class PasswordReqDto {

		private String prePassword;
		private String newPassword;
		
		public User toEntity(int id) {
			return User.builder()
					.id(id)
					//암호화 해서 넣어줘야함
					.userPw(new BCryptPasswordEncoder().encode(newPassword))
					.build();
		}
		
	
}
