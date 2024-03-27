<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<canvas id="cpiChart"></canvas>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
	<script src="./jquery-3.7.1.min.js"></script>

    <script>
    	var ctx = document.getElementById('cpiChart').getContext('2d');
    	var cpiChart = new Chart (ctx, {
    		type : 'bar',
    		data : {
    			labels : ['23.02', '23.03', '23.04', '23.05', '23.06', '23.07', '23.08', '23.09', '23.10', '23.11', '23.12', '24.01', '24.02'],
    			datasets : [{
    				label : '소비자 물가 동향',
    				data : ['110.33', '110.52', '110.77', '111.13', '111.16', '111.29', '112.28', '112.83', '113.26', '112.67', '112.71', '113.15', '113.77'],
    				backgroundColor : 'rgba(54, 162, 235, 0.5)',
    				borderWidth: 1
    				}]
    			},
    			options : {
    				scales : {
    					y : {
    						beginAtZero : false
    					}
    				}
    			}
    				
    			})
    		
    </script>
	



</body>
</html>