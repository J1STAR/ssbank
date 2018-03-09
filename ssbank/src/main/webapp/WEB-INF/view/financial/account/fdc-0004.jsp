<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<br>
<div class="step-area">
    <ol>
        <li>
            <span class="step-num">1</span>
            <span class="step-name">해지계좌 잔액조회</span>
        </li>
        <li>
            <span class="step-num">2</span>
            <span class="step-name">해지계좌 인증</span>
        </li>
        <li>
            <span class="step-num">3</span>
            <span class="step-name">해지계좌 잔액이체</span>
        </li>
        <li class="active">
            <span class="step-num">4</span>
            <span class="step-name">해지완료</span>
        </li>
    </ol>
</div>
	<h1>해지 완료</h1>
	
	<div class="btn-area">
    <a onclick="javascript:location.href='<%=cp%>/financial/account" class="btn-type-blue1 big">계좌목록</a>
	</div>
	
</div>