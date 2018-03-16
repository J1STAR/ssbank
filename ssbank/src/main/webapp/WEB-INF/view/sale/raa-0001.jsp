
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
	<h1>매물/시세</h1>
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
					<div class="tab-area">
					<c:forEach var="dto" items="${list}">
					<tbody>
						<tr>
							<td>${dto.addr2}</td>
							<td><a href="${articleUrl}&saleIdx=${dto.saleIdx}">${dto.tradeDate}
									</a></td>
							<td>${dto.typeIdx}<br>
								${dto.room}<br>
								${layer}/{tLayer}<br>
								${status}<br>
								${addr1}
							</td>
							<td>${dto.createDate}</td>
							<td><c:if test="${not empty dto.saveFilename}">
									<a href="<%=cp%>/bbs/download?num=${dto.num}"
										class="attach-file"><img
										src="<%=cp%>/resource/images/disk.gif" border="0"
										style="margin-top: 1px;"></a>
								</c:if></td>
							<td>${dto.hitCount}</td>
						</tr>
					</tbody>
				</c:forEach>
					
						</div>
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
					</div>
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
<!-- //jsp body 영역 -->z