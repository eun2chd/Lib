<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

       
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상단 NAV 페이지 입니다.</title>
    <link rel="shortcut icon" href="/Eunchong/images/book-icon.png">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/base.css">
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
                        <li> <a href="/auth/signin">로그인</a></li>
                        <li> <a href="#">회원가입</a></li>
                        <!-- 내서재 클릭시 로그인 페이지 이동 -->
                        <li><a href="#" class="lib">내 서재</a></li>
                    </ul>
                    <!-- enf of right util -->
                </div>
                <!-- end of container -->
            </div>

          
        </header>
        <!-- end conatiner -->
    </div>






</body>

</html>