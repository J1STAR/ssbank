<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function deletePhoto() {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
  var num = "${dto.num}";
  var page = "${page}";
  var query = "num="+num+"&page="+page;
  var url = "<%=cp%>/photo/delete?" + query;

  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
  	location.href=url;
</c:if>    
<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
  alert("게시물을 삭제할 수  없습니다.");
</c:if>
}

function updatePhoto() {
<c:if test="${sessionScope.member.userId==dto.userId}">
  var num = "${dto.num}";
  var page = "${page}";
  var query = "num="+num+"&page="+page;
  var url = "<%=cp%>/photo/update?" + query;

  location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!=dto.userId}">
 alert("게시물을 수정할 수  없습니다.");
</c:if>
}
</script>
<div class="content">
<div class="table-wrap bold">
<h1>청약 사진 상세</h1>
    <table class="table-hori">
           <colgroup>
            <col style="width:20%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">제목</th>
                <td> ${dto.subject}</td>
            </tr>
            <tr>
                <th scope="col">ID</th>
                <td>${dto.userId}</td>
            </tr>
              <tr>
                <th scope="col">날짜</th>
                <td>${dto.created}</td>
            </tr>
            <tr>
                <th scope="col">내용</th>
                <td><img src="<%=cp%>/uploads/photo/${dto.imageFilename}" style="max-width:100%; height:auto; resize:both;"></td>
            </tr>
              <tr>
                <th scope="col">설명</th>
                <td>${dto.content}</td>
            </tr>
            <tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="<%=cp%>/photo/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			         <c:if test="${not empty nextReadDto}">
			              <a href="<%=cp%>/photo/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
        </tbody>
    </table>
	
	<div class="btns">
	<c:if test="${sessionScope.member.userId==dto.userId}">	
    <a href="#" class="btn-type-gray medium mt20 fl" onclick="updatePhoto();">수정</a>
    </c:if>
    <a href="#" class="btn-type-gray medium mt20 fl" onclick="deletePhoto();">삭제</a>
    <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">	
	 </c:if>
    <a href="javascript:location.href='<%=cp%>/photo/list?${query}';" class="btn-type-blue1 medium mt20 fr">리스트</a>
</div>
</div>
	
</div>