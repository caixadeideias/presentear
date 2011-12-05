// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require fancybox
//= require_tree .

$(document).ready(function() {
	
	$("a#add_suggestion").fancybox();
	
	$.datepicker.setDefaults( $.datepicker.regional[ "pt-BR" ] );
	
	//dateFormat: 'dd/mm/yyyy'
	$(".datepicker").datepicker({ minDate: 0, maxDate: "+10M" });
	
	$('input[placeholder], textarea[placeholder]').placeholder();
	
	//Tooltip
	$("input#event_input")
		.focus(function() { 
			$("span#event_helper").fadeIn();
		})
		.blur(function() { 
			$("span#event_helper").fadeOut();
		})	
		
	//Simulate placeholder behavior -> Was buggy to set text-align:center to a placeholder in Safari...
	
	//Prevent form from considerating the placeholder as a valid value
	$("form#new_event").submit(function() {
		$("input[data-placeholder]").each(function() {
			if ($(this).val() == $(this).attr("data-placeholder")) 
				$(this).val("")
		})
	})
	
	//Set data-placeholder as the default value
	$("input[data-placeholder]").each(function() {
		$(this).val($(this).attr("data-placeholder"));
	})
	
	//Handle placeholder in/out
	$("input[data-placeholder]")
		.focus(function() {
			if ($(this).val() === $(this).attr("data-placeholder"))
				$(this).val("");
		})
		.blur(function() {
			if ($(this).val() === "")
				$(this).val($(this).attr("data-placeholder"));
		})
	
});