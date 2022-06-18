//초기화면 설정
$(document).ready(function() {
    acyncMovePage("main.jsp");
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
})};

//ajax_fetch 메뉴 생성
fetch('data/list_menu').then(function(response){
    response.text().then(function(text){
        //document.querySelector('#nav').innerHTML = text;
        $('#nav').html(text);
    });
});

// function fetchPage(name){
//     fetch(name).then(function(response){
//         response.text().then(function(text){
//             document.querySelector('#article').innerHTML = text;
//         });
//     });
// }

// $(document).ready(function(){
//     $("#sidebar").click(function(){
//         var submenu = $(this).css("overflow");
//         if(submenu!="hidden"){
//             $(".main-menu").css({
//                 width : "60px",
//                 overflow : "hidden"
//             })
//         }else{
//             $(".main-menu").css({
//                 width : "250px",
//                 overflow : "visible"
//             })
//         }
//     });
// });