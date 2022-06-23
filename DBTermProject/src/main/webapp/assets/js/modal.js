const modal = document.getElementById("modal")

function modalOn(url) {
    modal.style.display = "flex";
    $.ajax({
		url:url,
		dataType:"html",
		type:"get",
		success:function(result){
			console.log(result);
			$("body").css("overflow","hidden");
			$(".content").html(result);
		},error:function(err){console.log("err",err)}
	})
}

function isModalOn() {
    return modal.style.display === "flex"
}

function modalOff() {
    modal.style.display = "none";
    $("body").css("overflow","scroll");
}



$(".btn-modal").click(function(){
	var url = $(this).attr('id');
	modalOn(url);
});

const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modalOff()
})

modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modalOff()
    }
})

window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }
})