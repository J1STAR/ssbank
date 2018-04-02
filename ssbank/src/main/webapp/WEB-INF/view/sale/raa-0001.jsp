<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=PLHPMSmFQ_sQUQfGl3Bi&submodules=geocoder"></script>
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
				<c:forEach var="dto" items="${list}">
					<ul>
						<li>${dto.city}(${dto.cnt})</li>
					</ul>
				</c:forEach>
			</div>
		</div>
		<div class="tab-wrap basic">
			<ul class="tabs">
				<li rel="tab1" class="active" data-sortType="1">알짜순</li>
				<li rel="tab2" data-sortType="2">카테고리별</li>
				<li rel="tab3" data-sortType="3">면적순</li>
				<li rel="tab4" data-sortType="4">지역별</li>
			</ul>

			<div class="tab_container">
				<div id="tab1" class="tab_content"></div>
				<div id="tab2" class="tab_content"></div>
				<div id="tab3" class="tab_content"></div>
				<div id="tab4" class="tab_content"></div>
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


<script type="text/javascript">
$(function(){
   
   listPage(1);
   
   $(".tab-wrap .tabs li").click(function(){
      $(".tab-wrap .tabs li").each(function(){
         $(this).removeClass("active");
      });
      
      $(this).addClass("active");
      
      listPage(1);
   });
});

$(window).load(function(){
	loadMap();

	initMarkerMap();
});

function listPage(page) {
      var sortType = "1";
      $(".tab-wrap .tabs li").each(function(){
         if($(this).hasClass("active")) {
            sortType=$(this).attr("data-sortType");
            return;
         }
      });
      
      var url="<%=cp%>/sale/saleList";
    
      var query="pageNo="+page+"&sortType="+sortType+"&modeIdx=1";
      
      $.ajax({
        type:"GET"
        ,url:url
        ,data:query
        ,async:false
        ,success:function(data){
           
           var id="#tab"+sortType;
           $(id).html(data);
           
           // 마커
           
        }
           ,error:function(e){
              console.log(e.responseText);
           }
      });
      
}

function articleView(saleIdx) {
   
   var sortType = "1";
      $(".tab-wrap .tabs li").each(function(){
         if($(this).hasClass("active")) {
            sortType=$(this).attr("data-sortType");
            return;
         }
      });
      
      
      var url="<%=cp%>/sale/article";

		var query = "saleIdx=" + saleIdx;

		$.ajax({
			type : "GET",
			url : url,
			data : query,
			success : function(data) {
				var id = "#tab" + sortType;
				$(id).html(data);
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});
	}
</script>

<script>
	var MARKER_ICON_URL = './img/sp_pins_spot_v3.png';

	var MARKER_SPRITE_X_OFFSET = 29;
	var MARKER_SPRITE_Y_OFFSET = 50;

	var MARKER_SPRITE_POSITION = {};

	var map = null;

	function initMarkerMap() {

		var addrCount = 0;
		$.each($("span[class=mapAddr]"), function(index, addrItem) {

			var targetAddr = $(this).html();

			naver.maps.Service.geocode({

				address : targetAddr
			}, function(status, response) {
				if (status !== naver.maps.Service.Status.OK) {
					return alert('Something wrong!');
				}

				var result = response.result, // 검색 결과의 컨테이너
				items = result.items; // 검색 결과의 배열+

				// do Something
				$.each(items, function(index, item) {
					MARKER_SPRITE_POSITION[targetAddr] = [ item.point.y,
							item.point.x ];
					addrCount++;

					if (addrCount == $("span[class=mapAddr]").size()) {
						markerMap();
					}
				});
			});
		});
	}

	function loadMap() {
		map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.5332116, 126.8067516),
			zoom : 10
		});
	}

	function markerMap() {
		var markers = [];
		var infoWindows = [];
		
		for ( var key in MARKER_SPRITE_POSITION) {

			var position = new naver.maps.LatLng(
					MARKER_SPRITE_POSITION[key][0],
					MARKER_SPRITE_POSITION[key][1]);
			
			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(
						MARKER_SPRITE_POSITION[key][0],
						MARKER_SPRITE_POSITION[key][1]),
				map : map,
				title : key
			});

			var content = 	'<table class="saleInfoTable">'+
							'	<tr>'+
							'		<th>위치</th>'+
							'		<td>'+$("tr[name='" + key + "']").find(".mapAddr").html()+'</td>'+
							'	</tr>'+
							'	<tr>'+
							'		<th>거래 희망일</th>'+
							'		<td>'+$("tr[name='" + key + "']").find("[name=tradeDate]").html()+'</td>'+
							'	</tr>'+
							'	<tr>'+
							'		<th>매물정보</th>'+
							'		<td>'+$("tr[name='" + key + "']").find("[name=saleInfo]").html()+'</td>'+
							'	</tr>'+
							'</table>';
				
			var infoWindow = new naver.maps.InfoWindow({
				content: content
			});
			markers.push(marker);
			infoWindows.push(infoWindow);

		}
		naver.maps.Event.addListener(map, 'idle', function() {
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

			if (marker.setMap())
				return;
			marker.setMap(map);
		}

		function hideMarker(map, marker) {

			if (!marker.setMap())
				return;
			marker.setMap(null);
		}
		
		function getClickMarkerHandler(markerIndex){
			return function(e){
				var marker = markers[markerIndex],
				infoWindow = infoWindows[markerIndex];
				
				if(infoWindow.getMap()){
					infoWindow.close();
					
				} else {
					infoWindow.open(map, marker);
				}
			}
		}
		
		for(var i = 0, markerCount = markers.length; i<markerCount; i++){
			naver.maps.Event.addListener(markers[i], 'click', getClickMarkerHandler(i));
		}
	}
</script>