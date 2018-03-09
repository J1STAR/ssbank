
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>



<div class="content">
			<h1>고객게시판</h1>
			<div class="page-con">
				<div class="table-num">${dataCount}건(${page}/${total_page} 페이지)</div>
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
						
						<tbody>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.listNum}</td>
								<td><a href="${articleUrl}&num=${dto.num}">${dto.subject}
								(${dto.replyCount})</a></td>
								<td>${dto.userName}</td>
								<td>${dto.createDate}</td>
								<td>
									<c:if test="${not empty dto.saveFilename}">
										<a href="${dto.num}" class="attach-file"></a>
									</c:if>
								</td>
								<td>${dto.hitCount}</td>
							</tr>			
						</c:forEach>
						</tbody>
						
					</table>
				</div>
				<div class="btns">
					<a href="<%=cp%>/sale/bbs/list"  class="btn-type-gray medium mt20 fl" >새로고침</a>
					<a href="<%=cp%>/sale/bbs/created"  class="btn-type-blue1 medium mt20 fr" >글올리기</a>
				</div>
				<div class="page-nav">
					<ul>
					<li>     <c:if test="${dataCount==0 }">
			                등록된 게시물이 없습니다.
			         </c:if>
			        <c:if test="${dataCount!=0 }">
			               ${paging}
			         </c:if></li>
					</ul>
				</div>
					<form name="searchForm" action="<%=cp%>/bbs/list" method="post">
				<div class="search-wrap mt40">
					<div class="item-select">
						
						<select name="searchKey" id="selectField">
							<option value="subject">제목</option>
							<option value="userName">작성자</option>
							<option value="content">내용</option>
							<option value="createDate">등록일</option>
						</select>
					</div>
					<input type="text" name="searchValue">
					<a href="#" class="btn-type-gray medium" onclick="searchList()">검색</a>	
				</div>
				</form>
			</div>
</div>