const broBtn = document.querySelector('.bro-btn');
const broBtn2 = document.querySelector('.pagedown');






function BookBorrow() {

	const id = $('.id').text();
	const Book_Name = $('.bookname').text();
	const Book_Author = $('.author').text();
	const Book_Publisher = $('.publisher').text();
	const Book_Loction = $('.location').text();

	let BookObj = {
		id: id,
		bookname: Book_Name,
		bookauthor: Book_Author,
		bookpublisher: Book_Publisher,
		booklocation: Book_Loction
	}

	console.log(BookObj);


	$.ajax({
		type: "post",
		url: "/book/bookshow/borrow",
		data: BookObj,
		dataType: "text",
		success: function(data) {
			if (data == 400) {
				alert('이미 대출된 책입니다.');
			} else if (data == 401) {
				alert('로그인 후 시도해 주십시오');
				location.replace('/auth/signin');
			} else if (data == 200) {
				alert('대출이 완료되었습니다.');
				location.reload();
			}

		},

		error: function() {
			alert('에러');
		}
	});
}


broBtn.onclick = () => {
	BookBorrow();
}

broBtn2.onclick = () => {
	history.go(-1);
}
