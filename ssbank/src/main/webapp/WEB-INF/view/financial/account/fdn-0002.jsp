<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script>
function sendOk(){

	var f = document.newAccInfo;
	
	//비밀번호 숫자만 가능
	if(!/^(\d+)$/.test(f.accountPwd.value.trim())) {
        alert("숫자만 가능합니다. ");
        f.accountPwd.focus();
        return;
    }
	//비밀번호 확인
	if(f.accountPwd.value != f.accountPwdCh.value){
		aler('비밀번호가 틀립니다.');
		f.accountPwd.focus();
		return;
	}
	//주민번호 체크
	var ssn1 = f.ssn1.value;
	var ssn2 = f.ssn2.value;
	if(!isValidResidentNO(ssn1,ssn2)){
		alert('주민번호가 유효하지 않습니다.');
		f.ssn1.focus();
		return;
	}
	
	f.action = "<%=cp%>/financial/account/accountNew"
	f.submit();
}

function isValidResidentNO(ssn1, ssn2) {
    var days = new Array (31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

    var check = new Array (2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5);
    var ssn = new Array(13);
    var temp, year, month, day, tot, chkNum, i;

    if((ssn1.length != 6) || (ssn2.length != 7))
        return false;

    for(i = 0; i< 13; i++) {
        if(i < 6)
            ssn[i] = parseInt(ssn1.charAt(i));
        else
            ssn[i] = parseInt(ssn2.charAt(i-6));
    }

    temp = ssn1.substr(0, 2);
    if(temp.charAt(0) == '0')
        temp = temp.charAt(1);
    year = parseInt(temp);

    if(ssn[6] == 1 || ssn[6] == 2)
        year = year + 1900;
    else
        year = year + 2000;

    temp = ssn1.substr(2, 2);
    if(temp.charAt(0) == '0')
        temp = temp.charAt(1);
    month = parseInt(temp);

    if(ssn[6] < 1 || ssn[6] > 4)
        return false;

    temp = ssn1.substr(4, 2);
    if(temp.charAt(0) == '0')
        temp = temp.charAt(1);
    day = parseInt(temp);

    if(year%4==0 && year%100!=0 || year%400==0)
        days[1]=29;
    else
        days[1]=28;

    if(month < 1 || month > 12)
        return false;

    if(day > days[month-1] || day < 1)
        return false;

    tot=0;
    for(i=0; i<12; i++)
        tot = tot + ssn[i] * check[i];
    chkNum = 11 - tot % 11;
    chkNum = chkNum % 10;

    if(chkNum != ssn[12])
        return false;
    return true;
}	
		
</script>
<div class="content">
<div class="step-area">
    <ol>
        <li>
            <span class="step-num">1</span>
            <span class="step-name">이용약관동의</span>
        </li>
        <li class="active">
            <span class="step-num">2</span>
            <span class="step-name">정보입력</span>
        </li>
        <li>
            <span class="step-num">3</span>
            <span class="step-name">가입완료</span>
        </li>
    </ol>
</div>

<div class="box-gray-area mb10">
    <dl>
        <dt>알아두세요</dt>
        <dd>
            <ul>
                <li>만 14세 미만의 고객은 회원가입시 ‘정보통신망 이용촉진 및 정보등에 관한 법률’ 및 “개인정보취급방침”에 따라 법정대리인의 정보활용 동의가 필요합니다.</li>
                <li>당행 영업점을 통한 보호자분의 홈페이지 회원 법정대리인 등록이 완료된 고객에 한하여 회원등록이 가능하므로 홈페이지 회원 정대리인 등록이 안된 고객님의 보호자분께서는 먼저 가까운 영업점을 방문해 주시기 바랍니다.</li>
                <li><em>구비서류 : 보호자(법정대리인) 실명확인 증표, 본인과 법정대리인의 관계입증 서류 (주민등록등본 혹은 가족관계증명서)</em></li>
            </ul>
        </dd>
    </dl>
</div>


<div class="table-wrap">
<form name="newAccInfo" method="post" >
    <table class="table-verti">
        <caption>회원가입 정보입력</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        
        <tbody>
        	<tr>
        		<th scope="col">상품명</th>
                <td scope="col"><input type="text" class="" readonly="readonly" value="${productIdx}"></td>
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
                <td><input type="password" name="accountPwd" class=""></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" name="accountPwdCh" class=""></td>
            </tr>
            <tr>
                <th>주민번호</th>
                <td><input type="text" class="" id="jumin1" name="ssn1"> - <input type="text" id="jumin2" name="ssn2"></td>
                <td><!-- 버튼하나 --></td>
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
    <a href="javascript:location.href='<%=cp%>/financial/account" class="btn-type-gray1 big">취소</a>
    <a href="javascript:sendOk();" class="btn-type-blue1 big">확인</a>
</div>
</div>

