package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.example.demo.config.oauth.PrincipalOauth2UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	

    private final AuthenticationFailureHandler customFailureHandler;
	
	private final PrincipalOauth2UserService principalOauth2UserService;
	
// 로그인 진행할때 꼭 넣어야함!!
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	protected void configure(HttpSecurity http) throws Exception {
		
		http.csrf().disable();
		http.authorizeRequests()
		.antMatchers("/sing-in" , "/user/**") // 해당 요청은 인증을 거친다.
		.authenticated()
		.anyRequest()
		.permitAll()
		.and()
		.formLogin()
		.loginPage("/auth/signin")
		.loginProcessingUrl("/auth/signin")
		.defaultSuccessUrl("/")
		.failureHandler(customFailureHandler)
		.and()
		.oauth2Login()
		.loginPage("/auth/signin")
		.userInfoEndpoint()
		.userService(principalOauth2UserService)
		.and()
		.defaultSuccessUrl("/");
	}
}
