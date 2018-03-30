<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script src="https://code.highcharts.com/js/highcharts.js"></script>
<script src="https://code.highcharts.com/js/modules/exporting.js"></script>


<style>
@import 'https://code.highcharts.com/css/highcharts.css';

#container {
	height: 400px;
	max-width: 1000px;
	margin: 0 auto;
}

/* Link the series colors to axis colors */
.highcharts-color-0 {
	fill: #ec79cb;
	stroke: #ec79cb;
}
.highcharts-axis.highcharts-color-0 .highcharts-axis-line {
	stroke: #ec79cb;
}
.highcharts-axis.highcharts-color-0 text {
	fill: #ec79cb;
}
.highcharts-color-1 {
	fill: #e6ec7a;
	stroke: #e6ec7a;
}
.highcharts-axis.highcharts-color-1 .highcharts-axis-line {
	stroke: #e6ec7a;
}

</style>
<script type="text/javascript">
var chart;
$(document).ready(function(){
	
	$.ajaxSetup({
		async: false
	});
	
	var url="<%=cp%>/assetManage/carbookChart";
	$.getJSON(url, function (tt) {
		chart = new Highcharts.Chart({
			  chart: {
			        renderTo: 'chart',
			        type: 'column',
			        options3d: {
			            enabled: true,
			            alpha: 15,
			            beta: 15,
			            depth: 50,
			            viewDistance: 25
			        }
			    },
			xAxis: {
				labels:{
					enabled: true,
					formatter: function() { return tt[0].data[this.value][0].split(' ')[0];}
				}
			},
	        title: {
	            text: 'Daily Distance'
	        },
	        subtitle: {
	            text: 'km'
	        },
	        plotOptions: {

	            
				column : {
						dataLabels : {
							enabled : true
						},
						enableMouseTracking : true,
						depth : 40
					}
				},
				series : tt
			});

		});
	});

	$(function() {
		var url = "<%=cp%>/assetManage/carOiling";
	$.getJSON(url, function (csv) {
		Highcharts.chart('container', {

		    chart: {
		        type: 'column'
		    },
		    xAxis: {
				labels:{
					enabled: true,
					formatter: function() { return csv[0].data1[this.value][0].split(' ')[0];}
				}
			},
		    title: {
		        text: 'Daily Oiling Amount'
		    },
		    yAxis: [{
		        className: 'highcharts-color-0',
		        title: {
		            text: '주유량(ℓ)'
		        }
		    }, {
		        className: 'highcharts-color-1',
		        opposite: true,
		        title: {
		            text: '주유금액(원)'
		        }
		    }],

		    plotOptions: {
		        column: {
			        	dataLabels : {
							enabled : true
						},
						enableMouseTracking : true,
						borderRadius: 10
					}
		    },
		    series: [{
		    	name:'주유량(ℓ)',
		    	data:csv[0].data1
		    },{
		    	name:'주유금액(원)',
		    	data:csv[0].data2,
		    	yAxis:1
		    }]
		});
	});
});
</script>
<div class="content">
<h1>차계부관리</h1>
<div id="chart" style="min-width: 300px; height: 400px; margin: 0 auto" ></div>
<div id="container" ></div>
</div>
