package com.example.demo.domain.user;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@Data
public class User {

		private int id;
		private String userid;
		private String username;
		private String userPw;
		private String usermail;
		private String userprovider;
		private String userRole;
		private String oauth2_username;
		
		private LocalDateTime create_date;
		private LocalDateTime update_date;
		
}
