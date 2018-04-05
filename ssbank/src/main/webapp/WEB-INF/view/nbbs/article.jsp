<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>







<!--  -->
<div class="content">
<div class="table-num">  ${dto.created}</div>
<div class="table-num"> ${dto.hitCount}</div>
<h1>게시글 상세</h1>
<div class="table-wrap">
    <table class="table-verti">
        <caption>글 상세</caption>
        <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">분류</th>
                <td scope="col">내용</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${dto.subject}</td>
            </tr>
      		<tr>
                <th>이름</th>
                <td>${dto.name}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>${dto.content}</td>
            </tr>
            <tr>
                <th>첨부</th>
                <td><c:if test="${not empty dto.saveFilename}">
	         <a href="<%=cp%>/nbbs/download?num=${dto.num}">${dto.originalFilename}</a>
       </c:if></td>
            </tr>
        </tbody>
    </table>
    From : ${dto.ipAddr}
</div>
  <div class="btns">       
           
    <c:if test="${not empty preReadDto}">
              <a href="javascript:articleBoard('${preReadDto.num}');" class="btn-type-gray medium mt20 fl"> 이전글 :${preReadDto.subject}</a>
	</c:if>
    </div>
      <div class="btns">       

    <c:if test="${not empty nextReadDto}">
              <a href="javascript:articleBoard('${nextReadDto.num}');" class="btn-type-gray medium mt20 fl">다음글 :${nextReadDto.subject}</a>
	</c:if>
    </div>
  <div class="btns">       
        <a href="#" class="btn-type-gray medium mt20 fr"  onclick="listPage(pageNo);">리스트</a>
    </div>
    <div class="btn-area">
   <a href="#" class="btn-type-gray big" onclick="updateBoard('${dto.num}');">수정</a>
        <a href="#" class="btn-type-blue1 big" onclick="deleteBoard('${dto.num}', '${dto.saveFilename}');">삭제</a>  
    </div>
        </div>
