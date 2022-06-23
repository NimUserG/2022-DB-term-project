//초기화면 설정
$(document).ready(function() {
    acyncMovePage("sub/main.jsp");
});


//ajax_fetch 메뉴 생성
fetch('assets/data/standard_menu').then(function(response){
    response.text().then(function(text){
        //document.querySelector('#nav').innerHTML = text;
        $('#stanaerd_nav').html(text);
    });
});

fetch('assets/data/manager_menu').then(function(response){
    response.text().then(function(text){
        //document.querySelector('#nav').innerHTML = text;
        $('#manager_nav').html(text);
    });
});