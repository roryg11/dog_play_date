$(document).ready(function(){
  $('.description').on('click', 'span', function(){
    var dogId = $(this).data('dog-id');
    var div = $(this).parent().find('div');
    div.fadeIn().toggleClass('inactive');
    if(div.hasClass('inactive')){
      $(this).text('more');
      div.fadeOut().toggleClass('inactive');
    }else{
      $(this).text('less');
      }
  });
});
