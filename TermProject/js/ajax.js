function acyncMovePage(url){
    $.ajax({
        url:url,
        dtatType:"html",
        type:"post",
        success:function(result){
            $("#main").html(result);
        }
})};