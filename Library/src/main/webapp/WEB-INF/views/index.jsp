<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        	
        	 /* input box 빈값 입력 경고창 */
        	
        	$('#main-search-btn').on('click', function() {
        		if($('input#key-search').val() == '') {
        			alert('검색어를 입력하세요');
        			$('input#key-search').focus();
        			return false;
        		}
        		
        		$('#searchForm').submit();
        	});
        	
    
        	 /* 날씨 API */
        	
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
                	// substr(start,length) 문자열 추출함수
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

		<!-- 상단 NAV 바  -->
  	   <jsp:include page="./include/nav.jsp"></jsp:include>
	
         
    <!-- group1 영역 -->
    <section class="setion-group1">
        <div id="h-container">

            <!-- Search 영역 -->
            <div class="main_bg">
                <div class="main1">
                    <div class="section">
                      
                        <div class="title-box">
                            <form  id ="searchForm"  action="/book-search" method="get">
                                <label for="" class="in-la"></label>
                                <input id = "key-search" name = "keyword" type="text" placeholder="도서명 또는 저자를 검색하세요" class="in-search">
                                <button id = "main-search-btn">검색</button>
                            </form>
                        </div>


                    </div>
                </div>
            </div>
            <!-- Search end  -->

			<!-- 지나가는 이미지 영역 -->
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
    
    <!-- 지나가는 이미지영역 END -->

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
    <!-- group2 END -->
    

    <!-- group3 영역   -->
    <section class = "section-group3">
		<!-- book-list-zone Start -->
        <div class = "book-list-zone">
        
        	<!-- menu 바 영역  -->
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
            <!-- menu바 영역 end -->
        

            <!-- book-img 추천도서 영역 -->
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
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/142/619/14261951.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">나의 삶은 서서히 진화해왔다 : 찰스 다윈 자서전</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/146/520/14652013.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">레오나르도 다빈치: 인간 역사의 가장 위대한 상상력과 창의력</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://library.gangnam.go.kr/include/booksearch/image/kdc/noimg.png" alt="">
                                </a>
                            </span>
                            <span class="txt">간디자서전 : 나의 진리실험 이야기</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/163/557/16355714.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">아인슈타인이 괴델과 함께 걸을 때: 사고의 첨단을 찾아 떠나는 여행</span>
                        </li>

                </ul>

            </div>
             <!-- book-img 추천도서 영역 END -->


			  <!-- book-img 베스트셀러 영역  -->
            <div id = "book-best" class="book-image" style = "display: none;">

                <ul class = "book-image-list" style = >    
                    <li>
                        <span class = "cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/223/038/22303875.jpg" alt="">
                            </a>
                        </span>
                        <span class = "txt">아무도 흔들 수 없는 나라: 한 권에 담은 문재인 대통령 주요 연설문집</span>
                    </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/223/340/22334095.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">위대한 국민의 나라: 문재인정부 5년의 기록</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/144/122/14412268.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">적게자도 괜찮습니다</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/220/348/22034874.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">Go Go 카카오프렌즈: 세계 역사 문화 체험 학습만화. 23, 싱가포르</span>
                        </li>
                        <li>
                            <span class="cov">
                                <a href="#">
                                    <img src="https://bookthumb-phinf.pstatic.net/cover/219/828/21982883.jpg" alt="">
                                </a>
                            </span>
                            <span class="txt">나태평과 진지해</span>
                        </li>

                </ul>
	          </div>
				<!-- book-img 베스트셀러 영역 END  -->
				
			<!-- book-img 인기도서 영역   -->	
            <div id = "book-best-pop" class="book-image" style = "display: none;">
            
                <ul class="book-image-list" style=>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/204/734/20473472.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">(애니메이션 코믹북)엉덩이 탐정. 4</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/146/335/14633577.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">그리스 로마 신화: 만화로 읽는 초등 인문학/ 10; 영웅의 전설, 카드모스의 대가</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/162/674/16267450.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">그리스 로마 신화: 만화로 읽는 초등 인문학. 15, 신에 도전한 인간들</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/142/949/14294930.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">(설민석의)통일 대모험. 하: 통일 편 : "설쌤, 통일 한반도가 궁금해요!"</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/161/214/16121412.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">(카카오프렌즈)과학탐정단. 3, 공룡</span>
                    </li>
            
                </ul>
            </div>
            <!-- book-img 인기도서 영역  END -->	


			<!-- TOP10 영역  -->
            <div id="book-top" class="book-image" style = "display: none;">
            
                <ul class="book-image-list" style=>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://image.aladin.co.kr/product/26942/84/cover/k582730818_1.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">불편한 편의점 :김호연 장편소설</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://image.aladin.co.kr/product/24512/70/cover/k392630952_1.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">달러구트 꿈 백화점.이미예 장편소설</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://bookthumb-phinf.pstatic.net/cover/134/282/13428208.jpg?type=m1&udate=20180331" alt="">
                            </a>
                        </span>
                        <span class="txt">파친코 :이민진 장편소설</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://image.aladin.co.kr/product/27225/29/cover/k432732398_2.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">완전한 행복 :정유정 장편소설</span>
                    </li>
                    <li>
                        <span class="cov">
                            <a href="#">
                                <img src="https://image.aladin.co.kr/product/27587/47/cover/k962733015_1.jpg" alt="">
                            </a>
                        </span>
                        <span class="txt">달러구트 꿈 백화점.이미예 장편소설</span>
                    </li>
            
                </ul>           
            </div>        
           <!-- TOP10 영역 END  -->
               
        </div>
        <!-- end book list END -->
        
    </section>
        <!-- group3 영역 END   -->
    

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
        <!-- 위로이동 END -->

    </footer>
	<!-- footer end -->
    
</body>
<!-- 달력 스크립트 -->
<script src="/js/indexCalendar.js"></script>

</html>