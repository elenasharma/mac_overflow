// $(window).scroll(function(){
// 	console.log("scrolling!")
// 	$("#new_answer")
// 		.stop()
// 		.animate({"marginTop": ($(window).scrollTop()) + "px"},
// 		"slow" );
// });

var ready;
ready = function() {
	var $scrollingForm = $(".new_answer");

	$(window).scroll(function(){			
		$scrollingForm
			.stop()
			.animate({"top": ($(window).scrollTop() + 400) + "px"}, "slow" );			
	});
};

$(document).ready(ready);
$(document).on('click', ready)
