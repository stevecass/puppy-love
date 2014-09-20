$( document ).ready(function() {
	$('#login').click(function(event){
		event.preventDefault()
		$.ajax({
      url: '/login/',
      type: 'GET',
      dataType: 'html'
    }).done(function(response){
      console.log(response);
    }).fail(function(response){
      console.log('FAIL');
    });
	})
});