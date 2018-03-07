<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	
<h1>예금신규가입</h1>
<div class="step-area">
    <ol>
        <li class="active">
            <span class="step-num">1</span>
            <span class="step-name">이용약관동의</span>
        </li>
        <li>
            <span class="step-num">2</span>
            <span class="step-name">정보입력</span>
        </li>
        <li>
            <span class="step-num">3</span>
            <span class="step-name">가입완료</span>
        </li>
    </ol>
</div>
<div class="box-blue-area mb10">
    <dl>
        <dt>안내 및 유의사항</dt>    
        <dd>
            <ul>
                <li>입력하신 개인정보는 본인확인용으로 사용되며, 회원가입 완료 전까지 저장되지 않습니다.</li>
                <li>이메일 정보는 회원가입 본인인증 및 비밀번호 찾기 시 사용되오니 반드시 유효한 이메일 주소를 입력하여 주시기 바랍니다.</li>
            </ul>
        </dd>
    </dl>
</div>


<div class="info-area mb10">
    <span class="info-area-tit">쌍용은행 홈페이지 회원 서비스 이용약관</span>
    <a href="#" class="btn-type-gray medium fr">보기</a>
    <div class="box-agree">
        <ul>
            <li>
                <span class="box-agree-tit">홈페이지 회원 서비스 이용약관에 동의하십니까?</span>
                <div class="item-checkbox">
                    <input type="checkbox" id="fdn0001-01">
                    <label for="fdn0001-01">예, 동의합니다</label>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="info-area mb10">
    <span class="info-area-tit">쌍용은행 홈페이지 회원 서비스 이용약관</span>
    <a href="#" class="btn-type-gray medium fr">보기</a>
    <div class="box-agree">
        <ul>
            <li class="fdn">
                <span class="box-agree-tit">홈페이지 회원 서비스 이용약관에 동의하십니까?</span>
                <div class="item-checkbox">
                    <input type="checkbox" id="fdn0001-02" value="true" name="newOk" checked>
                    <label for="fdn0001-02">예, 동의합니다</label>
                    <input type="checkbox" id="fdn0001-03" value="false" name="newOk">
                    <label for="fdn0001-03">아니요, 동의하지 않습니다.</label>
                </div>
            </li>
        </ul>
    </div>
</div>

<div class="btn-area">
    <a href="javascript:location.href='<%=cp%>/financial/account" class="btn-type-gray1 big">취소</a>
    <a id="nextAccount" class="btn-type-blue1 big">확인</a>
</div>

</div>

<script>
$(function(){
	//확인버튼 클릭이벤트가 나타 났을 경우
	$("#nextAccount").click(function(event){
		event.preventDefault();
		if($("#fdn0001-01").prop("checked") && $("input[name=newOk]:checked").val()=="true"){
			location.href="<%=cp %>/financial/account/fdn0002";
		}
	});
});
</script>