<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/signup.css">
    <title>회원가입</title>
    <script src="/js/signup.js"></script>
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
                                <td><input id="email" type="text" placeholder="이메일주소"></td>
                                <td>

                                    <img src="" class="check_Img">

                                </td>
                            </tr>

                            <tr>
                                <th><span>이름</span></th>
                                <td><input type="text" placeholder="(실명입력)" onclick="verifyEmail()"></td>

                            </tr>


                            <tr>
                                <th><span>비밀번호</span></th>
                                <td><input type="text" placeholder="비밀번호를 입력해주세요."></td>
                            </tr>
                            <tr>
                                <th><span>비밀번호 확인</span></th>
                                <td><input type="text" placeholder="비밀번호를 확인하세요"></td>
                            </tr>
                            <tr>
                                <th><span>주소</span></th>
                                <td>

                                    <input type="text" size="10" name="wPostCode" id="postcode" placeholder="우편번호"
                                        readonly="readonly" onclick="DaumPostcode()">
                                    <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br><br />
                                    <input type="text" size="30" name="wRoadAddress" id="roadAddress"
                                        placeholder="도로명주소" readonly="readonly" onclick="DaumPostcode()">
                                    <input type="text" size="30" name="wJibunAddress" id="jibunAddress"
                                        placeholder="지번주소" readonly="readonly" onclick="DaumPostcode()">
                                    <br /><span id="guide" style="color:#999;font-size:10px;"></span>
                                    <br /><br /><input type="text" name="wRestAddress" placeholder="나머지 주소" size="70" />
                                </td>




                            </tr>

                            <tr class="email">
                                <th><span>이메일</span></th>
                                <td class="email-box">
                                    <input type="text" class="email" placeholder=""><span class="mar10">@</span>
                                    <input type="text" class="email email2" placeholder="">
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

                    <div class="btn_wrap">
                        <a href="#">다음</a>
                    </div>

                </div>
            </div> <!-- form_txtInput E -->
        </div><!-- content E-->
    </div> <!-- container E -->



</body>


</html>