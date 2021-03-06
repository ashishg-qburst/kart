var ready;
ready = function() {
  $('#search-box').keyup(function () {
    $.ajax({
      type: "GET",
      url: '/search',
      data: {
        "query": $('#search-box').val()
      },
      dataType: "JSON",
      success: function(json) {
        console.log(json.products);
        
        if($('#search-results').length == 0){
          $('.search-products-form').append('<div id="search-results"></div>');
        }

        $('#search-results').empty();
        
        $.each(json.categories, function(key, value){
          str = "<a href=\"/categories/" + value.id + "\">" + value.name + "</a>"
          $('#search-results').append($("<div class='cat-item'>").html(str))
        });

        $.each(json.products, function (key, value){
          str = "<a href=\"/products/" + value.id + "\">" + value.name + ", " + value.brand + "</a>"
          $('#search-results').append($("<div class='prod-item'>").html(str));
        });
      }
    });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);

$(document).click(function(e){
 var $box = $('#search-results');
 if(e.target.id !== 'search-results' && !$.contains($box[0], e.target))
    $box.remove();
});