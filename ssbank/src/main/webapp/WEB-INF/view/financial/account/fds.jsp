<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌조회</title>
</head>
<body>
<!-- 예금 -->
<c:forEach var="deposit" items="${deposit}">
	상품명 : ${deposit.productName}<br>
	계좌번호 :${deposit.accountNo}<br>
	잔액 : ${deposit.balance}<br>
	마지막거래일 :${deposit.lastTrDate}<br>
	이율 :${deposit.interestRate}<br>
</c:forEach>

<!-- 적금 -->


</body>
</html>