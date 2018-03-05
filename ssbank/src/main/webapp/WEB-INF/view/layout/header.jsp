<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<header>
	<div class="header-wrap">
		<h1>
			<a href="<%=cp%>/"><span>쌍용은행</span></a>
		</h1>
		<nav>
			<div class="gnb">
				<ul>
					<li class="depth-one"><a href="#">개인</a>
						<div class="depth-two">
							<ul>
								<li><a href="#">조회</a></li>
								<li><a href="#">이체</a></li>
								<li><a href="<%=cp%>/financial/account">금융상품</a></li>
								<li><a href="#">기타금융</a></li>
								<li><a href="#">외환</a></li>
								<li><a href="#">사용자관리</a></li>
							</ul>
						</div>
					</li>
					<li class="depth-one"><a href="<%=cp%>/financial/account">금융상품</a>
						<div class="depth-two">
							<ul>
								<li><a href="<%=cp%>/financial/account/fds">예금/신탁</a></li>
								<li><a href="<%=cp%>/financial/loan/las">대출</a></li>
								<li><a href="<%=cp%>/financial/product/lsm">상품안내</a></li>
								<li><a href="<%=cp%>/financial/fund/nfp">펀드</a></li>
								<li><a href="<%=cp%>/financial/counsel/cpc">상품상담</a></li>
							</ul>
						</div>
					</li>
					<li class="depth-one"><a href="<%=cp%>/acBookNcarBook/accountBook">가계부</a>
						<div class="depth-two">
							<ul>
								<li><a href="<%=cp%>/acBookNcarBook/accountBook">가계부</a></li>
								<li><a href="<%=cp%>/acBookNcarBook/carAcBook">차계부</a></li>
							</ul>
						</div>
					</li>
					<li class="depth-one"><a href="#">자산관리</a>
						<div class="depth-two">
							<ul>
								<li><a href="#">자산관리</a></li>
								<li><a href="#">포트폴리오</a></li>
							</ul>
						</div>
					</li>
					<li class="depth-one"><a href="#">부동산</a>
						<div class="depth-two">
							<ul>
								<li><a href="#">부동산</a></li>
								<li><a href="#">청약 및 경매</a></li>
							</ul>
						</div>
					</li>
					<li class="depth-one"><a href="#">고객센터</a>
						<div class="depth-two">
							<ul>
								<li><a href="#">고객상담</a></li>
								<li><a href="#">회원서비스</a></li>
								<li><a href="#">자료실</a></li>
								<li><a href="#">뉴스</a></li>
								<li><a href="#">공지사항</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		<div class="lnb-wrap">
			<ul>
				<c:choose>
					<c:when test="${sessionScope.member eq null}">
						<li><a href="<%=cp%>/member/login">로그인</a></li>
						<li><a href="<%=cp%>/member/member-0001">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li>${sessionScope.member.userName }님 환영합니다.</li>
						<li><a href="<%=cp%>/member/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="#" class="btn-mypage"><span class="blind">mypage</span></a></li>
			</ul>
		</div>
		<a href="#" class="btn-gnb"> <span class="gnb-bar1"></span> <span
			class="gnb-bar2"></span> <span class="gnb-bar3"></span>
		</a>
	</div>
</header>

<script>
	$(function(){
		
		/* tab */
		$("li.depth-one").mouseover(function(){
			var target = $(this).children(".depth-two");
			
			$.each( $(this).parent("ul").find(".depth-two"), function(index, item){
				$(item).css("display", "none");
			});
			
			$(this).addClass("active");
			target.css("display", "block");
			target.css("top", 56);
			target.css("left", -($(".gnb").offset().left - ($(window).width() - $(".header-wrap").width())/2));
			
			$(target).mouseout(function(){
				$(this).parent(".depth-one").removeClass("active");
				$(this).css("display", "none");
			});
		});
	});
	

</script>