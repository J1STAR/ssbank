<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<h2>거래내역</h2>
<div class="page-nav">
	<ul>
		${paging }
	</ul>
</div>
<div class="table-wrap">
	<table name="transactionList" class="table-hori">
		<caption>거래내역</caption>
		<colgroup>
			<col style="width: auto" />
			<col style="width: 15%" />
			<col style="width: 15%" />
			<col style="width: 15%" />
			<col style="width: 15%" />
			<col style="width: 155px;" />
		</colgroup>
		<thead>
			<th scope="col">거래일자</th>
			<th scope="col">적요</th>
			<th scope="col">출금(원)</th>
			<th scope="col">입금(원)</th>
			<th scope="col">잔액</th>
			<th scope="col">내용</th>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${transactionList }">
			<tr>
				<td>${dto.TRDATE }</td>
				<td>${dto.TYPENAME }</td>
				<c:choose>
					<c:when test="${dto.AMOUNT < 0 }">
						<td class="negative">${dto.AMOUNT }</td>
						<td>&nbsp;</td>
					</c:when>
					<c:otherwise>
						<td>&nbsp;</td>
						<td class="positive">${dto.AMOUNT }</td>
					</c:otherwise>
				</c:choose>
				<td>${dto.BALANCE }</td>
				<td>${dto.CONTENT }</td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>

		</tfoot>
	</table>
</div>
<div class="page-nav">
	<ul>
		${paging }
	</ul>
</div>