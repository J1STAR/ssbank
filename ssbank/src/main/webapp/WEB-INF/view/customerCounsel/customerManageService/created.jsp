<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<h1>자주하는 질문</h1>
		    
		    	<div class="page-con">
					<form name="boardForm" method="post" enctype="multipart/form-data">
					  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
					  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					      <td style="padding-left:10px;"> 
					        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}">
					      </td>
					  </tr>
					
					  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
					      <td width="100" bgcolor="#eeeeee" style="text-align: center;">카테고리</td>
					      <td style="padding-left:10px;"> 
					          <select name="categoryIdx">
					                  	<option value="9" >자주하는 질문</option>
					          </select>
					      </td>
					  </tr>
					
					  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
					      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					      <td valign="top" style="padding:5px 0px 5px 10px;"> 
					        <textarea name="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea>
					      </td>
					  </tr>
					  </table>
					
					  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
					     <tr height="45"> 
					      <td align="center" >
					        <a class="btn-type-blue1 medium" onclick="sendOk('${mode}', '${pageNo}');">${mode=='update'?'수정완료':'등록하기'}</a>
					        <a class="btn-type-blue1 medium">다시입력</a>
					        <a class="btn-type-blue1 medium" onclick="sendCancel('${pageNo}');">${mode=='update'?'수정취소':'등록취소'}</a>
					         <c:if test="${mode=='update'}">
					         	 <input type="hidden" name="boardIdx" value="${dto.boardIdx}">
					        	 <input type="hidden" name="page" value="${pageNo}">
					        </c:if>
					      </td>
					    </tr>
					  </table>
					</form>
		    </div>
