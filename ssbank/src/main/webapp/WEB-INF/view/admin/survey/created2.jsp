<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
input:-moz-read-only { /* For Firefox */
    border:1px solid #999999;
    padding:3px 5px 5px;
    border-radius:4px;
    background-color:#ffffff;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}

input:read-only { 
    border:1px solid #999999;
    padding:3px 5px 5px;
    border-radius:4px;
    background-color:#ffffff;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}

.questionLayout {
   width: 98%;
   min-height: 50px; 
   margin: 10px auto 0px; 
   padding: 5px;
   border: 1px solid #cccccc; 
}

</style>

<script type="text/javascript">
    $(function() {
        $("input[name=startDay]").datepicker();
        $("input[name=endDay]").datepicker();
        
        $("input[name=target]").click(function(){
        	if($(this).val()==3) {
        		$("#btnMemberRole").prop("disabled", false);
        	} else {
        		$("#btnMemberRole").prop("disabled", true);
        	}
        });
        
        $("input[name=accessType]").click(function(){
        	if($(this).val()==2) {
        		$("#pwdInputLayout").show();
        		$("input[name=pwd]").focus();
        	} else {
        		$("#pwdInputLayout").hide();
        	}
        });
    });
    
    // 객관식 문제 추가
    function objectiveAdd() {
    	
    	var out;
    	out="<div class='questionLayout'>";
    	out+="<form name='questionForm' method='post'>";
    	out+="<table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>";
    	out+="<tr style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td colspan='2'>";
    	out+="<div style='float: left; padding: 5px;'>";
    	out+="  <span class='questionNo'>1</span><span>번 : 객관식 문항</span>&nbsp;&nbsp;";
    	out+="  <input type='hidden' name='questionNo'>";
    	out+="  <input type='checkbox' name='required' value='1'>&nbsp;<label>필수응답</label>";
    	out+="</div>";
    	out+="<div style='float: right; padding: 5px;'>";
    	out+="  <button type='button' class='btn btnLast'>▼</button>";
    	out+="  <button type='button' class='btn btnNext'>▽</button>";
    	out+="  <button type='button' class='btn btnPrev'>△</button>";
    	out+="  <button type='button' class='btn btnFirst'>▲</button>";
    	out+="  <button type='button' class='btn' onclick='deleteQuestion(this.form)'>문항삭제</button>";
    	out+="</div>";
    	out+="</td>";
    	out+="</tr>";
    	out+="<tr height='40' style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td width='100' bgcolor='#eeeeee' style='padding-left:5px;'>";
    	out+="응답방식";
    	out+="</td>";
    	out+="<td style='padding-left:5px;'>";
    	out+="<input type='radio' name='answerType' value='1' checked='checked'>&nbsp;<label>단일선택</label>&nbsp;&nbsp;";
    	out+="<input type='radio' name='answerType' value='2'>&nbsp;<label>다중선택</label>&nbsp;&nbsp;";
    	out+="</td>";
    	out+="</tr>";
    	out+="<tr height='40' style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td width='100' valign='top' bgcolor='#eeeeee' style='padding-top:10px; padding-left:5px;'>";
    	out+="질문 내용";
    	out+="</td>";
    	out+="<td style='padding:5px;'>";
    	out+="<p><input type='text' name='question' class='boxTF' style='width:500px;' placeholder='질문을 입력 하세요'></p>";
    	out+="<p style='padding-top:10px; padding-left: 25px;'><input type='text' name='items' class='boxTF' style='width:300px;' placeholder='질문에 대한 항목을 입력 하세요'></p>";
    	out+="</td>";
    	out+="</tr>";
    	out+="<tr height='43'>";
    	out+="<td width='100'>&nbsp;</td>";
    	out+="<td style='padding: 5px;'>";
    	out+="<button type='button' class='btn' onclick='sendQuestion(this.form)'>문항 등록</button>";
    	out+="</td>";
    	out+="</tr>";
    	out+="</table>";
    	out+="</form>";
    	out+="</div>";
    	
    	$('#questionContainer').append(out);
    }
    
    // 주관식 문제 추가
    function subjectiveAdd() {
    	
    	var out;
    	out="<div class='questionLayout'>";
    	out+="<form name='questionForm' method='post'>";
    	out+="<table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>";
    	out+="<tr style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td colspan='2'>";
    	out+="<div style='float: left; padding: 5px;'>";
    	out+="  <span class='questionNo'>2</span><span>번 : 주관식 문항</span>&nbsp;&nbsp;";
    	out+="  <input type='hidden' name='questionNo'>";
    	out+="  <input type='checkbox' name='required' value='1'>&nbsp;<label>필수응답</label>";
    	out+="</div>";
    	out+="<div style='float: right; padding: 5px;'>";
    	out+="  <button type='button' class='btn btnLast'>▼</button>";
    	out+="  <button type='button' class='btn btnNext'>▽</button>";
    	out+="  <button type='button' class='btn btnPrev'>△</button>";
    	out+="  <button type='button' class='btn btnFirst'>▲</button>";
    	out+="  <button type='button' class='btn' onclick='deleteQuestion(this.form)'>문항삭제</button>";
    	out+="</div>";
    	out+="</td>";
    	out+="</tr>";
    	out+="<tr height='40' style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td width='100' bgcolor='#eeeeee' style='padding-left:5px;'>";
    	out+="응답방식";
    	out+="</td>";
    	out+="<td style='padding-left:5px;'>";
    	out+="<input type='radio' name='answerType' value='3' checked='checked'>&nbsp;<label>단답형</label>&nbsp;&nbsp;";
    	out+="<input type='radio' name='answerType' value='4'>&nbsp;<label>서술형</label>&nbsp;&nbsp;";
    	out+="</td>";
    	out+="</tr>";
    	out+="<tr height='40' style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td width='100' valign='top' bgcolor='#eeeeee' style='padding-top:10px; padding-left:5px;'>";
    	out+="질문 내용";
    	out+="</td>";
    	out+="<td style='padding:5px;'>";
    	out+="<p><input type='text' name='question' class='boxTF' style='width:500px;' placeholder='질문을 입력 하세요'></p>";
    	out+="</td>";
    	out+="</tr>";
    	out+="<tr height='43'>";
    	out+="<td width='100'>&nbsp;</td>";
    	out+="<td style='padding: 5px;'>";
    	out+="<button type='button' class='btn' onclick='sendQuestion(this.form)'>문항 등록</button>";
    	out+="</td>";
    	out+="</tr>";
    	out+="</table>";
    	out+="</form>";    	
    	out+="</div>";
    	
    	$('#questionContainer').append(out);
    }
    
    // 질문 가장위, 이전, 다음, 가장아래
    $(function(){
    	 $("body").on("click", ".btnFirst", function(){
    		 var $div=$(this).closest('.questionLayout');
    		 $('#questionContainer').find('.questionLayout:first').before($div);
    		 
    		 questionReNo();
    	 });

    	 $("body").on("click", ".btnPrev", function(){
    		 var $div=$(this).closest('.questionLayout');
    		 $div.prev().before($div);
    		 
    		 questionReNo();
    	 });

    	 $("body").on("click", ".btnNext", function(){
    		 var $div=$(this).closest('.questionLayout');
    		 $div.next().after($div);
    		 
    		 questionReNo();
    	 });

    	 $("body").on("click", ".btnLast", function(){
    		 var $div=$(this).closest('.questionLayout');
    		 $('#questionContainer').find('.questionLayout:last').after($div);
    		 
    		 questionReNo();
    	 });
    });
    
    // 질문 문번호 재작성
	 function questionReNo() {
         var no=1;    	    
		 $("#questionContainer .questionNo").each(function(){
			 $(this).text(no);
			 $(this).siblings("input[name=questionNo]").val(no);
			 no++;
		 });
	 }
    
	 // 객관식 질문에 대한 항목(답안)에서 엔터
    $(function(){
    	$("body").on("keydown", "input[name=items]", function(e){
    		var v;
    		var s;
    		
    		if(e.keyCode==13) {
    			var flag=true;
    			$(this).closest('td').find("input[name=items]").each(function(){
    				v=$(this).val().trim();
    				if(v=="") {
    					flag=false;
        				$(this).focus();
        				return;
        			}
    			});
    			
    			if(! flag) return  false;
    			
    			s="&nbsp;<button type='button' class='btn btnMinus'> - </button>";
    			$(this).after(s);
    			
    			s="<p style='padding-top:10px; padding-left: 25px;'>";
    			s+="<input type='text' name='items' class='boxTF' style='width:300px;' placeholder='질문에 대한 항목을 입력 하세요'>";
    			s+="</p>";
    			
    			$(this).closest('td').append(s);
    			$(this).closest('td').find("input[name=items]:last").focus();
    		}
   	    });
    	
   	    $("body").on("click", ".btnMinus", function(){
		      $(this).parent().remove();
	    });
    });

	// 두날짜 크기 비교
	function isDateCompare(startDay, endDay) {
		if(! startDay || ! endDay || startDay.length!=10 || endDay.length!=10)
			return false;
		
        var startDayArr = startDay.split('-');
        var endDayArr = endDay.split('-');
        
        if(startDayArr.length!=3 || endDayArr.length!=3)
        	return false;
                 
        var startDayCompare = new Date(startDayArr[0], startDayArr[1], startDayArr[2]);
        var endDayCompare = new Date(endDayArr[0], endDayArr[1], endDayArr[2]);
         
        if(startDayCompare.getTime() > endDayCompare.getTime())
            return false;
        
        return true;
	}
	
	// 설문 등록 및 수정 완료
    function sendSurvey() {
        var f = document.surveyForm;
        
        if(! $.trim(f.subject.value)) {
        	alert("설문 제목은 필수 입니다.");
        	f.subject.focus();
        	return;
        }
        
        if(! isDateCompare(f.startDay.value, f.endDay.value)) {
        	alert("날짜는 필수 이며 시작일은 종료일보다 클수 없습니다.");
        	f.startDay.focus();
        	return;
        }
        
        if(f.target.value==3 && !f.memberRole.value) {
        	alert("설문에 응답할 회원등급을 선택하세요.");
        	return;
        }
        
        if(f.accessType.value==2 && $.trim(f.pwd.value).length<4 || $.trim(f.pwd.value).length>10) {
        	alert("비밀번호는 4~10자 사이 입니다.");
        	f.pwd.focus();
        	return;
        }

   		f.action="<%=cp%>/admin/survey/request";
        f.submit();
    }
    
	// 설문 삭제
    function deleteSurvey(surveyNum) {
    	
    }
    
	// 설문에 대한 문항(질문) 등록 및 수정 완료
    function sendQuestion(f) {
    	
    }

	// 설문에 대한 문항(질문) 삭제
	function deleteQuestion(f) {
    	if(! confirm("문항을 삭제 하시 겠습니까 ? "))
    		return;
    	
    	// 테이블에 저장되지 않은 경우
    	if(f.questionNum == undefined || f.questionNum.value==0) {
    		$(f).parent(".questionLayout").remove();
    		return;
    	}
    	
    	// 해당 문항 삭제
    	
    }
</script>

<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 설문등록 </h3>
    </div>
    
    <div>
        <div style="width: 100%; margin: 20px auto 0px; border: 1px #777777 solid; padding: 15px; box-sizing: border-box;">
            <div style="clear:both; height: 25px;">
	            <div style="float: left;"><b>| 기본설정</b></div>
	            <div style="float: right;">
	                 <c:if test="${mode=='update'}">
	                     <button type="button" class="btn" onclick="deleteSurvey('${dto.surveyNum}');">삭제</button>
	                 </c:if>
	                 <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/survey/list?page=${page}';">리스트</button>
	            </div>
            </div>
            
			<form name="surveyForm" method="post">
			  <table style="width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="45" style="border-top: 1px solid #777777; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">설문제목</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}">
			      </td>
			  </tr>

			  <tr align="left" height="45" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">설문기간</td>
			      <td style="padding-left:10px;"> 
			            <input type="text" name="startDay" readonly="readonly" value="${dto.startDay}">
			            ~
			            <input type="text" name="endDay" readonly="readonly" value="${dto.endDay}">
			      </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">설문목적</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" rows="12" class="boxTA" style="width: 95%; height: 60px;">${dto.content}</textarea>
			      </td>
			  </tr>
			  
			  <tr align="left" height="95" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">참여대상</td>
			      <td style="padding-left:10px;">
			          <p style="height: 27px; line-height: 27px;"><input type="radio" name="target" id="target1" value="1" value="1" ${dto.target==1 || mode=='insert' ? "checked='checked'":"" }>&nbsp;<label for="target1">전체(회원+비회원)</label></p>
			          <p style="height: 27px; line-height: 27px;"><input type="radio" name="target" id="target2" value="2" ${dto.target==2 ? "checked='checked'":"" }>&nbsp;<label for="target2">회원전용</label></p> 
			          <p style="height: 27px; line-height: 27px;">
			             <input type="radio" name="target" id="target3" value="3" ${dto.target==3 ? "checked='checked'":"" }>&nbsp;<label for="target3">특정회원등급</label>&nbsp;&nbsp;
			             <button type="button" class="btn" id="btnMemberRole" ${dto.target!=3 || mode=='insert' ? "disabled='disabled'":"" }>등급선택</button>
			             <input type="hidden" name="memberRole" value="${dto.memebrRole}">
		              </p>
			      </td>
			  </tr>

			  <tr align="left" height="60" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">접근제한</td>
			      <td style="padding-left:10px;">
			          <p style="height: 30px;">
			              <span style="display: inline-block; height: 30px; line-height: 30px;">
			                  <input type="radio" name="accessType" id="accessType1" value="1" ${dto.accessType==1 || mode=='insert' ? "checked='checked'":"" }>&nbsp;<label for="accessType1">없음</label>&nbsp;&nbsp;
			                  <input type="radio" name="accessType" id="accessType2" value="2" ${dto.accessType==2 ? "checked='checked'":"" }>&nbsp;<label for="accessType2">있음</label>&nbsp;&nbsp;
			              </span>
			              <span id="pwdInputLayout" style="${dto.accessType==1 || mode=='insert' ? 'display: none;':'display: inline-block;'}">
			                     비밀번호 : <input type="text" name="pwd" class="boxTF" value="${dto.pwd}"> 
			              </span>
			          </p> 
			          <p class="help-block">접근제한 "있음"은 비밀번호를 알고 있는 경우만 설문에 응답할 수 있습니다.</p>
			      </td>
			  </tr>
			
			  <tr align="left" height="60" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">응답검증</td>
			      <td style="padding-left:10px;">
			         <p>
				          <input type="radio" name="verificationType" id="verificationType1" value="1" ${dto.verificationType==1 || mode=='insert' ? "checked='checked'":"" }>&nbsp;<label for="verificationType1">없음</label>&nbsp;&nbsp; 
				          <input type="radio" name="verificationType" id="verificationType2" value="2" ${dto.verificationType==2 ? "checked='checked'":"" }>&nbsp;<label for="verificationType2">아이디</label>&nbsp;&nbsp;
				          <input type="radio" name="verificationType" id="verificationType3" value="3" ${dto.verificationType==3 ? "checked='checked'":"" }>&nbsp;<label for="verificationType3">이메일</label>&nbsp;&nbsp; 
				          <input type="radio" name="verificationType" id="verificationType4" value="4" ${dto.verificationType==4 ? "checked='checked'":"" }>&nbsp;<label for="verificationType4">IP</label>&nbsp;&nbsp; 
				          <input type="radio" name="verificationType" id="verificationType5" value="5" ${dto.verificationType==5 ? "checked='checked'":"" }>&nbsp;<label for="verificationType5">임시번호</label>
			          </p>
			          <p class="help-block">응답 중복 및 응답자 확인을 위해 사용합니다.</p>
			      </td>
			  </tr>

			  <tr align="left" height="60" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">결과보기</td>
			      <td style="padding-left:10px;">
			          <p>
			              <input type="radio" name="resultType" id="resultType1" value="1" ${dto.resultType==1 || mode=='insert' ? "checked='checked'":"" }>&nbsp;<label for="resultType1">미지원</label>&nbsp;&nbsp;
			              <input type="radio" name="resultTye" id="resultType2" value="2" ${dto.resultType==2 ? "checked='checked'":"" }>&nbsp;<label for="resultType2">지원</label>
			          </p> 
			          <p class="help-block">설문참가자에게 설문 결과보기 지원여부를 설정 합니다.</p>
			      </td>
			  </tr>
			
			  <tr align="left" height="60" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">페이지</td>
			      <td style="padding-left:10px;">
			          <p>
			              <input type="radio" name="answerPage" id="answerPage1" value="1" ${dto.answerPage==1 || mode=='insert' ? "checked='checked'":"" }>&nbsp;<label for="answerPage1">이동안함</label>&nbsp;&nbsp;
			              <input type="radio" name="answerPage" id="answerPage2" value="2" ${dto.answerPage==2 ? "checked='checked'":"" }>&nbsp;<label for="answerPage2">이동</label>
			          </p> 
			          <p class="help-block">답변을 기준으로 다음 질문에 대한 페이지 이동여부를 지정합니다.</p>
			      </td>
			  </tr>

			  <tr align="left" height="45" style="border-bottom: 1px solid #777777;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상태</td>
			      <td style="padding-left:10px;">
			          <p>
			              <input type="radio" name="stateType" id="stateType1" value="1" ${mode=="insert" ? "disabled='disabled'":""} ${dto.stateType==1 ? "checked='checked'":"" }>&nbsp;<label for="stateType1">진행</label>&nbsp;&nbsp;
			              <input type="radio" name="stateType" id="stateType2" value="2" ${dto.stateType==2 || mode=='insert' ? "checked='checked'":"" }>&nbsp;<label for="stateType2">대기</label>&nbsp;&nbsp;
			          </p> 
			      </td>
			  </tr>
			  
			  <tr align="right" height="40">
			      <td width="100" style="padding-top: 10px;">
			             <c:if test="${mode=='update'}">
			                     등록일 : ${dto.created}
			             </c:if>
			      </td>
			      <td style="padding-top: 10px;">
			          <c:if test="${mode=='update'}">
			          	   <input type="hidden" name="surveyNum" value="${dto.surveyNum}">
			          </c:if>
			          <input type="hidden" name="page" value="${page}">
			          <button type="button" class="btn" onclick="sendSurvey();">${mode=="update"?"수정완료":"등록하기" }</button> 
			      </td>
			  </tr>
			  
			  </table>
			</form>
		</div>
		
		<div style="width: 100%; margin: 20px auto 0px; border: 1px #777777 solid; padding: 15px; box-sizing: border-box;">
            <div style="clear:both; height: 35px; margin-bottom:15px; border-bottom: 1px solid #777777;">
	            <div style="float: left;"><b>| 설문항목 설정</b></div>
	            <div style="float: right;">
	                 <button type="button" class="btn" onclick="objectiveAdd();">＋객관식 추가</button>
	                 <button type="button" class="btn" onclick="subjectiveAdd();">＋주관식 추가</button>
	            </div>
            </div>
            
            <div id="questionContainer">
            
		            <div class='questionLayout'>
		                <form name='questionForm' method='post'>
		                   <table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>
		                         <tr style='border-bottom: 1px solid #cccccc;'>
		                            <td colspan='2'>
		                                  <div style='float: left; padding: 5px;'>
		                                       <span class='questionNo'>1</span><span>번 : 객관식 문항</span>&nbsp;&nbsp;
		                                       <input type='hidden' name='questionNo'>
		                                       <input type='checkbox' name='required' value='1' checked='checked'>&nbsp;<label>필수응답</label>
		                                   </div>
		                                   <div style='float: right; padding: 5px;'>
		                                       <button type='button' class='btn btnLast'>▼</button>
		                                       <button type='button' class='btn btnNext'>▽</button>
		                                       <button type='button' class='btn btnPrev'>△</button>
		                                       <button type='button' class='btn btnFirst'>▲</button>
		                                       <button type='button' class='btn' onclick='deleteQuestion(this.form)'>문항삭제</button>
		                                   </div>
		                            </td>
		                         </tr>
		                         
		                         <tr height='40' style='border-bottom: 1px solid #cccccc;'>
		                            <td width='100' bgcolor='#eeeeee' align='center'>
		                                        응답방식
		                            </td>
		                            <td style='padding-left:5px;'>
		                                 <input type='radio' name='answerType' value='1' checked='checked'>&nbsp;<label>단일선택</label>&nbsp;&nbsp;
		                                 <input type='radio' name='answerType' value='2'>&nbsp;<label>다중선택</label>&nbsp;&nbsp;
		                            </td>
		                         </tr>
		                         
		                         <tr height='40' style='border-bottom: 1px solid #cccccc;'>
		                            <td width='100' valign='top' bgcolor='#eeeeee' align='center' style='padding-top:10px;'>
		                                        질문내용
		                            </td>
		                            <td style='padding:5px;'>
		                                 <p><input type='text' name='question' class='boxTF' style='width:500px;' placeholder='질문을 입력 하세요'></p>
		                                 <p style='padding-top:10px; padding-left: 25px;'><input type='text' name='items' class='boxTF' style='width:300px;' placeholder='질문에 대한 항목을 입력 하세요'></p>
		                            </td>
		                         </tr>
		                         
		                         <tr height='43'>
		                            <td width='100'>&nbsp;</td>
		                            <td style='padding: 5px;'>
		                                <input type='hidden' name='surveyNum' value='0'>
		                                <input type='hidden' name='questionNum' value='0'>
		                                <button type='button' class='btn' onclick='sendQuestion(this.form)'>문항 등록</button>
		                            </td>
		                         </tr>
		                   </table>
		                </form>
		            </div>
		            
		
		            <div class='questionLayout'>
		                <form name='questionForm' method='post'>
		                   <table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>
		                         <tr style='border-bottom: 1px solid #cccccc;'>
		                            <td colspan='2'>
		                                  <div style='float: left; padding: 5px;'>
		                                       <span class='questionNo'>2</span><span>번 : 주관식 문항</span>&nbsp;&nbsp;
		                                       <input type='hidden' name='questionNo'>
		                                       <input type='checkbox' name='required' value='1' checked='checked'>&nbsp;<label>필수응답</label>
		                                   </div>
		                                   <div style='float: right; padding: 5px;'>
		                                       <button type='button' class='btn btnLast'>▼</button>
		                                       <button type='button' class='btn btnNext'>▽</button>
		                                       <button type='button' class='btn btnPrev'>△</button>
		                                       <button type='button' class='btn btnFirst'>▲</button>
		                                       <button type='button' class='btn' onclick='deleteQuestion(this.form)'>문항삭제</button>
		                                   </div>
		                            </td>
		                         </tr>
		                         
		                         <tr height='40' style='border-bottom: 1px solid #cccccc;'>
		                            <td width='100' bgcolor='#eeeeee' align='center'>
		                                        응답방식
		                            </td>
		                            <td style='padding-left:5px;'>
		                                 <input type='radio' name='answerType' value='3' checked='checked'>&nbsp;<label>단답형</label>&nbsp;&nbsp;
		                                 <input type='radio' name='answerType' value='4'>&nbsp;<label>서술형</label>&nbsp;&nbsp;
		                            </td>
		                         </tr>
		                         
		                         <tr height='40' style='border-bottom: 1px solid #cccccc;'>
		                            <td width='100' valign='top' bgcolor='#eeeeee' align='center' style='padding-top:10px;'>
		                                        질문내용
		                            </td>
		                            <td style='padding:5px;'>
		                                 <p><input type='text' name='question' class='boxTF' style='width:500px;' placeholder='질문을 입력 하세요'></p>
		                            </td>
		                         </tr>
		                         
		                         <tr height='43'>
		                            <td width='100'>&nbsp;</td>
		                            <td style='padding: 5px;'>
		                                <input type='hidden' name='surveyNum' value='0'>
		                                <input type='hidden' name='questionNum' value='0'>
		                                <button type='button' class='btn' onclick='sendQuestion(this.form)'>문항 등록</button>
		                            </td>
		                         </tr>
		                   </table>
		                </form>
		            </div>
		
		
		            <div class='questionLayout'>
		                <form name='questionForm' method='post'>
		                   <table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>
		                         <tr style='border-bottom: 1px solid #cccccc;'>
		                            <td colspan='2'>
		                                  <div style='float: left; padding: 5px;'>
		                                       <span class='questionNo'>3</span><span>번 : 객관식 문항</span>&nbsp;&nbsp;
		                                       <input type='hidden' name='questionNo'>
		                                       <input type='checkbox' name='required' value='1' checked='checked'>&nbsp;<label>필수응답</label>
		                                   </div>
		                                   <div style='float: right; padding: 5px;'>
		                                       <button type='button' class='btn btnLast'>▼</button>
		                                       <button type='button' class='btn btnNext'>▽</button>
		                                       <button type='button' class='btn btnPrev'>△</button>
		                                       <button type='button' class='btn btnFirst'>▲</button>
		                                       <button type='button' class='btn' onclick='deleteQuestion(this.form)'>문항삭제</button>
		                                   </div>
		                            </td>
		                         </tr>
		                         
		                         <tr height='40' style='border-bottom: 1px solid #cccccc;'>
		                            <td width='100' bgcolor='#eeeeee' align='center'>
		                                        응답방식
		                            </td>
		                            <td style='padding-left:5px;'>
		                                 <input type='radio' name='answerType' value='1' checked='checked'>&nbsp;<label>단일선택</label>&nbsp;&nbsp;
		                                 <input type='radio' name='answerType' value='2'>&nbsp;<label>다중선택</label>&nbsp;&nbsp;
		                            </td>
		                         </tr>
		                         
		                         <tr height='40' style='border-bottom: 1px solid #cccccc;'>
		                            <td width='100' valign='top' bgcolor='#eeeeee' align='center' style='padding-top:10px;'>
		                                        질문내용
		                            </td>
		                            <td style='padding:5px;'>
		                                 <p><input type='text' name='question' class='boxTF' style='width:500px;' placeholder='질문을 입력 하세요'></p>
		                                 <p style='padding-top:10px; padding-left: 25px;'><input type='text' name='items' class='boxTF' style='width:300px;' placeholder='질문에 대한 항목을 입력 하세요'></p>
		                            </td>
		                         </tr>
		                         
		                         <tr height='43'>
		                            <td width='100'>&nbsp;</td>
		                            <td style='padding: 5px;'>
		                                <input type='hidden' name='surveyNum' value='0'>
		                                <input type='hidden' name='questionNum' value='0'>
		                                <button type='button' class='btn' onclick='sendQuestion(this.form)'>문항 등록</button>
		                            </td>
		                         </tr>
		                   </table>
		                </form>
		            </div>
		            
             </div>
            
		</div>	
			
    </div>
    
</div>