//ajax 페이지 전환
function acyncMovePage(url){
    $.ajax({
        url:url,
        dtatType:"html",
        type:"post",
        success:function(result){
            $("#main").html(result);
        },error:function(err){console.log("err",err)}
	})
};

function acyncMovePage(url, data){
	var go_url = url + '?' + data;
	$.ajax({
		url:go_url,
		dataType:"html",
		type:"get",
		success:function(result){
			$("#main").html(result);
		},error:function(err){console.log("err",err)}
	})
};

function such(url){
	console.log($("#searchCondition").val());
	console.log($("#searchKeyword").val());
	var data = 'searchCondition='+$("#searchCondition").val()+'&searchKeyword='+$("#searchKeyword").val();
	console.log("data",data);
	acyncMovePage(url,data);
}

function open_modal(url){
	$.ajax({
		url:url,
		dataType:"html",
		type:"get",
		success:function(result){
			$("#modal > .content").html(result);
		},error:function(err){console.log("err",err)}
	})
}