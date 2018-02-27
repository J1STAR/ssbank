<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	<!-- jsp body 영역 -->
	<h1>개인회원가입</h1>
	<div class="page-con">
		<div class="step-area">
			<ol>
				<li class="active">
					<span class="step-num">1</span>
					<span class="step-name">이용약관동의</span>
				</li>
				<li>
					<span class="step-num">2</span>
					<span class="step-name">정보입력</span>
				</li>
				<li>
					<span class="step-num">3</span>
					<span class="step-name">가입완료</span>
				</li>
			</ol>
		</div>
		<div class="info-area">
			<span class="info-area-tit">쌍용은행 홈페이지 회원 서비스 이용약관</span>
			<a href="#" class="btn-type-gray medium fr">보기</a>
			<div class="box-agree">
				<ul>
					<li>
						<span class="box-agree-tit">홈페이지 회원 서비스 이용약관에 동의하십니까?</span>
						<div class="item-checkbox">
							<input type="checkbox" id="mbj0001-01">
							<label for="mbj0001-01">예, 동의합니다</label>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="info-area">
			<span class="info-area-tit">[필수] 개인정보 수집·이용 동의서</span>
			<a href="#" class="btn-type-gray medium fr">보기</a>
			<p class="info-area-sub">개인정보 수집·이용동의서를 확인하시고 개인정보 및 고유식별정보 수집·이용에 동의하셔야 합니다.</p>
			<div class="box-agree">
				<ul>
					<li>
						<span class="box-agree-tit">쌍용은행이 본인의 개인정보를 수집·이용하는 것에 동의합니다.</span>
						<div class="item-radio">
							<input type="radio" id="mbj0001-02" name="join01">
							<label for="mbj0001-02">동의하지않음</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="mbj0001-03" name="join01">
							<label for="mbj0001-03">동의함</label>
						</div>
					</li>
					<li>
						<span class="box-agree-tit">쌍용은행이 본인의 고유식별정보를 수집·이용하는 것에 동의합니다.</span>
						<div class="item-radio">
							<input type="radio" id="mbj0001-04" name="join02">
							<label for="mbj0001-04">동의하지않음</label>
						</div>
						<div class="item-radio">
							<input type="radio" id="mbj0001-05" name="join02">
							<label for="mbj0001-05">동의함</label>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="btn-area">
			<a href="javascript:history.back()" class="btn-type-gray1 big">취소</a>
			<a href="<%=cp %>/member/member-0002" class="btn-type-blue1 big">확인</a>
		</div>
		<div class="box-gray-area">
			<dl>
				<dt>알아두세요</dt>
				<dd>
					<ul>
						<li>만 14세 미만의 고객은 회원가입시 ‘정보통신망 이용촉진 및 정보등에 관한 법률’ 및 “개인정보취급방침”에 따라 법정대리인의 정보활용 동의가 필요합니다.</li>
						<li>당행 영업점을 통한 보호자분의 홈페이지 회원 법정대리인 등록이 완료된 고객에 한하여 회원등록이 가능하므로 홈페이지 회원 정대리인 등록이 안된 고객님의 보호자분께서는 먼저 가까운 영업점을 방문해 주시기 바랍니다.</li>
						<li><em>구비서류 : 보호자(법정대리인) 실명확인 증표, 본인과 법정대리인의 관계입증 서류 (주민등록등본 혹은 가족관계증명서)</em></li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
	<!-- //jsp body 영역 -->
</div>
