$(document).ready(function(){
	handleResizing();
	var pathname = window.location.pathname;
	if(pathname.indexOf("registrieren") > -1 ||
		pathname.indexOf("kontakt") > -1 ||
		pathname.indexOf("impressum") > -1){
		$('.leftContainer').hide();
		$('.rightContainer').hide();
	}

	$(window).resize(function(){
		handleResizing();
	});

	$('#toggleFavorites').on('click', function(){
		var favorites = $('#favorites');
		if(favorites.is(":visible")){
			favorites.hide();
		} else {
			favorites.show();
		}
	});

	$('#toggleKuehlschrank').on('click', function(){
		var kuehlschrank = $('#kuehlschrank');
		if(kuehlschrank.is(":visible")){
			kuehlschrank.hide();
		} else {
			kuehlschrank.show();
		}
	});

	$('[data-toggle="tooltip"]').tooltip(); 
});

function handleResizing(){
    if(sessionStorage.getItem('userLoggedIn')){
	   if($(window).width() < 750){
	   	$('#favorites').hide();
	   	$('#kuehlschrank').hide();
	   } else {
	   	$('.innerContainer').show();
	   }
    }
}

$(document).keypress(function(e) {
    if(e.which == 13) {
        console.log('You pressed enter!');
        var focused = document.activeElement;
        console.log(focused.id);
        switch(focused.id){
            case "searchbar":
            case "selectedSearchKind":
                $('#searchSomething').click();
                break;
            case "loginMail":
            case "loginPW":
                $('#loginForm').submit();
                break;
            default:
                break;
        };
    }
});