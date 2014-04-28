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
//= require_tree .

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
	injectScriptToMenuItems();
});