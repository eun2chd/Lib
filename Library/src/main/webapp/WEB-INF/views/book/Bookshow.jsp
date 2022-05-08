<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 페이지</title>
<link rel="stylesheet" href="/css/book-info.css">
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
					<b>책 상세정보</b>
				</h2>
			</div>
		</div>
		<div class="bok-info">
			<div class="bok-in">
				<h2>책 상세정보를 확인하세요!</h2>
			</div>



			<div class="content-title">
				<h2>도서의 상세 내용을 확인하세요. <buntton class = "pagedown" type = "button"  style = "cursor: pointer;color:red">[이전페이지로 돌아갈래요!]</buntton></h2>
			</div>

			<div class="content">
				<div class="sinfo">
					<div class="thumb">

						<c:choose>
							<c:when test="${empty show.BOOK_IMG }">
								<img src="/image/ready_img.png" alt="이미지 준비중">
							</c:when>
							<c:otherwise>
								<img src="${show.BOOK_IMG }" alt="이미지 준비중">
							</c:otherwise>
						</c:choose>


					</div>
					<div class="info">
						<ul>

							<li>
								<b style="font-size: 21px; color: #c56816" class="bookname">${showbook.BOOK_NAME }</b>
							</li>
							<li><strong>ID : </strong><span class="id">${showbook.KEY_NUM }</span></li>
							<li><strong>도서관 : </strong><span class="location">${showbook.LOCATION }</span></li>
							<li><strong>자료실 : </strong><span class="ref_room">${showbook.REF_ROOM }</span></li>
							<li><strong>저자 : </strong><span class="author">${showbook.AUTHOR }</span></li>
							<li><strong>출판사 : </strong><span class="publisher">${showbook.PUBLISHER }</span></li>
							<li><strong>년도 : </strong><span class="year">${showbook.YR_PUBLICATION }</span></li>
							<li><strong>책 코드 : </strong><span class="call_sign">${showbook.CALL_SIGN }</span></li>

						</ul>
					</div>

					<button class="bro-btn">대출하기</button>

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
										 ${showbook.CALL_SIGN }
								</td>
								<td>
									 <c:choose>
									 	<c:when test="${showbook.STATUS_CD eq 1}">
									 			<span style="font-weight: 600;color: blue;">대출가능</span>
									 	</c:when>
									 	<c:otherwise>
									 		<span style="font-weight: 600;color: red;">대출불가</span>
									 	</c:otherwise>
									 
									 </c:choose>
								</td>
								<td>
										
									 ${showbook.REF_ROOM }
							   </td>
								<td>
										
									 ${showbook.KEY_NUM }
							  </td>
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

<script src = "/js/showBook.js"></script>

</html>