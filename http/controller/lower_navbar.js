$(document).ready(function(){
    $('#searchbar')[0].placeholder = $('#selectedSearchKind')[0].value;
    $('#selectedSearchKind').on('change', '', function (e) {
        $('#searchbar')[0].placeholder = $('#selectedSearchKind')[0].value;
    });
    $('#searchSomething').on('click', function(){
        var name = $('#searchbar').val();
        var selectedKind = $('#selectedSearchKind')[0];
        if(selectedKind.value == selectedKind[0].value){
            self.location='/recipe_search_results/' + name;
        } else {
            self.location='/ingredient_search_results/' + name;
        }
        
    });
    $('#createRecipe').on('click', function(){
        self.location='/rezepterstellen';
    });
    $('#createIngredient').on('click', function(){
        self.location='/zutatenerstellen';
    });
    $('#search-form').on('submit', function(event) {
        event.preventDefault();
    })
});