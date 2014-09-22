$( document ).ready(function() {
	$('.view-profile').click(function(event){
		event.preventDefault();
		displayProfile(event.target);
	})

	$('#profile-overlay').click(function(event){
		$('#profile-overlay').css( "display", "none");
		$('.profile_modal').css( "display", "none");
	})

})


function displayProfile(button){
	var dogId = $(button).attr('data-dog-id');
	$('#profile-overlay').css( "display", "inherit");
	$('#profilemodal-' + dogId).css( "display", "inherit");
}