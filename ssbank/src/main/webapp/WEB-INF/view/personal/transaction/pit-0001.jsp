<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	
	<h1>당행 / 타행이체</h1>
	
	<h2>출금 정보</h2>
	<div class="table-wrap">
    <table class="table-verti">
        <caption>출금 정보</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">출금계좌번호</th>
                <td scope="col">
					<div class="item-select">
                        <select name="" id="">
                            <option>선택</option>
                        </select>
                    </div>
				</td>
            </tr>
            <tr>
                <th>계좌비밀번호</th>
                <td><input type="password" class=""></td>
            </tr>
        </tbody>
    </table>
    
    <h2>입금정보</h2>
    <table class="table-verti">
        <caption>입금 정보</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">입금은행</th>
                <td scope="col">
					<div class="item-select">
                        <select name="" id="">
                            <option>선택</option>
                        </select>
                    </div>
				</td>
            </tr>
            <tr>
                <th>입금계좌번호</th>
                <td><input type="password" class=""></td>
            </tr>
            <tr>
                <th>이체금액</th>
                <td><input type="password" class=""></td>
            </tr>
            <tr>
                <th>받는통장 메모</th>
                <td><input type="password" class=""></td>
            </tr>
            <tr>
                <th>내통장 메모</th>
                <td><input type="password" class=""></td>
            </tr>
        </tbody>
    </table>
</div>
</div>