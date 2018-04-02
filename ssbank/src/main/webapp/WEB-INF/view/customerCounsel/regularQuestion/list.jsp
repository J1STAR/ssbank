<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<h1>고객의 소리</h1>
		<div class="box-blue-area">
		    <dl>
		       <dt>1:1 문의 공간 입니다.</dt>
		    </dl>
		</div>
		<div>
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
						</colgroup>
						<thead>
							<th scope="col">No</th>
							<th scope="col">제목</th>
							<th scope="col">구분</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</thead>
						<c:forEach var="dto" items="${list}">
							<tbody>
								<tr>
									<td>${dto.num}</td>
									<td>
										<a href="javascript:articleBoard('${dto.memberIdx}', '${pageNo}');">${dto.subject}</a>
									</td>
									<td>${info.getCategory}</td>
									<td>${info.getUserName}</td>
									<td>${dto.created}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				
				<div class="btns" style="width: 10%; float: left;">
					<a onclick="reloadBoard();" class="btn-type-gray medium mt20 fl">새로고침</a>
				</div>	
				<div class="btns">	
					<c:if test="${sessionScope.member.userId == 'admin'}">
						<a onclick="insertForm();" class="btn-type-blue1 medium mt20 fr">글올리기</a>
					</c:if>
				</div>
				
				<div class="page-nav">
					<ul>
						<c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
						<c:if test="${dataCount!=0 }">${paging}</c:if>
					</ul>
				</div>
				<div class="search-wrap mt40">
					<form name="searchForm" action="" method="post">
					<div class="item-select">
						<select name="searchKey" class="selectField" id="searchKey">
							<option value="subject">제목</option>
							<c:if test="${sessionScore.member.userId=='admin'}">
								<option value="userName">작성자</option>
							</c:if>
							<option value="content">내용</option>
							<option value="created">등록일</option>
						</select>
					</div>
					<input type="text" name="searchValue" class="boxTF">
					<a onclick="searchList()" class="btn-type-gray medium">검색</a>
				</form>
				</div>
		</div>
</div>