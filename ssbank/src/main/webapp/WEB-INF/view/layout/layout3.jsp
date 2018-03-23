<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>


<!doctype html>
<html lang="ko">
<head>
<title>쌍용은행 - SS BANK</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link rel="stylesheet" href="<%=cp%>/resource/css/base.css" media="all" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=cp%>/resource/css/owl.theme.default.min.css">
<link rel="stylesheet" href="<%=cp%>/resource/css/common.css" media="all" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" media="all" type="text/css">


<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/owl.carousel.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.tablesorter.js"></script> 

<%-- <link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.min.css"> --%>
<%-- <script type="text/javascript" src="<%=cp%>/resource/js/bootstrap.min.js"></script> --%>

</head>

<body>

<div class="cssload-container middle">
	<div class="cssload-crazy-arrow"></div>
</div>
	
<div id="wrap">	
	<div class="header">
	    <tiles:insertAttribute name="header"/>
	</div>
	
	<section class="container">
	
   		<tiles:insertAttribute name="body"/>
	</section>

	<div class="footer">
	    <tiles:insertAttribute name="footer"/>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.main-visual .slider').owlCarousel({
			loop:true,
			margin:0,
			nav:false,
			dots:true,
			autoWidth:false,
			items:1,
			autoHeight:false
		})

		$('.recommand-visual .slider').owlCarousel({
			loop:true,
			margin:31,
			nav:false,
			dots:false,
			autoWidth:false,
			items:3,
			autoHeight:true,
			autoplay:true,
			autoplayTimeout:4000,
			autoplayHoverPause:true
		})

		$(".tab_content").hide();
		$(".tab_content:first").show();

		$("ul.tabs li").click(function () {
			$("ul.tabs li").removeClass("active");
			$(this).addClass("active");
			$(".tab_content").hide()
				var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
	})

	$(function(){
		$(".btn-gnb").click(function(){
			$(this).toggleClass("change");
		});
	});

	$(document).bind("ajaxStart.mine", function() {
	    $('.cssload-container').css("display", "flex");
	});
	
	$(document).bind("ajaxStop.mine", function() {
	    $('.cssload-container').css("display", "none");
	});
</script>
</body>
</html>