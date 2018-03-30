<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<h1>의뢰 상세 현황</h1>
<div class="tab-wrap blue item2">
    <ul class="tabs">
        <li rel="tab1" class="active" data-modeType="1">매수</li>
        <li rel="tab2" data-modeType="2">매도</li>
    </ul>
    <div class="tab_container">
				<div id="tab1" class="tab_content">aa</div>
				<div id="tab2" class="tab_content">bb</div>
	</div>
</div>
</div>



<script type="text/javascript">
$(function(){

	listPage(1);
	
	$(".tab-wrap .tabs li").click(function(){
		$(".tab-wrap .tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$(this).addClass("active");
		$(".tab_content").hide()
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn()
		
		listPage(1);
	});
});

function listPage(modeIdx) {
	   var modeType = "1";
	   $(".tab-wrap .tabs li").each(function(){
		   if($(this).hasClass("active")) {
			   modeType=$(this).attr("data-modeType");
			   return;
		   }
	   });
	   
	   var url="<%=cp%>/sale/saleList";
	 
	   var query="&modeIdx="+modeIdx;
	   
	   $.ajax({
		  type:"GET"
		  ,url:url
		  ,data:query
		  ,success:function(data){
			  
			  var id="#tab"+modeType;
			  $(id).html(data);
			  
			  // 마커
			  
		  }
	   	  ,error:function(e){
	   		  console.log(e.responseText);
	   	  }
	   });
	   
}

function articleView(saleIdx) {
	
	var modeType = "1";
	   $(".tab-wrap .tabs li").each(function(){
		   if($(this).hasClass("active")) {
			   modeType=$(this).attr("data-modeType");
			   return;
		   }
	   });
	   
	   
	   var url="<%=cp%>/sale/article";
		 
	   var query="saleIdx="+saleIdx;
	   
	   $.ajax({
		  type:"GET"
		  ,url:url
		  ,data:query
		  ,success:function(data){
			  var id="#tab"+modeType;
			  $(id).html(data);
		  }
	   	  ,error:function(e){
	   		  console.log(e.responseText);
   		  }
   	  });
}
</script>