<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!-- 계좌 디테일 -->
<div class="content">
	<h1>적금계좌 상세보기</h1>
	<div class="table-wrap">
		<table class="table-verti half">
			<caption>입출금계좌</caption>
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: *;" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="col">계좌번호</th>
					<td scope="col">${dto.accountNo}</td>
				</tr>
				<tr>
					<th>계좌상품명</th>
					<td>${dto.productName}</td>
				</tr>
				<tr>
					<th>계좌생성일</th>
					<td>${dto.createDate }</td>
				</tr>
				<tr>
					<th>저축방법</th>
					<td>${dto.savingType }</td>
				</tr>
				<tr>
					<th>가입기간</th>
					<td>${dto.entryDate }</td>
				</tr>
				<tr>
					<th>적금상품타임</th>
					<td>${dto.productType }</td>
				</tr>
				<tr>
					<th>기본이율</th>
					<td>${dto.interest }</td>
				</tr>
				<tr>
					<th>우대이율</th>
					<td>${dto.vipInterest}</td>
				</tr>
				<tr>
					<th>월납입금액</th>
					<td>${dto.monthly}</td>
				</tr>
				<tr>
					<th>이자지급방식</th>
					<td>${dto.interestType}</td>
				</tr>
				<tr>
					<th>과세</th>
					<td>${dto.tax}</td>
				</tr>
				<tr>
					<th>계좌상품상세</th>
					<td>${dto.productDetail}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-area">
    <a onclick="javascript:location.href='<%=cp%>/financial/account';" class="btn-type-gray1 big">목록</a>
	</div>
</div>