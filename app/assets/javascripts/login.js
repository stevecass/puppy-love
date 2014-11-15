$( document ).ready(function() {
	$('#login').click(function(event){
		event.preventDefault();
		displayLogin();
	})

	$('#signup').click(function(event){
		event.preventDefault();
		displaySignup();
	})	

	$('#overlay').click(function(event){
		$('#overlay').css( "display", "none");
		$('#loginmodal').css( "display", "none");
		$('#signupmodal').css( "display", "none");
		$('#loginerror').remove();
		$('#signuperror').remove();
	})

	if( $('#signuperror').length != 0 ){
		displaySignup();
	}

	if( $('#loginerror').length != 0 ){
		displayLogin();
	}
})

function displaySignup(){
	$('#overlay').css( "display", "inherit");
	$('#signupmodal').css( "display", "inherit");
}

function displayLogin(){
	$('#overlay').css( "display", "inherit");
	$('#loginmodal').css( "display", "inherit");

}
