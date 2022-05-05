<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<b>회원정보 수정</b>
				</h2>

				<ul class="sub-menu">
					<li>

						<ul>
					

							<li><a href="/user/myLib"> <span
									style="font-weight: bold;">대출중인 도서</span>
							</a></li>
							<li><a href="/user/myhistory"> <span
									style="font-weight: bold">대출이력</span>
							</a></li>

						</ul>
					<li class="active"><a href="/user/user-edit"> <span>회원정보 수정</span>
					</a></li>
					
					<li><a href="/user/password-edit"> <span>비밀번호 수정</span>
					</a></li>
					
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
							<h3>회원정보 수정</h3>
						</div>
					</div>
					<div class="bor-content">
						<div class="content">							
								<div class="editForm">
									<table id="">
										<tbody>
											<tr>
												<th>성명</th>
												<td>${principal.user.username }</td>
											</tr>
											<tr>
												<th>아이디</th>
												<td>${principal.user.userid }</td>
											</tr>
										<form enctype = "multpart/form-data">
											<tr>
												<th>성별</th>
												<td>
												<input type = "text" id = "genderInput" class = "text" name = "gender" value = ${principal.userDtl.user_gender }>
													<select id = "genderBtn" >
														<option value = "남">남</option>
														<option value = "여">여</option>
													</select>	
													
											</td>
											</tr>
											<tr>
												<th>휴대폰</th>
												<td><input type="text" class="text" name = "user_phone" placeholder="010-xxxx-xxxx" value = "${principal.userDtl.user_phone }"></td>
											</tr>

											<tr>
												<th>생년월일</th>
												<td><input type="text" class="text" name = "birthday" placeholder="ex)xxxx/xx/xx" value = "${principal.userDtl.user_birthday }"></td>
											</tr>

											<tr>
												<th>주소</th>
												<td>
													<p>
														<input type="text" id = "postcode" class="text" name = "addr_number"  value = "${principal.userDtl.addr_number }">
														 <input type="button" class = "btn" onclick="findAddr()" value="우편번호 찾기" >
													</p>
													<p>
														<input type="text" id = "roadAddress" class="text" name = "addr_1" style="width: 80%;" value = "${principal.userDtl.addr_1 }">
													</p>
													<p>
														<input type="text" id="address_1" name = "addr_2" class="text" value = "${principal.userDtl.addr_2 }"
															style="width: 80%">
													</p>
												</td>
											</tr>
											<tr>
												<th>이메일</th>
												<td><input type="text" class="text" name = "mail_1" value = "${principal.userDtl.mail_1 }">@<input
													type="text" id = "changeInput" class="text" name = "mail_2" value = "${principal.userDtl.mail_2 }" > 
													<select id="email2_temp" class="selectmenu" onchange = "" style="width: 150px;">
														<option value="">--직접입력--</option>
														<option value="naver.com">naver.com</option>
														<option value="daum.net">daum.net</option>
														<option value="gmail.com">gmail.com</option>
														<option value="nate.com">nate.com</option>
														<option value="korea.com">korea.com</option>
														<option value="hotmail.com">hotmail.com</option>
														<option value="yahoo.com">yahoo.com</option>
														<option value="korea.kr">korea.kr</option>
												</select></td>
											</tr>

										</tbody>
									</table>

								</div>
							</form>
							<div class="btn-wrap">
								<button class = "save-btn">저장</button> <button class = "cancel-btn">취소</button>
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

<script src = "/js/accounts-edit.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		$('.selectmenu').change(function(){
			$('#changeInput').val($(this).val());
		});
		$('#genderBtn').change(function() {
			 $('#genderInput').val($(this).val());
		});
	});
	
	
	
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {

				var roadAddr = data.roadAddress;
				
				document.getElementById('postcode').value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById('roadAddress').value = roadAddr;
				}
					
			}
			
			
		}).open();
	}	
	
	
	
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</html>

</body>
</html>