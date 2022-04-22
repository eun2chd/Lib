package com.example.demo.domain.user;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserDtl {
	
	private int id;
	private String gender;
	private String birthday;
	private String user_phone;
	private String addr;
	private String Lib;
	private String home_phone;
	

}
