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
	<form name="counselForm">
	  <table style="width: 80%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
	  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
	      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
	      <td style="padding-left:10px;"> 
	        <input type="text" name="subject" id="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}">
	      </td>
	  </tr>
	
	  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
	      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
	      <td style="padding-left:10px;"> 
	        <input type="hidden" id="categoryIdx" name="categoryIdx" value="${categoryIdx}">
		  	<input type="hidden" id="memberIdx" name="memberIdx" value="${memberIdx}">
	        <input type="text" name="name" id="name" size="35" maxlength="20" class="boxTF" value="${name}" readonly="readonly">
	      </td>
	  </tr>
	
	  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
	      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
	      <td valign="top" style="padding:5px 0px 5px 10px;"> 
	        <textarea name="content" id="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea>
	      </td>
	  </tr>

	  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
	      <td width="100" bgcolor="#eeeeee" style="text-align: center;">패스워드</td>
	      <td style="padding-left:10px;"> 
	           <input type="password" name="boardPwd" id="boardPwd" size="35" maxlength="7" class="boxTF">&nbsp;(게시물 수정 및 삭제시 필요 !!!)
	       </td>
	  </tr> 
	  </table>
	
	  <table style="width: 80%; margin: 0px auto; border-spacing: 0px;">
	     <tr height="45"> 
	      <td align="center" >
	      	<div class="btns">
	      		<a class="btn-type-gray" onclick="sendBoard('${mode}',${categoryIdx});">${mode=='created'?'등록하기':'수정완료'}</a>
	      		<a class="btn-type-gray" onclick="counselList(${categoryIdx},1);">${mode=='created'?'등록취소':'수정취소'}</a>
		  		
		  	</div>
		  </td>
	    </tr>
	  </table>
	</form>
	</div>

</div>