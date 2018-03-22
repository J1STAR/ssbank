<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
    function sendOk() {
        var f = document.photoForm;

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

        var mode="${mode}";
        if(mode=="created"||mode=="update" && f.upload.value!="") {
    		if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
    			alert('이미지 파일만 가능합니다.(bmp 파일은 불가) !!!');
    			f.upload.focus();
    			return;
    		}
    	}
    	
    	f.action="<%=cp%>/photo/${mode}";

        f.submit();
    }
</script>
<div class="content">
<h1>청약 사진 수정</h1>
<div class="table-wrap">
<form name="photoForm" method="post" enctype="multipart/form-data">
    <table class="table-verti ">
        <tbody>
            <tr>
                <th scope="col">제목</th>
                <td > <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}"></td>
            </tr>
            <tr>
                <th scope="col">작성자</th>
                <td>${sessionScope.member.userId}</td>
            </tr>
            <tr>
                <th scope="col">내용</th>
                <td> <textarea name="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea></td>
            </tr>
            <tr>
                <th scope="col">이미지</th>
                <td><input type="file" name="upload" class="boxTF" size="53" accept="image/*" style="height: 25px;"></td>
            </tr>
            <c:if test="${mode=='update' }">
            <tr>
                <th scope="col">첨부된 파일</th>
                <td>${dto.imageFilename}</td>
            </tr>
            </c:if>
        </tbody>
  		  </table>	   	
			  	<div class="btn-area">
   				 <a href="#" class="btn-type-gray1 big" onclick="javascript:location.href='<%=cp%>/photo/list';">${mode=='update'?'수정취소':'등록취소'}</a>
   				   <a href="<%=cp %>/photo/created?num=${num}" class="btn-type-blue1 big" >다시입력</a>
  				  <a href="#" class="btn-type-blue1 big" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</a>
  				    <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="num" value="${dto.num}">
			         	 <input type="hidden" name="imageFilename" value="${dto.imageFilename}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
				</div>		  
    </form>
</div>
</div>