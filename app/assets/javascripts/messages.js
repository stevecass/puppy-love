$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})


	$('.message button[name="delete"]').click(function(event){
	  event.preventDefault();
	  var response = confirm("Are you sure you want to delete this message?")
	  if (response){
	    messageId = $(this).attr('id');
	    $.ajax({
	      url: '/messages/'+messageId,
	      type: 'DELETE',
	      data: { id: messageId },
	      dataType: 'text'
	    }).done(function(response){
	      alert(response);
	      $('.message #' + messageId).parent().slideUp();
	    }).fail(function(response){
	      console.log('FAIL');
	    });
	  }
	})


	$('.message button[name="reply"]').click(function(event){
	  event.preventDefault();
	  debugger
	  recipientId = $(this).attr('data-recepient');
	  name = $(this).parent().find('a').html();
	  $('input[name="message[recipient_id]"]').val(recipientId)
	  $('#recipient_name').html(name);
	  $('#overlay').css( "display", "inherit");
	  $('.messages .message_comp').css( "display", "inherit");
	})

	$('#overlay').click(function(event){
	  $('#overlay').css( "display", "none");
	  $('.messages .message_comp').css( "display", "none");
	})

})