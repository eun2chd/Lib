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
<link rel="shortcut icon" href="./images/icon.png">
<link rel="stylesheet" href="/css/booklist.css">
<script src="/js/jquery.js"></script>


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
				<h3>책제목을 클릭해서 대출가능 및 나의 관심도서에 넣어보세요!</h3>
			</div>


			<div class="con-book-list">
				<c:forEach var="book" items="${list }">
					<div class="sub">
						<div class="sub-left">
							<a href="#"> <img
								src="../image/ready_img.png" alt="이미지 준비중">
							</a>
						</div>
						<div class="sub-box-left">
							<div class="sub-item">
								<div class="clip">
									<a href="#"> <span class="text">${book.BOOK_NAME }</span>
									</a>
									<p class="text">지은이 : ${ book.AUTHOR}</p>
									<p>출판사 : ${book.PUBLISHER}</p>
									<c:choose>
										<c:when test="${empty book.YR_PUBLICATION }">
											<p>출판년도 : 정보없음</p>
										</c:when>

										<c:otherwise>
											<p>출판년도 :${ book.YR_PUBLICATION }</p>
										</c:otherwise>
									</c:choose>
									<p>도서관 : ${ book.REF_ROOM }</p>
								</div>
							</div>

						</div>
					</div>
				</c:forEach>
			
			</div>

			<div class="bar-btns">
				<div class="page_nation">
					<c:if test="${pagelist.prev}">
							<a class="arrow pprev" href="/book/booklist?page = 1"></a>
							<a class="arrow prev" href="/book/booklist?page=${pagelist.currentPage -1 }"></a>
					  </c:if>
						
						
						
					<c:forEach begin="${pagelist.startPage }" end ="${pagelist.endPage }" var="page">
						
							<li><a href="/book/booklist?page=${page }" class="">${page }</a></li>
					
					</c:forEach>
					
						<c:if test="${pagelist.next}">
							<a class="arrow next" href="/book/booklist?page=${pagelist.currentPage + 1 }"></a>
				    		<a class="arrow nnext" href="/book/booklist?page=${pagelist.totalPage }"></a>
						</c:if>

		
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
						<li><a href="#">이용약관</a></li>
						<li><a href="#"> <span> 개인정보처리방침 </span>
						</a></li>
						<li><a href="#">저작권보호정책</a></li>
					</ul>
				</div>
			</div>
		</div>


	</footer>

</body>


<script type="text/javascript">
	var i = ${pagelist.currentPage - pagelist.startPage };
	var totalPage = ${pagelist.totalPage - pagelist.startPage}
	
	if(i > totalPage) {
		i = totalPage
	}
	
	$(function() {
		$(".page_nation > li  a").eq(i).addClass("active");
		
	});
</script>



</html>