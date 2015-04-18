$(document).ready(function(){
	
	$("#loginpopup").bind("click", function() {
		$('#login').modal('toggle');
	});
	$('#signup-link').bind("click", function() {
		$('#login').modal('hide');
 		$('#signup').modal('toggle');
	 });
	$('#login-link').bind("click", function() {
	    $('#signup').modal('hide');
	    $('#login').modal('toggle');
	 });

    $('#register_form').submit(function() { 
	    $.ajax({ 
	        data: $(this).serialize(),
	        type: $(this).attr('method'),
	        url: $(this).attr('action'),
	        success: function(response) { // on success..
	            if(response.success == true){
	            	document.location.href = '/';
	           		return true;
	            }
	            else{
	            	for(var index in response.fields){
	            		$('#' + response.fields[index] + '_').html('')
	            		$('#' + response.fields[index] + '_div').removeClass('has-error')
	            	}
	            	for(var field in response.errors){
	            		$('#' + field + '_').append(' ('+ response.errors[field] + ')')
	            		$('#' + field + '_div').addClass('has-error')
	            	}/*
	           		$("#form_validation").html(response.errors.register_username)*/;
	        		return false;
	            }
	        },
	        error: function(response, error){
	        	return false;
	        }
	    });
	    return false;
	});
})
