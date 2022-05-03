<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="shortcut icon" href="/image/icon.png">
    <link rel="stylesheet" href="/css/signin.css">
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/nav.css">
    
</head>

<body>

 <!-- 전체 헤더 영역 -->
    <div id="container">
        <!-- 헤더 영역 -->
        <header id="header">
            <div class="container">

                <div class="left-util">
                    <ul>
                        <li><a href="/">Library</a></li>
                    </ul>
                </div>


                <div class="right-util">
                    <ul>
                    	<li class = "sign-in"><a href="/auth/signin">로그인</a></li>
                      	<li> <a href="/auth/signup-terms">회원가입</a></li>
                       	<!-- 내서재 클릭시 로그인 페이지 이동 -->
                      	<li><a href="/user/myLib" class="lib">내 서재</a></li>
                    </ul>
                </div>
            </div>
        </header>
    </div>
   
      <section>
        <div class="wrap">
            <div class="form-wrap">
              
                <div class = "social-icons">
                  <a href ="/oauth2/authorization/facebook">
                  	 <img src="/image/facebook.png" alt="facebook">
                  </a>
                   <a href ="/oauth2/authorization/naver">
                   	 <img src="/image/naver.png" alt="naver">
                   </a>
                   
                   <a href ="/oauth2/authorization/google">
                   	 <img src="/image/google.png" alt="google">	
                   </a>
                        
                </div>

                <form id="login" action="/auth/signin" method="post" class="input-group">
                    <input type="text" name = "username" class="input-field" placeholder="ID" required>
                    <input type="password" name = "password" class="input-field" placeholder="Enter Password" required>
                    <div class = "form-title">
                        <button	class = "si-submit-btn">LOG IN</button>
                    </div>

                    <div class ="sec3"></div>
                </form>

               <div class ="find-group">
                    <div class ="find-user">
                        <a href="/auth/signup-terms">
                        계정 만들기 
                        </a>
                    </div>
                    <div class ="find-user">
                        <a href="#">
                            비밀번호 찾기
                        </a>
                    </div>
               </div>

         


            </div>
        </div>




      </section>

<!-- end container -->
    </div>


</body>

</html>