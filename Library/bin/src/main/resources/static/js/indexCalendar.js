var CDdate = new Date();
var today = new Date();
var selectCk = 0;

var buildcalendar = function () {
    var htmlDates = '';


    var prevLast = new Date(CDdate.getFullYear(), CDdate.getMonth(), 0);
    // 지난달의 마지막날
    var thisFirst = new Date(CDdate.getFullYear(), CDdate.getMonth(), 1);
    // 이번달의 첫째날
    var thisLast = new Date(CDdate.getFullYear(), CDdate.getMonth() + 1, 0);
    // 이번달의 마지막 날
    document.querySelector(".year").innerHTML = CDdate.getFullYear() + "년";  // year에 년도 출력
    document.querySelector(".month").innerHTML = (CDdate.getMonth() + 1) + "월";
    // 월 출력

    console.log(today);

    const dates = [];
    if (thisFirst.getDay() != 0) {
        for (var i = 0; i < thisFirst.getDay(); i++) {
            dates.unshift(prevLast.getDate() - i); // 지난 달 날짜 채우기

        }
    }
    for (var i = 1; i <= thisLast.getDate(); i++) {
        dates.push(i); // 이번 달 날짜 채우기 
    }
    for (var i = 1; i <= 13 - thisLast.getDay(); i++) {
        dates.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)

    }
    for (let i = 0; i < 42; i++) {
        if (i < thisFirst.getDay()) {
            htmlDates += '<div class = "date last">' + dates[i] + '</div>';
        } else if (today.getDate() == dates[i] && today.getMonth() == CDdate.getMonth() && today.getFullYear() == CDdate.getFullYear()) {
            htmlDates += '<div id="date_' + dates[i] + '" class="date today" onclick="fn_selectDate(' + dates[i] + ');">' + dates[i] + '</div>';
        } else if (i >= thisFirst.getDay() + thisLast.getDate()) {
            htmlDates += '<div class="date next">' + dates[i] + '</div>';
        } else {
            htmlDates += '<div id="date_' + dates[i] + '" class="date" onclick="fn_selectDate(' + dates[i] + ');">' + dates[i] + '</div>';
        }
    }
    document.querySelector(".dates").innerHTML = htmlDates;

    for (var i = 1; i <= thisLast.getDate(); i++) {

        if (today.getDate() == dates[i] && today.getMonth() == CDdate.getMonth() && today.getFullYear() == CDdate.getFullYear()) {
            $("#date_" + dates[i]).css("background-color", "red");
            $("#date_" + dates[i]).css("color", "#fff");
        }

    }




}
function prevCal() {
    CDdate.setMonth(CDdate.getMonth() - 1);
    buildcalendar();
}

function nextCal() {
    CDdate.setMonth(CDdate.getMonth() + 1);
    buildcalendar();
}

function showClock() {
    var currentDate = new Date();
    var Clock = document.getElementById('Clock');
    var msg = "";
    if (currentDate.getHours() > 12) {
        msg += "오후 ";
        msg += currentDate.getHours() - 12 + "시";
    } else {
        msg += "오전 ";
        msg += currentDate.getHours() + "시";
    }
    msg += currentDate.getMinutes() + "분";
    msg += currentDate.getSeconds() + "초";
    Clock.innerHTML = msg;

    if (currentDate.getMinutes > 58) {
        Clock.style.color = "red";
    }
    setTimeout(showClock, 1000);
}


buildcalendar();
showClock();
