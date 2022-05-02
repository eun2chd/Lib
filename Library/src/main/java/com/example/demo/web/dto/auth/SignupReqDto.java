package com.example.demo.web.dto.auth;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.demo.domain.user.User;

import lombok.Data;

@Data
public class SignupReqDto {
	
	@NotBlank
	@Size(min = 4, max = 10)
	private String userid;
	@NotBlank
	@Size(min = 4, max = 10)
	private String name;
	@NotBlank
	@Size(min = 4, max = 10)
	private String password;
	@NotBlank
	private String addr;
	@NotBlank
	private String email;
	
	public User toEntity() {
		return User.builder()
				.userid(userid)
				.username(name)
				.userPw(new BCryptPasswordEncoder().encode(password))
				.addr(addr)
				.usermail(email)
				.userRole("ROLE_USER")
				.build();
	}
	
}
