<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">

	<h1>ATM 테스트 페이지</h1>
	
	<h2>ATM 입금</h2>
	<div class="table-wrap">
		<form name="depositTable" method="POST">
		    <table class="table-verti">
		        <caption>입금 정보</caption>
		        <colgroup>
		            <col style="width:20%;"/>
		            <col style="width:*;"/>
		        </colgroup>
		        <tbody>
		            <tr>
		                <th scope="col">입금계좌번호</th>
		                <td scope="col">
							<input type="text" name="accountNo" class="">
						</td>
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
		                <th>이체금액</th>
		                <td><input type="text" name="amount" class=""></td>
		            </tr>
		            <tr>
		                <th>받는통장 메모</th>
		                <td><input type="text" name="content" class=""></td>
		            </tr>
		        </tbody>
		    </table>
	    </form>
	    <div class="btn-area">
		    <a href="javascript:history.back()" class="btn-type-gray1 big">취소</a>
		    <a href="" id="depositConfirm" class="btn-type-blue1 big">확인</a>
		</div>
	</div>
	
</div>