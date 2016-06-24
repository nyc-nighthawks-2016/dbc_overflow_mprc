$(document).ready(function() {
  $('#login_button').click(function(e){
    e.preventDefault();
    $.ajax({
      url:"/users/login",
      type:"GET"
    }).done(function(response){
      $('#login').html(response);
    });
  });
  $('#submit_login').submit(function(e){
    e.preventDefault();
    $.ajax({
      url:"/users/login",
      type:"POST",
      data:$('#login_form').serialize()
    }).done(function(response){
      $('#login').html("");
      $('#layout').html(response);
    });
  });

  $('#add-answer').submit(function(e){
    e.preventDefault();
    var target = e.target
    $.ajax({
      url:$(target).attr('action'),
      method:$(target).attr('method'),
      data:$(target).serialize()
    }).done(function(response){
      $('.answer_container').html(response);
    });
  });

});
