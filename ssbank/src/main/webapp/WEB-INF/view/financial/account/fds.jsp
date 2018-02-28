<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="content">

<h1>계좌조회</h1>
<a onclick="javascript:location.href='<%=cp%>/financial/account/excel';" class="btn-type-gray">엑셀다운</a>
<h2>입출금계좌</h2>
	<div class="table-wrap">
    <table class="table-hori">
        <caption>입/출금계좌</caption>
        <colgroup>
            <col style="width:auto"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:155px;"/>
        </colgroup>
        <thead>
            <th scope="col">계좌명</th>
            <th scope="col">계좌번호</th>
            <th scope="col">이율</th>
            <th scope="col">만기일/최근거래일</th>
            <th scope="col">잔액(원)</th>
            <th scope="col">업무</th>
        </thead>
        <tfoot>
            <th colspan="4">입/출금계좌 총잔액</th>
            <td colspan="2">9,999,990원</td>
        </tfoot>
        <tbody>
        	<c:forEach var="deposit" items="${deposit}">
            <tr>
                <td>${deposit.productName}</td>
                <td>${deposit.accountNo}</td>
                <td>${deposit.interestRate}</td>
                <td>${deposit.lastTrDate}</td>
                <td>${deposit.balance}</td>
                <td>
                    <a href="#" class="btn-type-gray medium">조회</a>
                    <a href="#" class="btn-type-blue1 medium">이체</a>
                </td>
            </tr>
           </c:forEach>
        </tbody>
    </table>
</div>
	<h2>적금계좌</h2>
	<div class="table-wrap">
    <table class="table-hori">
        <caption>적금계좌</caption>
        <colgroup>
            <col style="width:auto"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:155px;"/>
        </colgroup>
        <thead>
            <th scope="col">계좌명</th>
            <th scope="col">계좌번호</th>
            <th scope="col">이율</th>
            <th scope="col">만기일/최근거래일</th>
            <th scope="col">잔액(원)</th>
            <th scope="col">업무</th>
        </thead>
        <tfoot>
            <th colspan="4">입/출금계좌 총잔액</th>
            <td colspan="2">9,999,990원</td>
        </tfoot>
        <tbody>
        	<c:forEach var="saving" items="${saving}">
            <tr>
                <td>${saving.productName }</td>
                <td>${saving.accountNo }</td>
                <td>${saving.interest }</td>
                <td>${saving.lastTrDate }</td>
                <td>${saving.balance }</td>
                <td>
                    <a href="#" class="btn-type-gray medium">조회</a>
                    <a href="#" class="btn-type-blue1 medium">이체</a>
                </td>
            </tr>
           </c:forEach>
        </tbody>
    </table>
</div>
	


</div>