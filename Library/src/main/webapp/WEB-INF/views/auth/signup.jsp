<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/signup.css">
    <link rel="stylesheet" href="/css/signupUser.css">    
    <title>회원가입</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
        
</head>

<body>

    <div class="wrap">
        <div class="container">
            <div class="form_txtInput">
                <h2 class="sub_tit_txt">회원가입</h2>
                <p class="exTxt">회원가입시 이메일 인증을 반드시 진행하셔야 합니다.</p>
                <div class="join_form">
                    <table>
                        <colgroup>
                            <col width="30%" />
                            <col width="auto" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>아이디</span></th>
                                <td><input id="user_id" name = "username" type="text" class = "su-input" placeholder="아아디" required oninput = "checkId()"></td>
                                <td>
                                    <img src="" class="check_Img">
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>
                            	<span class = "user-id">공백은 입력할 수 없습니다.!!</span>
                            	<span class = "user-length">아이디 길이는 4~10 입니다.</span>
                            	<span class = "user-CheckOk">사용가능한 아아디 입니다.</span>
                            	<span class = "user-CheckFail">현재 사용중인 아이디 입니다.</span>
                            	</td>
                            </tr>
								
                            <tr>
                            	
                                <th><span>이름</span></th>
                                <td><input type="text" name = "name"  class = "su-input" placeholder="(실명입력)" ></td>

                            </tr>
                            
                    


                            <tr>
                                <th><span>비밀번호</span></th>
                                <td><input type="password" id = "password_1" name = "password" class = "su-input pw" placeholder="비밀번호를 입력해주세요."></td>
                           </tr>
                            <tr>
                                <th><span>비밀번호 확인</span></th>
                                <td><input type="password" id = "password_2" class = "pw" placeholder="비밀번호를 확인하세요" onclick = "chkPW()"></td>
                            </tr>
                           	 <tr>
                            	<td>
                            		<span class = "user-password-fail">비밀번호가 일치하지 않습니다.</span>
                            		<span class = "user-password-ok">비밀번호가 일치합니다!</span>                            		
                            		<span class = "user-password-less">비밀번호 양식에 맞지 않습니다.</span>                            		
                            	</td>
                            </tr>
                            
                            <tr>
                                <th><span>주소</span></th>
                                <td>

                                    <input type="text" size="10" name="wPostCode" class = "su-input" id="postcode" placeholder="우편번호">
                                    <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br><br />
                                    <input type="text" size="30" name="wRoadAddress" id="roadAddress"
                                        placeholder="도로명주소" class = "su-input"  >
                           
                                    <br /><br /><input type="text" class = "su-input" name="wRestAddress" placeholder="나머지 주소" size="70" />
                                </td>




                            </tr>

                            <tr class="email">
                                <th><span>이메일</span></th>
                                <td class="email-box">
                                    <input type="text" class="email su-input"  placeholder=""><span class="mar10">@</span>
                                    <input type="text" class="email email2 su-input" placeholder="">
                                    <a href="javascript:;" class="btn_confirm">인증번호 발송</a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>인증번호 확인</span></th>
                                <td><input type="text" class="send_number" placeholder="10:00">
                                    <a href="javascript:;" class="btn_confirm">인증번호 확인</a>
                                </td>
                            </tr>

                        </tbody>


                    </table>
                    
                       <div class="make-account">
               			 <a href="/auth/signin">게정이 있으신가요?</a>
          			  </div>

                    <div class="btn_wrap">
                        <button class ="si-btn">가입하기</button>
                    </div>

                </div>
            </div> <!-- form_txtInput E -->
        </div><!-- content E-->
    </div> <!-- container E -->



</body>

    <script src="/js/signup.js"></script>
</html>