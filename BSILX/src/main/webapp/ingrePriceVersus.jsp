<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	fetch('IngrePriceChart') // 서블릿의 URL로 변경
    .then(response => response.json()) // JSON 형식으로 파싱
    .then(data => {
        // 대형 카테고리에 해당하는 데이터 필터링
        var largeData = data.filter(item => item.category === '대형');
        var largeLabels = largeData.map(item => item.day);
        var largePrices = largeData.map(item => item.price);

        // 전통 카테고리에 해당하는 데이터 필터링
        var traditionalData = data.filter(item => item.category === '전통');
        var traditionalLabels = traditionalData.map(item => item.day);
        var traditionalPrices = traditionalData.map(item => item.price);

        // 차트 생성
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: largeLabels, // 대형 카테고리의 레이블 사용
                datasets: [{
                    label: 'Price (Large)',
                    data: largePrices, // 대형 카테고리의 가격 데이터
                    backgroundColor: 'rgba(255, 99, 132, 0.5)', // 대형 카테고리 색상 설정
                    borderWidth: 1
                }, {
                    label: 'Price (Traditional)',
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