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
$(document).on('click', ready);
