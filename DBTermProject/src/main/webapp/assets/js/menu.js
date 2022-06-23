//초기화면 설정
$(document).ready(function() {
    acyncMovePage("sub/main.jsp");
});

//ajax 페이지 전환
function acyncMovePage(url){
    $.ajax({
        url:url,
        dtatType:"html",
        type:"post",
        success:function(result){
            $("#main").html(result);
        }
	})
};

function acyncMovePage(url, data){
	$.ajax({
		url:url,
		dataType:"html",
		type:"post",
		data:data,
		success:function(result){
			$("#main").html(result);
		}
	})
};

//ajax_fetch 메뉴 생성
fetch('assets/data/list_menu').then(function(response){
    response.text().then(function(text){
        //document.querySelector('#nav').innerHTML = text;
        $('#nav').html(text);
    });
});