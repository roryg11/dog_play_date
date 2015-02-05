$(document).ready(function(){
  $('#reply').on ('click', function(){
    var sender_id= $(this).data('id');
    var body = $('textarea').val();
    var conversation_id = $('h3')[0].id;
    var url = '/conversations/'+ conversation_id + '/messages';
    $.ajax(url, {type: 'post',
    data: {
      message:{
        user_id: sender_id,
        body: body,
        conversation_id: conversation_id,
      }
    }
  }).done(function(comment){
    //console.log(comment);
    $('textarea').val('');
    var image = $('#current_user')[0].src;
    var userName = $('#user_name').data('id');
    var newComment = '\
      <div class="comment">\
      <a class="avatar">\
        <img src=' + image + '>\
      </a>\
      <div class="content">\
      <a class="author">' + userName + '</a>\
      <div class="metadata">\
      <span class="date"> ' + comment.created_at + '</span>\
      </div>\
      <div class="text">\
      ' + comment.body + '\
      </div>\
      </div>\
      </div>';
    $('#container').append(newComment);
  });
});
});
