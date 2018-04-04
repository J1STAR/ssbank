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
function counsel(categoryIdx){
	var url="<%=cp%>/counsel/product?categoryIdx="+categoryIdx;
	location.href=url;
	
}

</script>
<div class="content">
<h1>대출 상세보기</h1>
<br>
<div class="btns">
    <a href="javascript:counsel(7);" class="btn-type-gray medium mt20 fl">대출상품상담</a>
</div>
<div class="table-wrap">
    <table class="table-verti half">
        <caption>대출상품상세</caption>
        <colgroup>
            <col style="width:30%;"/>
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
                <th>대출 최대금액</th>
                <td>${dto.limitAmount}</td>
            </tr>
            <tr>
                <th>대출 최대 만기일</th>
                <td>${dto.entryDate}개월</td>
            </tr>
            <tr>
                <th>대출 이자</th>
                <td>${dto.interest}</td>
            </tr>
            <tr>
                <th>출시일</th>
                <td>${dto.createDate}</td>
            </tr>
          
        </tbody>
    </table>
</div>
<div class="btn-area">
    <a onclick="javascript:location.href='<%=cp%>/financial/product';" class="btn-type-gray1 big">상품목록</a>
    <a onclick="javascript:sendProduct(${dto.productIdx});" class="btn-type-blue1 big">신규가입</a>
</div>
</div>