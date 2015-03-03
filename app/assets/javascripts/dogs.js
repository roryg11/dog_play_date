$(document).ready(function(){
  $('.fluid').on('click', function(){
    var div = $(this).find('#more-info');
    var span = $(this).find('span');
    div.fadeIn().toggleClass('inactive');
    if(div.hasClass('inactive')){
      span.text('more');
      div.fadeOut().toggleClass('inactive');
    }else{
      span.text('less');
      }
  });

  $('.card').on('click', 'div.header', function(){
    var dogId = $(this).data('dog-id');
    var imagePath = $(this).find('img').attr('src');
    var url = '/dogs/' + dogId
    $.ajax(url, {type: 'get'}).done(function(data){

      var source = $('#dog-modal').html();
      var template = Handlebars.compile(source);

      var context = {
        name: data.name,
        image: imagePath,
        bio: data.bio,
        breed: data.breed,
        gender: data.gender,
        play: data.play,
        personality: data.personality
        }

        var html = template(context);

      $('body').append(html);
      $('.ui.modal')
      .modal('show')
    });
  });

  // $(window).scroll(function(){
  //   if($(window).scrollTop() >= $(document).height() - $(window).height()){
  //     $.ajax('/dogs', {type: 'get'}).done(function(dogs){
  //       var source = $('#added-dogs').html();
  //       var template = Handlebars.compile(source);
  //
  //       var dog = template(dogs[0]);
  //       $('#dog-table').append(dog);
  //     });
  //   }
  // });
});
