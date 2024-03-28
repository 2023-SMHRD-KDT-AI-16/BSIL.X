let inputElm = document.querySelector('input[name=input]');
let table = document.querySelector('#search_img');
// 화이트 리스트 : 해당 문자만 태그로 추가 가능

// initialize Tagify



var tagify = new Tagify(inputElm, {
	enforceWhitelist: false, // 화이트리스트에서 허용된 태그만 사용
})


tagify.on('add', function() {
	//var tags = tagify.value.map(tag => tag.value).join(','); // 태그 배열을 문자열로 변환
	console.log("tagifyValue" + tagify.value); // 입력된 태그 정보 객체
	var tags = tagify.value.map(tag => tag.value);
	console.log("tags" + tags); // 입력된 태그 정보 객체

	$.ajax({
		type: "POST",
		url: "LboxPrint", // 'LboxPrint'는 서블릿의 URL 매핑을 가리킵니다.
		data: { ingre_name: tags.join(',') }, // 서블릿에 보낼 데이터
		dataType: "json", // 응답을 JSON 형식으로 받습니다.
		success: function(data) {
			// 성공적으로 데이터를 받으면 페이지에 렌더링
			console.log("data : " + data);
			renderRecipes(data);
		},
		error: function(xhr, status, error) {
			// 에러 처리
			console.error("Error: " + error);
		}
	});


})

tagify.on('remove', function(e) {
	//var tags = tagify.value.map(tag => tag.value).join(','); // 태그 배열을 문자열로 변환
	var tags = tagify.value.map(tag => tag.value);
	if (tags.length === 0) {
		clearData(); // 모든 태그가 제거되었을 때, 데이터를 지우는 함수 호출
	} else {
		$.ajax({
			type: "POST",
			url: "LboxPrint", // 'LboxPrint'는 서블릿의 URL 매핑을 가리킵니다.
			data: { ingre_name: tags.join(',') }, // 서블릿에 보낼 데이터
			dataType: "json", // 응답을 JSON 형식으로 받습니다.
			success: function(data) {
				// 성공적으로 데이터를 받으면 페이지에 렌더링
				console.log("Updated data based on remaining tags: ", data);
				renderRecipes(data); // 받은 데이터로 페이지 내용 업데이트
			},
			error: function(xhr, status, error) {

				// 에러 처리
				console.error("Error: " + error);
			}

		});
	}
})


// 만일 모든 태그 지우기 기능 버튼을 구현한다면
document.querySelector('버튼').addEventListener('click', tagify.removeAllTags.bind(tagify));
// tagify 전용 이벤트 리스터. 참조 : https://github.com/yairEO/tagify#events
tagify.on('add', onAddTag) // 태그가 추가되면
	.on('remove', onRemoveTag) // 태그가 제거되면
	.on('input', onInput) // 태그가 입력되고 있을 경우
	.on('invalid', onInvalidTag) // 허용되지 않는 태그일 경우
	.on('click', onTagClick) // 해시 태그 블럭을 클릭할 경우
	.on('focus', onTagifyFocusBlur) // 포커스 될 경우
	.on('blur', onTagifyFocusBlur) // 반대로 포커스를 잃을 경우

	.on('edit:start', onTagEdit) // 입력된 태그 수정을 할 경우

	.on('dropdown:hide dropdown:show', e => console.log(e.type)) // 드롭다운 메뉴가 사라질경우
	.on('dropdown:select', onDropdownSelect) // 드롭다운 메뉴에서 아이템을 선택할 경우


// tagify 전용 이벤트 리스너 제거 할떄
tagify.off('add', onAddTag);

function clearData() {
	var container = $('#search_img');
	container.empty(); // 컨테이너의 모든 내용을 비우기
}
function renderRecipes(recipes) {
	/*var container = $('#search_img');
	container.empty(); // 컨테이너를 비우고

	recipes.forEach(function(recipe) { // 각 레시피 정보를 동적으로 생성
		var html = '<div class="recipe">' +
			'<img src="' + recipe.lbox_img + '" alt="레시피 이미지">' +
			'<h3>' + recipe.lbox_name + '</h3>' +
			'<p>가격: ' + recipe.lbox_price + '</p>' +
			'</div>';
		container.append(html); // 생성된 HTML을 컨테이너에 추가
	});*/
	var container = $('#search_img');
	container.empty(); // 컨테이너를 비우고

	recipes.forEach(function(recipe, index) {
		// 폼을 동적으로 생성합니다.
		var formHtml = `<form id="recipeForm${index}" action="mainRecipePage.jsp" method="post" style="display:none;">
                            <input type="hidden" name="lbox_img" value="${recipe.lbox_img}">
                            <input type="hidden" name="lbox_name" value="${recipe.lbox_name}">
                            <input type="hidden" name="lbox_price" value="${recipe.lbox_price}">
                        </form>`;

		// 레시피 정보를 표시하는 HTML을 생성합니다.
		var recipeHtml = `<div class="recipe" onclick="submitRecipeForm(${index});">
                              <img src="${recipe.lbox_img}" alt="레시피 이미지">
                              <h3>${recipe.lbox_name}</h3>
                              <p>가격: ${recipe.lbox_price}</p>
                           </div>`;

		container.append(formHtml + recipeHtml); // 생성된 폼과 HTML을 컨테이너에 추가합니다.
	});







}
function submitRecipeForm(index) {
	document.getElementById(`recipeForm${index}`).submit();
}

// 이벤트 리스너 콜백 메소드
function onAddTag(e) {
	console.log("onAddTag: ", e.detail);
	console.log("original input value: ", inputElm.value)
}

// tag remvoed callback
function onRemoveTag(e) {
	console.log("onRemoveTag:", e.detail, "tagify instance value:", tagify.value)
}

function onTagEdit(e) {
	console.log("onTagEdit: ", e.detail);
}

// invalid tag added callback
function onInvalidTag(e) {
	console.log("onInvalidTag: ", e.detail);
}

// invalid tag added callback
function onTagClick(e) {
	console.log(e.detail);
	console.log("onTagClick: ", e.detail);
}

function onTagifyFocusBlur(e) {
	console.log(e.type, "event fired")
}

function onDropdownSelect(e) {
	console.log("onDropdownSelect: ", e.detail)
}

function onInput(e) {
	console.log("onInput: ", e.detail);

	tagify.loading(true) // 태그 입력하는데 우측에 loader 애니메이션 추가
	tagify.loading(false) // loader 애니메이션 제거

	tagify.dropdown.show(e.detail.value); // 드롭다운 메뉴 보여주기
	tagify.dropdown.hide(); // // 드롭다운 제거
}


