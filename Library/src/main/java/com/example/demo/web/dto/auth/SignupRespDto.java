package com.example.demo.web.dto.auth;

import lombok.Data;

@Data
public class SignupRespDto<T> {
	
	private int code;
	private T data;

}
