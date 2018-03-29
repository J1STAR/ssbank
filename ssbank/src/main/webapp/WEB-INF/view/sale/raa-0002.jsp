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
	<section class="container">
		<div class="content">
			<!-- jsp body 영역 -->
			<div class="page-con">
				<div class="menu-wrap">
					<h1>매물올리기</h1>
					<div class="hover-menu mb50">
						<ul>
							<li><a href="<%=cp %>/sale/raa-0005?mode=created" class="">내놓기</a></li>
							<li><a href="<%=cp %>/sale/raa-0005?mode=gain"  class="">찾아주세요</a></li>
							<li><a href="<%=cp %>/sale/raa-0007" class="">의뢰현황</a></li>
							<li><a href="<%=cp %>/nbbs" class="">고객후기</a></li>
						</ul>
					</div>
				</div>
				<div class="box-wrap">
					<div class="box-area left">
						<dl class="ico-home">
							<dt>매물내놓을때</dt>
							<dd>
								<a href="<%=cp %>/sale/raa-0005?mode=created" class="icon-arrow">내놓기 등록</a>
							</dd>
						</dl>
						<dl class="ico-search">
							<dt>매물을 찾고 계신가요 ?</dt>
							<dd>
								<a href="<%=cp %>/sale/raa-0005?mode=gain" class="icon-arrow">찾아주세요 등록</a>
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
										<span>총의뢰수</span> <span>${dataCount}</span>
									</dt>
									<dd>
										<ul>
											<li><span class="tit">내놓기</span> <span class="type-gray">의뢰중</span>
												<span class="type-white">30</span> <span class="type-gray">접수</span>
												<span class="type-white">5</span></li>
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
				<h2>자산관리 이용하기</h2>
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
		</div>
	</section>
</body>
</html>

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