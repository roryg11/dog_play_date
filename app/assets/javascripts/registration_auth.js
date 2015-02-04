// Sign-Up

$(document).ready(function(){
  $('form').submit(function(event){
    event.preventDefault();
    var formData = new FormData(this);
    console.log(formData);
    $.ajax({
      url: '/sign-up',
      type: 'post',
      data: formData,
      cache: false,
      contentType: false,
      processData: false
    }).done(function(){
      console.log("User saved");
    });
  });

  $('#sign-in-submit').on('click', function(){
    var userEmail = $('#email-sign-in').val();
    var userPassword = $('#password-input').val();
    console.log(userEmail);
    console.log(userPassword);
    $.ajax({
      url: '/sign-in',
      data: {
        user: {
          email: userEmail,
          password: userPassword,
        }
      }
    }).done(function(data){
      console.log("SUCCESS");
    })
  });
});
