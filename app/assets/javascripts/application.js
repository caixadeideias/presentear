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
	
});