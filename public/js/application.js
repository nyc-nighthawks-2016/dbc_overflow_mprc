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


  // add answer

  $('#add-answer').submit(function(e){
    e.preventDefault();
    var target = e.target
    $.ajax({
      url:$(target).attr('action'),
      method:$(target).attr('method'),
      data:$(target).serialize()
    }).done(function(response){
      $('.answers').append(response);
    });
  });



  $('#add-question-comment').submit(function(e){
    e.preventDefault();
    var target=e.target
    $.ajax({
      url:$(target).attr('action'),
      method:$(target).attr('method')
    }).done(function(response){
      console.log(response)
      $('#add-question-comment-form').html(response);
    });
  });

  $('#add-question-comment-form').on('submit','#add-comment', function(e){
    e.preventDefault();
    // debugger
    var target = e.target
    $.ajax({
      url:$(target).attr('action'),
      method:$(target).attr('method'),
      data:$(target).serialize()
    }).done(function(response){
      $('.question-comments').append(response);
      $(target).hide();
    });
  });

});
