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
        <li class="active">
            <span class="step-num">3</span>
            <span class="step-name">해지계좌 잔액이체</span>
        </li>
        <li>
            <span class="step-num">4</span>
            <span class="step-name">해지완료</span>
        </li>
    </ol>
</div>
<br>
<div class="table-wrap">
    <table class="table-verti half">
        <caption>해지계좌 계좌이체</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">은행</th>
                <td scope="col">
                <div class="item-select">
                	<select>
                		<option>은행선택</option>
                		<option value="">ssb</option>
                		<option value="">aa은행</option>
                		<option value="">bb은행</option>
                	</select>
                </div>
                </td>
            </tr>
            <tr>
                <th>계좌번호</th>
                <td><input type="text" id=""></td>
            </tr>
        </tbody>
    </table>
</div>
<br>
<div class="btn-area">
    <a onclick="javascript:location.href='<%=cp%>/financial/account" class="btn-type-gray1 big">취소</a>
    <a href="mbj-0002.html" class="btn-type-blue1 big">확인</a>
</div>

</div>