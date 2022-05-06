<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 페이지</title>
<link rel="stylesheet" href="/css/book-info.css">
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
                        	<c:if test="${empty show.BOOK_NAME }">
                        		<b style="font-size: 21px;color : #c56816 " class = "bookname">정보없음</b>
                        	</c:if>
                            <b style="font-size: 21px;color : #c56816 " class = "bookname">${showbook.BOOK_NAME }</b>
                        </li>
                        <li>
                            <strong>ID : </strong>
                            <c:if test="${empty show.KEY_NUM }">
                        		<span class ="id">정보없음</span>
                        	</c:if>
                                <span class ="id">${showbook.KEY_NUM }</span>
                        </li>
                        <li>
                            <strong>도서관 : </strong>
                             <c:if test="${empty show.LOCATION }">
                        		<span class ="id">정보없음</span>
                        	</c:if>
                            
                                <span class ="location">${showbook.LOCATION }</span>
                        </li>
                        <li>
                            <strong>자료실 : </strong>
                             <c:if test="${empty show.REF_ROOM }">
                        		<span class ="id">정보없음</span>
                        	</c:if>
                                <span class ="ref_room">${showbook.REF_ROOM }</span>
                        </li>
                        <li>
                       
                            <strong>저자 : </strong>
                              <c:if test="${empty show.AUTHOR }">
                        		<span class ="id">정보없음</span>
                        	</c:if>
                                <span class ="author">${showbook.AUTHOR }</span>
                        </li>
                        <li>
                            <strong>출판사 : </strong>
                                <c:if test="${empty show.PUBLISHER }">
                        		<span class ="id">정보없음</span>
                        	</c:if>
                                <span class ="publisher">${showbook.PUBLISHER }</span>
                        </li>
                        <li>
                            <strong>년도 : </strong>
                             <c:if test="${empty show.YR_PUBLICATION }">
                        		<span class ="id">정보없음</span>
                        	</c:if>	
                                <span class ="year">${showbook.YR_PUBLICATION }</span>
                        </li>
                        <li>
                            <strong>책 코드 : </strong>
                             <c:if test="${empty show.CALL_SIGN }">
                        		<span class ="id">정보없음</span>
                        	</c:if>
                                <span class ="call_sign">${showbook.CALL_SIGN }</span>
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
                            <td>
                              <c:if test="${empty show.CALL_SIGN}">
                        		<span class ="id">정보없음</span>
                        	  </c:if>
                            ${showbook.CALL_SIGN }
                            </td>
                            <td>
                              <c:if test="${empty show.STATUS_CD }">
                        		<span class ="id">정보없음</span>
                        	</c:if>
                        	
                            </td>
                            <td>  
                            <c:if test="${empty show.REF_ROOM }">
                        		<span class ="id">정보없음</span>
                        	</c:if>
                            
                            ${showbook.REF_ROOM }</td>
                            <td>
                              <c:if test="${empty KEY_NUM }">
                        		<span class ="id">정보없음</span>
                        	</c:if>
                            ${showbook.KEY_NUM }</td>
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