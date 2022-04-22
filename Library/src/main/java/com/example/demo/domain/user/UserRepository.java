package com.example.demo.domain.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	
	public int insertUser(User user);
	public User getUserByOauth2Username(String oauth2_username);
//	public UserDtl getUserDtlById(int id);
	
	
	

}
