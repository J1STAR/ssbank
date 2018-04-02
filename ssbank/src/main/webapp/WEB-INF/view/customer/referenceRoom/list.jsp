<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>

<div class="content">
	<h1>자료실</h1>
			<div class="page-con">
				<div class="table-num">
					<th>${dataCount}개(${page}/${total_page} 페이지)</th>
				</div>
				<div class="table-wrap">
					<table class="table-hori board">
						<caption>게시판</caption>
						<colgroup>
			                <col style="width:7%"/>
			                <col style="width:auto"/>
			                <col style="width:10%"/>
			                <col style="width:12%"/>
			                <col style="width:9%"/>
			                <col style="width:7%;"/>
			            </colgroup>
			            <thead>
			                <th scope="col">No</th>
			                <th scope="col">제목</th>
			                <th scope="col">작성자</th>
			                <th scope="col">작성일</th>
			                <th scope="col">첨부파일</th>
			                <th scope="col">조회수</th>
			            </thead>
						<c:forEach var="dto" items="${list}">
							<tbody>
								<tr>
									<td>${dto.listNum}</td>
									<td>
										<a href="${articleUrl}&boardIdx=${dto.boardIdx}">${dto.subject}</a>
									</td>
									<td>${dto.userName}</td>
									<td>${dto.createDate}</td>
									<td>
									   <c:if test="${dto.fileCount!=0}">
                           				   <img src="<%=cp%>/resource/images/disk.gif" border="0" style="margin-top: 1px; width: 15%" >
                           				</c:if>
									</td>
									<td>${dto.hitCount}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<div class="btns" style="width: 10%; float: left;">
					<a href="javascript:location.href='<%=cp%>/customer/referenceRoom/list';" class="btn-type-gray medium mt20 fl">새로고침</a>
				</div>
				<c:if test="${sessionScope.member.userId == 'admin' }">				    
				          <a href="javascript:location.href='<%=cp%>/customer/referenceRoom/write';" class="btn-type-blue1 medium mt20 fr">글올리기</a>
				</c:if>
				<div class="page-nav">
					<ul>
						<c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
						<c:if test="${dataCount!=0 }">${paging}</c:if>
					</ul>
				</div>
				<div class="search-wrap mt40">
					<form name="searchForm" action="<%=cp%>/customer/referenceRoom/list" method="post">
					<div class="item-select">
						<select name="" class="">
							<option>제목</option>
							<option>작성자</option>
							<option>내용</option>
							<option>등록일</option>
						</select>
					</div>
					<input type="text" name="searchValue" class="boxTF">
					<a onclick="searchList()" class="btn-type-gray medium">검색</a>
				</form>
				</div>
			</div>
			
			
</div>

