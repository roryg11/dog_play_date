$(document).ready(function(){
  $('.description').on('click', 'span', function(){
    console.log("YOU CLICKED")
    var dogId = $(this).data('dog-id');
    var div = $(this).parent().find('div');
    div.fadeIn().toggleClass('inactive');
    if(div.hasClass('inactive')){
      $(this).text('more');
      div.fadeOut().toggleClass('inactive');
    }else{
      $(this).text('less');
      };
  });

  $('.card').on('click', 'div.header', function(){
    console.log("YOU CLICKED A DOG!");
    var dogId = $(this).data('dog-id');
    var imagePath = $(this).find('img').attr('src');
    console.log(imagePath);
    var url = '/dogs/' + dogId
    $.ajax(url, {type: 'get'}).done(function(data){

      var dogModal = '<div class="ui modal">\
      <i class="close icon"></i>\
      <div class="header">' +data["name"]+'</div>\
      <div class="content">\
      <div class="ui medium circular image">\
      <img src ="'+imagePath+'">\
      </div>\
      <div class="description"><h3>A Little Bit About Me</h3>\
      <p>'+data["bio"]+'</p>\
      <ul><li>Breed: '+data["breed"]+'</li><li>Gender: '+data["gender"]+'</li>\
      <li>Play Type: '+data["play"]+'</li><li>Personality Type: '+data["personality"]+'</li></ul>\
      </div>\
      </div>\
      <div class="actions">\
      <div class="ui button">OK</div>\
      </div>\
      </div>'
;
      $('body').append(dogModal);
      $('.ui.modal')
      .modal('show')
    });
  })
});
