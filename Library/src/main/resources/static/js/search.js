let Book_Name = $('.book-name').text();
let Book_Author = $('.book-author').text();
let Book_Publisher = $('.book-publisher').text();
let Book_Loction = $('.book-location').text();
let Btn = document.querySelector('.brow-bt');
let key = $('key').val();



function BookBorrow() {
	
	console.log(Book_Name);
	console.log(Book_Author);
	console.log(Book_Publisher);
	console.log(Book_Loction);	
	
	let BookObj = {
		bookname : Book_Name,
		bookauthor : Book_Author,
		bookpublisher : Book_Publisher,
		bookloction : Book_Loction
	}
	
	$.ajax({
		type : "post",
		url : "book-search/borrow",
		data : BookObj,
		dataType : "text",
		success : function(data) {
			alert('대출이 완료되었습니다.');
		},
		error : function () {
			alert('에러');
		}	
	});
	
	
	
}

