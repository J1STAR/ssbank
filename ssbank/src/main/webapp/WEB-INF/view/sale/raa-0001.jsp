
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=PLHPMSmFQ_sQUQfGl3Bi"></script>

<!-- jsp body 영역 -->
<div class="content">
	<div class="page-con">
		<div class="menu-wrap">
			<div class="menu-area">
				<ul>
					<li><a href="#" class="active">매물/시세</a></li>
					<li><a href="<%=cp %>/sale/raa-0002" class="">내놓기</a></li>
					<li><a href="#" class="">청약</a></li>
					<li><a href="#" class="">고객게시판</a></li>
				</ul>
			</div>
			<div class="hover-menu mb50">
				<ul>
					<li><a href="#" class="">아파트</a></li>
					<li><a href="#" class="">연립다세대</a></li>
					<li><a href="#" class="">단독다가구</a></li>
					<li><a href="#" class="">오피스텔</a></li>
					<li><a href="#" class="">상가</a></li>
				</ul>
			</div>
			
		</div>
		<div class="map-wrap mb50">
			<div class="map-area" id="map"></div>
			<div class="map-menu">
				<ul>
					<li><a href="#">강남구(4,400)</a></li>
				</ul>
			</div>
		</div>
		<div class="tab-wrap basic">
			<ul class="tabs">
				<li rel="tab1" class="active">매물</li>
				<li rel="tab2">시세</li>
				<li rel="tab3">통계</li>
				<li rel="tab4">지역소식</li>
			</ul>
			<div class="tab_container">
				<div id="tab1" class="tab_content">
					<div class="sort-area">
						<ul>
							<li><a href="#" class="active">알짜추천순</a></li>
							<li><a href="#">가격순</a></li>
							<li><a href="#">면적순</a></li>
							<li><a href="#">매물명순</a></li>
						</ul>
					</div>
					<div class="tab-area">A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A
						매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A
						매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A
						매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A
						매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A
						매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A
						매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A 매물매물A
						매물매물</div>
				</div>
				<div id="tab2" class="tab_content">
					<div class="sort-area">
						<ul>
							<li><a href="#" class="active">알짜추천순</a></li>
							<li><a href="#">가격순</a></li>
							<li><a href="#">면적순</a></li>
							<li><a href="#">매물명순</a></li>
						</ul>
					</div>
					<div class="tab-area">B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B
						매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B
						매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B
						매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B
						매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B
						매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B
						매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B
						매물매물매B 매물매물매</div>
				</div>
				<div id="tab3" class="tab_content">
					<div class="sort-area">
						<ul>
							<li><a href="#" class="active">알짜추천순</a></li>
							<li><a href="#">가격순</a></li>
							<li><a href="#">면적순</a></li>
							<li><a href="#">매물명순</a></li>
						</ul>
					</div>
					<div class="tab-area">
						C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물C매물물매물
					</div>
				</div>
				<div id="tab4" class="tab_content">
					<div class="sort-area">
						<ul>
							<li><a href="#" class="active">알짜추천순</a></li>
							<li><a href="#">가격순</a></li>
							<li><a href="#">면적순</a></li>
							<li><a href="#">매물명순</a></li>
						</ul>
					</div>
					<div class="tab-area">D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D
						매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D
						매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D
						매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D
						매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D
						매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D
						매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루D 매물룰룰루</div>
				</div>
			</div>
		</div>
		<div class="ad-area">
			<ul>
				<li><a href="#">광고1</a></li>
				<li><a href="#">광고2</a></li>
			</ul>
		</div>
	</div>
</div>

<script>
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);
</script>
<!-- //jsp body 영역 -->