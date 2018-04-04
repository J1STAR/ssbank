<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<div class="table-num">
<div class="table-wrap">
	<table class="table-hori" id="mytable">
		<colgroup>
			<col style="width: 30%" />
			<col style="width: 30%" />
			<col style="width: 40%" />
		</colgroup>
		<thead>
		<tr>
			<th>내용</th>
			<th>매매&Tab;희망일</th>
			<th>상세내용</th>
		</tr>
		<thead>
		<tbody>
			<c:if test="${dataCount == 0 }">
				<tr>
					<td colspan="3">매물이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">

				<tr onclick="articleView('${dto.saleIdx}');" name="${dto.addr1 }">
					<fmt:parseNumber var="totalArea" integerOnly="true"
						value="${dto.totalArea}" />
					<td>${totalArea}평&Tab;${dto.addr2}<br>${dto.categoryName}&Tab;${dto.maxAmount}만원<br>
					</td>
					<td name="tradeDate">${dto.tradeDate}</td>
					<td name="saleInfo">${dto.typeName}&Tab;방${dto.room}개<br>
						${dto.layer}층&sol;${dto.tLayer}층<br> ${dto.status}<br> 
						<span class="mapAddr">${dto.addr1}</span>
					</td>
				</tr>

			</c:forEach>
		</tbody>
		<c:if test="${dataCount != 0 }">
			<tr>
				<td align="center" colspan="3">${paging }</td>
			</tr>
		</c:if>
	</table>
</div>
</div>