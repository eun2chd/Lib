<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="shortcut icon" href="/image/icon.png">
<link rel="stylesheet" href="/css/accounts-edit.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>


	<jsp:include page="../include/nav.jsp"></jsp:include>

	<div id="section-container">
		<div class="h-wrap"></div>
		<div class="section">
			<div class="lnb">
				<h2>
					<b>비밀번호 수정</b>
				</h2>

				<ul class="sub-menu">
					<li>

						<ul>
				
							<li><a href="/user/lib/${principal.user.userid }?page=1"> <span
									style="font-weight: bold;">대출중인 도서</span>
							</a></li>
							<li><a href="/user/myhistory"> <span
									style="font-weight: bold">대출이력</span>
							</a></li>

						</ul>
					<li><a href="/user/user-edit"> 
						<span>회원정보수정</span></a>
					</li>

					<li class="active"><a href="/user/password-edit"> 
						<span>비밀번호 수정</span></a>
					</li>

					</li>

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
							<h3>비밀번호 수정</h3>
						</div>
					</div>
					<div class="bor-content">
						<div class="content">
							<form action="" id="" name="" method="">
								<div class="editForm">
									<table id="">
										<tbody>
											<tr>
												<th>이전 비밀번호</th>
												<td><input id = "pre-password-ip" type="password" class="text"></td>
											</tr>
											<tr>
												<th>새 비밀번호</th>
												<td><input id = "new-password-ip" type="password" class="text">
												<p style="font-weight: bold;position: relative;top: 5px;">비밀번호 길이는 8 ~ 20 자 이내 입니다. 특수문자 및 영문자를 포함해주세요</p>
												</td>
												
										
											</tr>
											<tr>
												<th>새 비밀번호 확인</th>
												<td><input id = "new-repassword-ip" type="password" class="text"></td>
											</tr>
										</tbody>
									</table>

								</div>
							</form>
							<div class="btn-wrap">
								<button type = "button" class = "save-btn">저장</button> <button type = "button" class = "cancel-btn">취소</button>
							</div>


						</div>



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

<script src = "/js/accounts-password.js"></script>

</html>
