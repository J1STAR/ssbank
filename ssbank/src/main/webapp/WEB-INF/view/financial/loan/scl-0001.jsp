<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<div class="content">
<h1>대출상환조회</h1>
	<div class="table-wrap">
		<table class="table-hori">
			<caption>대출상환조회</caption>
			<colgroup>
				<col style="width: 15%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 12%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<th scope="col">상환날짜</th>
				<th scope="col">원금상환금액</th>
				<th scope="col">이자상환금액</th>
				<th scope="col">상환금액확인</th>
				<th scope="col">이자상환금액확인</th>
			</thead>

			<tbody>
				<c:forEach var="repay" items="${repayList}">
					<tr>
						<td>${repay.repayDate}</td>
						<td>${repay.principal}</td>
						<td>${repay.interest}</td>
						<td>${repay.repayPrinciple}</td>
						<td>${repay.repayInterest}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
		<div class="btn-area">
			   <a href='<%=cp%>/personal/transaction?accountNo="${accountNo}"' class="btn-type-blue1 medium">납부</a>
		</div>

</div>