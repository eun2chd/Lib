package com.example.demo.config.oauth.provider;

import com.example.demo.domain.user.User;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class oAuth2UserDto {

	private String oauth2_username;
	private String email;
	private String name;
	private String provider;
	private String role;
	
	public User toEntity() {
		return User.builder()
				.userid(email)
				.oauth2_username(oauth2_username)
				.usermail(email)
				.username(name)	
			    .userRole(role)
			    .userprovider(provider)
			    .build();
	}
	
}
