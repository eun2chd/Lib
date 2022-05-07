const BroBtn = document.querySelector('.bro-btn');


function BookBorrow() { 
   const Book_Name = $('.bookname').text();
   const Book_Author = $('.author').text();
   const Book_Publisher = $('.publisher').text();
   const Book_Loction = $('.location').text();
   
   	let BookObj = {
		bookname : Book_Name,
		bookauthor : Book_Author,
		bookpublisher : Book_Publisher,
		bookloction : Book_Loction,
	}
   
   console.log(BookObj);  
  
  $.ajax({
	  type : "post",
      url :"/book/bookshow/borrow",
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


BroBtn.onclick = () => {
	
	BookBorrow();
	
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
