package com.example.demo.config.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.domain.user.User;
import com.example.demo.domain.user.UserDtl;
import com.example.demo.domain.user.UserRepository;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class PrincipalDetailsService implements UserDetailsService{
	
	private final UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println(username);
		User userEntity = userRepository.getUserIdCheck(username);
		
		System.out.println(userEntity);
		
		if(userEntity == null) {
			return null;
		}else {
			return new PrincipalDetails(userEntity);
		}
	}	

}
