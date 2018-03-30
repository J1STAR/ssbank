<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>


<script type="text/javascript" >
var chart;
var chart2;
$(document).ready(function(){
	
	$.ajaxSetup({
		async: false
	});
	
	var url="<%=cp%>/assetManage/myAsset";
	$.getJSON(url, function (csv) {
		console.log(csv);
		chart =new Highcharts.Chart({
		  chart: {
			  renderTo: 'chart',
		        type: 'pie',
		        options3d: {
		            enabled: true,
		            alpha: 45,
		            beta: 0
		        }
		    },
		    title: {
		        text: 'Total Asset Division '
		    },
		    subtitle: {
		        text: '총 자산대비 각 분야 비율 '
		    },
		    tooltip: {
		        pointFormat: '금액: <b>{point.y:.0f}원</b>'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            depth: 35,
		            dataLabels: {
		                enabled: true,
		                format: '{point.name}:<b>{point.percentage:.1f}%</b>'
		            }
		        },
		    },
		    series : csv 
});
});
	
	$(function() {
		var url = "<%=cp%>/assetManage/myAssetList";
	$.getJSON(url, function (csv) {
		console.log(csv);
		chart2 = new Highcharts.Chart({

			 chart: {
				    renderTo: 'chart2',
				 	plotBackgroundColor: null,
			        plotBorderWidth: null,
			        plotShadow: false,
			        type: 'pie'
			    },
			    title: {
			        text: '자산 분야별 수입,지출 비율'
			    },
			    tooltip: {
			        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			    },
			    plotOptions: {
			        pie: {
			            allowPointSelect: true,
			            cursor: 'pointer',
			            dataLabels: {
			                enabled: true,
			                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
			                style: {
			                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
			                }
			            }
			        }
			    },
			    series: csv        
			});
	});
	});
	});


	


	
		</script>
		
<div class="content">
<h1>자산관리</h1>
<div id="chart" class=assetpie ></div>
<div id="chart2" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
</div>