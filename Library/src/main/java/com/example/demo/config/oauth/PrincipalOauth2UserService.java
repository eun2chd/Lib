package com.example.demo.config.oauth;

import java.util.Map;
import java.util.UUID;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.example.demo.config.auth.PrincipalDetails;
import com.example.demo.config.oauth.provider.oAuth2UserDto;
import com.example.demo.domain.user.User;
import com.example.demo.domain.user.UserDtl;
import com.example.demo.domain.user.UserRepository;
import com.nimbusds.oauth2.sdk.Response;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{
	
	private final UserRepository userRepository;
			

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println(userRequest.getClientRegistration());
		System.out.println(userRequest.getAccessToken());
		OAuth2User oAuth2User = super.loadUser(userRequest);
		Map<String, Object> oAuth2UserAttributes = oAuth2User.getAttributes();
		System.out.println(oAuth2UserAttributes);		
		
		
		String provider = userRequest.getClientRegistration().getRegistrationId();
		String providerId = null;
		
		if(provider.equals("naver")) {
			oAuth2UserAttributes = (Map<String, Object>)oAuth2User.getAttributes().get("response");
			                       // 오브젝트로 들고오기때문에 형변환 해줘야함.
			providerId = (String)oAuth2UserAttributes.get("id");
		}else if(provider.equals("google")) {
			providerId = (String)oAuth2UserAttributes.get("sub");
		}else if(provider.equals("facebook")) {
			providerId = (String)oAuth2UserAttributes.get("id");
		}
		
		else {
			providerId = UUID.randomUUID().toString().replaceAll("-", ""); 
			// providerId 값이 null 이라면 uuid 값 넣으면(의미없다) db테이블에 있는 패스워드랑 관련이 없기때문에 임의이값을 그냥 넣음
		}
		String oauth2_username = provider + "_" + providerId;
		oAuth2UserDto auth2UserDto = oAuth2UserDto.builder()
								.name((String)oAuth2UserAttributes.get("name"))
								.email((String)oAuth2UserAttributes.get("email"))
								.oauth2_username(oauth2_username)
								.provider(provider)
								.role("ROLE_USER")
								.build();
		
		User userEntity = userRepository.getUserByOauth2Username(oauth2_username);
		
		
		if(userEntity == null) {
			userEntity = auth2UserDto.toEntity();
			userEntity.setUserPw(new BCryptPasswordEncoder().encode("1234"));
			userRepository.insertUser(userEntity); // 강제로 회원가입	
			userEntity = userRepository.getUserByOauth2Username(oauth2_username);
	
		}
			
//		UserDtl userDtlEntity = userRepository.getUserDtlById(userEntity.getId());
		return new PrincipalDetails(userEntity, oAuth2UserAttributes);
	
	}

}
