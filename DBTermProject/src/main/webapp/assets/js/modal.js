$(document).ready(function(){
	linkedPage("sub/customerDetail.jsp");
});

function linkedPage(url){
	$.ajax({
        url:url,
        dtatType:"html",
        type:"post",
        success:function(result){
			alert("hi");
            $(".modal-body").html(result);
        }
	});
};
