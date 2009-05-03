// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Locales = {
	select_all: function(event) {
		$('input[type=checkbox]').each(function() {
			this.checked = true;
			$('.' + this.value).show();
		});
		return false;
	},
	select_none: function(event) {
		$('input[type=checkbox]').each(function() {
			this.checked = false;
			$('.' + this.value).hide();
		});
		return false;
	},
	toggle: function(event) {
		this.checked ? $('.' + this.value).show() : $('.' + this.value).hide();
	}
}

$(document).ready(function() {
	$('#select_all').click(Locales.select_all);
	$('#select_none').click(Locales.select_none);
	$('input[type=checkbox]').click(Locales.toggle);
});