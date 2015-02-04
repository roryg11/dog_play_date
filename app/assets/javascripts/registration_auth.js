// Sign-Up

$(document).ready(function(){
  $('.submit').on('click', function(){
  var userName = $('#new-user-name').val();
  var userEmail = $('#new-email').val();
  var userAge = $('#new-age').val();
  var userBio = $('#new-bio').val();
  var userZipcode = $('#new-zipcode').val();
  var userPassword = $('input[type="password"]').val();
  var userPasswordConfirmation = $('input[type="password"]').val();
    $.ajax({
      url: '/sign-up',
      type: 'post',
      data: {
        user: {
          name: userName,
          email: userEmail,
          age: userAge,
          bio: userBio,
          zipcode: userZipcode,
          password: userPassword,
          passwordConfirmation: userPasswordConfirmation
        }
      }
    }).done(function(){
      console.log("AFTER AJAX");
      // generate form for picture
      $('#new-form').empty();
      var el = '<h4>Upload a Profile Picture</h4><div class = "field"><%= f.file_field :avatar %></div><%= f.submit "Submit" %><% end %>'
      $('#new-form').append(el);
    }).fail(function(){
      console.log("It didn't go through");
    });
  })

  $('#sign-in-submit').on('click', function(){
    var userEmail = $('#email-sign-in').val();
  });
});
