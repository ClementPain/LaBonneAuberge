$(document).on('turbolinks:load', function() {

    var $ul = $('#villagers');
    var $lis = $ul.find('li');
  
    $('#search').on('keyup', function() {
      var input = this;
      $lis.each(function() {
        var searchString = $(input).val().toLowerCase();
        var textToMatch = $(this).data('searchstring').toLowerCase();
  
        if(textToMatch.match(searchString)) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    });
  });
  
