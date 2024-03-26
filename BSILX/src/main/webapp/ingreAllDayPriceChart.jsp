<%@page import="com.bsilx.model.IngrePriceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>

<body>
	<div class="cotainer">
		<div class="row">
			<div class="col-md-6">

				<canvas id="myChart-깻잎"></canvas>
				<canvas id="myChart-참깨"></canvas>
				<canvas id="myChart-쌀"></canvas>
			</div>
		</div>
	</div>
	<script src="./jquery-3.7.1.min.js"></script>
	<script>
	fetch('Test') // 서블릿의 URL로 변경
    .then(response => response.json()) // JSON 형식으로 파싱
    .then(data => {
        createCharts(data);
    })
    .catch(error => {
        console.error('Error fetching data:', error);
    });

function createCharts(data) {
    // 과일 종류 추출
    const fruitNames = [...new Set(data.map(item => item.name))];

    // 과일 종류별로 그래프 생성
    fruitNames.forEach(fruitName => {
        const fruitData = data.filter(item => item.name === fruitName);
        createChart(fruitName, fruitData);
    });
}

function createChart(fruitName, fruitData) {
    // 그래프 생성 코드
    var ctx = document.getElementById('myChart-' + fruitName).getContext('2d');
    
    var c = JSON.parse(원하는 json) -> 배열로 바꿈
    var a=[{label: "", data:""},{label:"" data:""},{},{}]
    c.forEach((item, i) => {
    	item['lv'] = 넣고싶은값
    })
    for(){
    a.push({
        label: fruitName,
        data: fruitData.map(item => item.price), // 과일 데이터의 가격
        borderColor: getRandomColor(), // 랜덤 색상 사용
        borderWidth: 2,
        fill: false
    })}
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: fruitData.map(item => item.week), // 과일 데이터의 날짜를 라벨로 사용
            datasets: a
    
        },
        options: {
            scales: {
                y: {
                    beginAtZero: false
                }
            }
        }
    });
}

function getRandomColor() {
    return '#' + Math.floor(Math.random()*16777215).toString(16);
}


	</script>


</body>


</html>