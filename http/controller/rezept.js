$(function () {
	var ajaxRequest = function (target) {
		$.ajax({
			url: '/' + target,
			method: 'POST',
			data: { recipeid: +location.href.substr(location.href.lastIndexOf('/')+1) },
			success: function(data) {
				location.reload();
			},
			error: ajaxErrorLog
		});
	}

	$('#recipeAddFavo').off('click').on('click', function () {
		ajaxRequest('rezeptfavo');
	});

	$('#recipeDelFavo').off('click').on('click', function () {
		ajaxRequest('rezeptunfavo');
	});

});