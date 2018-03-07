<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script>
function cancle(){
	var f = document.sendAccount;
	f.action = "<%=cp%>/financial/account/fdc0003";
	f.submit();
}
$(function(){
	$("#cancleCheck").click(function(event){
		
		event.preventDefault();
		
		var account = $("#cancleAcc").val();
		var accountPwd = $("#canclePwd").val();
		var url = "<%=cp%>/financial/account/cancleCheck";
		var q ="accountNo="+account+"&accountPwd="+accountPwd;
		$.ajax({
			type:"post"
				,url:url
				,data:q
				,dataType:"json"
				,success:function(data){
					var s = data.state;
					if(s==0){
						alert('비밀번호를 확인해주세요.');
					}else{
						cancle();
					}
				}
				,error:function(data){
					console.log(e.responseText);
				}
			
		});
	});
});
</script>
<div class="content">
	<br>
<div class="step-area">
    <ol>
        <li>
            <span class="step-num">1</span>
            <span class="step-name">해지계좌 잔액조회</span>
        </li>
        <li class="active">
            <span class="step-num">2</span>
            <span class="step-name">해지계좌 인증 및 계좌이체</span>
        </li>
        <li>
            <span class="step-num">4</span>
            <span class="step-name">해지완료</span>
        </li>
    </ol>
</div>
	<br>
<div class="box-blue-area">
		<dl>
			<dt>안내 및 유의사항</dt>
			<dd>
				<ul>
					<li>입력하신 개인정보는 본인확인용으로 사용되며, 회원가입 완료 전까지 저장되지 않습니다.</li>
					<li>이메일 정보는 회원가입 본인인증 및 비밀번호 찾기 시 사용되오니 반드시 유효한 이메일 주소를 입력하여
						주시기 바랍니다.</li>
				</ul>
			</dd>
		</dl>
	</div>
	<br>
	<h2 align="center">계좌 비밀번호 확인</h2>
	<div class="table-wrap">
		<table class="table-verti half">
			<caption>해지계좌 비밀번호 확인</caption>
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: *;" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="col">해지계좌</th>
					<td scope="col">
						<form name ="sendAccount" method="post">
							<input type="text" id="cancleAcc" name="accountNo" readonly="readonly" value="${accountNo}">
						</form>
					</td>
				</tr>
				<tr>
					<th>계좌비밀번호</th>
					<td><input type="password" id="canclePwd"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<h2 align="center">잔액 계좌이체</h2>
	<div class="table-wrap">
    <table class="table-verti half">
        <caption>해지 계좌이체</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">보낼 은행</th>
                <td scope="col">
                	<div class="item-select">
                        <select name="bankName" id="">
                            <option>선택</option>
                            <option>ssb</option>
                            <option>저기은행</option>
                            <option>여기은행</option>
                        </select>
                    </div>
                    </td>
            </tr>
            <tr>
                <th>계좌번호 </th>
                <td><input type="text" id="accountNo"></td>
            </tr>
        </tbody>
    </table>
</div>
	<br>
	<div class="btn-area">
		<a href="javascript:location.href='<%=cp%>/financial/account" class="btn-type-gray1 big">취소</a> 
		<a id="cancleCheck"class="btn-type-blue1 big">확인</a>
	</div>	
</div>