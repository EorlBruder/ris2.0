$(document).ready(function (){
    if($('#recipecount').length > 0){
        console.log("should only be shown if in recipe search");
        var list = document.getElementById('recipecount');
        var test = list.getElementsByTagName("tr").length;
        $('#recipecount tr:nth-child(1n+3)').hide();
        var pages = Math.ceil(test/recipeperpage);
        switch(pages) {
        	case 1:
        		$('#pagedisplay').css('visibility','hidden');
        		break;
        	case 2:
        		$('#pagedisplay').show();
        		$('#pagedisplay').css('visibility','visible');
        		break;
        	default:
        		$('#pagedisplay').css('visibility','visible');
        		for(var i=3;pages > 2;i++) {
        			$('#pagedisplay li:last').before( $('<li><a href="#">' + i + '</li>') );
        			pages--;
        		}		
        }
        var listpages = $('#pagedisplay li');
        $.each(listpages, function(index, value){
        	//$( 'li' ).addClass( 'selected' );
        	$(value).on('click', function(){
        		console.log(test);
        		if ($(value).hasClass('selected')){
        		} 
        		else {
        			switch(index){
        			case 0: break;
        			case (listpages.length-1): break;
        			default: 
        				var x = recipeperpage*(index-1)+1;
        				var y = (x+recipeperpage);
        				$('.selected').removeClass('selected');
        				$(value).addClass('.selected');
        				$('#recipecount tr').hide();
        				console.log($('#recipecount tr:nth-child(1n +'+x +')'));
        				console.log($('#recipecount tr:nth-child(1n +'+y +')'));
        				$('#recipecount tr:nth-child(1n +'+x +')').show();
        				$('#recipecount tr:nth-child(1n +'+y +')').hide();
        				break;
        			}
        
        		} 
        	});
        });
    }
});