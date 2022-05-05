/*
let 
let 
let 
let Btn = document.querySelector('.brow-bt');
let key = $('key').val();*/


function BookBorrow() { 
   const Book_Name = "정신병과 심리학"
   const Book_Author = "미셀 푸코 지음:박혜영 옮김";
   const Book_Publisher = "아름드라미디어";
   const Book_Loction = "수영도서관";
   var key = $('.brow-bt').val();
   
   	let BookObj = {
		bookname : Book_Name,
		bookauthor : Book_Author,
		bookpublisher : Book_Publisher,
		bookloction : Book_Loction,
		test : key
	}
   
   console.log(BookObj);  
  
  $.ajax({
	  type : "post",
      url :"book-search/borrow",
      data : BookObj,
	  dataType : "text",
	  success : function(data) {
		alert('대출이 완료되었습니다.');
	},
	error : function() {
		alert('에러');
	}
  });
}

/*function BookBorrow() {
	
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
*/
