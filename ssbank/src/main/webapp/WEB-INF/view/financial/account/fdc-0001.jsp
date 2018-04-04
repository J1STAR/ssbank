<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script>

function cancle(){
	var account = $("#myAcc option:checked").val();
	console.log(account);
	var url ="<%=cp%>/financial/account/fdc0002?accountNo="+account;
	location.href=url;
}
$(function(){
	$("#myAcc").change(function(){
		var accountNo = $(this).val();
		var url="<%=cp%>/financial/account/balance";
		var q="accountNo="+accountNo;
		$.ajax({
			type:"post"
			,url:url
			,data:q
			,dataType:"json"
			,success:function(data){
				var s = data.balance;
				$("#myBalance").val(s);
			}
			,error:function(){
				console.log(e.responseText);
			}
		});
	});
})
</script>
<!-- 해지조회 -->
<div class="content">
<br>
<div class="step-area">
    <ol>
        <li class="active">
            <span class="step-num">1</span>
            <span class="step-name">해지계좌 잔액조회</span>
        </li>
        <li>
            <span class="step-num">2</span>
            <span class="step-name">해지계좌 인증</span>
        </li>
        <li>
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
<div class="box-gray-area">
    <dl>
        <dt>※주의※</dt>
        <dd>
            <ul>
                <li>해지가 될 경우 다시 복원되지 않습니다.</li>
                <li>아래 약관을 동의 하지 않을 경우 해지가 불가합니다.</li>
                <li>만 14세 미만의 고객은 영업장에서만 해지 가능합니다..</li>
                <li><em>구비서류 : 보호자(법정대리인) 실명확인 증표, 본인과 법정대리인의 관계입증 서류 (주민등록등본 혹은 가족관계증명서)</em></li>
            </ul>
        </dd>
    </dl>
</div>
<br>
<div class="table-wrap">
    <table class="table-verti half">
        <caption>통장해지</caption>
        <colgroup>
            <col style="width:35%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">해지계좌 선택</th>
                <td scope="col">
                	<div class="item-select">
                        <select name="myAccount" id="myAcc">
                        	<option>계좌선택</option>
                        	<c:forEach var="dto" items="${account}">
                            <option value="${dto.accountNo}">${dto.accountNo}</option>
                            </c:forEach>
                        </select>
                    </div>
                 </td>
            </tr>
            <tr>
                <th>잔액</th>
                <td><input type="text" id="myBalance" readonly="readonly"></td>
            </tr>
        </tbody>
    </table>
</div>
<div class="btn-area">
    <a onclick="javascript:location.href='<%=cp%>/financial/account" class="btn-type-gray1 big">취소</a>
    <a onclick="javascript:cancle();" class="btn-type-blue1 big">확인</a>
</div>

</div>