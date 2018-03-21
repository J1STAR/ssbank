<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<br>
<div class="table-num">[총  ${dataCount}건]</div>
    <div class="table-wrap">
        <table class="table-hori board">
            <caption>상담게시판</caption>
            <colgroup>
                <col style="width:7%"/>
                <col style="width:auto"/>
                <col style="width:15%"/>
                <col style="width:15%"/>
                <col style="width:7%;"/>
            </colgroup>
            <thead>
                <th scope="col">No</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회수</th>
            </thead>
            <tbody>
            	<c:forEach var="dto" items="${list}">
                <tr>
                    <td>${dto.listNum}</td>
                    <td><a href="javascript:articleBoard(${dto.boardIdx},${dto.categoryIdx});">${dto.subject} (${dto.replyCount})</a></td>
                    <td>${dto.name}</td>
                    <td>${dto.createDate}</td>
                    <td>${dto.hitCount}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
     </div>  
    <div class="btns">
      	<a href="javascript:reloadBoard();" class="btn-type-gray medium mt20 fl">새로고침</a>
        <a href="javascript:insertBoard(${categoryIdx});" class="btn-type-blue1 medium mt20 fr">글올리기</a>
    </div>
    <div class="page-nav">
        <ul>
          <c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
          <c:if test="${dataCount!=0}">${paging}</c:if>
        </ul>
    </div>
