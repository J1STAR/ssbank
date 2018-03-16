<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function deleteBoard() {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
	var boardIdx = "${dto.boardIdx}";
	var page = "${page}";
	var query = "boardIdx="+boardIdx+"&page="+page;
	var url = "<%=cp%>/customer/noticeBoard/delete?" + query;

	if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
			location.href=url;
	}
</c:if>    
<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
	alert("게시물을 삭제할 수  없습니다.");
</c:if>
} 

function updateBoard() {
<c:if test="${sessionScope.member.userId==dto.userId}">
	var boardIdx = "${dto.boardIdx}";
	var page = "${page}";
	var query = "boardIdx="+boardIdx+"&page="+page;
	var url = "<%=cp%>/customer/noticeBoard/update?" + query;

	location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!=dto.userId}">
	alert("게시물을 수정할 수  없습니다.");
</c:if>
}
</script>

<script type="text/javascript">
//로그인 화면
function login() {
	location.href="<%=cp%>/member/login";	
}

</script> 

<div class="content">
	
	<h1>공지사항</h1>
    
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
			
				
			<%-- <tr height="35" style="border-bottom: 1px solid #cccccc;">
		    	<td colspan="2" align="left" style="padding-left: 5px;">
		    		<c:forEach var="vo" items="${listFile}">
			      		<a href="<%=cp%>/customer/noticeBoard/download?boardIdx=${vo.boardIdx}">${vo.originalFileName}</a>
		          		(<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
		          	</c:forEach>	
		    	</td>
			</tr> --%>
			
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
					<c:forEach var="vo" items="${listFile}">
			    		<td colspan="2" align="left" style="padding-left: 5px;">
			    			첨부파일:
			    			<a href="<%=cp%>/customer/noticeBoard/download?fileIdx=${vo.fileIdx}">${vo.originalFileName}</a>
		          					(<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
                           
			    		</td>
		    		</c:forEach>
			    </tr>	
			    
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty nextReadDto}">
			              <a href="<%=cp%>/customer/noticeBoard/article?${query}&boardIdx=${nextReadDto.boardIdx}">${nextReadDto.subject}</a>
			        </c:if>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="<%=cp%>/customer/noticeBoard/article?${query}&boardIdx=${preReadDto.boardIdx}">${preReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
				<tr height="45">
				    <td align="left">
				       <c:if test="${sessionScope.member.userId==dto.userId}">				    
				          <a class="btn-type-blue1 medium" onclick="updateBoard();">수정</a>
				       </c:if>
				       <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
				          <a class="btn-type-gray1 medium" onclick="deleteBoard();">삭제</a>
				       </c:if>
				    </td>
				
				    <td align="right">
				        <a class="btn-type-blue1 medium" onclick="javascript:location.href='<%=cp%>/customer/noticeBoard/noticeList?${query}';">리스트</a>
				    </td>
				</tr>
			</table>
    </div>
    
</div>
