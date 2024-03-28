$(document).ready(function() {
	checkFavorites();
	$('#favoritebtn').click(function() {
		addToFavorites();
	});
});


function checkFavorites() {
	$.ajax({
		type: "POST",
		url: "CheckFavorites",
		data: {
			user_id: '<%= session.getAttribute("user_id")%>',
			lbox_seq : '<%= session.getAttribute("lbox_seq")%>'
		},
		success: function(data) {
			if(data=="existFavorite"){
        		$("#favoritebtn").text('즐겨찾기 삭제');
        	}else{
        		$("#favoritebtn").text('즐겨찾기 추가');
        	}
		},
		error: function() {
			console.log('오류가 발생했습니다.');
		}
	});
}

function addToFavorites() {
	$.ajax({
		type: "POST",
		url: "AddFavorite",
		data: {
			user_id: '<%= session.getAttribute("user_id")%>',
			lbox_seq : '<%= session.getAttribute("lbox_seq")%>'
		},
		success: function(data) {
			if(data=="loginFirst"){
        		alert("로그인을 해주세요.");
        	}else if(data=="add"){
        		alert("즐겨찾기에 추가되었습니다.")
        		checkFavorites();
        	}else if(data=="delete"){
        		alert("즐겨찾기가 해제되었습니다.")
        		checkFavorites();
        	}
		},
		error: function() {
			console.log('오류가 발생했습니다.');
		}
	});
}
