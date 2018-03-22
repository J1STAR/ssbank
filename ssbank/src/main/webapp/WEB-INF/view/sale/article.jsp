<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="content">
    <h1>매물 상세 정보</h1>
<div class="table-wrap">

    <table class="table-verti">
        <colgroup>
            <col style="width:40%;"/>
            <col style="width:*;"/>
        </colgroup>
        <tbody>
            <tr>
                <th scope="col">개요</th>
                <td scope="col">내용</td>
            </tr>
            
            <tr>
                <th>매물번호</th>
                <td>${dto.saleIdx}</td>
            </tr>
            <tr>
                <th>구매자번호</th>
                <td>${dto.memberIdx}</td>
            </tr>
               <tr>
                <th>건물유형</th>
                <td>${dto.categoryName}</td>
            </tr>
            <tr>
                <th>거래유형</th>
                <td>${dto.typeName}</td>
            </tr>
            <tr>
                <th>매물주소</th>
                <td>${dto.addr1},${dto.addr2}</td>
            </tr>
            <tr>
            	<fmt:parseNumber var="totalArea" integerOnly="true" value="${dto.totalArea}"/>
                <th>면적</th>
                <td>${totalArea}평</td>
            </tr>
         
            <tr>
                <th>층/총층</th>
                <td>${dto.layer}/${dto.tLayer}</td>
            </tr>
            <tr>
                <th>동/호</th>
                <td>${dto.dong}/${dto.ho}</td>
            </tr>
            <tr>
                <th>매물 상세 상황</th>
                <td>${dto.status}</td>
            </tr>
            <tr>
                <th>거래 날짜</th>
                <td>${dto.tradeDate}</td>
            </tr>
        </tbody>
    </table>
				   <%--  <td align="left">
				       <c:if test="${dto.memberIdx == sessionScope.member.memberIdx || sessionScope.member.memberIdx == 'memberIdx'}">				    
				          <a class="btn-type-blue1 medium" onclick="updateBoard();">수정</a>
				       </c:if>
				       <c:if test="${sessionScope.member.memberIdx== 'memberIdx' }">				    
				          <a class="btn-type-gray1 medium" onclick="deleteBoard();">삭제</a>
				       </c:if>
				    </td> --%>
</div>
 <div class="btns">
   			 <a href="<%=cp%>/sale/raa-0001" class="btn-type-blue1 medium mt20 fr">리스트</a>
			</div>

</div>