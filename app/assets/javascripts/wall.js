$(document).ready(function(){
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
})