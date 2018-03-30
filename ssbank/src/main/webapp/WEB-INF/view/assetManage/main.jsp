<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<h1>자산관리</h1>
	<div class="asset1">
		<div class="tab1">
			<div class="tab1-1">
				<h2>자산관리 현황</h2>
			</div>
			<div class="tab1-2">
				<a href="<%=cp %>/assetManage/myAsset" class="btn-type-blue1 medium">자산 관리</a>
			</div>
		</div>
		<div class="tab2">
			<div class="tab2-1">
				<h2>가계부 현황</h2>
			</div>
			<div class="tab2-2">
				<a href="<%=cp %>/assetManage/accountbook" class="btn-type-blue1 medium">가계부 관리</a>
			</div>
		</div>
		<div class="tab3">
			<div class="tab3-1">
				<h2>차계부 현황</h2>
			</div>
			<div class="tab3-2">
				<a href="<%=cp %>/assetManage/carbook" class="btn-type-blue1 medium">차계부 관리</a>
			</div>
		</div>
	</div>
	<div class="asset2"> 
				<h2>자산관리 이용하기</h2>
				<div class="step-area map-info">
					<ol>
						<li><span class="step-num">STEP 1</span> <span
							class="step-name">내 자산 정보 관리 선택</span></li>
						<li><span class="step-num">STEP 2</span> <span
							class="step-name">자산 정보 확인</span></li>
						<li><span class="step-num">STEP 3</span> <span
							class="step-name">전문가의 진단 확인</span></li>
						<li><span class="step-num">STEP 4</span> <span
							class="step-name">추천 자산관리 상품 선택</span></li>
					</ol>
				</div>
				<h2>가계부 및 차계부 이용하기</h2>
				<div class="step-area map-info">
					<ol>
						<li><span class="step-num">STEP 1</span> <span
							class="step-name">희망하는 가계부 및 차계부 관리 선택</span></li>
						<li><span class="step-num">STEP 2</span> <span
							class="step-name">나의 가계부 및 차계부 정보 확인</span></li>
						<li><span class="step-num">STEP 3</span> <span
							class="step-name">전문가의 진단 확인</span></li>
						<li><span class="step-num">STEP 4</span> <span
							class="step-name">추천 성향 및 도움말 보기</span></li>
					</ol>
				</div>
	</div>
</div>