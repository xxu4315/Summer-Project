$(function(){
	$('#btnSignIn').click(function(){
		alert("test javascript");
		$.ajax({
			url: '/validateLogin',
			data: $('form').serialize(),
			type: 'POST',
			success: function(response){
				console.log(response);
			},
			error: function(error){
				console.log(error);
			}
		});
	});
});
