package com.example.demo.web.dto.auth;

import com.example.demo.domain.user.User;
import com.example.demo.domain.user.UserDtl;

import lombok.Data;

@Data
public class AccountsEditReqDto {
	
	private String gender;
	private String user_phone;
	private String birthday;
	private String addr_number;
	private String addr_1;
	private String addr_2;
	private String mail_1;
	private String mail_2;
	
	public User toUserEntity(int id, String password,String userid,String username) {
		
		return User.builder()
				.id(id)
				.userid(userid)
				.username(username)
				.userPw(password)
				.user_adder_number(addr_number)
				.user_addr_1(addr_1)
				.user_addr_2(addr_2)
				.user_email_1(mail_1)
				.user_email_2(mail_2)
				.build();
	
	}
	
	public UserDtl toUserDtlEntity(int id) {
		return UserDtl.builder()
				.id(id)
				.user_gender(gender)
				.user_phone(user_phone)
				.user_birthday(birthday)
				.user_phone(user_phone)
				.addr_number(addr_number)
				.addr_1(addr_1)
				.addr_2(addr_2)
				.mail_1(mail_1)
				.mail_2(mail_2)
				.build();	
	}
	
	
	
	
	
	
}
