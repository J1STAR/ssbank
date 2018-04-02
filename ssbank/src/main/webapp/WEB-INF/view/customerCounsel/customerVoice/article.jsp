<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script>
$(function(){
	replyList(1);
});

function replyList(page) {
	var boardIdx = $("#reply-boardIdx").val();
	var url = "<%=cp%>/customerCounsel/"+tab+"/replyList";
	var q = "pageNo=" + page + "&boardIdx=" + boardIdx;
	
	$.ajax({
		type:"get"
		,url:url
		,data:q
		,success:function(data){
			$("#listReply").html(data);
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

function insertReply(boardIdx) {
	var f = document.replyForm;
	if(!f.content.value) {
		alert('내용을 입력 하세요.');
		f.content.focus();
		return;
	}
	
	var url = "<%=cp%>/customerCounsel/"+tab+"/insertReply";
	var q = $("form[name=replyForm]").serialize();
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			var state = data.state;
			if(state="true"){
				$("#replyContent").val();
				replyList(1);
			} else if(state=="false"){
				alert("댓글을 추가 하지 못했습니다.")
			}
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

function deleteReply(replyIdx, page) {
	if(!confirm("게시글을 삭제하시겠습니까?")) return;
	
	var url = "<%=cp%>/customerCounsel/"+tab+"/deleteReply";
	var q = "replyIdx=" + replyIdx + "&mode=reply";
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			replyList(page);
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

</script>

<div class="content">
<br>
	<div>
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
		    <td colspan="2" align="center">
			   ${dto.subject}
		    </td>
		</tr>
		
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
		    <td width="50%" align="left" style="padding-left: 5px;">
		       이름 : ${dto.userName}
		    </td>
		    <td width="50%" align="right" style="padding-right: 5px;">
		        ${dto.createDate} | 조회 ${dto.hitCount}
		    </td>
		</tr>
		
		<tr style="border-bottom: 1px solid #cccccc;">
		  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
		      ${dto.content}
		   </td>
		</tr>
	</table>
	</div>
	
	<div>
	</div>
	
	<div class="btns">
    	<a onclick="listPage('${pageNo}')" class="btn-type-gray medium mt20 fl">상담목록</a>
    	 <a onclick="deleteBoard('${dto.boardIdx}', '${pageNo}');" class="btn-type-blue1 medium mt20 fr">삭제</a>
	</div>
	
	<div>
	  <form name="replyForm">
		<table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
			<tr height='30'>
				<!-- <div class="box-blue-area">
				    <dl>
				        <dt>안내 및 유의사항</dt>    
				        <dd>
				            <ul>
				                <li>입력하신 개인정보는 본인확인용으로 사용되며, 회원가입 완료 전까지 저장되지 않습니다.</li>
				                <li>이메일 정보는 회원가입 본인인증 및 비밀번호 찾기 시 사용되오니 반드시 유효한 이메일 주소를 입력하여 주시기 바랍니다.</li>
				            </ul>
				        </dd>
				    </dl>
				</div> -->
				 
				 <td align='left' >
				 	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				 </td>
			</tr>
			<tr>
			   	<td style='padding:5px 5px 0px;'>
					<textarea class='boxTA' style='width:99%; height: 70px;'name="content" id="replyContent"></textarea>
			    </td>
			</tr>
			<tr>
			   <td align='right'>
			   		<input type="hidden" id="reply-boardIdx" name="boardIdx" value="${dto.boardIdx}">
			   		<input type="hidden" id="answer" name="answer" value="0">
			        <a onclick="insertReply(${dto.boardIdx});"  class="btn-type-gray small">댓글 등록</a>
			    </td>
			 </tr>
		</table>
	</form>  
		<div id="listReply"></div>
    
    </div>
	
</div>