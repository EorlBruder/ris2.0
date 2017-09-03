$(function () {
	$('#recipeAddFavo').off('click').on('click', function () {
		$.ajax({
			url: '/rezeptfavo',
			method: 'POST',
			data: { recipeid: +location.href.substr(location.href.lastIndexOf('/')+1) },
			success: function(data) {
				alert('success');
			},
			error: ajaxErrorLog
		});
	});
});