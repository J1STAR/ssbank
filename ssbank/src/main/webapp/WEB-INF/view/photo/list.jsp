<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<script type="text/javascript">
function searchList() {
		var f=document.searchForm;
		f.submit();
}

function article(num) {
	var url="${articleUrl}&num="+num;
	location.href=url;
}
</script>
<div class="content">
	<h1>청약 사진</h1>
	<div class="table-num"> ${dataCount}개(${page}/${total_page} 페이지)</div>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
<c:forEach var="dto" items="${list}" varStatus="status">
                 <c:if test="${status.index==0}">
                       <tr>
                 </c:if>
                 <c:if test="${status.index!=0 && status.index%3==0}">
                        <c:out value="</tr><tr>" escapeXml="false"/>
                 </c:if>
			     <td width="210" align="center">
			        <div class="imgLayout bold">
			             <img src="<%=cp%>/uploads/photo/${dto.imageFilename}" width="180" height="180" border="0" onclick="javascript:article('${dto.num}');">
			             <span class="subject" onclick="javascript:article('${dto.num}');" >
			                   ${dto.subject}
			             </span>
			         </div>
			     </td>
</c:forEach>

<c:set var="n" value="${list.size()}"/>
<c:if test="${n>0&&n%3!=0}">
		        <c:forEach var="i" begin="${n%3+1}" end="3" step="1">
			         <td width="210">
			             <div class="imgLayout">&nbsp;</div>
			         </td>
		        </c:forEach>
</c:if>
	
<c:if test="${n!=0 }">
		       <c:out value="</tr>" escapeXml="false"/>
</c:if>
		</table>           
		<div class="btns">
        <a href="#" class="btn-type-gray medium mt20 fl" onclick="javascript:location.href='<%=cp%>/photo/list';">새로고침</a>
        <a href="#" class="btn-type-blue1 medium mt20 fr" onclick="javascript:location.href='<%=cp%>/photo/created';">등록하기</a>
    </div>
    <div class="page-nav">
        <ul>
  		<li class="prev-page"><a href="#"></a></li>
				<li class="prev"><a href="#"></a></li>
				<c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
				<c:if test="${dataCount!=0 }">${paging}</c:if>
				<li class="next"><a href="#"></a></li>
				<li class="next-page"><a href="#"></a></li>
        </ul>
    </div>
    
    <form name="searchForm" action="<%=cp%>/photo/list" method="post">
    <div class="search-wrap mt40">
        <div class="item-select">           
		              <select name="searchKey" class="selectField">
       					  <option value="subject">제목</option>
		                  <option value="userName">작성자</option>
		                  <option value="content">내용</option>
		                  <option value="created">등록일</option>
            </select>
        </div>
        <input type="text">
        <a href="#" class="btn-type-gray medium">검색</a>   
    </div>
     </form>
</div>