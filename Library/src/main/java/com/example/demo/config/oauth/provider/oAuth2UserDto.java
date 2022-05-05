package com.example.demo.config.oauth.provider;

import com.example.demo.domain.user.User;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class oAuth2UserDto {

	private String oauth2_username;
	private String userid;
	private String user_email_1;
	private String user_email_2;	
	private String name;
	private String provider;
	private String role;
	private String addr;
	
	public User toEntity() {
		return User.builder()
				.userid(userid)
				.oauth2_username(oauth2_username)
				.user_email_1(user_email_1)
				.user_email_2(user_email_2)
				.username(name)	
			    .userRole(role)
			    .userprovider(provider)
			    .user_addr_1(addr)
			    .build();
	}
	
}
