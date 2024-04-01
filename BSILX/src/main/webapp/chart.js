/*$(function(){
    let ctx = document.getElementById('myChart').getContext('2d');
    console.log("들어왔냐??????");
    let chart = new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: chartOptions
    })
})

    $.ajax({
        url: 'IngreOneDayPriceChart', // 서버 측 URL
        type: 'GET', // HTTP 메소드
        dataType: 'json', // 응답 데이터 타입
        success: function(data) {
            // 대형마트 카테고리에 해당하는 데이터 필터링
            var largeData = data.filter(item => item.category === '대형');
            var largeLabels = largeData.map(item => item.name);
            var largePrices = largeData.map(item => item.price);
            
            console.log("largeLabels"+largeLabels);
            console.log("largePrices"+largePrices);



            // 전통시장 카테고리ㄴ에 해당하는 데이터 필터링
            var traditionalData = data.filter(item => item.category === '전통');
            var traditionalLabels = traditionalData.map(item => item.name);
            var traditionalPrices = traditionalData.map(item => item.price);
            
            console.log("traditionalLabels: ", traditionalLabels);
			console.log("traditionalPrices: ", traditionalPrices);
			
            // 차트 생성
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
*/


$(function(){
    let ctx = document.getElementById('myChart').getContext('2d');
    console.log("들어왔냐??????");
    
    // AJAX 호출을 이곳에 넣어서 페이지 로딩 시 바로 실행되게 합니다.
    $.ajax({
        url: 'IngreOneDayPriceChart', // 서버 측 URL
        type: 'GET', // HTTP 메소드
        dataType: 'json', // 응답 데이터 타입
        success: function(data) {
            console.log("AJAX 호출 성공, 데이터:", data);
            // 데이터 필터링 및 처리
            var largeData = data.filter(item => item.category === '대형');
            var traditionalData = data.filter(item => item.category === '전통');
            
            // 필터링된 데이터 로깅
            console.log("대형마트 데이터:", largeData);
            console.log("전통시장 데이터:", traditionalData);
            
            var chartData = {
                labels: largeData.map(item => item.name), // 대형 카테고리의 레이블 사용
                
                datasets: [{
                    label: '대형마트',
                    data: largeData.map(item => item.price), // 대형 카테고리의 가격 데이터
                    backgroundColor: 'rgba(255, 99, 132, 0.5)', // 대형 카테고리 색상 설정
                    borderWidth: 1
                }, {
                    label: '전통시장',
                    data: traditionalData.map(item => item.price), // 전통 카테고리의 가격 데이터
                    backgroundColor: 'rgba(54, 162, 235, 0.5)', // 전통 카테고리 색상 설정
                    borderWidth: 1
                }]
            };
            	console.log("largeData"+largeData);

            let chartOptions = {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            };

            // 차트 생성
           new Chart(ctx, {
                type: 'bar',
                data: chartData,
                options: chartOptions
            });
        },
        error: function(xhr, status, error) {
            console.error("Error: " + error);
        }
    });
});
