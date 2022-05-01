<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 서재</title>
    <link rel="shortcut icon" href="/image/icon.png">
    <link rel="stylesheet" href="css/search.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <script type="text/javascript">
		$(document).ready(function() {
			
			$('#main-search-btn').on('click', function() {
        		if($('input#key-search').val() == '') {
        			alert('검색어를 입력하세요');
        			$('input#key-search').focus();
        			return false;
        		}
        		
        		$('#searchForm').submit();
        		
        	
        	});
        	
			
			
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
			
			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});
	</script>
</head>

<body>

	<jsp:include page="../include/nav.jsp"></jsp:include>
	
  
        <!-- book-list -->
        <div id="section-container">
            <div class="h-wrap"></div>
            <div class="section">
                <div class="lnb">
                    <h2>
                        <b>자료검색</b>
                    </h2>
                </div>
            </div>
            <div class = "bok-info">
                <div class="bok-in">
                    <h2>자료검색 결과입니다.</h2>
                </div>

            <div class="show-search">
                <div class="show-search-in">
                    <h3>통합검색</h3>
                </div>
            </div>

            <div class = "search-input">
                <span class = "search-key">
                  <form action="/book-search" method="post">
                    <input id = "key-search"  name = "keyword" type="text" placeholder="검색어를 입력하세요">
             		<button id = "main-search-btn">검색</button>
             	  </form>
                </span>
                	
            </div>
	
		<c:choose>
		
			<c:when test="${empty Serch }">
				    <div class = "show-search-view">
                		<p class = "view-search-findresult">검색결과가 없습니다. <br>"${bookSerch.keyword }" 에 대한 결과는 총 "${bookSerch.total }" 건 있습니다.</p>
         		   </div> 
			</c:when>
			
			<c:otherwise>
			
				   	 <!-- 관심자료 도서바로가기 start  -->
            <div class = "show-search-view" >
                <p><span class = "view-content">"${bookSerch.keyword }"</span> 에 대한 검색 결과가 <span class = "view-content">"${bookSerch.total }"</span>건 있습니다.</p>
         
                <div class ="search-header">
                    <div class = "btns-save">
                        <span class = "btn-check">
                            <input type="checkbox" id = "cbx_chkAll" title="전체목록 선택" name = "tt">
                        </span>
                        <a href="#" class = "button put">관심자료 담기</a>
                        <a href="user/myinter" class = "button move">나의 관심도서 바로가기</a>
                    </div> 
                </div>
                
               <!-- 관심자료 도서바로가기 end  -->
                
		<!-- 책정보 Start-->

                <ul class ="book-result">
              	   <c:forEach var = "book" items = "${Serch }">
                    <li>
                        <span class = "chk">
                            <input type="checkbox" title="선택" name = "chk">
                        </span>
                        <div class="thmb">
                            <span class = "book-cover-img">
                                <img src="/image/ready_img.png" alt="">
                            </span>
                        </div>
                        <div class = "book-clip">
                            <p class = "book-name">제목 : "${book.BOOK_NAME }"</p>
                            <p>저자 : "${book.AUTHOR }"</p>
                            <p>출판사 : "${book.PUBLISHER }"</p>
                            <p>도서관 : "${book.LOCATION }"</p>
                            <p>코드 : "${book.CALL_SIGN }"</p>
                        </div>
                        <div class = "brow-book-view">
                            <span>
                                <a href="#" style= "color : #0459d7; font-weight: bold;">대출가능</a>
                            </span>
                            <p style = "display: none;">대출 불가</p>
                            <div class = "brow-book-btn">
                            <span>
                                <a href="#" class = "brow-btn">대출하기</a>
                            </span>
                            </div>
                        </div>
                    </li>
                    
                       </c:forEach> 
                    
                </ul>
                   
            </div>
          

        <!-- 책정보 END-->
			
			</c:otherwise>
		
		</c:choose>
	
             
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