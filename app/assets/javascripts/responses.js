var responseView = {
	renderResponseForm: function(e, data){
		var responseIdLink = $(this).attr("class")
		$('#' + responseIdLink).append(data)
		$('.responselink .' + responseIdLink).off('ajax:success', responseView.renderResponseForm)
		$(this).remove()
	}
}















$(document).on('page:load',function(){

	$('.responselink a').on('ajax:success', responseView.renderResponseForm)
  // $('#new_response').on('ajax:success', function(){console.log("You submitted a response!")})
});
