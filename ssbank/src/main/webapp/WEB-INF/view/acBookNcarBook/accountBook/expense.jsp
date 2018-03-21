<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<!-- //jsp body 영역 -->

	<table class="table-hori">
		<!--머리-->
        <colgroup>
            <col style="width:auto"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:15%"/>
            <col style="width:auto;"/>
        </colgroup>
        <thead>
        	<tr>
                <th scope="col">
                	<div class="item-checkbox">
                   		<input type="checkbox" id="sltAll">
                   		<label for="sltAll"></label>
                    </div>
                </th>
                <th scope="col">날짜</th>
                <th scope="col">사용내역</th>
                <th scope="col">현금</th>
                <th scope="col">카드</th>
                <th scope="col">카테고리</th>
                <th scope="col">입력 및 수정</th>
            </tr>        
        </thead>
		
		<!--몸통-->
        <tbody id="my-tbody">
        <c:forEach var="dto" items="${expenseList}" begin="0" varStatus="status">
            <tr>
                <td>
                	<div class="item-checkbox">
                   		<input type="checkbox" name="${status.count}" id="sltThis">
                    	<label for="${status.count}"></label>
                    </div>
                </td>
                <td class="date">
                	<input type="text" class="ACBtext" value="${dto.accountBookDate}" size="10" style="width=100%">
             
                </td>
                <td><input type="text" class="ACBtext" value="${dto.content}" size="10" style="width=100%"></td>
                <td><input type="text" class="ACBtext" value="" size="10" style="width=100%"></td>
                <%-- <td><input type="text" class="ACBtext" value="${dto.amount}" size="10" style="width=100%"></td> --%>
                <td><input type="text" class="ACBtext" value="${dto.amount}" size="10" style="width=100%"></td>
                <td class="slt">
                	<div class="item-select" name="sltCat">
                		 <select class="slt">
                		 	<option>카테고리</option>
                		 	<option value="1">식비</option>
                            <option value="2">주거/통신</option>
                		 	<option value="3">생활용품</option>
                		 	<option value="4">의복/미용</option>
                		 	<option value="5">건강/문화</option>
                		 	<option value="6">교육/육아</option>
                		 	<option value="7">교통/차량</option>
                		 	<option value="8">경조사/회비</option>
                		 	<option value="9">세금/이자</option>
                		 	<option value="10">용돈/기타</option>
                            <option value="11">미분류</option>
                        </select>
                	</div>
                </td>
                <td>
                    <a class="btn-type-gray1 medium">수정</a>
                </td>   
            </tr>
      </c:forEach>      
            <tr>
                <td colspan="8">
                	<a id="addRowBtn" class="btn-type-gray1 small">추가</a>
                	<a id="removeRowBtn" class="btn-type-gray1 small">선택삭제</a>
                </td>                
            </tr>
            
        </tbody>
    </table>


