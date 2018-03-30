<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="content">
	<!-- jsp body 영역 -->
	<h1>개인회원가입</h1>
	<div class="page-con">
		<div class="step-area">
			<ol>
				<li>
					<span class="step-num">1</span>
					<span class="step-name">
						<c:if test="${mode== 'created' }">이용약관동의</c:if>
						<c:if test="${mode== 'update' }">비밀번호 확인</c:if>
					</span>
				</li>
				<li>
					<span class="step-num">2</span>
					<span class="step-name">
						<c:if test="${mode== 'created' }">정보 입력</c:if>
						<c:if test="${mode== 'update' }">내 정보</c:if>
					</span>
				</li>
				<li class="active">
					<span class="step-num">3</span>
					<span class="step-name">
						<c:if test="${mode== 'created' || mode == 'mailOk' }">가입 완료</c:if>
						<c:if test="${mode== 'update' }">수정 완료</c:if>
					</span>
				</li>
			</ol>
		</div>
		<div class="box-complete-area">
			<dl>
				<dt>회원 ${mode == "created" || mode == 'mailOk' ? "가입" : "정보 수정"}이 완료되었습니다.</dt>	
				<dd>
					<ul>
						<li>${dto.userName }님의 ${mode == "created" || mode == 'mailOk' ? "회원가입" : "정보 수정"}이 정상적으로 처리되었습니다.</li>
						<li>${mode == "upadte" || mode =="mailOk" ? "메인화면으로 이동하여 로그인 하시기 바랍니다." : "이메일을 통해 회원가입을 완료해주세요."}</li>
					</ul>
				</dd>
			</dl>
		</div>
		<div class="table-wrap">
			<table class="table-verti half">
				<caption>${mode == "created" || mode =="mailOk" ? "회원가입" : "정보 수정"} 완료</caption>
				<colgroup>
					<col style="width:20%;"/>
					<col style="width:*;"/>
				</colgroup>
				<tbody>
					<tr>
						<th scope="col">성명</th>
						<td scope="col">${mode == "created" || mode =="mailOk" ? dto.lastName.concat(dto.firstName) : dto.userName}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${mode == "created" ? dto.email1.concat("@").concat(dto.email2) : dto.userId}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn-area">
			<a href="<%=cp %>/" class="btn-type-blue1 big">메인으로 이동</a>
		</div>
	</div>
	<!-- //jsp body 영역 -->
</div>