<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
#container, #sliders {
    min-width: 310px; 
    max-width: 800px;
    margin: 0 auto;
}
#container {
    height: 400px; 
}
</style>


<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">

var chart;
var chart2;
$(document).ready(function(){
	
	$.ajaxSetup({
		async: false
	});
	
	var url="<%=cp%>/assetManage/pie3d";
	$.getJSON(url, function (csv) {
		console.log("1")
		chart = new Highcharts.Chart({
			chart: {
				renderTo: 'pie3dContainer',
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45
	            }
	        },			
	        title: {
	            text: '지출 분류',
	        },
	        plotOptions: {
	            pie: {
	                innerSize: 100,
	                depth: 45
	            }
	        },
	        series:csv
	        
	        
		});
	});

	var url="<%=cp%>/assetManage/chart2";
	$.getJSON(url, function (tt) {
		console.log(2)
		chart2 = new Highcharts.Chart({
			  chart: {
			        renderTo: 'chart2',
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
	            text: '날짜별 금액(원)'
	        },
	        subtitle: {
	            text: 'daily spend money'
	        },
	        plotOptions: {
	            column: {
	                depth: 25
	            }
	        },
	        series:tt
		});
		
	});
	
	// Activate the sliders
	$('#sliders input').on('input change', function () {
		chart.options.chart.options3d[this.id] = parseFloat(this.value);
	    chart.redraw(false);
	    
	    chart2.options.chart.options3d[this.id] = parseFloat(this.value);
	    chart2.redraw(false);
	    
	});

});


$(window).load(function(){
	showValues();
});


function showValues() {
 	$('#alpha-value').html(chart.options.chart.options3d.alpha);
    $('#beta-value').html(chart.options.chart.options3d.beta);
    $('#depth-value').html(chart.options.chart.options3d.depth);
}

</script>


<div class="content">
	<h1>가계부관리</h1>
  
    <div class="table-wrap">
        <div id="pie3dContainer" class="pie3dContainer"
            style="width: 100%; float: left; margin: 0px;" >
        </div>
    	<div id="chart2" class="chart2"
    		style="width: 100%; float: left; margin: 0px;">
    	</div>
    </div>
      	<div class="btns">
    <a href="<%=cp %>/assetManage/main" class="btn-type-blue1 medium mt20 fr">뒤로가기</a>
</div>
    
    
    <div id="sliders">
	    <table>
	        <tr>
	           <td>Alpha Angle</td>
	           <td><input id="alpha" type="range" min="0" max="45" value="15"/> <span id="alpha-value" class="value"></span></td>
	        </tr>
	        <tr>
	           <td>Beta Angle</td>
	           <td><input id="beta" type="range" min="-45" max="45" value="15"/> <span id="beta-value" class="value"></span></td>
	        </tr>
	        <tr>
	           <td>Depth</td>
	           <td><input id="depth" type="range" min="20" max="100" value="50"/> <span id="depth-value" class="value"></span></td>
	        </tr>
	        
	    </table>
	    
   	</div>
 
   	
</div> 

  