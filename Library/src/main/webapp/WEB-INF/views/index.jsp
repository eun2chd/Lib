<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta HTTP-EQUIV="refresh" CONTENT="70">
    <title>도서관 index페이지</title>
    <link rel="shortcut icon" href="/image/icon.png">
    <link rel="stylesheet" href="/css/index.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/index.js"></script>
    <script src="/js/tab.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
        integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF"
        crossorigin="anonymous"></script>
        
          <script>
        $(document).ready(function () {
            let weatherIcon = {
                '01': 'fas fa-sun',
                '02': 'fas fa-cloud-sun',
                '03': 'fas fa-cloud',
                '04': 'fas fa-cloud-meatball',
                '09': 'fas fa-cloud-sun-rain',
                '10': 'fas fa-cloud-showers-heavy',
                '11': 'fas fa-poo-storm',
                '13': 'far fa-snowflake',
                '50': 'fas fa-smog'
            };
            $.ajax({
                url: 'http://api.openweathermap.org/data/2.5/weather?q=Busan&APPID=010c240fc719ffe978fff69e8cda76d8&units=metric',
                dataType: 'json',
                type: 'GET',
                success: function (data) {
                    var $Icon = (data.weather[0].icon).substr(0, 2);
                    var $Temp = Math.floor(data.main.temp) + '℃';
                    var $city = data.name;
                    $('.Curricon').append('<i class="' + weatherIcon[$Icon] + '"></i>');
                    $('.CurrTemp').prepend($Temp);
                    $('.City').append($city);
                }
            })
        });
    </script>

</head>

<body>

  	   <jsp:include page="./include/nav.jsp"></jsp:include>
	
         
    <!-- group1 영역 -->
    <section class="setion-group1">
        <div id="h-container">

            <!-- Search 영역 -->
        
            <div class="main_bg">
                <div class="main1">
                    <div class="section">
                        <div class="latter-check">
                        	  <div class="in-latter-check">
                                <label class="check-la"><input ' type="checkbox" class="in-check">단어 포함
                                                                    검색</label>
                            </div>
                        </div>
                        <div class="title-box">
                            <form action="/book-search" method="post">
                                <label for="" class="in-la"></label>
                                <input name = "bookName" type="text" placeholder="도서명 또는 저자를 검색하세요" class="in-search">
                                <button>검색</button>
                            </form>
                        </div>


                    </div>
                </div>
            </div>

            <!-- Search end  -->

            <div class="h-wrap">
                <ul>
                    <li>
                        <img src="/image/lib01.jpg" alt="">
                    </li>
                    <li>
                        <img src="/image/lib02.jpg" alt="">
                    </li>
                    <li>
                        <img src="/image/lib03.jpg" alt="">
                    </li>
                    <li>
                        <img src="/image/lib04.jpg" alt="">
                    </li>
                </ul>
            </div>
            <ul class="h-btns">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
    </section>

    <!-- group2 영역   -->
    <section class = "setion-group2">
        <div class="sec-group">
           <div class="content1">
                <div class="calendar">
                    <div class="cal_in">
                        <button class="calendar_btn" onclick="prevCal();">&lt;</button>
                    <div class="title">
                        <span class = "year"></span>
                        <span class="month"></span>
                    </div>
                    <button class = "calendar_btn" onclick="nextCal();">&gt;</button>
                   </div>
               
                <div class="day">
                    <div>S</div>
                    <div>M</div>
                    <div>T</div>
                    <div>W</div>
                    <div>T</div>
                    <div>F</div>
                    <div>S</div>
                </div>
                <div class="dates"></div>
           </div>
        </div>


         <div class="content2">
            <div class="weather">
                    <div class="Curricon"></div>
            </div>
         
                <div class="CurrTemp"></div>
                <div class="City"></div>
         
        </div>

             <div class="content3">
                 <div class="time-wrap">
                    <h2>현재 시간</h2>
                 </div>
                    <div id="Clock" class="clock">
                 </div>
             </div>
         </div>


    </section>


     
    <!-- group3 영역   -->
    <section class = "section-group3">
        <div class = "book-list-zone">
            <ul class = "book-list">
                <li>
                    <a href="">추천도서</a>
                </li>
                <li>
                    <a href="">베스트 셀러</a>
                </li>
                 <li>
                    <a href="">인기도서</a>
                </li>
                <li>
                    <a href="">TOP10</a>
                 </li>
            </ul>

            <!-- book-img -->
             <div id = "book-sug" class="book-image" style = "display: block;">

                <ul class = "book-image-list" style = >    
                    <li>
                        <span class = "cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/163/581/16358168.jpg" alt="">
                            </a>
                        </span>
                        <span class = "txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/163/581/16358168.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/163/581/16358168.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/163/581/16358168.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/163/581/16358168.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                        </li>

                </ul>

            </div>

            <div id = "book-best" class="book-image" style = "display: none;">

                <ul class = "book-image-list" style = >    
                    <li>
                        <span class = "cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/144/122/14412268.jpg" alt="">
                            </a>
                        </span>
                        <span class = "txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/144/122/14412268.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/144/122/14412268.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/144/122/14412268.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/144/122/14412268.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                        </li>

                </ul>

            </div>

            <div id = "book-best-pop" class="book-image" style = "display: none;">
            
                <ul class="book-image-list" style=>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/164/291/16429192.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/164/291/16429192.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/164/291/16429192.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/164/291/16429192.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/164/291/16429192.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
            
                </ul>
            
            </div>

            <div id="book-top" class="book-image" style = "display: none;">
            
                <ul class="book-image-list" style=>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/156/192/15619225.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/156/192/15619225.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/156/192/15619225.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/156/192/15619225.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/156/192/15619225.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">우아한 방어 : 우리 몸을 지키는 면역의 놀라운 비밀</span>
                    </li>
            
                </ul>
            
            </div>
            
            
            
            
            
            <!-- book-img-end -->



            <!-- end book list -->
        </div>

     


    </section>

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

        <!-- 위로이동 버튼 -->
        <div class = "f-bootom">
            <div class = "btn-wrap">
                <a href="#">
                    <img src="/image/top.png" alt="">
                </a>

            </div>

        </div>

    </footer>

    
</body>

<script src="/js/indexCalendar.js"></script>

</html>