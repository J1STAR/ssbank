<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="content">
<br>
	<div>
	<table style="width: 80%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
		    <td colspan="2" align="center">
			   ${dto.subject}
		    </td>
		</tr>
		
		<tr height="35" style="border-bottom: 1px solid #cccccc;">
		    <td width="50%" align="left" style="padding-left: 5px;">
		       이름 : ${dto.name}
		    </td>
		    <td width="50%" align="right" style="padding-right: 5px;">
		        ${dto.createDate} | 조회 ${dto.hitCount}
		    </td>
		</tr>
		
		<tr style="border-bottom: 1px solid #cccccc;">
		  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
		      ${dto.content}
		   </td>
		</tr>
	</table>
	</div>
	
</div>