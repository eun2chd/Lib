package com.example.demo.web.dto.auth;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.demo.domain.user.User;

import lombok.Data;

@Data
public class SignupReqDto {
	
	@NotBlank
	@Size(min = 4, max = 20)
	private String userid;
	@NotBlank
	@Size(min = 2, max = 8)
	private String name;
	@NotBlank
	@Size(min = 8, max = 20)
	private String password;
	@NotBlank
	private String addr_number;
	private String addr_1;
	private String addr_2;
	@NotBlank
	@Size(min = 5, max = 20)
	private String email_1;
	private String email_2;
	
	public User toEntity() {
		return User.builder()
				.userid(userid)
				.username(name)
				.userPw(new BCryptPasswordEncoder().encode(password))
				.user_adder_number(addr_number)
				.user_addr_1(addr_1)
				.user_addr_2(addr_2)
				.user_email_1(email_1)
				.user_email_2(email_2)
				.userRole("ROLE_USER")
				.build();
	}
	
}
