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
		User userEntity = userRepository.getUserIdCheck(username);
		
		if(userEntity == null) {
			throw new UsernameNotFoundException(username);
		}else {
			return new PrincipalDetails(userEntity);
		}
	}	

}
