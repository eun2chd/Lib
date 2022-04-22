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
    <link rel="stylesheet" href="/css/myinterest.css">
</head>

<body>

   
	 <jsp:include page="../include/nav.jsp"></jsp:include>
	
        <div id="section-container">
            <div class="h-wrap"></div>
            <div class="section">
                <div class="lnb">
                    <h2>
                        <b>나의 관심 도서 목록</b>
                    </h2>

                    <ul class="sub-menu">
                        <li class="active">
                            <a href="#">
                                <span>대출현황</span>
                            </a>
                            <ul>
                                <li class="active">
                                    <a href="/user/myLib">
                                        <span style="font-weight: bold; color : #4c4c4c;">대출중인 도서</span>
                                    </a>

                                </li>
                                <li>
                                    <a href="/user/myhistory">
                                        <span style="font-weight: bold;">대출이력</span>
                                    </a>

                                </li>
                            </ul>

                        </li>
                        <li>
                            <a href="#">
                                <span style="font-weight: bold;">회원정보 수정</span>
                            </a>
                        </li>
                        <li>
                            <a href="/user/myinter">
                                <span style="font-weight: bold; color : #003b9d">나의 관심 도서</span>
                            </a>
                        </li>

                    </ul>

                    <!-- end class lnb -->
                </div>

                <div class="content">
                    <div class="bor">
                        <div class="bor-head">
                            <div class="bor-title">
                                <h3>관심등록한 책 리스트를 확인하세요.</h3>
                            </div>
                        </div>
                        <div class="my-inter-list">
                            <table>
                                <th>번호</th>
                                <th>책 코드</th>
                                <th>자료실</th>
                                <th>책이름</th>
                                <th>지은이</th>
                                <th>출판사</th>
                            </table>
                        </div>
                        <div class = "my-inter-in">
                            <table>
                                <tr>
                                  <td>등록된 데이터가 없습니다</td>       
                                </tr>
                            </table>
                        </div>

                        <div class = "border-num">
                            <span>
                                <a href="#">
                                    1
                                </a>
                            </span>

                        </div>
                        
                    </div>
                </div>

            </div>


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