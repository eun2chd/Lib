<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 서재</title>
    <link rel="shortcut icon" href="/image/icon.png">
    <link rel="stylesheet" href="/css/mypage.css">

</head>
<body>

      <jsp:include page="../include/nav.jsp"></jsp:include>
	


    <div id = "section-container">
        <div class="h-wrap"></div>
        <div class = "section">
            <div class = "lnb">
                <h2>
                    <b>내 서재</b>
                </h2>
    
                <ul class="sub-menu">
                    <li class = "active">
                        <a href="#">
                           <span>대출현황</span>
                        </a>
                       <ul>
                        <li class = "active">
                            <a href="/user/myLib">
                                <span>대출중인 도서</span>
                            </a>
                            
                        </li>
                        <li>
                            <a href="/user/myhistory">
                                <span style = "font-weight : bold">대출이력</span>
                            </a>
                            
                        </li>
                    </ul>
    
                    </li>
                    <li>
                        <a href="#">
                            <span>회원정보 수정</span>
                        </a>
                    </li>
                     <li>
                          <a href="/user/myinter">
                             <span style="font-weight: bold;">나의 관심 도서</span>
                          </a>
                     </li>
                  
                </ul>
    
                  <!-- end class lnb -->
            </div>

            <div class = "content">
                <div class = "bor">
                    <div class = "bor-head">
                        <div class = "bor-title">
                            <h3>대출중인 도서</h3>
                        </div>
                    </div>
                    <div class = "book-list">
    
                     <table>
                        <tbody>
                            <tr>
                                <th style="width: 20%;">제목</th>
                                <th style="width: 20%;">도서관 명</th>
                                <th style="width: 20%;">지은이</th>
                                <th style="width: 20%;">출판사</th>
                            </tr>
                            
                            <tr>
                                <td>우아한 방어</td>
                                <td>부산도서관</td>
                                <td>지은이</td>
                                <td>부산시 출판사</td>
                           </tr>
                        </tbody>
                    </table>
        
        
                    </div>
                </div>
            </div>

        </div>


    </div>
</div>


 <!-- footer 영역 -->
 <footer>

    <div class = "f-top">
     <div class = "f-top-in">
        <div class = "f-in-list">
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