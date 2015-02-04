$(document).ready(function(){
  $('.description').on('click', 'span', function(){
    var description = $('.description');
    var dogId = $(this).data('data-dog-id');
    console.log(dogId);
  });
});
