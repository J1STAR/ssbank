<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="content">

	<!-- jsp body 영역 -->
	<div class="page-con">
		<h1>자산관리 게시판</h1>
		<div class="table-num">[총 10건]</div>
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
					<tr>
						<th scope="col">No</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">첨부파일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>4</td>
						<td><a href="#">게시판 제목임미당 ( 9 )</a></td>
						<td>김화눅</td>
						<td>2018.01.11</td>
						<td><a href="#" class="attach-file"></a></td>
						<td>7</td>
					</tr>
					<tr>
						<td>3</td>
						<td><a href="#">게시판 제목임미당 ( 9 )</a></td>
						<td>김화눅</td>
						<td>2018.01.11</td>
						<td><a href="#" class="attach-file"></a></td>
						<td>7</td>
					</tr>
					<tr>
						<td>2</td>
						<td><a href="#">게시판 제목임미당 ( 9 )</a></td>
						<td>김화눅</td>
						<td>2018.01.11</td>
						<td><a href="#" class="attach-file"></a></td>
						<td>7</td>
					</tr>
					<tr>
						<td>1</td>
						<td><a href="#">게시판 제목임미당 ( 9 )</a></td>
						<td>김화눅</td>
						<td>2018.01.11</td>
						<td><span class="attach-file"></span></td>
						<td>7</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btns">
			<a href="#" class="btn-type-gray medium mt20 fl">새로고침</a>
			<a href="#" class="btn-type-blue1 medium mt20 fr">글올리기</a>
		</div>
		<div class="page-nav">
			<ul>
				<li class="prev-page"><a href="#"></a></li>
				<li class="prev"><a href="#"></a></li>
				<li class="normal active"><a href="#">1</a></li>
				<li class="normal"><a href="#">2</a></li>
				<li class="normal"><a href="#">3</a></li>
				<li class="normal"><a href="#">4</a></li>
				<li class="normal"><a href="#">5</a></li>
				<li class="normal"><a href="#">6</a></li>
				<li class="normal"><a href="#">7</a></li>
				<li class="normal"><a href="#">8</a></li>
				<li class="normal"><a href="#">9</a></li>
				<li class="normal"><a href="#">10</a></li>
				<li class="next"><a href="#"></a></li>
				<li class="next-page"><a href="#"></a></li>
			</ul>
		</div>
		<div class="search-wrap mt40">
			<div class="item-select">
				<select name="" id="">
					<option>제목</option>
					<option>작성자</option>
					<option>내용</option>
					<option>등록일</option>
				</select>
			</div>
			<input type="text">
			<a href="#" class="btn-type-gray medium">검색</a>
		</div>
	</div>
	<!-- //jsp body 영역 -->


</div>