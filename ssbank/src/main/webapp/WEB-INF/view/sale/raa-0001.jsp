<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=PLHPMSmFQ_sQUQfGl3Bi&submodules=geocoder"></script>
<!-- <script type="text/javascript" src="../jquery-tablesorter/jquery.tablesorter.min.js"></script> -->


<!-- jsp body 영역 -->
<div class="content">
	<div class="page-con">
		<div class="menu-wrap">
			<h1>매물/시세</h1>
			<div class="hover-menu mb50">
				<ul>
					<li><a href="#" class="">아파트</a></li>
					<li><a href="#" class="">단독다가구</a></li>
					<li><a href="#" class="">오피스텔</a></li>
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
			 <form name="searchForm" action="<%=cp%>/sale/list" method="post">
			<div class="tab_container">
				<div id="tab1" class="tab_content">
				
					<div class="sort-area">
						<ul>
							<li><a href="#" class="active" onclick=upload();>알짜추천순</a></li>
							<li><a href="#" >가격순</a></li>
							<li><a href="#">면적순</a></li>
							<li><a href="#">매물명순</a></li>
						</ul>
				
					</div>
			
					<!--  -->
					<div class="table-wrap">
						<table class="table-hori" id="mytable">
							<colgroup>
								<col style="width: 30%" />
								<col style="width: 30%" />
								<col style="width: 40%" />
							</colgroup>
							<tr>
							<td>내용</td>
							<td>매매유무</td>
							<td>상세내용</td>	
							</tr>
							<c:forEach var="dto" items="${list}">
							<tbody>						
								<tr>
									<fmt:parseNumber var="totalArea" integerOnly="true" value="${dto.totalArea}"/>
									<td><a href="${articleUrl}&saleIdx=${dto.saleIdx}">${totalArea}평&Tab;${dto.addr2}<br>
										${dto.categoryName}&Tab;${dto.maxAmount}만원</a><br>
									</td>
									<td><a href="${articleUrl}&saleIdx=${dto.saleIdx}">${dto.tradeDate}
									</a></td>
									<td><a href="${articleUrl}&saleIdx=${dto.saleIdx}">${dto.typeName}&Tab; 방${dto.room}개<br>
										${dto.layer}층&sol;${dto.tLayer}층<br> ${dto.status}<br>
										<span name="addr">${dto.addr1}</span>
									</a></td>
								</tr>
							</tbody>
								</c:forEach>
						</table>
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
						매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B 매물매물매B</div>
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
			</form>
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
	
	$(window).load(function(){
		
		
		
		var MARKER_ICON_URL = './img/sp_pins_spot_v3.png';

		var MARKER_SPRITE_X_OFFSET = 29;
		var MARKER_SPRITE_Y_OFFSET = 50;

		var MARKER_SPRITE_POSITION = {
				
		};

		
		
		var addrCount = 0;
		$.each($("span[name=addr]"), function(index, addrItem){

			var targetAddr = $(this).html();
			
			naver.maps.Service.geocode({
				
			    address: targetAddr
			}, function(status, response) {
			    if (status !== naver.maps.Service.Status.OK) {
			        return alert('Something wrong!');
			    }
			
			    var result = response.result, // 검색 결과의 컨테이너
			        items = result.items; // 검색 결과의 배열+
			        
			    // do Something
			    $.each(items, function(index, item){
		    		MARKER_SPRITE_POSITION[targetAddr] = [item.point.y, item.point.x];
		    		addrCount++;

					if(addrCount == $("span[name=addr]").size()){
						loadMap();
					}		    		
			    });
			});
		});
		
		function loadMap(){
			var map = new naver.maps.Map('map', {
			    center: new naver.maps.LatLng(37.5332116, 126.8067516),
			    zoom: 10
			});
			

			var bounds = map.getBounds(),
			    southWest = bounds.getSW(),
			    northEast = bounds.getNE(),
			    lngSpan = northEast.lng() - southWest.lng(),
			    latSpan = northEast.lat() - southWest.lat();
			
			var markers = [];

			for (var key in MARKER_SPRITE_POSITION) {

			    var position = new naver.maps.LatLng(
		    		MARKER_SPRITE_POSITION[key][0],
		    		MARKER_SPRITE_POSITION[key][1]
			    );
			    
			    
			    var marker = new naver.maps.Marker({
			        position: new naver.maps.LatLng(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1]),
			        map: map
			    });
			    
			    markers.push(marker);
			};

			naver.maps.Event.addListener(map, 'zoom_changed', function() {
			    updateMarkers(map, markers);

			});

			naver.maps.Event.addListener(map, 'dragend', function() {
			    updateMarkers(map, markers);
			});

			function updateMarkers(map, markers) {

			    var mapBounds = map.getBounds();
			    var marker, position;

			    for (var i = 0; i < markers.length; i++) {

			        marker = markers[i]
			        position = marker.getPosition();

			        if (mapBounds.hasLatLng(position)) {
			            showMarker(map, marker);
			        } else {
			            hideMarker(map, marker);
			        }
			    }
			}

			function showMarker(map, marker) {

			    if (marker.setMap()) return;
			    marker.setMap(map);
			}

			function hideMarker(map, marker) {

			    if (!marker.setMap()) return;
			    marker.setMap(null);
			}
			/* var testAddr = $("span[name=addr]");
			
			naver.maps.Service.geocode({
			    address: testAddr.html()
			}, function(status, response) {
			    if (status !== naver.maps.Service.Status.OK) {
			        return alert('Something wrong!');
			    }
			
			    var result = response.result, // 검색 결과의 컨테이너
			        items = result.items; // 검색 결과의 배열
			        
			    // do Something
			    $.each(items, function(index, item){
			    		console.log("주소:"+item.address);
			    		console.log("위도:"+item.point.x);
			    		console.log("경도:"+item.point.y);
			    		
			    		var map = new naver.maps.Map('map', {
						    mapTypeId: naver.maps.MapTypeId.HYBRID
						});
			    		
			    		var target = new naver.maps.LatLng(item.point.y, item.point.x);
			
					    map.setCenter(target); // 중심 좌표 이동
					    map.setZoom(13);     // 줌 레벨 변경
					    
					    var marker = new naver.maps.Marker({
					        position: new naver.maps.LatLng(item.point.y, item.point.x),
					        map: map
					    });
			    });
			}); */
		}
		
		
	});

</script>
<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}  

</script>