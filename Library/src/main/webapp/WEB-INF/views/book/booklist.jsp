<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 서재</title>
    <link rel="shortcut icon" href="./images/icon.png">
    <link rel="stylesheet" href="/css/booklist.css">
</head>

<body>

   		<jsp:include page="../include/nav.jsp"></jsp:include>

        <!-- book-list -->
        <div id="section-container">
            <div class="h-wrap"></div>
            <div class="section">
                <div class="lnb">
                    <h2>
                        <b>BOOK LIST</b>
                    </h2>
                </div>
            </div>
            <div class="bok-info">
                <div class="bok-in">
                    <h2>검색가능한 책 목록</h2>
                </div>
            </div>
            <div class="show-book">
                <div class="show-book-in">
                    <h3>초성으로 검색하기</h3>
                </div>
                <div class="con-search">
                    <div>ㄱ</div>
                    <div>ㄴ</div>
                    <div>ㄷ</div>
                    <div>ㄹ</div>
                    <div>ㅁ</div>
                    <div>ㅂ</div>
                    <div>ㅅ</div>
                    <div>ㅇ</div>
                    <div>ㅈ</div>
                    <div>ㅊ</div>
                    <div>ㅋ</div>
                    <div>ㅌ</div>
                    <div>ㅍ</div>
                    <div>ㅎ</div>
                </div>

                <div class="con-book-list">
                	<c:forEach var = "book" items = "${b }">
                    <div class="sub">
                        <div class="sub-left">
                            <a href="#">
                                <img src="https://image.aladin.co.kr/product/26987/37/cover/k962730610_1.jpg" alt="">
                            </a>
                        </div>
                        <div class="sub-box-left">
                            <div class="sub-item">
                                <div class="clip">
                                    <a href="#">
                                        <span class="text">${book.BOOK_NAME }</span>
                                    </a>
                                    <p>지은이 : ${ book.AUTHOR}</p>
                                    <p>출판사 : ${book.PUBLISHER}</p>
                                    <p>출판년도 :${ book.YR_PUBLICATION }</p>
                                    <p>도서관 : ${ book.REF_ROOM } </p>
                                </div>
                            </div>

                        </div>
                    </div>
                    </c:forEach>

                </div>
            </div>


            <div class="bar-btns">
                <a href="#" class="b-button">&laquo;&laquo;</a>
                <a href="#" class="b-button">1</a>
                <a href="#" class="b-button">2</a>
                <a href="#" class="b-button">3</a>
                <a href="#" class="b-button">4</a>
                <a href="#" class="b-button">&raquo;&raquo;</a>
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