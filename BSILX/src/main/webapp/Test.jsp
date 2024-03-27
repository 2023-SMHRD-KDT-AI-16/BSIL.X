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
	
	$(document).ready(function(){
		$.ajax({
			type : 'GET',
			url : 'Test',
			dataType : 'json',
			success : function(response){
				var data = response;
				console.log(data)
				
				const name = data.map(function(index){
					return index.name;
				})
				console.log(name);
				
				const price = data.map(function(index){
					return index.price;
				});
				console.log(price);
				
				const labelsweek = data.map(function(index){
					return index.week;
				});
				console.log(labelsweek);
				
				var ctx = document.getElementById('myChart').getContext('2d');
				
				const Data = {
						labels : labelsweek,
						datasets : [{
							label : name,
							data : price,
							backgroundColor : [getRandomColor(),getRandomColor()],
						borderWidth : 2,
						fill : false
						}]
				};
				
				var myChart = new Chart(ctx,{
					type : 'line',
					data : Data,
					options : {
						scale : {
							y:{
								beginAtZero : false
							}
						},
						elements :{
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
			error : function(xhr, status, error){
				console.error('Error fetching JSON data:', error);
			}
		})
	})
	
	function getRandomColor() {
    return '#' + Math.floor(Math.random() * 16777215).toString(16);
}

    
    
    
    
    
    
    
function getRandomColor() {
    return '#' + Math.floor(Math.random()*16777215).toString(16);
}


	</script>


</body>


</html>