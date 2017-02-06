$(document).ready(function () {
	//check login
	if(sessionStorage.getItem('userLoggedIn')){
		$('#notLoggedIn').hide();
        $('.leftContainer').show();
        $('.rightContainer').show();
	} else {
		$('#loggedIn').hide();
        $('.leftContainer').hide();
        $('.rightContainer').hide();
	}
});

function handleLogin () {
	sessionStorage.setItem('userLoggedIn', true);
	$('#notLoggedIn').hide();
	$('#loggedIn').show();
	$('#loginMail').val("");
	$('#loginPW').val("");
	$('#loginMail').css('border','1px solid black');
	$('#loginPW').css('border','1px solid black');
    $('.leftContainer').show();
    $('.rightContainer').show();
	location.reload();
};

function handleLogout () {
	// clear PHP session via ajax
	$.ajax({
		url: '/logout',
		method: 'GET',
		success: function (data) {
			console.log(data);
		},
		error: ajaxErrorLog
	});
	sessionStorage.removeItem('userLoggedIn');
	$('#notLoggedIn').show();
	$('#loggedIn').hide();
    $('.leftContainer').hide();
    $('.rightContainer').hide();
	location.reload();
};

function handleSearch () {

}

function ajaxErrorLog(jqXHR, textStatus, errorThrown) {
	console.log('### Error in AJAX Request ###');
	console.log('# jqXHR: ' + JSON.stringify(jqXHR));
	console.log('# status: ' + textStatus);
	console.log('# error thrown: ' + errorThrown);
	console.log('#############################');
}
