<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- 계좌 디테일 -->
<div class="content">
	<h1>입출금계좌 상세보기</h1>
	<div class="table-wrap">
    <table class="table-verti half">
        <caption>입출금계좌</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">계좌번호 </th>
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
                <th>이율</th>
                <td>${dto.interestRate}</td>
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