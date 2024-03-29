<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
</head>
<body>
	<div class="cotainer">
		<div class="row">
			<div class="col-md-6">
				<canvas id="myChart"></canvas>
			</div>
		</div>
	</div>

	<script>
	fetch('IngreOneDayPriceChart') 
    .then(response => response.json()) 
    .then(data => {
    	
        // 대형마트 카테고리에 해당하는 데이터 필터링
        var largeData = data.filter(item => item.category === '대형');
        var largeLabels = largeData.map(item => item.name);
        var largePrices = largeData.map(item => item.price);

        // 전통시장 카테고리에 해당하는 데이터 필터링
        var traditionalData = data.filter(item => item.category === '전통');
        var traditionalLabels = traditionalData.map(item => item.name);
        var traditionalPrices = traditionalData.map(item => item.price);

        // 차트 생성
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: largeLabels, // 대형 카테고리의 레이블 사용
                datasets: [{
                    label: '대형마트',
                    data: largePrices, // 대형 카테고리의 가격 데이터
                    backgroundColor: 'rgba(255, 99, 132, 0.5)', // 대형 카테고리 색상 설정
                    borderWidth: 1
                }, {
                    label: '전통시장',
                    data: traditionalPrices, // 전통 카테고리의 가격 데이터
                    backgroundColor: 'rgba(54, 162, 235, 0.5)', // 전통 카테고리 색상 설정
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    })
    .catch(error => {
        console.error('Error fetching data:', error);
    });
	</script>

</body>
</html>