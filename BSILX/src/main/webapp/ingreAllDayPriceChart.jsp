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

				<canvas id="myChart2"></canvas>
			</div>
		</div>
	</div>
	<script src="./jquery-3.7.1.min.js"></script>
	<script>
	
	
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
	</script>


</body>


</html>