<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<div class="content">
	<!-- jsp body 영역 -->
	<h1>
		<c:if test="${mode == 'created' }">개인회원가입</c:if>
		<c:if test="${mode == 'update' }">나의 회원정보</c:if>
	</h1>
	<form name="memberInfo" method="POST">
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
					<li class="active">
						<span class="step-num">2</span>
						<span class="step-name">
							<c:if test="${mode== 'created' }">정보 입력</c:if>
							<c:if test="${mode== 'update' }">내 정보</c:if>
						</span>
					</li>
					<li>
						<span class="step-num">3</span>
						<span class="step-name">
							<c:if test="${mode== 'created' }">가입 완료</c:if>
							<c:if test="${mode== 'update' }">수정 완료</c:if>
						</span>
					</li>
				</ol>
			</div>
			<c:if test="${mode == 'created'}">
				<div class="box-blue-area">
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
			</c:if>
			
			<h2>회원 정보</h2>
			<div class="table-wrap">
				
				<table class="table-verti">
					<caption>회원 정보</caption>
					<colgroup>
						<col style="width:20%;"/>
						<col style="width:*;"/>
					</colgroup>
					<tbody>
						<tr>
							<c:choose>
								<c:when test="${mode == 'created' }">
									<th scope="col">성 / 이름</th>
									<td scope="col"><input type="text" name="lastName" > / <input type="text" name="firstName" ></td>
								</c:when>
								<c:otherwise>
									<th scope="col">이름</th>
									<td scope="col"><input type="text" name="userName" class="modiTarget" readonly value="${sessionScope.member.userName }">
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<c:choose>
									<c:when test="${mode == 'created'}">
										<input type="text" name="email1"  >
										<span>@</span>
										<input type="text" name="email2" >
										<div class="item-select">
											<select name="emailSelect">
												<option value="">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanmail.com">hanmail.com</option>
											</select>
										</div>
										<span class="check-false">이미 존재하는 이메일입니다.</span>
										<span class="check-true">가입가능한 이메일입니다.</span>
									</c:when>
									<c:otherwise>
										<input type="text" name="userId" class="modiTarget" readonly value="${sessionScope.member.userId }">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" id="zip" name="zipCode"  style="width: 80px;" maxlength="5" readonly>
								<a href="#" id="btnPostCode" class="btn-type-gray medium" onclick="daumPostcode();">우편번호 찾기</a><br>
								<input type="text" id="addr1" name="addr1"  style="width: 100%; margin-top: 8px;">
								<input type="text" id="addr2" name="addr2"  style="width: 100%; margin-top: 8px;">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="userPwd" ></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" name="userPwd-confirm" >
								<span class="check-false">비밀번호 불일치</span>
								<span class="check-true">비밀번호 일치</span>
							</td>
						</tr>
						<c:if test="${mode == 'created'}">
							<tr>
								<th>주민등록번호</th>
								<td>
									<input type="text" name="ssn1" maxlength="6">-<input type="text" name="ssn2" maxlength="7">
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" id="date" name="birth" readonly></td>
							</tr>
						</c:if>
						
						<tr>
							<th>휴대폰</th>
							<td>
								<div class="item-select">
									<select name="tel1" class="item-select-tel">
										<option value="">선택</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
								</div>
								<span> - </span>
								<input type="text" name="tel2"  style="width: 120px;" maxlength="4">
								<span> - </span>
								<input type="text" name="tel3"  style="width: 120px;" maxlength="4">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn-area">
			    <a href="javascript:history.back()" class="btn-type-gray1 big">취소</a>
			    <a href="" id="memberSubmit" class="btn-type-blue1 big">확인</a>
			</div>
		</div>
	</form>
	<!-- //jsp body 영역 -->
</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>	
<c:if test="${mode == 'created'}">
	var lastName = $("input[name=lastName]");
	var firstName = $("input[name=firstName]");
	var email1 = $("input[name=email1]");
	var email2 = $("input[name=email2]");
	var birth = $("input[name=birth]");
	var ssn1 = $("input[name=ssn1]");
	var ssn2 = $("input[name=ssn2]");
