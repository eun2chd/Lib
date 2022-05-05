package com.example.demo.domain.user;

import java.time.LocalDateTime;

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
	private String user_gender;
	private String user_birthday;
	private String user_phone;
	private String addr_number;
	private String addr_1;
	private String addr_2;
	private String mail_1;
	private String mail_2;
	
	private LocalDateTime create_date;
	private LocalDateTime update_date;

}
