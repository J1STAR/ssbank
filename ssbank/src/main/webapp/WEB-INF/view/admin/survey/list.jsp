<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
input:-moz-read-only { /* For Firefox */
    border:1px solid #999999;
    padding:3px 5px 5px;
    border-radius:4px;
    background-color:#ffffff;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}

input:read-only { 
    border:1px solid #999999;
    padding:3px 5px 5px;
    border-radius:4px;
    background-color:#ffffff;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}
.bbtn {
    color:#ffffff;
    font-weight:500;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    border:1px solid #2f3741;
    background-color:#424951;
    text-align:center;
    padding:3px 10px 5px;
    border-radius:4px;    
    
}
.bbtn:hover {
    font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    background-image:none; background: #333; border-color: #333;
    color:#ffffff;
    font-weight: normal;
}
</style>

<script type="text/javascript">
$(function() {
    $("input[name=sd]").datepicker();
    $("input[name=ed]").datepicker();
});

function searchList() {
	var f=document.searchForm;
	
	f.action="<%=cp%>/admin/survey/list";
	f.submit();
}
</script>

<div class="body-container" style="width: 850px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 설문 조사 관리 </h3>
    </div>
    
    <div>
    
    	<form name="searchForm" method="post">
    	  <div style="width: 100%; margin: 20px auto 0px; border: 1px #777777 solid; padding: 15px; box-sizing: border-box;">
			  <table style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="35" style="border-bottom: 1px solid #cccccc;"> 
			      <td colspan="2"><b>| 설문조사 검색</b></td>
			  </tr>
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">검색어</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="q" maxlength="100" class="boxTF" style="width: 200px;">
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">기간검색</td>
			      <td style="padding-left:10px;"> 
			            <select name="period" class="selectField">
			                <option value="1">진행기간</option>
			                <option value="2">등록일</option>
			            </select>
			            <input type="text" name="sd" readonly="readonly">
			            ~
			            <input type="text" name="ed" readonly="readonly">
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">진행상태</td>
			      <td style="padding-left:10px;"> 
			            <input type="radio" name="state" id="state1" value="0" checked="checked">&nbsp;<label for="state1">전체</label>&nbsp;&nbsp;
			            <input type="radio" name="state" id="state2" value="1">&nbsp;<label for="state2">진행중</label>&nbsp;&nbsp;
			            <input type="radio" name="state" id="state3" value="2">&nbsp;<label for="state3">예정</label>&nbsp;&nbsp;
			            <input type="radio" name="state" id="state4" value="3">&nbsp;<label for="state4">종료</label>&nbsp;&nbsp;
			            <input type="radio" name="state" id="state5" value="4">&nbsp;<label for="state5">대기</label>&nbsp;&nbsp;
			      </td>
			  </tr>
			  <tr align="center">
			      <td colspan="2" style="padding-top: 10px;">
			         <button type="button" class="bbtn" onclick="searchList();"> 검 색 </button>
			      </td>
			  </tr>
              </table>
           </div>
         </form>
         
		<table style="width: 100%; margin: 30px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		   <tr height="45" style="border-top: 1px solid #777777;">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<form name="deleteForm" method="post">
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="37" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="30" style="color: #787878;" align="center">
		             <input type="checkbox" name="chkAll">
		      </th>
		      <th width="55" style="color: #787878;">번호</th>
		      <th style="color: #787878;">제목</th>
		      <th width="175" style="color: #787878;">설문기간</th>
		      <th width="60" style="color: #787878;">참여현황</th>
		      <th width="80" style="color: #787878;">진행상태</th>
		      <th width="80" style="color: #787878;">질문</th>
		      <th width="80" style="color: #787878;">변경</th>
		  </tr>
		 
		 <c:forEach var="dto" items="${list}">
		  <tr align="center" bgcolor="#ffffff" height="37" style="border-bottom: 1px solid #cccccc;"> 
		      <td>
		         <input type="checkbox" name="chk" value="${dto.surveyNum}">
		      </td>
		      <td>${dto.listNum}</td>
		      <td align="left" style="padding-left: 10px;">
		           <a href="<%=cp%>/admin/survey/result?surveyNum=${dto.surveyNum}&page=${page}">${dto.subject}</a>
		      </td>
		      <td>${dto.startDay}~${dto.endDay}</td>
		      <td>${dto.surveyCount}</td>
		      <td>${dto.state}</td>
		      <td>
		         <button type="button" class="btn"
		             onclick="javascript:location.href='<%=cp%>/admin/survey/question?surveyNum=${dto.surveyNum}&page=${page}';">질문등록</button>
		      </td>
		      <td>
		         <button type="button" class="btn"
		             onclick="javascript:location.href='<%=cp%>/admin/survey/survey?surveyNum=${dto.surveyNum}&mode=update&page=${page}';">설문수정</button>
		      </td>
		  </tr>
		</c:forEach>
		
		  <tr bgcolor="#ffffff" height="45"> 
		      <td colspan="3">
		           <button type="button" class="btn">선택삭제</button>
		      </td>
		      <td colspan="5" align="right">
		           <button type="button" class="bbtn"
		               onclick="javascript:location.href='<%=cp%>/admin/survey/survey';">설문등록</button>
		      </td>
		  </tr>
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }">
			                등록된 설문이 없습니다.
			         </c:if>
			        <c:if test="${dataCount!=0 }">
			               ${paging}
			         </c:if>
			 </td>
		   </tr>
		</table>
		</form>
		
    </div>

</div>