</c:if>

var zipCode = $("input[name=zipCode]");
var addr1 = $("input[name=addr1]");
var addr2 = $("input[name=addr2]");
var userPwd = $("input[name=userPwd]");
var userPwdConfirm = $("input[name=userPwd-confirm]");
var tel1 = $("select[name=tel1]");
var tel2 = $("input[name=tel2]");
var tel3 = $("input[name=tel3]");

$(function(){
	
	<c:if test="${mode == 'update'}">
	readMemberInfo();
	</c:if>
	
	
	/* 회원가입 또는 수정 */
	$("#memberSubmit").click(function(event){
		allInputTrim();
		
		if(validInfoCheck()){
			var form = $("form[name=memberInfo]");
			
			var mode = "${mode}";
			var url = "<%= cp %>/member";
			var data = form.serialize();
			if(mode == "update"){
				url += "/memberModiSubmit";
				data += "&memberIdx=${sessionScope.member.memberIdx}";
			} else if(mode == "created"){
				url += "/memberJoinSubmit";
			}
			
			$.ajax({
				url:url,
				type:"POST",
				data:data,
				dataType:"json",
				success: function(data) {
					if(data.status == "success"){
						$(form).attr("action", "<%= cp%>/member/submitOK?mode="+mode);
						$(form).submit();
						return;
					} else {
						if(mode == "update"){
							alert("정보수정에 실패했습니다.");
						} else if(mode == "created"){
							alert("회원가입에 실패했습니다.");
						}
						return;
					}
				},
				error: function(e) {
					console.log(e.responseText);
				}
			});
		}
		event.preventDefault();
	});
	
	/* 입력한 비밀번호와 입력한 확인용 비밀번호 비교 */
	userPwdConfirm.keyup(function(){
		if(userPwd.val() == userPwdConfirm.val()){
			$(this).parent().find('.check-false').hide();
			$(this).parent().find('.check-true').show();
			$(this).css("border-color", 'blue');
		} else {
			$(this).parent().find('.check-false').show();
			$(this).parent().find('.check-true').hide();
			$(this).css("border-color", 'red');
		}
	});
	
	$("select[name=emailSelect]").change(function(){
		if($(this).val() != ''){
			$("input[name=email2]").val($(this).val());
			$("input[name=email2]").attr("readonly",true);
		} else {
			$("input[name=email2]").val("");
			$("input[name=email2]").attr("readonly",false);
		}
	});
	
	$("input[name=ssn1]").keyup (function () {
        var charLimit = $(this).attr("maxlength");
        if (this.value.length >= charLimit) {
    		
			$(this).next('input').focus();
			return false;
        }
    });
	
	$("input[name=ssn2]").keyup (function () {

        	// 주민번호 첫쨰자리에서 년,월,일 값을 가져오기
    		var year = $("input[name=ssn1]").val().substring(0,2);
    		var month = $("input[name=ssn1]").val().substring(2,4);
    		var day = $("input[name=ssn1]").val().substring(4,6);

    		if($(this).val().charAt(0) == 1 || $(this).val().charAt(0) == 2){
    			year = "19"+year;
    			$("input[name=birth]").val(year+"-"+month+"-"+day);
    		} else if ($(this).val().charAt(0) == 3 || $(this).val().charAt(0) == 4){
			year = "20"+year;
			$("input[name=birth]").val(year+"-"+month+"-"+day);
		} else {
			$(this).val("");
		}
			
    		
    });
});

