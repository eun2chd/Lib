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

<style>
    body {
        font-size: 16px;
    }

    .book-date {
        padding: 20px;
        text-align: center;
        border: 1px solid #eaeaea;
        border-top: 2px solid #000;
        margin-bottom: 10px;

    }

    input {
        width: 200px;
        height: 30px;
        border-radius: 4px;
        border: 1px solid #c9c9c9;
        padding: 4px;
        font-size: 14px;
        font-weight: bold;
    }

    .book-show-info {
        border-top: 1px solid #ddd;
        color: #000;
        padding: 22px 0 10px 28px;
    }

    .btn {
        width: 50px;
        display: inline-block;
        border: 1px solid #d5d5d5;
        color: #000;
        margin-left: 10px;
        padding: 9px;
        cursor: pointer;
        border-radius: 6px;
        background-color: #f9f9f9;
    }

    .btn:hover {
        background-color: #f2f2f2;
        border: 1px solid #ccc;

    }

    label {
        font-weight: bold;
    }
</style>

<body>

   <jsp:include page="../include/nav.jsp"></jsp:include>
   
        <div id="section-container">
            <div class="h-wrap"></div>
            <div class="section">
                <div class="lnb">
                    <h2>
                        <b>대출 이력</b>
                    </h2>

                    <ul class="sub-menu">
                        <li class="active">
                            <a href="#">
                                <span>대출현황</span>
                            </a>
                            <ul>
                                <li class="active">
                                    <a href="/user/myLib">
                                        <span style="color : #4c4c4c">대출중인 도서</span>
                                    </a>

                                </li>
                                <li>
                                    <a href="/user/myhistory">
                                        <span style="color : #003b9d;font-weight: bold;">대출이력</span>
                                    </a>

                                </li>
                            </ul>

                        </li>
                        <li>
                            <a href="/user/user-edit">
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

                <div class="content">
                    <div class="bor">
                        <div class="bor-head">
                            <div class="bor-title">
                                <h3>대출 이력 조회</h3>
                            </div>
                        </div>
                        <div class="book-date">
                            <label for="start_date">시작일</label>
                            <input type="date" name="start_date" value="">
                            ~
                            <label for="end_date">종료일</label>
                            <input type="date" name="end_date" value="">
                            <a href="#" class="btn">검색</a>

                        </div>

                        <div class="book-show-info">
                            <!-- 조회목록 출력하는 곳 -->
                            <h3 style = "font-size : 20px">조회된 대출 정보가 없습니다.</h3>
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