<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/book-info.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	
	
	
     <!-- book-list -->
     <div id="section-container">
        <div class="h-wrap"></div>
        <div class="section">
            <div class="lnb">
                <h2>
                    <b>책 상세정보</b>
                </h2>
            </div>
        </div>
        <div class = "bok-info">
            <div class="bok-in">
                <h2>책 상세정보를 확인하세요!</h2>
            </div>

        <div class="content-title">   
            <h2>도서의 상세 내용을 확인하세요</h2>
         </div>

         <div class="content">
            <div class="sinfo">
                <div class="thumb">
                    <img src="/image/ready_img.png" alt="">
                </div>
                <div class="info">
                    <ul>
                        <li>
                            <b style="font-size: 21px;">책 제목을 출력하세요</b>
                        </li>
                        <li>
                            <strong>ID : </strong>
                                <span class ="id">ID값을 출력하세요</span>
                        </li>
                        <li>
                            <strong>도서관 : </strong>
                                <span class ="location">도서관을 출력하세요</span>
                        </li>
                        <li>
                            <strong>자료실 : </strong>
                                <span class ="ref_room">자료실 출력하세요</span>
                        </li>
                        <li>
                            <strong>저자 : </strong>
                                <span class ="author">저자 출력하세요</span>
                        </li>
                        <li>
                            <strong>출판사 : </strong>
                                <span class ="publisher">출판사 출력하세요</span>
                        </li>
                        <li>
                            <strong>년도 : </strong>
                                <span class ="year">년도 출력하세요</span>
                        </li>
                        <li>
                            <strong>책 코드 : </strong>
                                <span class ="call_sign">책 코드 출력하세요</span>
                        </li>
                    
                    </ul>
                </div>
                
             <button class = "bro-btn">대출하기</button>
 
            </div>

            <div class="detailtable">
                <table>
                    <thead>
                        <tr>
                            <th>책코드</th>
                            <th>대출상태</th>
                            <th>자료실</th>
                            <th>ID</th>
                        </tr>
                     
                    </thead>
                    <tbody>
                        <tr>
                            <td>ddd</td>
                            <td>ddd</td>
                            <td>ddd</td>
                            <td>ddd</td>
                        </tr>
                      
                    </tbody>
                    
                </table>


            </div>





         </div>
    <!-- footer 영역 -->
    <footer>

        <div class="f-top">
            <div class="f-top-in">
                <div class="f-in-list">
                    <ul>
                        <li>
                            <a href="#">이용약관</a>
                        </li>
                        <li>
                            <a href="#">
                                <span>
                                    개인정보처리방침
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">저작권보호정책</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


    </footer>


       


</body>

</html>