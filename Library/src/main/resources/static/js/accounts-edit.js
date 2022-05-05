const save_btn = document.querySelector('.save-btn');
const cancel_btn = document.querySelector('.cancel-btn');
const form = document.querySelector('form');


function multpartSubmit() {
	
	let formData = new FormData(form);
	
	$.ajax({
		type : "put",
		url : "/accounts/edit",
		data : formData,
		dataType : "text",
		enctype : "multipart/form-data",
		processData : false,
		contentType : false,
		success : function(data) {
	
				alert('회원정보 수정 완료');
			

		},
		error : function() {
			alert('에러');
		}
		
	});
	
	
}


save_btn.onclick = () => {
	multpartSubmit();
}
cancel_btn.onclick = () => {
	location.replace('/');
}