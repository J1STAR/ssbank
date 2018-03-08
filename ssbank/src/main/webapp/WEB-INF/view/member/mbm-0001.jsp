<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="content">
	<!-- jsp body 영역 -->
	<h1>회원정보 변경</h1>
	<form name="memberInfo">
		<div class="page-con">
			<div class="step-area">
				<ol>
					<li>
						<span class="step-num">1</span>
						<span class="step-name">비밀번호 확인</span>
					</li>
					<li class="active">
						<span class="step-num">2</span>
						<span class="step-name">내 정보</span>
					</li>
					<li>
						<span class="step-num">3</span>
						<span class="step-name">수정 완료</span>
					</li>
				</ol>
			</div>
			<h2>정보입력</h2>
			<div class="table-wrap">
				
				<table class="table-verti">

					<colgroup>
						<col style="width:20%;"/>
						<col style="width:*;"/>
					</colgroup>
					<tbody>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="userId" class="modiTarget" value="${sessionScope.member.userId }" readOnly>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="userPwd" class="modiTarget">
								<span class="check-false">비밀번호 불일치</span>
							</td>
						</tr>
					</tbody>

				</table>
				
			</div>
			
			<div class="btn-area">
			    <a href="javascript:history.back()" class="btn-type-gray1 big">취소</a>
			    <a href="" id="memberInfo" class="btn-type-blue1 big">확인</a>
			</div>
		</div>
	</form>
	<!-- //jsp body 영역 -->
</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>	

$(function(){
	
	/* 입력한 비밀번호와 입력한 DB내 비밀번호 비교 */
	$("#memberInfo").click(function(event){
		event.preventDefault();
		
		console.log($("input[name=userId]").val())
		
		pwdCheck();
	});
	
});


	function pwdCheck(){
		var url = "<%=cp %>/member/memberPwdCheck";
		var query = $("form[name=memberInfo]").serialize();
		console.log(query);
		
		$.ajax({
			url		: url,
			type		: "POST",
			data		: query,
			dataType	: "json",
			success	: function(data){
				if(data.status != null){
					if(data.status == "success"){
						console.log("성공");
						location.href = "<%= cp %>/member/memberModi-0002";
					} else{
						console.log("실패");
						$('.check-false').show();
						$('input[name=userPwd]').css("border-color", 'red');
						return;	
					}
				}
			},
			error	: function(e){
				console.log(e.responseText);
			}
		});
	}
</script>