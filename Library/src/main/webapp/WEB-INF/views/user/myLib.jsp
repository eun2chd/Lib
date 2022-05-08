<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize> 


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 서재</title>
<link rel="shortcut icon" href="/image/icon.png">
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="/css/pagebuttons.css">

  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    

</head>
<body>

	<jsp:include page="../include/nav.jsp"></jsp:include>



	<div id="section-container">
		<div class="h-wrap"></div>
		<div class="section">
			<div class="lnb">
				<h2>
					<b>내 서재</b>
				</h2>

				<ul class="sub-menu">
					<li class="active"><a href="#"> <span>대출현황</span>
					</a>
						<ul>
							<li class="active"><a href="/user/myLib"> <span>대출중인
										도서</span>
							</a></li>
							<li><a href="/user/myhistory"> <span
									style="font-weight: bold">대출이력</span>
							</a></li>
						</ul></li>
					<li><a href="/user/user-edit"> <span>회원정보 수정</span>
					</a></li>
					<li><a href="/user/myinter"> <span
							style="font-weight: bold;">나의 관심 도서</span>
					</a></li>

				</ul>

				<!-- end class lnb -->
			</div>

			<div class="content">
				<div class="bor">
					<div class="bor-head">
						<div class="bor-title">
							<h3>대출중인 도서</h3>
						</div>
					</div>
					<div class="book-list">

						<c:choose>
							<c:when test="${Lib eq null }">

								<span style="font-size: 26px; font-weight: 800;">대출중인 도서가
									없습니다.</span>

							</c:when>
							<c:otherwise>
							
								<table>
									<tbody>
										<tr>
											<th style="width: 35%;">제목</th>
											<th style="width: 20%;">도서관 명</th>
											<th style="width: 20%;">지은이</th>
											<th style="width: 20%;">출판사</th>
										</tr>
										<c:forEach var="list" items="${Lib }">
											<tr>
												<td style="height: 35px;">${list.book_name }</td>
												<td style="height: 35px;">${list.lib_name }</td>
												<td style="height: 35px;">${list.author }</td>
												<td style="height: 35px;">${list.publisher }</td>
											</tr>
										</c:forEach>


								</div>
							</div>
						</tbody>
					</table>
							</c:otherwise>
						</c:choose>
						
						         <!-- start button -->
            <div class="bar-btns">
				<div class="page_nation">
				<c:if test="${bookSerch.prev }">
							<a class="arrow pprev" href="1"></a>
							<a class="arrow prev" href="/book-search?page=${bookSerch.currentPage - 1 }"></a>
				</c:if>
						<c:forEach begin = "${bookSerch.startPage }" end = "${bookSerch.endPage }" var = "page">
							<li><a href="/user/lib/${principal.user.userid }?page=${page}" class="">${page }</a></li>				
						</c:forEach>
						
					<c:if test="${bookSerch.next }">
						<a class="arrow next" href="/book-search?page=${bookSerch.currentPage + 1 }"></a>
				    	<a class="arrow nnext" href="/book-search?page=${bookSerch.totalPage + 1 }"></a>
					</c:if>
						
			
				</div>
			</div>
			
			<!-- end buttons -->


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
var i = ${bookSerch.currentPage - bookSerch.startPage };
var totalPage = ${bookSerch.totalPage - bookSerch.startPage}

if(i > totalPage) {
	i = totalPage
}

$(function() {
	$(".page_nation > li  a").eq(i).addClass("active");
	
});
</script>
</html>