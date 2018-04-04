<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<form name="boardForm" enctype="multipart/form-data">
<h1>게시판 수정</h1>
<div class="table-wrap">

    <table class="table-verti">
        <caption>게시판작성</caption>
        <colgroup>
            <col style="width:25%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">항목</th>
                <td scope="col">내용</td>
            </tr>
            <tr>
                <th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
                <td><input type="text" name="subject" id="subject" size="35" maxlength="20" class="boxTF" value="${dto.subject}"></td>
            </tr>
            <tr>
            	<th>작성자</th>
            	<td><input type="text" name="name" id="name" size="35" maxlength="20" class="boxTF" value="${dto.name}"></td>
            </tr>
            <tr>
            	<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
            	<td><textarea name="content" id="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea></td>
            </tr>
             <tr>
            	<th>첨&nbsp;&nbsp;&nbsp;&nbsp;부</th>
			<td style="padding-left:10px;"> 
           <input type="file" name="upload" id="upload" class="boxTF" style="height: 23px; width: 95%;">
       		 </td>
            </tr>
             <tr>
            	<th>패스워드</th>
            	<td>  <input type="password" name="pwd" id="pwd" size="35" maxlength="7" class="boxTF">&nbsp;(게시물 수정 및 삭제시 필요 !!!)</td>
            </tr>
        </tbody>       
   		 </table>
   		 </div>


        <c:if test="${mode=='update'}">
            <input type="hidden" name="num" value="${dto.num}">
            <input type="hidden" name="saveFilename" value="${dto.saveFilename}">
            <input type="hidden" name="originalFilename" value="${dto.originalFilename}">
        </c:if>
   <div class="btns">
        <a href="#" class="btn-type-gray medium mt20 fl" onclick="sendBoard('${mode}');">${mode=='created'?'등록하기':'수정완료'}</a>
        <a href="#" class="btn-type-blue1 medium mt20 fr" onclick="insertBoard()">다시입력</a>
        <a href="#" class="btn-type-blue1 medium mt20 fr" onclick="listPage(pageNo);">${mode=='created'?'등록취소':'수정취소'}</a>
    </div>
</form>
