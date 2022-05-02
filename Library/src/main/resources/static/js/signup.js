const signupInputs = document.querySelectorAll('.su-input');
const submitBtn = document.querySelector('.si-btn');


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
				if(cnt != 1) {
					$Img.src = "/image/check.png"
				}else {
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
			'userid : ' + isEmpty(signupDataObj.data.userid) + '\n' + 
			'name : ' + isEmpty(signupDataObj.data.username) + '\n' + 
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
			alert(data);
		},
		error : function() {
			alert('비동기 오류');
		}
	
	});
	
}	

submitBtn.onclick = () => {
	signup();
}

	
    
    