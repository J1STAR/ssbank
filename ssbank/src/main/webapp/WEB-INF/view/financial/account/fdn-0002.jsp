<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script>
function accountNew(){
	
 var pwd = $(".table-verti[name=pwd]").val();
 var pwdCh = $(".table-verti[name=pwdCh]").val();
 
 if(pwd != pwdCh){
	 alert('비밀번호가 올바르지 않습니다.');
	 pwd.focus();
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
    <table class="table-verti">
        <caption>회원가입 정보입력</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
        	<tr>
        		<th scope="col">상품명</th>
                <td scope="col"><input type="text" class="" readonly="readonly"></td>
        	</tr>
            <tr>
                <th scope="col">성명</th>
                <td scope="col"><input type="text" class="" readonly="readonly" value="${info.name}"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="text" class="" readonly="readonly" value="${info.userId}">
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                     <input type="text" class="" style="width: 80px;" maxlength="5" readonly="readonly" value="${info.zipCode }"><br>
                     <input type="text" class="" style="width: 100%; margin-top: 8px;"readonly="readonly" value="${info.addr1 }">
                     <input type="text" class="" style="width: 100%; margin-top: 8px;"readonly="readonly" value="${info.name}">
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pwd" class=""></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" name="pwdCh" class=""></td>
            </tr>
            <tr>
                <th>주민번호</th>
                <td><input type="text" class="" name="jumin"> - <input type="text" name="jumin"></td>
                <td><!-- 버튼하나 --></td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td><input type="text" value="${info.tel}" readonly="readonly"></td>
            </tr>
        </tbody>
    </table>
</div>
<div class="btn-area">
    <a href="javascript:location.href='<%=cp%>/financial/account" class="btn-type-gray1 big">취소</a>
    <a onclick="javascript:accountNew()';" class="btn-type-blue1 big">확인</a>
</div>
</div>

