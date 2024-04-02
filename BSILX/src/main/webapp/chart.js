/*
$(function(){
    let ctx = document.getElementById('myChart').getContext('2d');
    var ctx2 = document.getElementById('myChart2').getContext('2d');
    var lboxName = "<%=lboxName%>";
    
    
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
					responsive: false,
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
          
          $.ajax({
		url : 'Test',
		type : 'GET',
		data: {
                lbox_name: lboxName // 서버로 전송할 데이터
            },
		dataType : 'json',
		success : function(data){
			console.log("ajax 호출 성공!")
			
			
			var uniqueWeek = [];
			var labels = [];
			for (var i = 0; i < data.length; i++) {
			    var week = data[i].week;
			    if (!uniqueWeek.includes(week)) { // 중복되지 않는 값인 경우에만 추가
			        labels.push(week);
			        uniqueWeek.push(week); // 중복 여부를 확인하기 위해 사용될 배열에도 추가
			    }
			}
			console.log(uniqueWeek);
			
			var uniqueNames = {};
			var labels = [];
			for (var i = 0; i < data.length; i++) {
			    var name = data[i].name;
			    // 이름이 '참깨'나 '소금'이 아닌 경우에만 배열에 추가합니다.
			    if (name !== '참깨' && name !== '소금' && !(name in uniqueNames)) {
			        labels.push(name);
			        uniqueNames[name] = true;
			    }
			}
			console.log(uniqueNames);
			
			
			var dataset = [];
			 for(var i = 0; i < labels.length; i++){
				 var filterData = data.filter(item => item.name === labels[i]);
				 var color = getRandomColor();
				 if(filterData.length >= 5){
				 	dataset.push({
					label : labels[i],
				 	data : filterData.map(item => item.price),
				 	backgroundColor : color,
				 	borderColor : color,
					borderWidth : 2
				 });
				 }
			 }
			
			 console.log(dataset)
			 
			var lineChartData = {
					labels : uniqueWeek,
					datasets : dataset
			};
			console.log(lineChartData)
			
			var lineChartOptions = {
					scale : {
						y :{
							beginAtZero : false
						}
					},
					elements : {
						point : {
							radius : 0
						}
					},
					legend : {
						display : true,
						position : 'right'
					}
			};
			
			new Chart(ctx2, {
				type : 'line',
				data : lineChartData,
				options : lineChartOptions
			});
			
		},
		error : function(xhr, status, error) {
			console.error('Error fetching JSON data:', error);
		}
	})
	
	
	
	
	
	
	
	  
            
            
            
            
            
            
        },
        error: function(xhr, status, error) {
            console.error("Error: " + error);
        }
    });
});


$(function(){
		var ctx2 = document.getElementById('myChart2').getContext('2d');
	$.ajax({
		url : 'Test',
		type : 'GET',
		dataType : 'json',
		success : function(data){
			console.log("ajax 호출 성공!")
			
			
			var uniqueWeek = [];
			var labels = [];
			for (var i = 0; i < data.length; i++) {
			    var week = data[i].week;
			    if (!uniqueWeek.includes(week)) { // 중복되지 않는 값인 경우에만 추가
			        labels.push(week);
			        uniqueWeek.push(week); // 중복 여부를 확인하기 위해 사용될 배열에도 추가
			    }
			}
			console.log(uniqueWeek);
			
			var uniqueNames = {};
			var labels = [];
			for (var i = 0; i < data.length; i++) {
			    var name = data[i].name;
			    // 이름이 '참깨'나 '소금'이 아닌 경우에만 배열에 추가합니다.
			    if (name !== '참깨' && name !== '소금' && !(name in uniqueNames)) {
			        labels.push(name);
			        uniqueNames[name] = true;
			    }
			}
			console.log(uniqueNames);
			
			
			var dataset = [];
			 for(var i = 0; i < labels.length; i++){
				 var filterData = data.filter(item => item.name === labels[i]);
				 var color = getRandomColor();
				 if(filterData.length >= 5){
				 	dataset.push({
					label : labels[i],
				 	data : filterData.map(item => item.price),
				 	backgroundColor : color,
				 	borderColor : color,
					borderWidth : 2
				 });
				 }
			 }
			
			 console.log(dataset)
			 
			var lineChartData = {
					labels : uniqueWeek,
					datasets : dataset
			};
			console.log(lineChartData)
			
			var lineChartOptions = {
					scale : {
						y :{
							beginAtZero : false
						}
					},
					elements : {
						point : {
							radius : 0
						}
					},
					legend : {
						display : true,
						position : 'right'
					}
			};
			
			new Chart(ctx2, {
				type : 'line',
				data : lineChartData,
				options : lineChartOptions
			});
			
		},
		error : function(xhr, status, error) {
			console.error('Error fetching JSON data:', error);
		}
	})
	});
	
	function getRandomColor() {
			return '#' + Math.floor(Math.random() * 16777215).toString(16);
		}
		
		
		
*/