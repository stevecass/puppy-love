$(document).ready(function(){
  var commentId;

  $('form#newcomments').submit(function(event){
    event.preventDefault();
    $.ajax({
      url: '/comments/',
      type: 'POST',
      data: $(this).serialize(),
      dataType: 'html'
    }).done(function(response){
      $('.comments').prepend('<li id="level1">'+response+'</li>')
    }).fail(function(response){
      console.log('FAIL');
    });
  })

  $('.comments button[name="reply"]').click(function(event){
    event.preventDefault();
    commentId = $(this).parent().data().id;
    $('#reply[data-id="' + commentId + '"').slideDown();
  })

  $('.comments button[name="delete"]').click(function(event){
    event.preventDefault();
    var response = confirm("Are you sure you want to delete this comment?")
    if (response){
      commentId = $(this).parent().data().delete;
      $.ajax({
        url: '/comments/'+commentId,
        type: 'DELETE',
        data: $(this).serialize(),
        dataType: 'text'
      }).done(function(response){
        alert(response);
        $('.comments li[data-delete="' + commentId + '"').slideUp();
      }).fail(function(response){
        console.log('FAIL');
      });
    }
  })

  $('form#newreplies').submit(function(event){
    event.preventDefault();
    $.ajax({
      url: '/comments/',
      type: 'POST',
      data: $(this).serialize(),
      dataType: 'html'
    }).done(function(response){
      $('form#newreplies').slideUp()
      $('#reply[data-id="' + commentId + '"').append('<li id="level2">'+response+'</li>')
    }).fail(function(response){
      console.log('FAIL');
    });
  })

  $('#dog-details button[name="message"]').click(function(event){
    event.preventDefault();
    console.log('Hello!')
    $('#overlay').css( "display", "inherit");
    $('#profile .message_comp').css( "display", "inherit");
  })

  $('#overlay').click(function(event){
    $('#overlay').css( "display", "none");
    $('#profile .message_comp').css( "display", "none");
  })

})