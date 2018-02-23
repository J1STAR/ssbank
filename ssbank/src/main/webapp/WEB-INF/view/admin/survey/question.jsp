<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.questionLayout {
   width: 98%;
   min-height: 50px; 
   margin: 10px auto 0px; 
   padding: 5px;
   border: 1px solid #cccccc; 
}
.bbtn {
    color:#ffffff;
    font-weight:500;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    border:1px solid #2f3741;
    background-color:#424951;
    text-align:center;
    padding:3px 10px 5px;
    border-radius:4px;    
    
}
.bbtn:hover {
    font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    background-image:none; background: #333; border-color: #333;
    color:#ffffff;
    font-weight: normal;
}
</style>
<script type="text/javascript">
   function login() {
	    location.href="<%=cp%>/member/login";
   }

    // 객관식 문제 추가
    function objectiveAdd() {
    	var flag=true;
    	$("#questionContainer form").each(function(){
    		if($(this).find("input[name=mode]").val()=="insert") {
    			flag=false;
    			return;
    		}
    	});
    	
    	if(! flag) {
    		alert("모든 문항을 등록해야 문항 추가가 가능합니다.");
    		return;
    	}
    	
    	var no=1;
    	if($("input[name=questionNo]")!=undefined) {
    		no=$("input[name=questionNo]").length+1;
    	}
    	
    	var surveyNum="${dto.surveyNum}";
    	var page="${page}";
    	
    	var out;
    	out="<div class='questionLayout'>";
    	out+="<form name='questionForm' method='post'>";
    	out+="<table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>";
    	out+="<tr style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td colspan='2'>";
    	out+="<div style='float: left; padding: 5px;'>";
    	out+="  <span class='questionNo'>"+no+"</span><span>번 : 객관식 문항</span>&nbsp;&nbsp;";
    	out+="  <input type='hidden' name='questionNo' value='"+no+"'>";
    	out+="  <input type='checkbox' name='required' value='1' checked='checked'>&nbsp;<label>필수응답</label>";
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
    	out+="<td width='100' bgcolor='#eeeeee' align='center'>";
    	out+="응답방식";
    	out+="</td>";
    	out+="<td style='padding-left:5px;'>";
    	out+="<input type='radio' name='answerType' value='1' checked='checked'>&nbsp;<label>단일선택</label>&nbsp;&nbsp;";
    	out+="<input type='radio' name='answerType' value='2'>&nbsp;<label>다중선택</label>&nbsp;&nbsp;";
    	out+="</td>";
    	out+="</tr>";
    	out+="<tr height='40' style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td width='100' valign='top' bgcolor='#eeeeee' align='center' style='padding-top:10px;'>";
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
    	out+="<input type='hidden' name='surveyNum' value='"+surveyNum+"'>";
    	out+="<input type='hidden' name='page' value='"+page+"'>";
    	out+="<input type='hidden' name='mode' value='insert'>";
    	out+="</form>";
    	out+="</div>";
    	
    	$('#questionContainer').append(out);
    	// 스크롤바 이동
    	$("body").scrollTop($("body").prop("scrollHeight"));
    }
    
    // 주관식 문제 추가
    function subjectiveAdd() {
    	var flag=true;
    	$("#questionContainer form").each(function(){
    		if($(this).find("input[name=mode]").val()=="insert") {
    			flag=false;
    			return;
    		}
    	});
    	
    	if(! flag) {
    		alert("모든 문항을 등록해야 문항 추가가 가능합니다.");
    		return;
    	}
    	
    	var no=1;
    	if($("input[name=questionNo]")!=undefined) {
    		no=$("input[name=questionNo]").length+1;
    	}
    	
    	var surveyNum="${dto.surveyNum}";
    	var page="${page}";
    	
    	var out;
    	out="<div class='questionLayout'>";
    	out+="<form name='questionForm' method='post'>";
    	out+="<table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>";
    	out+="<tr style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td colspan='2'>";
    	out+="<div style='float: left; padding: 5px;'>";
    	out+="  <span class='questionNo'>"+no+"</span><span>번 : 주관식 문항</span>&nbsp;&nbsp;";
    	out+="  <input type='hidden' name='questionNo' value='"+no+"'>";
    	out+="  <input type='checkbox' name='required' value='1' checked='checked'>&nbsp;<label>필수응답</label>";
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
    	out+="<td width='100' bgcolor='#eeeeee' align='center'>";
    	out+="응답방식";
    	out+="</td>";
    	out+="<td style='padding-left:5px;'>";
    	out+="<input type='radio' name='answerType' value='3' checked='checked'>&nbsp;<label>단답형</label>&nbsp;&nbsp;";
    	out+="<input type='radio' name='answerType' value='4'>&nbsp;<label>서술형</label>&nbsp;&nbsp;";
    	out+="</td>";
    	out+="</tr>";
    	out+="<tr height='40' style='border-bottom: 1px solid #cccccc;'>";
    	out+="<td width='100' valign='top' bgcolor='#eeeeee' align='center' style='padding-top:10px;'>";
    	out+="질문내용";
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
    	out+="<input type='hidden' name='surveyNum' value='"+surveyNum+"'>";
    	out+="<input type='hidden' name='page' value='"+page+"'>";
    	out+="<input type='hidden' name='mode' value='insert'>";
    	out+="</form>";    	
    	out+="</div>";
    	
    	$('#questionContainer').append(out);
    	// 스크롤바 이동
    	$("body").scrollTop($("body").prop("scrollHeight"));
    }
    
    // 질문 가장위, 이전, 다음, 가장아래
    $(function(){
    	 $("body").on("click", ".btnFirst", function(){
    		 var $div=$(this).closest('.questionLayout');
    		 $('#questionContainer').find('.questionLayout:first').before($div);
    		 
    		 questionNoUpdate();
    	 });

    	 $("body").on("click", ".btnPrev", function(){
    		 var $div=$(this).closest('.questionLayout');
    		 $div.prev().before($div);
    		 
    		 questionNoUpdate();
    	 });

    	 $("body").on("click", ".btnNext", function(){
    		 var $div=$(this).closest('.questionLayout');
    		 $div.next().after($div);
    		 
    		 questionNoUpdate();
    	 });

    	 $("body").on("click", ".btnLast", function(){
    		 var $div=$(this).closest('.questionLayout');
    		 $('#questionContainer').find('.questionLayout:last').after($div);
    		 
    		 questionNoUpdate();
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

    // 문항번호 변경
	 function questionNoUpdate() {
			questionReNo();
			
			var cnt="${list.size()}";
			if(cnt=="" || cnt=="0") {
				return;
			}
			
	    	if(! confirm("변경된 문항번호를 저장하시겠습니까 ? ")) {
	    		return;
	    	}
	    	
			var query="surveyNum=${dto.surveyNum}";
			$("#questionContainer form").each(function(){
				 var num=$(this).find("input[name=questionNum]").val();
				 var no=$(this).find("input[name=questionNo]").val();
				 if(num!=undefined) {
					 query+="&nums="+num+"&nos="+no;
				 }
			});
			
			if(query.indexOf("nums")==-1)
				return;
			
    		var url="<%=cp%>/admin/survey/questionNoUpdate";
	    	$.ajax({
   	    			type:"post"
   	    			,url:url
   	    			,data:query
   	    			,dataType:"json"
   	    			,success:function(data) {
   	    				// var state=data.state;
   	    			}
   	    			,beforeSend : function(jqXHR) {
   	    		        jqXHR.setRequestHeader("AJAX", true);
   	    		    }
   	    		  	,error : function(jqXHR) {
   	    		        if (jqXHR.status == 401) {
   	    		        	 console.log(jqXHR);
   	    		        } else if (jqXHR.status == 403) {
   	    		            login();
   	    		        } else {
   	    		        	 console.log(jqXHR.responseText);
   	    		        }
   	    		    }
   	    	});
	}
    
    // 설문 상태 변경
    function surveyStateUpdate() {
    	var stateType=$("input[name=stateType]:checked").val();
    	
    	var url="<%=cp%>/admin/survey/surveyStateUpdate";
    	var query="surveyNum=${dto.surveyNum}&stateType="+stateType;
    	
    	$.ajax({
	    			type:"post"
	    			,url:url
	    			,data:query
	    			,dataType:"json"
	    			,success:function(data) {
	    				// var state=data.state;
	    				alert("상태가 변경 되었습니다.");
	    			}
	    			,beforeSend : function(jqXHR) {
	    		        jqXHR.setRequestHeader("AJAX", true);
	    		    }
	    		  	,error : function(jqXHR) {
	    		        if (jqXHR.status == 401) {
	    		        	 console.log(jqXHR);
	    		        } else if (jqXHR.status == 403) {
	    		            login();
	    		        } else {
	    		        	 console.log(jqXHR.responseText);
	    		        }
	    		    }
	    	});
    }
		
    $(function(){
	    // 객관식 질문에 대한 항목(답안)에서 엔터
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
    	
	    // 객관식 질문 - 버튼
   	    $("body").on("click", ".btnMinus", function(){
   	    	var itemNum = $(this).attr("data-itemNum");
   	    	if(itemNum!=undefined) {
   	    		if(! confirm("항목을 삭제 하시 겠습니까 ? ")) {
   	     		    return;
   	    		}
   	    		
   	    		var cnt=$(this).closest('td').find("input[name=items]").length;
   	    		if(cnt<=2) {
   	    			alert("객관식은 질문에 대한 항목이 존재해야 합니다.");
   	    			return;
   	    		}
   	    		
   	    		var url="<%=cp%>/admin/survey/itemDelete";
   	    		var query="itemNum="+itemNum;
   	    		
   	    		var flag=true;
   	    		$.ajax({
   	    			type:"post"
   	    			,url:url
   	    			,data:query
   	    			,dataType:"json"
   	    			,success:function(data) {
   	    				if(data.state=="false") {
   	    					flag=false;
   	    				}
   	    				return;
   	    			}
   	    			,beforeSend : function(jqXHR) {
   	    		        jqXHR.setRequestHeader("AJAX", true);
   	    		    }
   	    		  	,error : function(jqXHR) {
   	    		        if (jqXHR.status == 401) {
   	    		        	 console.log(jqXHR);
   	    		        } else if (jqXHR.status == 403) {
   	    		            login();
   	    		        } else {
   	    		        	 console.log(jqXHR.responseText);
   	    		        }
   	    		    }
   	    		});
   	    	}
   	    	
   	    	if(flag)
			   $(this).parent().remove();
	    });
    });
    
	// 설문에 대한 문항(질문) 등록 및 수정 완료
    function sendQuestion(f) {
    	if(! $.trim(f.question.value)) {
    		f.question.focus();
    		return;
    	}
    	
    	if(f.answerType.value==1||f.answerType.value==2) {
    		 var cnt=0;
    		 $(f).find("input[name=items]").each(function(){
    			 if($.trim($(this).val())!="")
    				 cnt++;
    		 });
    		 
    		 if(cnt==0) {
    			 $(f).find("input[name=items]").eq(0).focus();
    			 return;
    		 }
    	}
    	
    	f.action="<%=cp%>/admin/survey/question";
        f.submit();
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
    	var query="surveyNum="+f.surveyNum.value;
    	query+="&questionNum="+f.questionNum.value;
    	query+="&page=${page}";
    	var url="<%=cp%>/admin/survey/questionDelete?"+query;
    	
    	location.href=url;
    }
</script>

<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 설문항목 등록 </h3>
    </div>
    
    <div>
        <div style="width: 100%; margin: 20px auto 0px; border: 1px #777777 solid; padding: 15px; box-sizing: border-box;">
            <div style="clear:both; height: 25px;">
	            <div style="float: left;"><b>| 기본설정</b></div>
	            <div style="float: right;">
	                 <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/survey/list?page=${page}';">리스트</button>
	            </div>
            </div>
            
		  <table style="width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="left" height="45" style="border-top: 1px solid #777777; border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">설문제목</td>
		      <td style="padding-left:10px;"> 
		        ${dto.subject}
		      </td>
		  </tr>

		  <tr align="left" height="45" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">설문기간</td>
		      <td style="padding-left:10px;"> 
		            ${dto.startDay} ~ ${dto.endDay}
		      </td>
		  </tr>
		
		  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">설문목적</td>
		      <td valign="top" style="padding:5px 0px 5px 10px; white-space: pre-wrap;">${dto.content}</td>
		  </tr>
		  
		  <tr align="left" height="65" style="border-bottom: 1px solid #777777;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상태</td>
		      <td style="padding-left:10px;">
		          <p>
		              <input type="radio" name="stateType" id="stateType1" value="1" ${dto.stateType==1 ? "checked='checked'":"" }>&nbsp;<label for="stateType1">진행</label>&nbsp;&nbsp;
		              <input type="radio" name="stateType" id="stateType2" value="2" ${dto.stateType==2 ? "checked='checked'":"" }>&nbsp;<label for="stateType2">대기</label>&nbsp;&nbsp;
		              <button type="button" class="btn" onclick="surveyStateUpdate()">상태 변경</button>
		          </p> 
		          <p class="help-block">상태가 "대기"인 경우 클라이언트 화면에 출력되지 않습니다.</p>
		      </td>
		  </tr>
		  </table>
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
            
               <c:forEach var="vo" items="${list}">
		            <div class='questionLayout'>
		                <form name='questionForm' method='post'>
		                   <table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>
		                         <tr style='border-bottom: 1px solid #cccccc;'>
		                            <td colspan='2'>
		                                  <div style='float: left; padding: 5px;'>
		                                       <span class='questionNo'>${vo.questionNo}</span><span>번 : ${vo.answerType le 2 ? "객관식" : "주관식" } 문항</span>&nbsp;&nbsp;
		                                       <input type='hidden' name='questionNo' value='${vo.questionNo}'>
		                                       <input type='checkbox' name='required' value='1' ${vo.required==1 ? "checked='checked'": ""}>&nbsp;<label>필수응답</label>
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
		                                 <c:if test="${vo.answerType le 2}">
		                                     <input type='radio' name='answerType' value='1' ${vo.answerType == 1 ? "checked='checked'" : ""}>&nbsp;<label>단일선택</label>&nbsp;&nbsp;
		                                     <input type='radio' name='answerType' value='2' ${vo.answerType == 2 ? "checked='checked'" : ""}>&nbsp;<label>다중선택</label>&nbsp;&nbsp;
		                                 </c:if>
		                                 <c:if test="${vo.answerType ge 3}">
		                                     <input type='radio' name='answerType' value='3' ${vo.answerType == 3 ? "checked='checked'" : ""}>&nbsp;<label>단답형</label>&nbsp;&nbsp;
		                                     <input type='radio' name='answerType' value='4' ${vo.answerType == 4 ? "checked='checked'" : ""}>&nbsp;<label>서술형</label>&nbsp;&nbsp;
		                                 </c:if>
		                            </td>
		                         </tr>
		                         
		                         <tr height='40' style='border-bottom: 1px solid #cccccc;'>
		                            <td width='100' valign='top' bgcolor='#eeeeee' align='center' style='padding-top:10px;'>
		                                        질문내용
		                            </td>
		                            <td style='padding:5px;'>
		                                 <p><input type='text' name='question' value="${vo.question}" class='boxTF' style='width:500px;' placeholder='질문을 입력 하세요'></p>
		                                 <c:forEach var="v" items="${vo.listItem}" varStatus="status">
		                                       <p style='padding-top:10px; padding-left: 25px;'><input type='text' name='items' value="${v.item}" class='boxTF' style='width:300px;' placeholder='질문에 대한 항목을 입력 하세요'>
		                                       <button type='button' class='btn btnMinus' data-itemNum='${v.itemNum}'> - </button>
		                                       </p>            
		                                 </c:forEach>
		                                 <c:if test="${vo.answerType le 2}">
		                                       <p style='padding-top:10px; padding-left: 25px;'><input type='text' name='items' class='boxTF' style='width:300px;' placeholder='질문에 대한 항목을 입력 하세요'>
		                                 </c:if>
		                            </td>
		                         </tr>
		                         
		                         <tr height='43'>
		                            <td width='100'>&nbsp;</td>
		                            <td style='padding: 5px;'>
		                                <input type='hidden' name='surveyNum' value='${vo.surveyNum}'>
		                                <input type='hidden' name='questionNum' value='${vo.questionNum}'>
		                                <input type='hidden' name='page' value='${page}'>
		                                <input type='hidden' name='mode' value='update'>
		                                <button type='button' class='btn' onclick='sendQuestion(this.form)'>수정 완료</button>
		                            </td>
		                         </tr>
		                   </table>
		                </form>
		            </div>
               </c:forEach>
            </div>
		</div>	
			
    </div>
</div>