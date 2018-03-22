<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<h1>대출 신규가입</h1>
<div class="step-area">
    <ol>
        <li>
            <span class="step-num">1</span>
            <span class="step-name">이용약관동의</span>
        </li>
        <li  class="active">
            <span class="step-num">2</span>
            <span class="step-name">정보입력</span>
        </li>
        <li>
            <span class="step-num">3</span>
            <span class="step-name">가입완료</span>
        </li>
    </ol>
</div>
</div>