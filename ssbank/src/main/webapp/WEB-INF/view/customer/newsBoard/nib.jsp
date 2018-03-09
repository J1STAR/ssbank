<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- list -->
<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>

<%-- <div class="content">
	
	<h1>뉴스</h1>
	<div class="table-wrap">
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
	</table>
    <table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="60" style="color: #787878;">번호</th>
		      <th style="color: #787878;">제목</th>
		      <th width="100" style="color: #787878;">작성자</th>
		      <th width="80" style="color: #787878;">작성일</th>
		      <th width="60" style="color: #787878;">조회수</th>
		  </tr>
		 
		 <c:forEach var="dto" items="${list}">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td>${dto.listNum}</td>
		      <td align="left" style="padding-left: 10px;">
		           <a href="${articleUrl}&boardIdx=${dto.boardIdx}">${dto.subject}</a>
		      </td>
		      <td>${dto.userName}</td>
		      <td>${dto.createDate}</td>
		      <td>${dto.hitCount}</td>
		  </tr>
		  </c:forEach>

		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <a class="btn-type-blue medium" onclick="javascript:location.href='<%=cp%>/customer/newsBoard/newsList';">새로고침</a>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="<%=cp%>/customer/newsBoard/newsList" method="post">
		              <select name="searchKey" class="selectField">
		                  <option value="subject">제목</option>
		                  <option value="userName">작성자</option>
		                  <option value="content">내용</option>
		                  <option value="created">등록일</option>
		            </select>
		            <input type="text" name="searchValue" class="boxTF">
		            <a class="btn-type-gray1 small" onclick="searchList()">검색</a>
		        </form>
		      </td>
		      <td align="right" width="100">
		          <a class="btn-type-blue1 medium" onclick="javascript:location.href='<%=cp%>/customer/newsBoard/writeNews';">글올리기</a>
		      </td>
		   </tr>
		</table>

	</div>
	
</div> --%>

<div class="content">
	<h1>공지사항</h1>
			<div class="page-con">
				<div class="table-num">${dataCount}개(${page}/${total_page} 페이지)</div>
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
							<th scope="col">조회수</th>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.listNum}</td>
									<td>
										<a href="${articleUrl}&boardIdx=${dto.boardIdx}">${dto.subject}</a>
									</td>
									<td>${dto.userName}</td>
									<td>${dto.createDate}</td>
									<td>${dto.hitCount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="btns">
					<a href="javascript:location.href='<%=cp%>/customer/newsBoard/newsList';" class="btn-type-gray medium mt20 fl">새로고침</a>
					<a href="javascript:location.href='<%=cp%>/customer/newsBoard/writeNews';" class="btn-type-blue1 medium mt20 fr">글올리기</a>
				</div>
				<div class="page-nav">
					<ul>
						<c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
						<c:if test="${dataCount!=0 }">${paging}</c:if>
					</ul>
				</div>
				<div class="search-wrap mt40">
					<form name="searchForm" action="<%=cp%>/customer/newsBoard/newsList" method="post">
					<div class="item-select">
						<select name="" class="">
							<option>제목</option>
							<option>작성자</option>
							<option>내용</option>
							<option>등록일</option>
						</select>
					</div>
					<input type="text">
					<a onclick="searchList()" class="btn-type-gray medium">검색</a>
				</form>
				</div>
			</div>
</div>
