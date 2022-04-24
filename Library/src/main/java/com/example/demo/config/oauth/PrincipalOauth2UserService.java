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
// Oauth2UserService 상속받기
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{
	
//	UserRepository 인터페이스 기능을 사용하기 위해 선언
	private final UserRepository userRepository;
			

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("userRequestClient : " + userRequest.getClientRegistration()); // 데이터 보기
		System.out.println("Token : " + userRequest.getAccessToken()); // Token 값 보기
		OAuth2User oAuth2User = super.loadUser(userRequest);
		Map<String, Object> oAuth2UserAttributes = oAuth2User.getAttributes();
		System.out.println(oAuth2UserAttributes); // 응답받는 데이터 보기 (내정보가 담겨서 넘어옴)		
		
		
		String provider = userRequest.getClientRegistration().getRegistrationId(); // 여기에 naver,google,facebook 등 해당 id가 저장됨 [사용자가 로그인 시]
		String providerId = null; // null 로 초기화
		
		if(provider.equals("naver")) {
			oAuth2UserAttributes = (Map<String, Object>)oAuth2User.getAttributes().get("response");
			                       // 오브젝트로 들고오기때문에 형변환 해줘야함.
			providerId = (String)oAuth2UserAttributes.get("id"); // id 값을 providerId 에 저장 (어떤 로그인 인지 구분하기 위함)
			System.out.println(providerId);
		}else if(provider.equals("google")) {
			providerId = (String)oAuth2UserAttributes.get("sub");
		}else if(provider.equals("facebook")) {
			providerId = (String)oAuth2UserAttributes.get("id");
		}
		
		else {
			providerId = UUID.randomUUID().toString().replaceAll("-", ""); // UUID : 정보 식별하기 위해 사용됨 랜덤한 숫자가 생성되고 - 으로 연결
			// providerId 값이 null 이라면 uuid 값 넣으면(의미없다) db테이블에 있는 패스워드랑 관련이 없기때문에 임의이값을 그냥 넣음
		}
		String oauth2_username = provider + "_" + providerId; // naver_providerId 연결
		oAuth2UserDto auth2UserDto = oAuth2UserDto.builder()  // 각 정보를 가져오면 해당 정보를 각 DTO 객체에 담아준다.
								.name((String)oAuth2UserAttributes.get("name"))
								.email((String)oAuth2UserAttributes.get("email"))
								.oauth2_username(oauth2_username)
								.provider(provider)
								.role("ROLE_USER")
								.build();
		
		User userEntity = userRepository.getUserByOauth2Username(oauth2_username); // 엔티티에 유저 이름값을 넣어준다. 
		
		
		if(userEntity == null) { // 유저가 비어있다면 회원가입 진행
			userEntity = auth2UserDto.toEntity();
			userEntity.setUserPw(new BCryptPasswordEncoder().encode("1234")); // 비번 암호화
			userRepository.insertUser(userEntity); // 강제로 회원가입	
			userEntity = userRepository.getUserByOauth2Username(oauth2_username);
	
		}
			
//		UserDtl userDtlEntity = userRepository.getUserDtlById(userEntity.getId());
		return new PrincipalDetails(userEntity, oAuth2UserAttributes); // 유저이름과 , 어스정보 리턴
	
	}

}
