<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<br>
	<div>
	<table style="width: 80%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
		    <td colspan="2" align="center">
			   ${dto.subject}
		    </td>
		</tr>
		
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
		    <td width="50%" align="left" style="padding-left: 5px;">
		       이름 : ${dto.name}
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
    	<a href="javascript:counselList(${dto.categoryIdx},1)" class="btn-type-gray medium mt20 fl">상담목록</a>
    	 <a href="javascript:deleteBoard(${dto.categoryIdx},1,${dto.boardIdx})" class="btn-type-blue1 medium mt20 fr">삭제</a>
	</div>
	
	<div>
	  <form name="replyForm">
		<table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
			<tr height='30'> 
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
			   		<input type="hidden" id="boardIdx" name="boardIdx" value="${dto.boardIdx}">
			   		<input type="hidden" id="answer" name="answer" value="0">
			        <a href="javascript:insertReply(${dto.categoryIdx},1,${dto.boardIdx});"  class="btn-type-gray">댓글 등록</a>
			    </td>
			 </tr>
		</table>
	</form>  
		<div id="listReply"></div>
    
    </div>
	
</div>