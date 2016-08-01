var ready;
ready = function() {

   $('#search-box').keyup(function () {
    $.ajax({
      type: "GET",
      url: '/products',
      data: {
        "search": $('#search-box').val()
      },
      dataType: "JSON",
      success: function(json) {
        console.log(json.products);
        $('#search-results').empty();
        $.each(json.categories, function(key, value){
          $('#search-results').append($("<p>").text(value.name))
        });

        $.each(json.products, function (key, value){
          $('#search-results').append($("<p>").text(value.name + ", " + value.brand));
        });
      }
    });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);