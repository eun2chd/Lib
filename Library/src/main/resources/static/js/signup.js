/* 버튼 과 input 태그 */
const signupInputs = document.querySelectorAll('.su-input');
const submitBtn = document.querySelector('.si-btn');

/* 유저 아이디 */
const user_id = $('.user-id');
const user_length = $('.user-length');
const user_checkOk = $('.user-CheckOk');
const user_checkFail = $('.user-CheckFail');

/* 이메일 */
const user_mail_fail = $('.email-check-fail');
const user_mail_ok = $('.email-check-ok');
const user_mail_em = $('.email-check-em');


/* 비밀번호 클래스 */
const password_fail = $('.user-password-fail');
const password_ok = $('.user-password-ok');
const password_less = $('.user-password-less');
const password_length = $('.user-password-length');
const password_ball = $('.user-password-ball');

/* 비밀번호 정규화 규칙에 맞지 않을때 해당 css 나타냄 */
function chkPW(){

 var pw = $("#password_1").val();
 var num = pw.search(/[0-9]/g);
 var eng = pw.search(/[a-z]/ig);
 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 
 
 
 if(pw.length < 7 || pw.length > 20){
	password_length.css('display','block');
 }else {
	password_length.css('display','none');
}

 if(num < 0 || eng < 0 || spe < 0 ){
  password_less.css('display','block');	
 }else {
  password_less.css('display','none');	
 }

 
 if(pw.search(/\s/) != -1){
 	password_ball.css('display', 'block');
 }else {
	password_ball.css('display', 'none');
 }

}

/* 비밀번호 정규화 해당 규칙을 모두 통과하면 true 반환 */
function chkPWresult(){

 var pw = $("#password_1").val();
 var num = pw.search(/[0-9]/g);
 var eng = pw.search(/[a-z]/ig);
 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 
 

 if(pw.length < 8 || pw.length > 20){
  return false;
 }else if(pw.search(/\s/) != -1){
  return false;
 }else if(num < 0 || eng < 0 || spe < 0 ){
  return false;
 }else {
  return true;
 }

}


/* 패스워드 일치여부 나타냄  */
$('.pw').focusout(function() {
	let pass1 = $('#password_1').val();
	let pass2 = $('#password_2').val();
	
		if(pass1 != '' || pass2 != '') {
		
		if(pass1 == pass2) {
			password_ok.css('display','block');
			password_fail.css('display','none');
			password_less.css('display','none');
		}else {
			password_fail.css('display','block');
			password_ok.css('display','none');
			password_less.css('display','none');
		}	
	
}
	
		
});

/* str 변수를 받아서 해당 조건을 판단  */
function isEmpty(str) {
	
	if(typeof str == "undefined" || str == null || str == '') {
		return '사용가능';
	}else {
		return str;
	}
	
}
	
	/* 이메일 중복 체크 */
	function emailCheck() {
		var email = signupInputs[6].value + '@' + signupInputs[7].value;
		/* 이메일 정규화 */
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		
		$.ajax({
			url : '/auth/emailCheck',
			type : 'post',
			data : {email:email},
			success : function (emailFlag) {
				if(emailFlag == 0) {
					user_mail_ok.css('display','block');
					user_mail_fail.css('display','none');
				}else {
					user_mail_fail.css('display','block');
					user_mail_ok.css('display','none');
				}
				if(email.match(regExp) != null) {
					user_mail_em.css('display','none');
				}else {
					user_mail_em.css('display','block');
					user_mail_ok.css('display','none');
				}
				
			
			},
			error:function(){
				alert('에러입니다.');
			}
		
		});	
	
			
	}
	
	
	
	
	
	
	
    /* 아이디 중복 체크 */
     function checkId() {
		$Img = document.querySelector(".check_Img");
		var id = $('#user_id').val(); // 사용자가 입력한 아이디 저장
		$.ajax({
			url:'/auth/idcheck',
			type:'post',
			data:{id:id},
			success:function(cnt) {
				
				/* id 중복페크 cnt 값이 : 0 */
				if(cnt != 1 && id.length >= 4 || id.length > 20) {
					$Img.src = "/image/check.png"
					/* 사용가능한 아이디 알려주기 */
					user_checkOk.css('display', 'block');
					/* 문자열 길이 체크 지워주기 */
					user_length.css('display','none');
					/* 공백은 입력할 수 없습니다. 가려주기 */
					user_id.css('display','none');
					/* 사용중인 아이디 입니다. 가려주기 */
					user_checkFail.css('display','none');
					
				}else {
					/* 현재 사용중인 아이디 입니다 안내 */
					user_checkFail.css('display','block');
					/* 사용가능한 아이디 입니다. 가려주기 */
					user_checkOk.css('display', 'none');
					
					$Img.src = "/image/remove.png"
				}
				
				if(id == "") {
					/* 공백 입력 불가 메시지 안내 */
					user_id.css('display' ,'block'); 
					/* 길이체크 가려주기 */
					user_length.css('display', 'none');
					/* 사용중인 아이디 입니다. 가려주기 */
					user_checkFail.css('display','none');
					/* 사용가능한 아이디 입니다. 가려주기 */
					user_checkOk.css('display', 'none');
					/* X 이미지 나타내기 */
					$Img.src = "/image/remove.png"
					
				} else if(id.length < 4 || id.length > 20) {
					user_length.css('display', 'block');
					/* 사용중인 아이디 입니다. 가려주기 */
					/* 공백 입력 불가 메시지 안내 */
					user_id.css('display' ,'none'); 
					/* 길이체크 가려주기 */
					user_checkFail.css('display','none');
					/* 사용가능한 아이디 입니다. 가려주기 */
					user_checkOk.css('display', 'none');
					/* X 이미지 나타내기 */
					$Img.src = "/image/remove.png"
				}
				
			},
			error:function() {
				alert('에러입니다.');
			}
		});
	
	}
	
	
/* data json 으로 받아서 에러코드에 일치하는 알림창 발생 */	
function signupValidMsg(data) {
	let signupDataObj = JSON.parse(data);
	
	if(signupDataObj.code == 400) {
		alert('회원가입 진행 형식을 다시한번 확인해 주세요');
	}
	else if(signupDataObj.code == 401) {
			alert('아아디 또는 이메일 중복입니다. 다시한번 확인해주세요');
	}else if(signupDataObj.code == 200) {
		alert(signupDataObj.data);
		location.replace('/auth/signin');
	}

}
	
/* 사용자가 입력한 정보값을 obj 에 담기 ajax post 요청함  */
function signup() {
	
		let signupObj = {
			
			userid : signupInputs[0].value,
			name : signupInputs[1].value,
			password : signupInputs[2].value,
			addr_number : '['+signupInputs[3].value+']',
			addr_1 : signupInputs[4].value,
			addr_2 : signupInputs[5].value,
			email_1 : signupInputs[6].value,
			email_2 : signupInputs[7].value
		}
	
	$.ajax({
		type : "post",
		url : "/auth/signup",
		data : signupObj,
		dataType : "text",
		success : function(data) {
			signupValidMsg(data);
		},
		error : function() {
			alert('비동기 오류');
		}
	
	});
	
}	

/* 회원가입 버튼 클릭식 해당 이벤트 발생 비밀번호 정규화 true 값 넘어오면 signup 호출 */
submitBtn.onclick = () => {

	var flag = chkPWresult();

	
	if(flag == true) {
		signup();
	}else {
		alert('회원가입 형식을 다시한번 확인해주세요');
	}

}

	
    
    