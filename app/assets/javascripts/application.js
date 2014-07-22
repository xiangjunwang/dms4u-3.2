// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr.js

var clearActiveTagFromMenuItem = function() {
	$($('body > .navbar .container .nav li.active')[0]).removeClass('active');
}

var injectScriptToMenuItems = function() {
	var menuItems = $('body > .navbar .container .nav li a');
	for (var i = 0; i < menuItems.length; i++) {
		$(menuItems[i]).bind('click', function(){
			if ($(this).hasClass('active'))
				return;

			clearActiveTagFromMenuItem();
			$(this).parent().addClass('active');
		});
	}
}

$(document).ready(function() {
	event.preventDefault();

	injectScriptToMenuItems();

	$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
	    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true})
	});

	$('input#from').datepicker({
		"format": "yyyy-mm-dd", 
		"weekStart": 1, 
		"autoclose": true}).on("changeDate", function(event) {
			event.preventDefault();

			if ( $(this).val() == "" || window.location.search == "?start_date=" + $(this).val() + "&end_date=" + $("input#to").val())
				return;

			window.location.assign(window.location.protocol + "//" + window.location.host + window.location.pathname + "?start_date=" + $(this).val() + "&end_date=" + $('input#to').val());
		});

	$('input#to').datepicker({
		"format": "yyyy-mm-dd", 
		"weekStart": 1, 
		"autoclose": true}).on("changeDate", function(event) {
			event.preventDefault();

			if ( $(this).val() == "" || window.location.search == "?start_date=" + $('input#from').val() + "&end_date=" + $(this).val() )
				return;

			window.location.assign(window.location.protocol + "//" + window.location.host + window.location.pathname + "?start_date=" + $('input#from').val() + "&end_date=" + $(this).val());
		});
    
    // $('input#from').change(function(event){
    // 	event.preventDefault();
    // 	event.stopPropagation();
    //     alert("From : " + $("input#from").val() + " and To : " + $("input#to").val());
    // });
});