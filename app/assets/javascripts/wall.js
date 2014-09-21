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

  $('.comments button').click(function(event){
    event.preventDefault();
    commentId = $(this).parent().data().id;
    $('#reply[data-id="' + commentId + '"').slideDown();
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

})