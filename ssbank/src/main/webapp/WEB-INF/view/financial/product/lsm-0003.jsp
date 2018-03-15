<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script>
function sendProduct(productIdx){
	var url="<%=cp%>/financial/account/fdn0001?productIdx="+productIdx;
	location.href=url;
}

</script>
<div class="content">
<h1>적금상품 상세보기</h1>
<div class="btns">
    <a href="#" class="btn-type-gray medium mt20 fl">적금상품상담</a>
</div>
<div class="table-wrap">
    <table class="table-verti half">
        <caption>적금상품상세</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">상품명</th>
                <td scope="col">${dto.productName}</td>
            </tr>
            <tr>
                <th>상품 상세설명</th>
                <td>${dto.productDetail}</td>
            </tr>
            <tr>
                <th>상품타임</th>
                <td>${dto.productType}</td>
            </tr>
            <tr>
                <th>가입기간</th>
                <td>${dto.entryDate}</td>
            </tr>
            <tr>
                <th>월 납입금액</th>
                <td>${dto.monthly}</td>
            </tr>
            <tr>
                <th>기본이율</th>
                <td>${dto.interest}</td>
            </tr>
            <tr>
                <th>우대이율</th>
                <td>${dto.vipInterest}</td>
            </tr>
            <tr>
                <th>저축방법</th>
                <td>${dto.savingType}</td>
            </tr>
            <tr>
                <th>과세</th>
                <td>${dto.tax}</td>
            </tr>
            <tr>
                <th>이자지급방식</th>
                <td>${dto.interestType}</td>
            </tr>
            <tr>
                <th>상품출시일</th>
                <td>${dto.createDate }</td>
            </tr>
        </tbody>
    </table>
</div>
<div class="btn-area">
    <a onclick="javascript:location.href='<%=cp%>/financial/product';" class="btn-type-gray1 big">상품목록</a>
    <a onclick="javascript:sendProduct(${dto.productIdx});" class="btn-type-blue1 big">신규가입</a>
</div>
</div>