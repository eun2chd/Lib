const signupInputs = document.querySelectorAll('.su-input');
const submitBtn = document.querySelector('.si-btn');
const user_id = $('.user-id');
const user_length = $('.user-length');
const user_checkOk = $('.user-CheckOk');
const user_checkFail = $('.user-CheckFail');


/* 비밀번호 클래스 */
const password_fail = $('.user-password-fail');
const password_ok = $('.user-password-ok');
const password_less = $('.user-password-less');



function chkPW(){

 var pw = $("#password_1").val();
 var num = pw.search(/[0-9]/g);
 var eng = pw.search(/[a-z]/ig);
 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 
 

 if(pw.length < 8 || pw.length > 20){

  alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
  return false;
 }else if(pw.search(/\s/) != -1){
  alert("비밀번호는 공백 없이 입력해주세요.");
  return false;
 }else if(num < 0 || eng < 0 || spe < 0 ){
  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
  return false;
 }else {
	console.log("통과"); 
    return true;
 }

}


$('.pw').focusout(function() {
	let pass1 = $('#password_1').val();
	let pass2 = $('#password_2').val();
	
	/* 비밀번호 정규식 */
	var num = pass1.search(/[0-9]/g);
	var eng = pass1.search(/[a-z]/ig);
	var spe = pass1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
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


/*function PassCheck() {
	console.log(password);
	console.log(password2);

	if(password != password2) {
		
	}else {
		
	}
			
	
}*/



function isEmpty(str) {
	
	if(typeof str == "undefined" || str == null || str == '') {
		return '사용가능';
	}else {
		return str;
	}
	
}


    /* 아이디 체크 */
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
	
function signupValidMsg(data) {
	let signupDataObj = JSON.parse(data);
	
	if(signupDataObj.code == 400) {
		alert(
			'유효성 검사 오류.\n' +
			'오류코드 : \n' + signupDataObj.code + '\n' +
			'name : ' + isEmpty(signupDataObj.data.name) + '\n' + 
			'password : ' + isEmpty(signupDataObj.data.password) + '\n' + 
			'addr : ' + isEmpty(signupDataObj.data.addr) + '\n' + 
			'email : ' + isEmpty(signupDataObj.data.email)
		);
	}
	else if(signupDataObj.code == 401) {
		alert(
			'오류코드 : ' + signupDataObj.code + '\n' +
	    	 signupDataObj 
		);
	}else if(signupDataObj.code == 200) {
		alert(signupDataObj.data);
		location.replace('/auth/signin');
	}

}
	

function signup() {
	
		let signupObj = {
			
			userid : signupInputs[0].value,
			name : signupInputs[1].value,
			password : signupInputs[2].value,
			addr : signupInputs[3].value + ' ' + signupInputs[4].value +' '+signupInputs[5].value,
			email : signupInputs[6].value + '@' + signupInputs[7].value
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

submitBtn.onclick = () => {
	signup();
	
}

	
    
    