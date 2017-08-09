$(document).ready(function(){
	$('#loginForm').submit(function(event) {
		event.preventDefault();
		var formData = $('#loginForm').serialize();
		$.ajax({
			url: '/login',
			method: 'POST',
			data: formData,
			success: function(data) {
				if(data) {
					handleLogin();
				} else {
						$('#loginMail').css('border','2px solid red');
						$('#loginPW').css('border','2px solid red');
						$('#loginMail').on('focus', function () {
							$('#loginMail').css('border','1px solid black');
							$('#loginPW').css('border','1px solid black');
						});
						$('#loginPW').on('focus', function () {
							$('#loginMail').css('border','1px solid black');
							$('#loginPW').css('border','1px solid black');
						});
				}
			},
			error: ajaxErrorLog
		});

		return false;
	});
});