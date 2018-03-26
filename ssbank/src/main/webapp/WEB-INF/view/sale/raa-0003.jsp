<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
>
		<div class="content">


			<!-- jsp body 영역 -->
			<div class="page-con">
				<div class="menu-wrap">
				<h1>청약</h1>
					<div class="hover-menu mb30">
						<ul>
							<li><a href="#" class="">청약정보</a></li>
							<li><a href="<%=cp %>/sale/chy-0001" class="">청약일정</a></li>
							<li><a href="<%=cp %>/photo/list" class="">현장사진</a></li>
						</ul>
					</div>
				</div>
				<h1>분양정보</h1>
				<div class="minimap-wrap">
					<div class="minimap-area">
						<div class="map-area">미니맵영역</div>
						<div class="sort-area">
							<ul>
								<li><a href="#" class="active">알짜추천순</a></li>
								<li><a href="#">가격순</a></li>
								<li><a href="#">면적순</a></li>
								<li><a href="#">매물명순</a></li>
							</ul>
						</div>
						<div class="list-area">
							<ul>
								<li><a href="#">[구로구] 개봉역센트레빌레우스 (민간임대 임미다아앙아아아앙)</a><span class="home-ing">분양중</span></li>
								<li><a href="#">[강남구] 개나리 4차 재건축</a><span class="home-soon">분양예정</span></li>
								<li><a href="#">[송파구] 롯데캐슬</a><span class="home-soon">분양예정</span></li>
								<li><a href="#">[구로구] 개봉역센트레빌레우스 (민간임대 임미다아앙아아아앙)</a><span class="home-ing">분양중</span></li>
								<li><a href="#">[강남구] 개나리 4차 재건축</a><span class="home-soon">분양예정</span></li>
								<li><a href="#">[송파구] 롯데캐슬</a><span class="home-soon">분양예정</span></li>
							</ul>
						</div>
					</div>
					<div class="map-news">
						<h2>분양뉴스</h2>
						<ul>
							<li><a href="#">
								<span class="img">분양뉴스 사진영역</span>
								<span class="tit">쌍용건물 쌍용건물 쌍용건물 쌍용건물 쌍용건물 쌍용건물</span>
								<span class="sub">역세권 어쩌구 저쩌구 사당에서 강남을 누려라!!! 화이또!!! 역세권 어쩌구 저쩌구 역세권 어쩌구 저쩌구 역세권 어쩌구 저쩌구 역세권 어쩌구 저쩌구 강남을 누려라!!! 화이또!!! 강남을 누려라!!! 화이또!!!</span>
							</a></li>
							<li><a href="#">뉴스임미당</a></li>
							<li><a href="#">뉴스임미당</a></li>
							<li><a href="#">뉴스임미당</a></li>
							<li><a href="#">뉴스임미당</a></li>
							<li><a href="#">뉴스임미당</a></li>
							<li><a href="#">뉴스임미당</a></li>
						</ul>
					</div>
				</div>			
			</div>
			</div>
