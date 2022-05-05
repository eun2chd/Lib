package com.example.demo.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.example.demo.domain.user.User;
import com.example.demo.domain.user.UserDtl;

import lombok.Data;

@Data
public class PrincipalDetails implements UserDetails ,OAuth2User{
	
	private static final long serialVersionUID = 1L;
	
	private User user;
	private UserDtl userDtl;
	private Map<String, Object> attributes;
	
	public PrincipalDetails(User user, UserDtl userDtl) {
		this.user = user;
		this.userDtl = userDtl;
	}
	
	
	
	public PrincipalDetails(User user,UserDtl userDtl, Map<String, Object> attributes) {
		this.user = user;
		this.userDtl = userDtl;
		this.attributes = attributes;
	}

	@Override
	public Map<String, Object> getAttributes() {
		// TODO Auto-generated method stub
		return attributes;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collection = new ArrayList<GrantedAuthority>();
		collection.add(new GrantedAuthority() {
			
			private static final long serialVersionUID = 1L;

			@Override
			public String getAuthority() {
				return user.getUserRole();
			}
		});
		return collection;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return (String)attributes.get("name");
	}
	
//	--------------------------------------밑에는 일반 로그인계정 위에는 어스

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getUserPw();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getUsername();
	}

//	계정 만료
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
// 비밀번호 5번 틀리면
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
// 자격증명
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
// 휴면 계정
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
