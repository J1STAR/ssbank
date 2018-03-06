<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	
	<h1>계좌 조회</h1>

	<div class="box-blue-area">
	    <dl>    
	        <dd>
	            <ul>
	                <li>출금계좌번호</li>
	                <li>최종거래일시</li>
	                <li>최종접속일자</li>
	            </ul>
	        </dd>
	    </dl>
	</div>
	
	<div class="tab-wrap basic mt20 accountTabs">
		<ul class="tabs">
			<li rel="tab1" class="active accountTab">예금계좌</li>
			<li rel="tab2" class="accountTab">적금계좌</li>
			<li rel="tab3" class="accountTab">대출계좌</li>
		</ul>
		<div class="tab_container mt20">
			<div id="tab1" class="tab_content">
				
				<div class="table-wrap">
				    <table class="table-hori">
				        <caption>입/출금계좌</caption>
				        <colgroup>
				            <col style="width:auto"/>
				            <col style="width:15%"/>
				            <col style="width:15%"/>
				            <col style="width:15%"/>
				            <col style="width:15%"/>
				            <col style="width:155px;"/>
				        </colgroup>
				        <thead>
				            <th scope="col">계좌명</th>
				            <th scope="col">계좌번호</th>
				            <th scope="col">신규일</th>
				            <th scope="col">만기일/최근거래일</th>
				            <th scope="col">잔액(원)</th>
				            <th scope="col">업무</th>
				        </thead>
				        <tfoot>
				            <th colspan="4">입/출금계좌 총잔액</th>
				            <td colspan="2">9,999,990원</td>
				        </tfoot>
				        <tbody>
				            <tr>
				                <td>저축</td>
				                <td>123-456-7899</td>
				                <td>2016.11.11</td>
				                <td>2018.01.11</td>
				                <td>837,770</td>
				                <td>
				                    <a href="#" class="btn-type-gray medium">조회</a>
				                    <a href="#" class="btn-type-blue1 medium">이체</a>
				                </td>
				            </tr>
				            <tr>
				                <td>저축<br>[별명]</td>
				                <td>123-456-7899</td>
				                <td>2016.11.11</td>
				                <td>2018.01.11</td>
				                <td>837,770</td>
				                <td>
				                    <a href="#" class="btn-type-gray medium">조회</a>
				                    <a href="#" class="btn-type-blue1 medium">이체</a>
				                </td>
				            </tr>
				        </tbody>
				    </table>
				</div>
			</div>
			<div id="tab2" class="tab_content">
				
			</div>
			<div id="tab3" class="tab_content">
				
			</div>
		</div>
	</div>

</div>