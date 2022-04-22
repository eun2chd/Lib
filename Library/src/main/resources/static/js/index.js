$(function () {

    var result = 0;
    var bookClick = 0; // 책 이동
    var setTime;
    // 첫번째 버튼 on 적용
    $(".h-btns > li").eq(0).addClass("on");

    // 사용자가 입력한 버튼값 받아서 on 적용
    $(".h-btns > li").click(function () {
        var i = $(this).index();

        // 이전 버튼 on 클래스 지우기
        $(".h-btns > li").removeClass("on");
        $(this).addClass("on");

        move(i); // 함수호출

    });
    
     $(".book-list > li").eq(0).addClass("on");
    $(".book-list > li").click(function () {
        var j = $(this).index();

        $(".book-list > li").removeClass("on");
        $(this).addClass("on");
        console.log(j);

        bookshow(j);

    })

    // 자동실행 제어
    $("#h-container").on({
        mouseover: function () {
            clearInterval(setTime);
        },
        mouseout: function () {
            timer();
        }
    });


    timer();

    // 자동실행
    function timer() {
        setTime = setInterval(function () {
            var n = result + 1;
            if (n == 4) {
                n = 0;
            }
            $(".h-btns > li").removeClass("on");
            $(".h-btns > li").eq(n).addClass("on");

            move(n);
        }, 5000);
    }

    // 스크롤에 따라서 버튼을 사리지게 또는 나타나게 처리
    $(window).scroll(function () {
        var scrollSize = $(this).scrollTop();

        if (scrollSize > 200) {
            $('.btn-wrap').css({ opacity: 1 });
        } else {
            $('.btn-wrap').css({ opacity: 0 });
        }

    });

    // 버튼 클릭시 위치이동
    $('.btn-wrap').click(function (e) {
        e.preventDefault();
        $('html , body').animate({ scrollTop: 0 }, 500);

    });




    // 사용자가 버튼 클릭시 이미지 이동
    function move(n) {
        if (result == n) {
            return;
        }
        var nowPage = $(".h-wrap ul li").eq(result);
        var nextPage = $(".h-wrap ul li").eq(n);

        nowPage.css({ left: "0%" }).animate({ left: "-100%" });
        nextPage.css({ left: "100%" }).animate({ left: "0%" });

        result = n;

    }
    
       function bookshow(n) {
        if (bookClick == n) {
            return;
        } else if (n == 0) {
            $("#book-sug").show();
            $("#book-best").hide();
            $("#book-best-pop").hide();
            $("#book-top").hide();
        } else if (n == 1) {
            $("#book-sug").hide();
            $("#book-best").show();
            $("#book-best-pop").hide();
            $("#book-top").hide();
        } else if (n == 2) {
            $("#book-sug").hide();
            $("#book-best").hide();
            $("#book-best-pop").show();
            $("#book-top").hide();
        } else if (n == 3) {
            $("#book-sug").hide();
            $("#book-best").hide();
            $("#book-best-pop").hide();
            $("#book-top").show();
        }


        bookClick = n;
    }






});