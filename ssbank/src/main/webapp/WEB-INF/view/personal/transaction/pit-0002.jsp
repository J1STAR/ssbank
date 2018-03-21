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
						<li>보낸 사람 이름 : ${sessionScope.member.userName }</li>
						<li>보내는 계좌 : ${sendAccount }</li>
						<li>받는 계좌 : ${recvAccount }</li>
						<li>금액 : ${amount }</li>
						<c:if test="${trStatus != '0'}">
							<li>잔액 : ${currBalance }</li>
						</c:if>
					</ul>
				</dd>
			</dl>
		</div>
		<div class="btn-area">
			<a href="javascript:history.back()" class="btn-type-gray1 big">계속 이체하기</a>
			<a href="<%=cp %>/" class="btn-type-blue1 big">메인으로 이동</a>
		</div>
	</div>
	<!-- //jsp body 영역 -->
</div>