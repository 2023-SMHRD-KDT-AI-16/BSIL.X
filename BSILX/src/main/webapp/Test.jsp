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

				<canvas id="myChart"></canvas>
			</div>
		</div>
	</div>
	<script src="./jquery-3.7.1.min.js"></script>

	<script>
		$(document).ready(
				function() {
					$.ajax({
						type : 'GET',
						url : 'Test',
						dataType : 'json',
						success : function(response) {
							var data = response;
							console.log(data)

							var uniqueNames = {};
							var labels = [];
							for (var i = 0; i < data.length; i++) {
								var name = data[i].name;
								if (!(name in uniqueNames)) {
									labels.push(name);
									uniqueNames[name] = true;
								}
							}
							console.log(uniqueNames);

							var uniqueWeek = [];
							var labels1 = [];
							for (var i = 0; i < data.length; i++) {
							    var week = data[i].week;
							    if (!uniqueWeek.includes(week)) { // 중복되지 않는 값인 경우에만 추가
							        labels1.push(week);
							        uniqueWeek.push(week); // 중복 여부를 확인하기 위해 사용될 배열에도 추가
							    }
							}
							console.log(labels1);


							var ctx = document.getElementById('myChart')
									.getContext('2d');

							var datasets = [];
							for(var i=0; i<labels.length; i++){
								var name = labels[i];
								var Data = [];
								for(var j=0; j<data.length; j++){
									if(data[i].name === name){
										Data.push(data[j].price);
									}
								}
								datasets.push({
									label : name,
									data : Data,
									backgroundColor : getRandomColor(),
									borderWidth : 2
								});
							}
							
							
							
							
							var myChart = new Chart(ctx, {
								type : 'line',
								data : {
									labels : uniqueWeek,
									datasets : datasets
								},
								options : {
									scale : {
										x : {
											 type: 'category'
										},
										y : {
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
								}
							})
						},
						error : function(xhr, status, error) {
							console.error('Error fetching JSON data:', error);
						}
					})
				})

		function getRandomColor() {
			return '#' + Math.floor(Math.random() * 16777215).toString(16);
		}

	</script>


</body>


</html>