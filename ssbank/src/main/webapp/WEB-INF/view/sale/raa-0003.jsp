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
			<div class="menu-area">
				<ul>
					<li><a href="#" class="">매물/시세</a></li>
					<li><a href="#" class="active">내놓기</a></li>
					<li><a href="#" class="">청약</a></li>
					<li><a href="#" class="">고객게시판</a></li>
				</ul>
			</div>
			<div class="hover-menu mb50">
				<ul>
					<li><a href="#" class="">내놓기</a></li>
					<li><a href="#" class="">찾아주세요</a></li>
					<li><a href="#" class="">의뢰현황</a></li>
					<li><a href="#" class="">고객후기</a></li>
				</ul>
			</div>
		</div>
		<div class="box-wrap">
			<div class="box-area left">
				<dl class="ico-home">
					<dt>매물내놓을때</dt>
					<dd>
						<a href="#" class="icon-arrow">내놓기 등록</a>
					</dd>
				</dl>
				<dl class="ico-search">
					<dt>매물을 찾고 계신가요 ?</dt>
					<dd>
						<a href="#" class="icon-arrow">찾아주세요 등록</a>
					</dd>
				</dl>
			</div>
			<div class="box-area right">
				<dl class="ico-inquiry">
					<dt>
						쌍용은행은 고객님의 부동산 거래를<br>지원합니다.
					</dt>
					<dd>
						<a href="#" class="icon-arrow">고객센터 문의하기</a>
					</dd>
					<div class="inquiry-num">
						<dl>
							<dt>
								<span>총의뢰수</span> <span>3,106</span>
							</dt>
							<dd>
								<ul>
									<li><span class="tit">내놓기</span> <span class="type-gray">의뢰중</span>
										<span class="type-white">30</span> <span class="type-gray">접수</span>
										<span class="type-white">5</span></li>
									<li><span class="tit">찾아주세요</span> <span class="type-gray">의뢰중</span>
										<span class="type-white">30</span> <span class="type-gray">접수</span>
										<span class="type-white">5</span></li>
								</ul>
							</dd>
						</dl>
					</div>
				</dl>
			</div>
		</div>
		<h2>내놓기 이용하기</h2>
		<div class="step-area map-info">
			<ol>
				<li><span class="step-num">STEP 1</span> <span
					class="step-name">내 매물정보 입력</span></li>
				<li><span class="step-num">STEP 2</span> <span
					class="step-name">내 매물을 팔아줄 동네 중개사가 의견 제공</span></li>
				<li><span class="step-num">STEP 3</span> <span
					class="step-name">마음에 드는 중개사 선택</span></li>
				<li><span class="step-num">STEP 4</span> <span
					class="step-name">거래진행</span></li>
			</ol>
		</div>
		<h2>찾아주세요 이용하기</h2>
		<div class="step-area map-info">
			<ol>
				<li><span class="step-num">STEP 1</span> <span
					class="step-name">희망하는 매물정보 입력</span></li>
				<li><span class="step-num">STEP 2</span> <span
					class="step-name">내가 원하는 매물을 찾아줄 동네 중개사가 의견 제공</span></li>
				<li><span class="step-num">STEP 3</span> <span
					class="step-name">마음에 드는 중개사 선택</span></li>
				<li><span class="step-num">STEP 4</span> <span
					class="step-name">거래진행</span></li>
			</ol>
		</div>
	</div>
	<!-- //jsp body 영역 -->

</div>