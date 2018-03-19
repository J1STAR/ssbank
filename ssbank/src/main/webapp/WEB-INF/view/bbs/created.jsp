<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
    function sendOk() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

    	f.action="<%=cp%>/bbs/${mode}";

		f.submit();
	}
</script>

<div class="content">
	<h1>게시판</h1>
	<div class="page-con">
		<div class="table-wrap">
			<form name="boardForm" id="boardForm" method="post" enctype="multipart/form-data">
				<table class="table-hori board">
					<tr>
						<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						<td><input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}"></td>
					</tr>
					<tr>
						<th>작&nbsp;성&nbsp;자</th>
						<td>
							${sessionScope.member.userName}</td>
					</tr>
					<tr>
						<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
						<td><textarea
								name="content" rows="12" style="width: 95%;">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<th>패스워드</th>
				
				<!-- password는 value 속성 사용하지 말 것 -->
						<td ><input type="password" name="pwd"
					 ></td>
					</tr>
					
					<tr>
						<th>첨&nbsp;&nbsp;&nbsp;&nbsp;부</th>
						<td><input type="file" name="upload"  size="53"
							style="width: 95%; height: 25px;"></td>
					</tr>
					<c:if test="${mode=='update' }">
						<tr>
							<td >첨부된파일</td>
							<td >${dto.originalFilename} <c:if
									test="${not empty dto.saveFilename}">
				          		| <a
										href="<%=cp%>/bbs/deleteFile?boardIdx=${dto.boardIdx}&page=${page}">파일삭제</a>
								</c:if>
							</td>
						</tr>
					</c:if>

				</table>

				<div class="btns">
					<a href="<%=cp%>/bbs/created?boardIdx=${dto.boardIdx}" class="btn-type-blue1 medium mt20 fl">다시입력</a>
					<a href="#" class="btn-type-blue1 medium mt20 fr" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</a>
					<a href="#"  class="btn-type-blue1 medium mt20 fr"
						onclick="javascript:location.href='<%=cp%>/bbs/list';">${mode=='update'?'수정취소':'등록취소'}</a>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="boardIdx" value="${dto.boardIdx}">
						<input type="hidden" name="saveFilename"
							value="${dto.saveFilename}">
						<input type="hidden" name="originalFilename"
							value="${dto.originalFilename}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
				</div>
			</form>
		</div>
	</div>
</div>