	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@ page trimDirectiveWhitespaces="true"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%
	   String cp = request.getContextPath();
	%>

	<div class="table-wrap">
		<table class="table-hori board">
			<caption>게시판</caption>
			<colgroup>
				<col style="width: 7%" />
				<col style="width: auto" />
				<col style="width: 10%" />
				<col style="width: 12%" />
				<col style="width: 9%" />
				<col style="width: 7%;" />
			</colgroup>
			<thead>
				<th scope="col">No</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
				<th scope="col">첨부</th>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.listNum}</td>
						<td align="left" style="padding-left: 10px;"><a
							href="javascript:articleBoard(${dto.num})">${dto.subject}</a></td>
						<td>${dto.name}</td>
						<td>${dto.created}</td>
						<td>${dto.hitCount}</td>
						<td><c:if test="${not empty dto.saveFilename}">
								<a href="<%=cp%>/nbbs/download?num=${dto.num}"><img
									src="<%=cp%>/resource/images/disk.gif" border="0"
									style="margin-top: 1px;"></a>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center"><c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
				<c:if test="${dataCount!=0}">${paging}</c:if></td>
		</tr>
	</table>
	

	
	<div class="btns">
		<a href="#" class="btn-type-gray medium mt20 fl"
			onclick="reloadBoard()">새로고침</a> <a href="#"
			class="btn-type-blue1 medium mt20 fr" onclick="insertBoard();">글올리기</a>
	</div>
	
	<div class="search-wrap mt40">
		<div class="item-select">
			<select name="searchKey" id="searchKey" class="selectField">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
				<option value="created">등록일</option>
			</select>
		</div>
		<input type="text" name="searchValue" id="searchValue"> <a
			href="#" class="btn-type-gray medium" onclick="searchList()">검색</a>
	</div>