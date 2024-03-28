let bookmark = document.querySelector('#bookmarkbtn');

$(document).ready(function() {
	$('#bookmarkbtn').click(function() {
		addToFavorites();
	});
});


function addToFavorites() {
	$.ajax({
		type: "POST",
		url: "Bookmark",
		data: {
			user_id: '<%= session.getAttribute("userId") %>' ,
			lbox_seq : '<%= session.getAttribute("userId") %>'
		},
		success: function(response) {
			alert('즐겨찾기에 추가되었습니다.');
		},
		error: function() {
			alert('오류가 발생했습니다.');
		}
	});
}
