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
			
				<canvas id="myChart"></canvas>
			</div>
		</div>
	</div>
	<script src="./jquery-3.7.1.min.js"></script>
	<script>
	
	$.ajax({
	    url: 'IngreAllDayPriceChart', // 서블릿의 URL
	    dataType: 'json', // 데이터 형식은 JSON
	    success: function(data) {
	        // 대형 카테고리에 해당하는 데이터 필터링
	        var largeData = data.filter(item => item.category === '대형');
	        var largeLabels = largeData.map(item => item.week);

	        // 전통 카테고리에 해당하는 데이터 필터링
	        var traditionalData = data.filter(item => item.category === '전통');
	        var traditionalLabels = traditionalData.map(item => item.week);

	        console.log(traditionalData);

	        // 대형마트 차트 생성
	        var ctx = document.getElementById('myChart').getContext('2d');
	        var myChart = new Chart(ctx, {
	            type: 'line',
	            data: {
	                labels: largeLabels, // 대형 카테고리의 레이블 사용
	                datasets: [{
	                        label: 'Price (대형마트)',
	                        data: largeData.map(item => item.price),
	                        borderColor: 'rgba(255, 99, 132, 0.5)',
	                        borderWidth: 2,
	                        fill: false
	                    },
	                    {
	                        label: 'Price (전통시장)',
	                        data: traditionalData.map(item => item.price),
	                        borderColor: 'rgba(54, 162, 235, 0.5)',
	                        borderWidth: 2,
	                        fill: false
	                    }

	                ]
	            },
	            options: {
	                scales: {
	                    y: {
	                        beginAtZero: false
	                    }
	                },
	                elements: {
	                    point: {
	                        radius: 0
	                    }
	                },
	                legend: {
	                    display: true,
	                    position: 'right',
	                }
	            }
	        });
	    },
	    error: function(xhr, status, error) {
	        console.error('Error fetching data:', error);
	    }
	});
	</script>


</body>


</html>