<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
						<!doctype html>
						<html lang="ko">
<head>
<title>쌍용은행 - SS BANK</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link rel="stylesheet" href="../../../resource/css/base.css" media="all"
	type="text/css">
<link rel="stylesheet" href="../../../resource/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../../../resource/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../../../resource/css/common.css"
	media="all" type="text/css">
<link rel="stylesheet" href="../../../resource/css/layout.css"
	media="all" type="text/css">

<script type="text/javascript"
	src="../../../resource/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../../../resource/js/common.js"></script>
<script type="text/javascript"
	src="../../../resource/js/owl.carousel.js"></script>

</head>
<body>
	<div id="wrap">
		<header>
			<div class="header-wrap">
				<h1>
					<a href="../main/main.html"><span>쌍용은행</span></a>
				</h1>
				<nav>
					<div class="gnb">
						<ul>
							<li class="depth-one"><a href="../menu1/pas-0001.html">개인</a>
								<ul>
									<li><a href="../menu1/pas-0001.html">조회</a></li>
									<li><a href="../menu1/pit-0001.html">이체</a></li>
									<li><a href="../menu1/pfs-0001.html">금융상품</a></li>
									<li><a href="../menu1/psl-0001.html">기타금융</a></li>
									<li><a href="../menu1/per-0001.html">외환</a></li>
									<li><a href="../menu1/csc-0001.html">사용자관리</a></li>
								</ul></li>
							<li class="depth-one"><a href="../menu2/fds-0001.html">금융상품</a>
								<ul>
									<li><a href="../menu2/fds-0001.html">예금/신탁</a></li>
									<li><a href="../menu2/las-0001.html">대출</a></li>
									<li><a href="../menu2/lsm-0001.html">상품안내</a></li>
									<li><a href="../menu2/nfp-0001.html">펀드</a></li>
									<li><a href="../menu2/cpc-0001.html">상품상담</a></li>
								</ul></li>
							<li class="depth-one"><a href="../menu3/ggo-0001.html">가계부</a>
								<ul>
									<li><a href="../menu3/ggo-0001.html">가계부</a></li>
									<li><a href="../menu3/cgm-0001.html">차계부</a></li>
								</ul></li>
							<li class="depth-one"><a href="../menu4/ssa-0001.html">자산관리</a>
								<ul>
									<li><a href="../menu4/ssa-0001.html">자산관리</a></li>
									<li><a href="../menu4/ssp-0001.html">포트폴리오</a></li>
								</ul></li>
							<li class="depth-one"><a href="../menu5/raa-0001.html">부동산</a>
								<ul>
									<li><a href="../menu5/raa-0001.html">부동산</a></li>
									<li><a href="../menu5/sso-0001.html">청약 및 경매</a></li>
								</ul></li>
							<li class="depth-one"><a href="../menu6/cms-0001.html">고객센터</a>
								<ul>
									<li><a href="../menu6/cms-0001.html">고객상담</a></li>
									<li><a href="../menu6/mbj-0001.html">회원서비스</a></li>
									<li><a href="../menu6/rfr-0001.html">자료실</a></li>
									<li><a href="../menu6/nib-0001.html">뉴스</a></li>
									<li><a href="../menu6/nbl-0001.html">공지사항</a></li>
								</ul></li>
						</ul>
					</div>
				</nav>
				<div class="lnb-wrap">
					<ul>
						<li><a href="#">로그인</a></li>
						<li><a href="#">회원가입</a></li>
						<li><a href="#" class="btn-mypage"><span class="blind">mypage</span></a></li>
					</ul>
				</div>
				<a href="#" class="btn-gnb"> <span class="gnb-bar1"></span> <span
					class="gnb-bar2"></span> <span class="gnb-bar3"></span>
				</a>
			</div>
		</header>
		<section class="container">
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
												<li><span class="tit">내놓기</span> <span
													class="type-gray">의뢰중</span> <span class="type-white">30</span>
													<span class="type-gray">접수</span> <span class="type-white">5</span>
												</li>
												<li><span class="tit">찾아주세요</span> <span
													class="type-gray">의뢰중</span> <span class="type-white">30</span>
													<span class="type-gray">접수</span> <span class="type-white">5</span>
												</li>
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
		</section>
		<aside>
			<div class="side-bar">
				<ul>
					<li><a href="#">계산기</a></li>
					<li><a href="#">위치찾기</a></li>
					<li><a href="#">문의하기</a></li>
					<li><span class="tel">1588<br>3082
					</span> <span class="time">평일<br>09:00~17:50
					</span></li>
					<a href="#" class="btn-top">TOP</a>
				</ul>
			</div>
		</aside>
		<footer>
			<div class="footer-wrap">
				<div class="info-tel">
					<span>쌍용뱅크 콜센터</span> <span>1588-3082</span>
				</div>
				<div class="address-wrap">
					<div class="bottom-nav">
						<ul>
							<li><a href="#">개인정보 취급방침</a></li>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">전자민원</a></li>
						</ul>
					</div>
					<div class="address">
						<p>
							<span><address>서울시 마포구 월드컵북로 21 풍성빌딩 2,3,4층 쌍용뱅크</address></span>
							<span>대표이사 | 김환욱</span><span>사업자등록번호 | 486-486-012</span>
						</p>
						<span class="copy">COPYRIGHT 2018 SSANGYONG BANK CO. LTD.
							ALL RIGHTS RESERVED.</span>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<script>
	$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active");
        $(this).addClass("active");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
</script>


</body>
						</html>
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

</body>
</html>