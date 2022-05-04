package com.example.demo.domain.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	
//	insert int 로 하는 이유 : 몇건이 삽입되었는지 받아오기 위함
	public int insertUser(User user);
	public User getUserByOauth2Username(String oauth2_username);
//	public UserDtl getUserDtlById(int id);
	
//	아이디 중복체크
	public int IdCheck(String userid);
//  로그인시 해당 아이디 조회해서 정보 들고옴
	public User getUserIdCheck(String userid);	
//  이메일 중복체크
	public int UserEmailCheck(String mail);
 
}
