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
                <li>지나친 대출은 가계를 위협할 수 있습니다.</li>
                <li>대출취급 시, 고객님 부담으로 인지세(50%)의 부대비용이 발생할 수 있습니다.</li>
                <li>금융기간 신용관리대상자 등 여신부적격자에 대하여 대출이 제한될 수 있습니다.</li>
                <li>인터넷 및 모바일에서의 대출신청은 통합하여 1일1회,3개월 5회 가능하며 대출 신청 결과는 신청 당일만 유효합니다.</li>
            </ul>
        </dd>
    </dl>
</div>


<div class="info-area mb10">
    <span class="info-area-tit">ssb대출 금융상품 가입 이용약관</span>
    <a href="#" class="btn-type-gray medium fr">보기</a>
    <div class="box-agree">
        <ul>
            <li>
                <span class="box-agree-tit">ssb대출 금융상품 가입 동의하십니까?</span>
                <div class="item-checkbox">
                    <input type="checkbox" id="rbs0001-01">
                    <label for="rbs0001-01">예, 동의합니다</label>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="info-area">
    <span class="info-area-tit">[필수] 개인정보 수집·이용 동의서</span>
    <a href="#" class="btn-type-gray medium fr">보기</a>
    <p class="info-area-sub">개인정보 수집·이용동의서를 확인하시고 개인정보 및 고유식별정보 수집·이용에 동의하셔야 합니다.</p>
    <div class="box-agree">
        <ul>
            <li>
                <span class="box-agree-tit">쌍용은행이 본인의 개인정보를 수집·이용하는 것에 동의합니다.</span>
                <div class="item-radio">
                    <input type="radio" id="rbs0001-02" name="newLoan01" value="false" checked>
                    <label for="rbs0001-02">동의하지않음</label>
                </div>
                <div class="item-radio">
                    <input type="radio" id="rbs0001-03" name="newLoan01" value="true">
                    <label for="rbs0001-03">동의함</label>
                </div>
            </li>
            <li>
                <span class="box-agree-tit">쌍용은행이 본인의 고유식별정보를 수집·이용하는 것에 동의합니다.</span>
                <div class="item-radio">
                    <input type="radio" id="rbs0001-04" name="newLoan02" value="false" checked>
                    <label for="rbs0001-04">동의하지않음</label>
                </div>
                <div class="item-radio">
                    <input type="radio" id="rbs0001-05" name="newLoan02" value="true">
                    <label for="rbs0001-05">동의함</label>
                </div>
            </li>
        </ul>
    </div>
</div>

<div class="btn-area">
    <a href="javascript:location.href='<%=cp%>/financial/loan'" class="btn-type-gray1 big">취소</a>
    <a id="nextLoan" class="btn-type-blue1 big">확인</a>
</div>

</div>

<script>
$(function(){
	//확인버튼 클릭이벤트가 나타 났을 경우
	$("#nextLoan").click(function(event){
		if($("#rbs0001-01").prop("checked") && $("input[name=newLoan01]:checked").val()=="true" 
			&& $("input[name=newLoan02]:checked").val()=="true"){
		alert("aa");
			location.href="<%=cp%>/financial/loan/rbs0002?productIdx=${productIdx}";
		}
	});
});
</script>