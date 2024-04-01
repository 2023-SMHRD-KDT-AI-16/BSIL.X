
$(document).ready(function() {
    $.ajax({
        url: 'IngreOneDayPriceChart', // 서버 측 URL
        type: 'GET', // HTTP 메소드
        dataType: 'json', // 응답 데이터 타입
        success: function(data) {
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
        },
        error: function(xhr, status, error) {
  			console.error("Error: " + error);
}
    });
});