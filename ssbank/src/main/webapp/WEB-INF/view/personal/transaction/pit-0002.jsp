<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="content">
	<!-- jsp body 영역 -->
	<h1>이체 결과</h1>
	<div class="page-con">
		<div class="box-complete-area">
			<dl>
				<dt>${trStatus == "0" ? "이체 실패" : "이체 성공"}</dt>	
				<dd>
					<ul>
						<li>보낸 사람 이름</li>
						<li>보내는 계좌</li>
						<li>받는 계좌</li>
						<li>금액</li>
						<li>잔액</li>
					</ul>
				</dd>
			</dl>
		</div>
		<%-- <div class="table-wrap">
			<table class="table-verti half">
				<caption>${mode == "created" ? "회원가입" : "정보 수정"} 완료</caption>
				<colgroup>
					<col style="width:20%;"/>
					<col style="width:*;"/>
				</colgroup>
				<tbody>
					<tr>
						<th scope="col">성명</th>
						<td scope="col">${mode == "created" ? dto.lastName.concat(dto.firstName) : dto.userName}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${mode == "created" ? dto.email1.concat("@").concat(dto.email2) : dto.userId}</td>
					</tr>
				</tbody>
			</table>
		</div> --%>
		<div class="btn-area">
			<a href="javascript:history.back()" class="btn-type-gray1 big">계속 이체하기</a>
			<a href="<%=cp %>/" class="btn-type-blue1 big">메인으로 이동</a>
		</div>
	</div>
	<!-- //jsp body 영역 -->
</div>