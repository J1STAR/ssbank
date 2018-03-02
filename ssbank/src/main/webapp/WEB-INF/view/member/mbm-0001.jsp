<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="content">
	<!-- jsp body 영역 -->
	<h1>회원정보 변경</h1>
	<form name="entryInfo" method="post">
		<div class="page-con">
			<div class="step-area">
				<ol>
					<li>
						<span class="step-num">1</span>
						<span class="step-name">비밀번호 확인</span>
					</li>
					<li class="active">
						<span class="step-num">2</span>
						<span class="step-name">내 정보</span>
					</li>
					<li>
						<span class="step-num">3</span>
						<span class="step-name">수정 완료</span>
					</li>
				</ol>
			</div>
			<h2>정보입력</h2>
			<div class="table-wrap">
				<table class="table-verti">
					<colgroup>
						<col style="width:20%;"/>
						<col style="width:*;"/>
					</colgroup>
					<tbody>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="email1" class="">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="userPwd" class=""></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn-area">
			    <a href="javascript:history.back()" class="btn-type-gray1 big">취소</a>
			    <a href="" id="memberInfo" class="btn-type-blue1 big">확인</a>
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
	
	$("#memberInfo").click(function(event){
		event.preventDefault();
		
		if(validInfoCheck()){
			var form = document.entryInfo;
			
			var mode = "${mode}";
			if(mode == "update"){
				form.action = "<%=cp%>/member/memberInfo";
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
</script>