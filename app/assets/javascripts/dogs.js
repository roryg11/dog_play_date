$(document).ready(function(){
  $('.description').on('click', 'span', function(){
    var dogId = $(this).data('dog-id');
    var div = $(this).parent().find('div');
    div.toggleClass('inactive');
    if(div.hasClass('inactive')){
      $(this).text('more');
    }else{$(this).text('less')};
  });
});
