			
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="content">
	<div class="page-con">
		<div class="box-complete-area">
			<dl>
				<dt>매물이 성공적으로 등록되었습니다.</dt>
				<dd>
					<ul>
						<li>ooo님의 회원가입이 정상적으로 처리되었습니다.</li>
						<li>메인화면으로 이동하여 로그인 하시기 바랍니다.</li>
					</ul>
				</dd>
			</dl>
		</div>
		<div class="btn-area">
			<a href="<%=cp%>/sale/raa-0001" class="btn-type-blue1 big">부동산
				메인으로 이동</a>
		</div>
	</div>
</div>
