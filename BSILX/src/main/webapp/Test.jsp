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
				<
			</div>
		</div>
	</div>
	<script src="./jquery-3.7.1.min.js"></script>

	<script>
	fetch('Test') // 서블릿의 URL로 변경
    .then(response => response.json()) // JSON 형식으로 파싱
    .then(data => {
      
    	const ingre_name = [...new Set(data.map(item => item.name))];
    	
   		var ctx = document.getElementById('myChart').getContext('2d');
   		
   	 var myChart = new Chart(ctx,{
   		 type:'line',
   		 
   		 data:{
   			labels: data.map(item => item.week),
   			datasets: [{
   				ingre_name.forEach(ingre_name => {
   					
   		    		const Data = data.filter(item => item.name === ingre_name);

   		    		var dataSet = [{label: "", data:"", borderColor: getRandomColor()},{label:"" data:"", borderColor: getRandomColor()}]
   		       
   			       dataSet.forEach((item, i) => {
   			       		item['label'] = ingre_name
   			       		item['data'] = Data.map(item => item.price)
   			    label:
   			    data:
   			    borderColor: getRandomColor(),
   			    borderWidth: 2,
   				
   			}]
   		 }
   		
    	
	       })
	       
	      
	    	  
	       }) //ingre_name forEach문
    
   	 }) // my chart
    	
    	
    	
    	
    })
    
    
    
    
    
    
    
    
function getRandomColor() {
    return '#' + Math.floor(Math.random()*16777215).toString(16);
}


	</script>


</body>


</html>