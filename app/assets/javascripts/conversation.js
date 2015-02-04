$(document).ready(function(){
  $('.submit').on ('click', function(){
    var user1_id='Dana';
    var user2_id='Rory';
    var content = $('textarea').val();
    $.ajax('/comments', {type: 'post',
    data: {
      comment:{
        user1_id: user1_id,
        user2_id: user2_id,
        content: content,
      }
    }
  }).done(function(comment){
    var newComment = '\
    <div class="comment">\
    <a class="avatar">\
    <img src="/assets/' + comment.user1_id + '.jpg">\
    </a>\
    <div class="content">\
    <a class="author">' + comment.user1_id + '</a>\
    <div class="metadata">\
    <span class="date"> ' + comment.created_at + '</span>\
    </div>\
    <div class="text">\
    ' + comment.content + '\
    </div>\
    </div>\
    </div>';
    $('#container').append(newComment);
  });
});

});
