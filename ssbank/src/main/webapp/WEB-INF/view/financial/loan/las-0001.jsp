<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	<br>
	<h1>대출</h1>
	<h2>대출신청 (약정)잔액 : ${totalLoan}원 | 대출 총잔액 : 원</h2>
		<br>
		<div class="table-wrap">
		    <table class="table-hori">
		        <caption>입/출금계좌</caption>
		        <colgroup>
		            <col style="width:10%"/>
		            <col style="width:15%"/>
		            <col style="width:10%"/>
		            <col style="width:10%"/>
		            <col style="width:12%"/>
		            <col style="width:10%"/>
		            <col style="width:10%"/>
		            <col style="width:300px;"/>
		        </colgroup>
		        <thead>
		            <th scope="col">상품명</th>
		            <th scope="col">계좌번호</th>
		            <th scope="col">대출일</th>
		            <th scope="col">만기일</th>
		            <th scope="col">대출신청금액</th>
		            <th scope="col">대출잔액</th>
		            <th scope="col">이자납입일</th>
		            <th scope="col">거래구분</th>
		        </thead>
		        
		        <tbody>
		        <c:forEach	var="loan" items="${loanList}">
		            <tr>
		           
		                <td>${loan.productName}</td>
		                <td><a href="#">${loan.accountNo}</a></td>
		                <td>${loan.createDate}</td>
		                <td>${loan.lastDate}</td>
		                <td>${loan.lendMoney}</td>
		                <td>${loan.balance}</td>
		                <td>${loan.interestDate}</td>
		                <td>
		                    <a href='<%=cp%>/loan/repayList?accountNo="${loan.accountNo}"' class="btn-type-gray medium">조회</a>
		                    <a href='<%=cp%>/personal/transaction?accountNo="${loan.accountNo}"' class="btn-type-blue1 medium">납부</a>
		                </td>
		            </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		    </div>
	<div class="btns">
    <a onclick="javascript:location.href='<%=cp%>/financial/loan/excel';" class="btn-type-gray medium mt20 fl">엑셀다운</a>
	</div>
		
</div>