<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<div class="step-area">
    <ol>
        <li>
            <span class="step-num">1</span>
            <span class="step-name">이용약관동의</span>
        </li>
        <li>
            <span class="step-num">2</span>
            <span class="step-name">정보입력</span>
        </li>
        <li class="active">
            <span class="step-num">3</span>
            <span class="step-name">가입완료</span>
        </li>
    </ol>
</div>
<div class="box-complete-area">
    <dl>
        <dt>회원가입이 완료되었습니다.</dt>    
        <dd>
            <ul>
                <li>${name}님의 회원가입이 정상적으로 처리되었습니다.</li>
                <li>메인화면으로 이동하여 로그인 하시기 바랍니다.</li>
            </ul>
        </dd>
    </dl>
</div>

<div class="table-wrap">
    <table class="table-verti half">
        <caption>회원가입 완료</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">성명</th>
                <td scope="col">${name}</td>
            </tr>
            <tr>
                <th>계좌번호</th>
                <td>${create.accountNo}</td>
            </tr>
        </tbody>
    </table>
</div>

<div class="btn-area">
    <a onclick="javascript:location.href='<%=cp%>/financial/account';" class="btn-type-gray1 big">완료</a>
</div>
</div>