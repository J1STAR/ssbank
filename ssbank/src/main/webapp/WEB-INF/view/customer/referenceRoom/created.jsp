<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
    function sendOk() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

    	f.action="<%=cp%>/customer/referenceRoom/${mode}";

        f.submit();
    }
    
    function deleteFile(fileIdx) {
    	
    }
    <c:if test="${mode=='update'}">
    function deleteFile(fileIdx) {
  		var url="<%=cp%>/customer/referenceRoom/deleteFile";
  		$.post(url, {fileIdx:fileIdx}, function(data){
  			$("#f"+fileIdx).remove();
  		}, "json");
    }
  </c:if>
</script>
<div class="content">
	<div class="table-wrap">
		<div class="body-container" style="width: 700px;">
		    <div class="body-title">
		        <h3><span style="font-family: Webdings">2</span> 게시판 </h3>
		    </div>
		    
		    	<div>
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
					          	<option value="8">자료실</option>
					          </select>
					      </td>
					  </tr>
					
					  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
					      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					      <td valign="top" style="padding:5px 0px 5px 10px;"> 
					        <textarea name="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea>
					      </td>
					  </tr>
					  
					  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      		<td width="100" bgcolor="#eeeeee" style="text-align: center;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
			      		<td style="padding-left:10px;"> 
			          		<input type="file" name="upload" class="boxTF" size="53" style="width: 95%; height: 25px;">
			       		</td>
			  		  </tr>
			  
                    <c:if test="${mode=='update' }">
				  				<c:forEach var="vo" items="${listFile}">
						  		<tr id="f${vo.fileIdx}" align="left" height="40" style="border-bottom: 1px solid #cccccc;">
						      				<td width="100" bgcolor="#eeeeee" style="text-align: center;">첨부된파일</td>
						      					<td style="padding-left:10px;"> 
						          					${vo.originalFileName}
						          					| <a onclick="deleteFile('${vo.fileIdx}');">파일삭제</a>
						       				</td>
						  		</tr>
								</c:forEach>
  		  		</c:if>
				  		
					  </table>
					
					  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
					     <tr height="45"> 
					      <td align="center" >
					        <a class="btn-type-blue1 medium" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</a>
					        <a class="btn-type-blue1 medium">다시입력</a>
					        <a class="btn-type-blue1 medium" onclick="javascript:location.href='<%=cp%>/customer/referenceRoom/list';">${mode=='update'?'수정취소':'등록취소'}</a>
					         <c:if test="${mode=='update'}">
					         	 <input type="hidden" name="boardIdx" value="${dto.boardIdx}">
					        	 <input type="hidden" name="page" value="${page}">
					        </c:if>
					      </td>
					    </tr>
					  </table>
					</form>
		    </div>
		 </div>
    </div>
</div>

