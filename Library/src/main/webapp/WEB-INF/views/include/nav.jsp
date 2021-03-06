<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize> 

       
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="shortcut icon" href="/Eunchong/images/book-icon.png">
    <link rel="stylesheet" href="/css/nav.css">
    <link rel="stylesheet" href="/css/base.css">
</head>

<body>


    <div id="container">
        <!-- 헤더 영역 -->
        <header id="header">
        	
        	<!-- 헤더안 컨테이너  -->
            <div class="container">
                <div class="left-util">
                    <ul>
                        <li><a href="/">Library</a></li>
                    </ul>
                </div>

			<!-- 로그인 폼 -->
                <div class="right-util">
                    <ul>
                    <c:choose>
                    	<c:when test="${empty principal.user }">
                    		 <li class = "sign-in"><a href="/auth/signin">로그인</a></li>
                      		 <li> <a href="/auth/signup-terms">회원가입</a></li>
                       
                       		 <!-- 내서재 클릭시 로그인 페이지 이동 -->
                      		 <li><a href="/auth/signin" class="lib">내 서재</a></li>
                    	</c:when>
                    	<c:otherwise>
                    	    <li><a href="#">${principal.user.username }님</a></li>
                            <li> <a href="/logout">로그아웃</a></li>
                            <li><a href="/user/lib/${principal.user.userid }?page=1" class="lib">내 서재</a></li>
                    	</c:otherwise>
                    
                    </c:choose>
                    </ul>
                </div>
                <!-- 로그인 폼  end -->
                
            </div>
            <!-- 헤더안 컨테이너  end  -->           
        </header>
        
        
         <!-- header nav 메뉴 -->
            <div class="g-menu">
                <ul class="navbar">
                    <li>
                        <a href="/index">
                            <span>HOME</span>
                        </a>
                    </li>

 
                    <li>
                        <a href="/book/booklist">
                            <span>Book List</span>
                        </a>
                    </li>

         
                </ul>
                <!-- end header-menu -->
            </div>
            <!-- end header-->
        </header>
        <!-- end conatiner -->
    </div>
 

</body>

</html>