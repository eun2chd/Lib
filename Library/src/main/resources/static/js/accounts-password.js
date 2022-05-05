const passwordSubmitBtn = document.querySelector('.save-btn');
const cancelSubmitBtn = document.querySelector('.cancel-btn');
const PrePasswordInput = document.querySelector('#pre-password-ip');
const newPasswordInput = document.querySelector('#new-password-ip');
const newRePasswordInput = document.querySelector('#new-repassword-ip');


/* 비밀번호 정규화 해당 규칙을 모두 통과하면 true 반환 */
function chkPWresult(){

 var pw = $("#new-password-ip").val();
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


function passwordChange_Submit() {



	
	$.ajax({
		type : 'put',
		url : '/accounts/password/change',
		data : {
			"PrePassword" : PrePasswordInput.value,
			"newPassword" : newPasswordInput.value,
			
		},
		dataType : "text",
		success : function(data) {
			let passwordRespObj = JSON.parse(data);
			alert(passwordRespObj.message);
			if(passwordRespObj.code == 200) {
				alert('다시 로그인 하세요');
				location.replace('/logout');
			}
		},
		error : function() {
			alert('비동기 처리 오류');
		}
		
		
	});
	
	
}

passwordSubmitBtn.onclick = () => {
	
	var flag = chkPWresult()
	
	if(newPasswordInput.value != newRePasswordInput.value) {
		alert('새 비밀번호가 일치하지 않습니다.');
		return;
	}
	 if(flag != true) {
		alert('특수 문자 및 영문자를 포함해 주세요');
	}else {		
		passwordChange_Submit();
	}

	
}

cancelSubmitBtn.onclick = () => {
	location.replace('/');
}