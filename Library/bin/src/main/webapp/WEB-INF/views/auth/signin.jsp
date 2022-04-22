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

   <jsp:include page="../include/nav.jsp"></jsp:include>

    
      <section>
        <div class="wrap">
            <div class="form-wrap">
              
                <div class = "social-icons">
                    <img src="/image/facebook.png" alt="facebook">
                    <img src="/image/naver.png" alt="naver">
                    <img src="/image/google.png" alt="google">
                </div>

                <form id="login" action="" class="input-group">
                    <input type="text" class="input-field" placeholder="Email" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <div class = "form-title">
                        LOG IN
                    </div>

                    <div class ="sec3"></div>
                </form>

               <div class ="find-group">
                    <div class ="find-user">
                        <a href="">
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