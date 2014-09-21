
$(document).ready(function(){
	$('#signup').bind("ajax:success", function(e, data, status, xhr){
		$('.signup').toggle("blind");
	});

	$('#login').bind("ajax:success", function(e, data, status, xhr){
		$('.login').toggle("blind");
	});

});