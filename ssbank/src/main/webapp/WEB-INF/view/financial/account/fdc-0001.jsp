<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script>

</script>
<!-- 해지조회 -->
<div class="content">

<div class="box-gray-area">
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
    <table class="table-verti half">
        <caption>회원가입 완료</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">해지계좌 선택</th>
                <td scope="col">
                	<div class="item-select">
                        <select name="myAccount" id="">
                            <option>선택</option>
                            <option>선택</option>
                        </select>
                    </div>
                 </td>
            </tr>
            <tr>
                <th>잔액</th>
                <td></td>
            </tr>
        </tbody>
    </table>
</div>
<div class="btn-area">
    <a href="javascript:history.back()" class="btn-type-gray1 big">취소</a>
    <a href="mbj-0002.html" class="btn-type-blue1 big">확인</a>
</div>

</div>