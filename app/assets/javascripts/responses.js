var ready;
ready = function() {

var responseController = {
	bindEvents: function(){
		$('body').on('ajax:success', '#new_response', responseView.renderResponse)
		$('.responselink a').on('ajax:success', responseView.renderResponseForm)
	}
}

var responseView = {
	renderResponseForm: function(e, data){
		var responseIdLink = $(this).attr("class")
		$('#' + responseIdLink).append(data)
		$('.responselink .' + responseIdLink).off('ajax:success', responseView.renderResponseForm)
		$(this).remove()
	},
	renderResponse: function(e,data){
		console.log(this)
		console.log(data)
		var responseAnswerId = $(this).attr("class")
		console.log(responseAnswerId)
		$('#' + responseAnswerId + ' .response_container').append(data)
	}
}



  responseController.bindEvents();

};


$(document).ready(ready);
$(document).on('page:load', ready);