function validInfoCheck(){
	
	<c:if test="${mode == 'created'}">
	if(! lastName.val().trim()){
		 
		alert("성이 입력되지 않았습니다.");
			 
		lastName.focus();
			 
		return false;
		 
	}
	 
	  
	 
	if(! firstName.val().trim()){
		 
		alert("이름이 입력되지 않았습니다.");
			 
		firstName.focus();
			 
		return false;
	
	}
	 
	
	if(! ssn1.val().trim() || ! ssn2.val().trim() ){
		alert("주민번호가 제대로 입력되지 않았습니다.");
		
		if(! ssn1.val().trim() || ssn1.val().trim().size() != ssn1.attr("maxlength"))
			ssn1.focus();
		else if(! ssn2.val().trim() || ssn2.val().trim().size() != ssn2.attr("maxlength"))
			ssn2.focus();
		
		return false;
	}
	
	
	if(! birth.val().trim()){
		alert("생일이 입력되지 않았습니다.");
		if(! birth.val().trim())
			birth.focus();
		
		return false;
	}
	
	
	
	
	if(! email1.val().trim() || ! email2.val().trim()){
		alert("이메일이 입력되지 않았습니다.");
		if(! email1.val().trim()){
			email1.focus();
			return false;
		}
			
		
		if(! email2.val().trim()){
			email2.focus();
			return false;
		}
	}
	
	if(! userPwd.val().trim()){
		 
		alert("비밀번호가 입력되지 않았습니다.");
	 
		if(! userPwd.val().trim())
	 
		userPwd.focus();
	 
		return false;
	}
	 
	  
	 
	if(! userPwdConfirm.val().trim()){
	 
		alert("확인용 비밀번호가 입력되지 않았습니다.");
	 
		if(! userPwdConfirm.val().trim())
	 
		userPwdConfirm.focus();
		
		return false;
	}
	 
	</c:if>
	
	
	if(! zipCode.val().trim() || ! addr1.val().trim()){
		alert("주소가 입력되지 않았습니다.");
		
		if(! zipCode.val().trim()){
			$("#btnPostCode").focus();
			return false;
		}
			
		
		if(! addr1.val().trim()){
			addr1.focus();
			return false;
		}
	}
	
	if(! addr2.val().trim()){
		alert("주소가 입력되지 않았습니다.");
		if(! addr2.val().trim())
			addr2.focus();
		
		return false;
	}
	
	if( userPwd.val().trim() != "" || userPwdConfirm.val().trim() != "" ) {
		if(! (userPwd.val().trim() == userPwdConfirm.val().trim()) ){
			alert("입력한 비밀번호와 확인용 비밀번호가 일치하지 않습니다.");
			if(! userPwd.val().trim()){
				userPwd.focus();	
			}
			
			return false;
		}	
	}
	
	if(! tel1.select().val() || ! tel2.val().trim() || ! tel3.val().trim()){
		alert("연락처가 입력되지 않았습니다.");
		
		if(! tel1.val().trim()){
			tel1.focus();
			return false;
		}
			
		if(! tel2.val().trim()){
			tel2.focus();
			return false;
		}
		
		if(! tel3.val().trim()){
			tel3.focus();
			return false;
		}
	}
	
	return true;
}


/* 다음 주소 api */
function daumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
						: '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('addr1').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('addr2').focus();
		}
	}).open();
}

function readMemberInfo(){
	var url = "<%= cp %>/member/readMemberInfo";
	var query = "memberIdx=${sessionScope.member.memberIdx}";

	$.ajax({
		url		: url,
		type		: "GET",
		data		: query,
		dataType	: "json",
		success	: function(data) {
			if(data != null){
				$("input[name=zipCode]").val(data.member.ZIPCODE);
				$("input[name=addr1]").val(data.member.ADDR1);
				$("input[name=addr2]").val(data.member.ADDR2);
				$("input[name=birth]").val(data.member.BIRTH);
				
				var telInfo = (data.member.TEL).split("-");
				$("select[class=item-select-tel]").val(telInfo[0]);
				$("input[name=tel2]").val(telInfo[1]);
				$("input[name=tel3]").val(telInfo[2]);
			}
		},
		error	: function(e) {
			console.log(e.responseText);
		}
	});
}
</script>
