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
		<c:if test="${mode== 'created' }">개인회원가입</c:if>
		<c:if test="${mode== 'update' }">나의 회원정보</c:if>
	</h1>
	<form name="entryInfo" method="post">
		<div class="page-con">
			<div class="step-area">
				<ol>
					<li>
						<span class="step-num">1</span>
						<span class="step-name">
							<c:if test="${mode== 'created' }">개인회원가입</c:if>
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
							<th scope="col">성 / 이름</th>
							<td scope="col"><input type="text" name="lastName" class="" ${mode == 'created' ? '' : 'readonly'}> / <input type="text" name="firstName" class="" ${mode == 'created' ? '' : 'readonly'}></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<c:if test="${mode == 'created'}">
									<input type="text" name="email1" class="" >
									<span>@</span>
									<input type="text" name="email2" class="">
									<div class="item-select">
										<select name="item-select-email">
											<option>직접입력</option>
											<option>naver.com</option>
											<option>gmail.com</option>
											<option>hanmail.com</option>
										</select>
									</div>
									<span class="check-false">이미 존재하는 이메일입니다.</span>
									<span class="check-true">가입가능한 이메일입니다.</span>
								</c:if>
								<c:if test="${mode == 'update'}">

								</c:if>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" id="zip" name="zipCode" class="" style="width: 80px;" maxlength="5" readonly>
								<a href="#" id="btnPostCode" class="btn-type-gray medium" onclick="daumPostcode();">우편번호 찾기</a><br>
								<input type="text" id="addr1" name="addr1" class="" style="width: 100%; margin-top: 8px;">
								<input type="text" id="addr2" name="addr2" class="" style="width: 100%; margin-top: 8px;">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="userPwd" class=""></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" name="userPwd-confirm" class="">
								<span class="check-false">비밀번호 불일치</span>
								<span class="check-true">비밀번호 일치</span>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" class="" id="date" name="birth"></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td>
								<div class="item-select">
									<select name="tel1">
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
								<input type="text" name="tel2" class="" style="width: 120px;" maxlength="4">
								<span> - </span>
								<input type="text" name="tel3" class="" style="width: 120px;" maxlength="4">
								<!-- <div class="item-checkbox">
									<input type="checkbox" id="mbj0002-03">
									<label for="mbj0002-03">없음</label>
								</div>
								<span><em>* 휴대폰 없으신 분은 '없음' 선택</em></span> -->
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn-area">
			    <a href="javascript:history.back()" class="btn-type-gray1 big">취소</a>
			    <a href="" id="memberJoin" class="btn-type-blue1 big">확인</a>
			</div>
		</div>
	</form>
	<!-- //jsp body 영역 -->
</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>	
var lastName = $("input[name=lastName]");
var firstName = $("input[name=firstName]");
var email1 = $("input[name=email1]");
var email2 = $("input[name=email2]");
var zipCode = $("input[name=zipCode]");
var addr1 = $("input[name=addr1]");
var addr2 = $("input[name=addr2]");
var userPwd = $("input[name=userPwd]");
var userPwdConfirm = $("input[name=userPwd-confirm]");
var birth = $("input[name=birth]");
var tel1 = $("select[name=tel1]");
var tel2 = $("input[name=tel2]");
var tel3 = $("input[name=tel3]");

$(function(){
	
	$("#memberJoin").click(function(event){
		event.preventDefault();
		
		if(validInfoCheck()){
			var form = document.entryInfo;
			
			var mode = "${mode}";
			if(mode == "created"){
				form.action = "<%=cp%>/member/memberJoin";
			} else {
				
			}
			form.submit();
		}
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
});

function validInfoCheck(){

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
	
	if(! birth.val().trim()){
		alert("생일이 입력되지 않았습니다.");
		if(! birth.val().trim())
			birth.focus();
		
		return false;
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




/* DatePicker를 통한 날짜 입력 */
$(function(){
	
	$("#date").datepicker({
		showOn:"button"
		,buttonImage:"<%=cp %>/resource/images/ico_calendar.png"
		,buttonImageOnly:true
	});
	
	$(".ui-datepicker-trigger").css({
		position:"absolute", width:"32px", height:"32px"
	});
	
});

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

<%-- function memberOk() {
	var f = document.memberForm;
	var str;

	str = f.userId.value;
	str = str.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}
	f.userId.value = str;

	str = f.userPwd.value;
	str = str.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value = str;

	if(str!= f.userPwdCheck.value) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwdCheck.focus();
        return;
	}
	
    str = f.userName.value;
	str = str.trim();
    if(!str) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    f.userName.value = str;

    str = f.birth.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel2.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email1.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }

    var mode="${mode}";
    
    if(mode=="created")
   		f.action = "<%=cp%>/member/member";
	else
   		f.action = "<%=cp%>/member/update";

    f.submit();
}

function changeEmail() {
	
    var f = document.memberForm;
	    
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

function userIdCheck() {
	var str = $("#userId").val();
	str = str.trim();
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		$("#userId").focus();
		return;
	}
	
	var url="<%=cp%>/member/userIdCheck";
		var q = "userId=" + str;

		$.ajax({
			type : "post",
			url : url,
			data : q,
			dataType : "json",
			success : function(data) {
				var p = data.passed;
				if (p == "true") {
					var s = "<span style='color:blue;font-weight:bold;'>" + str
							+ "</span> 아이디는 사용 가능합니다.";
					$("#userId").parent().next(".help-block").html(s);
				} else {
					var s = "<span style='color:red;font-weight:bold;'>" + str
							+ "</span> 아이디는 사용할 수 없습니다.";
					$("#userId").parent().next(".help-block").html(s);
					$("#userId").val("");
					$("#userId").focus();
				}
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});

	} --%>
</script>
