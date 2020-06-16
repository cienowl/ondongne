$(document).ready(function(){

	function save(isLiked, callback) {
		// Pretend this is an AJAX call.
		return Promise.delay(!isLiked, 100);
	}
	
	$('.js-like-button').on('click', function(evt) {
		evt.preventDefault();
		var $btn = $(this);
		var liked = ($btn.text().match('Unlike') === null);
		save(liked).then(function(isLiked) {
			if (liked) {
				$btn.html('☹&nbsp; Unlike');
			} else {
				$btn.html('♥︎&nbsp; Like');
			}
		});
	});

});
