/*
* jQuery Emulate Placeholder Plugin
* ---
* Copyright 2011, Nicholas Pufal (http://nicholaspufal.com/)
* Released under the MIT license.
*/

(function($) {
	
   $.fn.emulatePlaceholder = function() {  			
			return this.each(function() {    

				//Prevent form from considerating the placeholder as a valid value
				$(this).submit(function() {		
					$("input[data-placeholder]").each(function() {						
						if ($(this).val() == $(this).attr("data-placeholder"))
							$(this).val("")
					})
				})
				
				$("input[data-placeholder]", $(this)).each(function() {
					
					//Set data-placeholder as the default value
					if ($(this).val() === "")
						$(this).val($(this).attr("data-placeholder"));
					
					//Emulate placeholder focus/blur behavior		
					$(this).focus(function() {
										if ($(this).val() === $(this).attr("data-placeholder"))
											$(this).val("");
									})
									.blur(function() {
										if ($(this).val() === "")
											$(this).val($(this).attr("data-placeholder"));
									})	
				})
			});		
   }
})(jQuery);