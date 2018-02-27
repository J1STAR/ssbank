<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
	<div class="content main">
		<section class="main-visual">
			<div class="owl-carousel owl-theme slider">
				<div class="item">
					<div class="item-text">
						<ul>
							<li>쌍용은행 새해 EVENT 01</li>
							<li>쌍용은행의 자산관리 프로그램으로</li>
							<li>2018년 새로운 시작을 준비하세요.</li>
							<li><a href="#" class="icon-arrow"></a></li>
						</ul>
					</div>
					<div class="item-img">
						<img src="<%=cp%>/resource/images/img_slide01.png" alt="" width="368" height="309">
					</div>
				</div>
				<div class="item">
					<div class="item-text">
						<ul>
							<li>쌍용은행 새해 EVENT 02</li>
							<li>쌍용은행의 자산관리 프로그램으로</li>
							<li>2018년 새로운 시작을 준비하세요.</li>
							<li><a href="#" class="icon-arrow"></a></li>
						</ul>
					</div>
					<div class="item-img">
						<img src="<%=cp%>/resource/images/img_slide01.png" alt="" width="368" height="309">
					</div>
				</div>
				<div class="item">
					<div class="item-text">
						<ul>
							<li>쌍용은행 새해 EVENT 03</li>
							<li>쌍용은행의 자산관리 프로그램으로</li>
							<li>2018년 새로운 시작을 준비하세요.</li>
							<li><a href="#" class="icon-arrow"></a></li>
						</ul>
					</div>
					<div class="item-img">
						<img src="<%=cp%>/resource/images/img_slide01.png" alt="" width="368" height="309">
					</div>
				</div>
			</div>
		</section>
		<section class="main-portfolio">
			<div class="port-wrap">
				<div class="port-text">
					<p>내 포트폴리오를</p>
					<p><span>지금 바로</span></p>	
					<p><span>진단 받아 보세요.</span></p>	
					<p><span class="small">내 마음에 꼭 드는 맞춤 포트폴리오를 확인해 보세요.</span></p>	
				</div>
				<div class="port-img">
					<ul>
						<li>
							<span class="num">1</span>
							<p class="tit"><span>투자성향</span> 알아보기</p>
							<div class="bg"></div>
						</li>
						<li>
							<span class="num">2</span>
							<p class="tit"><span>설계금액</span> 입력</p>
							<div class="bg"></div>
						</li>
						<li>
							<span class="num">3</span>
							<p class="tit"><span>포트폴리오</span> 설계</p>
							<div class="bg"></div>
						</li>
					</ul>
					<a href="#" class="btn-send">포트폴리오 진단받기</a>	
				</div>
			</div>
		</section>
		<section class="main-service">
			<h2>주요 서비스</h2>
			<a href="#" class="btn-more">더보기</a>
			<ul>
				<li><a href="#">예/적금신규</a></li>
				<li><a href="#">자동이체</a></li>
				<li><a href="#">인터넷환전</a></li>
				<li><a href="#">환율조회</a></li>
			</ul>
		</section>
		<div class="board-wrap">
			<section class="main-board">
				<ul class="tabs">
					<li class="active" rel="tab1">공지사항</li>
					<li rel="tab2">뉴스</li>
				</ul>
				<div class="tab_container">
					<div id="tab1" class="tab_content">
						<ul>
							<li><a href="#">2018년 새해에는 복을 많이많이많이 받으세요.</a><span>2018.02.14</span></li>
							<li><a href="#">쌍용은행 방문을 환영합니다. 첫거래 하신분들께 사랑드려요.</a><span>2018.02.14</span></li>
							<li><a href="#">여러분 반가워요. 또 오실거죠 ? 공지사항입니다아아아아.</a><span>2018.02.14</span></li>
						</ul>
					</div>
					<div id="tab2" class="tab_content">
						<ul>
							<li><a href="#">왜 눌렀똥?</a><span>2018.02.14</span></li>
							<li><a href="#">메롱메롱</a><span>2018.02.14</span></li>
							<li><a href="#">우헤헤헤헤ㅔ 졸려ㅕㅕ</a><span>2018.02.14</span></li>
						</ul>
					</div>
				</div>
				<a href="#" class="btn-more"></a>
			</section>
			<section class="main-estate">
				<h3>
					<span>부동산정보의 모든것</span>
					<span><span>쌍용은행</span>에서 알려드립니다.</span>
				</h3>
				<div class="btn-wrap">
					<ul>
						<li><a href="#">매물 및 시세</a></li>
						<li><a href="#">지역소개</a></li>
						<li><a href="#">부동산통계</a></li>
						<li><a href="#">청약넣기</a></li>
					</ul>
				</div>
			</section>
		</div>
		<section class="main-recommand">
			<h2>쌍용은행 <span>추천상품</span></h2>
			<section class="recommand-visual">
				<div class="owl-carousel owl-theme slider">
					<div class="item item-01">
						<ul>
							<li>쌍용뱅크 입출금 통장</li>
							<li>까다로운 계좌개설도</li>
							<li>정말 손쉽게</li>
							<li>연 0.10%</li>
						</ul>
						<a href="#">더 알아보기</a>
					</div>
					<div class="item item-02">
						<ul>
							<li>쌍용뱅크 정기예금</li>
							<li>실시간 이자로</li>	
							<li>돈모으는 재미가 쏠쏠</li>	
							<li>연 2.20%</li>	
							<li>(12개월기준)</li>	
						</ul>
						<a href="#">더 알아보기</a>
					</div>
					<div class="item item-03">
						<ul>
							<li>쌍용뱅크 전월세보증금 대출</li>
							<li>전월세 보증금도</li>
							<li>정말 간편하게</li>
							<li>연 2.82%</li>
							<li>(최저)</li>
						</ul>
						<a href="#">더 알아보기</a>
					</div>
				</div>
			</section>
		</section>
	</div>