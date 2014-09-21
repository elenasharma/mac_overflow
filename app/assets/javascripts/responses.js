var ready;
ready = function() {

var responseView = {
	renderResponseForm: function(e, data){
		var responseIdLink = $(this).attr("class")
		$('#' + responseIdLink).append(data)
		$('.responselink .' + responseIdLink).off('ajax:success', responseView.renderResponseForm)
		$(this).remove()
	}
}



	$('.responselink a').on('ajax:success', responseView.renderResponseForm)
  // $('#new_response').on('ajax:success', function(){console.log("You submitted a response!")})

};

$(document).ready(ready);
$(document).on('page:load', ready);

