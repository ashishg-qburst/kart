var ready;
ready = function() {
  $('#main-img')
  .wrap('<span style="display:inline-block"></span>')
  .css('display', 'block')
  .parent()
  .zoom();

  $('.product-image-thumb > img').click(function(){
    url = $(this).attr('src');
    $('#main-img').fadeOut('slow', function() {
      par = $(this).parent();
      par.children('.zoomImg').remove();
      $(this).attr('src', url).parent().zoom();
    }).fadeIn('slow');
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);