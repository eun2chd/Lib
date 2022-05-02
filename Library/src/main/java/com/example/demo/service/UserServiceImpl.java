package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.domain.user.UserRepository;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService{

	private final UserRepository userRepository;
	
	@Override
	public int idCheck(String userid) {
		// TODO Auto-generated method stub
		
		int resultId = userRepository.IdCheck(userid);
		
		return resultId;
	}

}
