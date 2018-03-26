<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<h1>대출 신규가입</h1>
<div class="step-area">
    <ol>
        <li>
            <span class="step-num">1</span>
            <span class="step-name">이용약관동의</span>
        </li>
        <li  class="active">
            <span class="step-num">2</span>
            <span class="step-name">정보입력</span>
        </li>
        <li>
            <span class="step-num">3</span>
            <span class="step-name">가입완료</span>
        </li>
    </ol>
</div>
<br>
<div class="table-wrap">
<form name="newloanInfo" method="post" >
    <table class="table-verti">
        <caption>회원가입 정보입력</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        
        <tbody>
        	<tr>
        		<th scope="col">상품명</th>
                <td scope="col"><input type="text" class="" readonly="readonly" value="${productName}"></td>
        	</tr>
        	<tr>
        		<th scope="col">대출금액</th>
                <td scope="col"><input type="text" name="lendMoney" ></td>
        	</tr>
            <tr>
                <th scope="col">성명</th>
                <td scope="col"><input type="text" name="name" class="" readonly="readonly" value="${info.name}"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="text" name="userId" class="" readonly="readonly" value="${info.userId}">
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                     <input type="text" name="zipCode" class="" style="width: 80px;" maxlength="5" readonly="readonly" value="${info.zipCode }"><br>
                     <input type="text" name="addr1" style="width: 100%; margin-top: 8px;"readonly="readonly" value="${info.addr1 }">
                     <input type="text" name="addr2" style="width: 100%; margin-top: 8px;"readonly="readonly" value="${info.addr2}">
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="loanPwd" class=""></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" name="loanPwdCh" class=""></td>
            </tr>
            <tr>
                <th>주민번호</th>
                <td><input type="text" class="" id="jumin1" name="ssn1"> - <input type="password" id="jumin2" name="ssn2"></td>
                <td>${msg}</td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td><input type="text" name="tel" value="${info.tel}" readonly="readonly"></td>
            </tr>
        </tbody>
    </table>
    </form>
</div>
<div class="btn-area">
    <a href="javascript:location.href='<%=cp%>/financial/loan'" class="btn-type-gray1 big">취소</a>
    <a href="javascript:loanOk(${productIdx});" class="btn-type-blue1 big">확인</a>
</div>
</div>
<script>
function loanOk(productIdx){
	
	var f = document.newloanInfo;

	if(parseInt(f.lendMoney.value) > parseInt('3000000')){
		alert("대출한도 금액이 초과되었습니다.");
		f.lendMoney.focus();
	    return;
	}
	//비밀번호 숫자만 가능
	if(!/^(\d+)$/.test(f.loanPwd.value.trim())) {
        alert("숫자만 가능합니다. ");
        f.loanPwd.focus();
        return;
    }
	//비밀번호 확인
	if(f.loanPwd.value != f.loanPwdCh.value){
		aler('비밀번호가 틀립니다.');
		f.loanPwd.focus();
		return;
	}
	
	f.action = "<%=cp%>/financial/loan/loanNew?productIdx="+productIdx;
	f.submit();
 
}
</script>