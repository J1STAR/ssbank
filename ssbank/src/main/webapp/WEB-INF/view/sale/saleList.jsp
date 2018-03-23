<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="table-wrap">
	<table class="table-hori" id="mytable">
		<colgroup>
			<col style="width: 30%" />
			<col style="width: 30%" />
			<col style="width: 40%" />
		</colgroup>
		<tr>
		<td>내용</td>
		<td>매매유무</td>
		<td>상세내용</td>	
		</tr>
      <c:forEach var="dto" items="${list}">
		<tbody>						
			<tr onclick="articleView('${dto.saleIdx}');">
				<fmt:parseNumber var="totalArea" integerOnly="true" value="${dto.totalArea}"/>
				<td>${totalArea}평&Tab;${dto.addr2}<br>${dto.categoryName}&Tab;${dto.maxAmount}만원<br>
				</td>
				<td>${dto.tradeDate}</td>
				<td>${dto.typeName}&Tab; 방${dto.room}개<br>
					${dto.layer}층&sol;${dto.tLayer}층<br> ${dto.status}<br>
					<span class="mapAddr">${dto.addr1}</span>
				</td>
			</tr>
		</tbody>
	  </c:forEach>
	  <tr>
	     <td align="center" colspan="3">${paging }</td>
	  </tr>
	</table>
</div>
