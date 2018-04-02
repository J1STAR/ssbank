<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
	<h1>고객의 소리</h1>
		<div class="box-blue-area">
		    <dl>
		       <dt>1:1 문의 공간 입니다.</dt>
		    </dl>
		</div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">

		<c:forEach var="vo" items="${list}" varStatus="vs">
		<c:if test="${vs.index==0}">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px; font-weight: 600;">
				     [문의] ${vo.subject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			         이름 : ${vo.userName}(${vo.userId})
			    </td>
			    <td width="50%" align="left" style="padding-right: 5px;">
			        문의일자 : ${vo.created}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			         구분 : ${vo.category}
			    </td>
			    <td width="50%" align="left" style="padding-right: 5px;">
			       상태 : ${vo.state=="0"?"처리중":"답변완료"}
			    </td>
			</tr>
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="70">
			      ${vo.content}
			   </td>
			</tr>
		</c:if>
</c:forEach>
		<tr height="45">
		    <td align="left">
		       <button onclick="javascript:deleteInquiry('${dto.num}', '${pageNo}');" class="btn">문의삭제</button>
			</td>
			<td align="right">
			       <button type="button" class="btn" onclick="listPage('${page}')">리스트</button>
			</td>
		</tr>
		</table>
</div>