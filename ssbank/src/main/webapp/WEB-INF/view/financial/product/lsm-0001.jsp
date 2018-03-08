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

function detail(productIdx){
	var url="<%=cp%>/financial/product/detail?productIdx="+productIdx;
	location.href=url;
}
</script>
<div class="content">
<h1>상품 리스트</h1>
<div class="table-wrap">
    <table class="table-hori">
        <caption>상품 리스트</caption>
        <colgroup>
            <col style="width:15%"/>
            <col style="width:auto"/>
            <col style="width:250px;"/>
        </colgroup>
        <tbody>
          <c:forEach var="dto" items="${list}"> 
            <tr>
                <td>${dto.productName}</td>
                <td>${dto.productDetail}</td>
                <td>
                    <a onclick="javascript:detail(${dto.productIdx})" class="btn-type-gray medium">상세보기</a>
                    <a onclick="javascript:sendProduct(${dto.productIdx});" class="btn-type-blue1 medium">신규가입</a>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


</div>