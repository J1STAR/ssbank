<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

	<table class="table-hori">
		<!--머리-->
        <colgroup>
            <col style="width:7%"/>
            <col style="width:15%"/>
            <col style="width:13%"/>
            <col style="width:13%"/>
            <col style="width:13%"/>
            <col style="width:17%"/>
            <col style="width:13%"/>
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
        <c:forEach var="dto" items="${incomeList}" begin="0" varStatus="status">
            <tr>
            	<td>
                	<div class="item-checkbox">
                   		<input type="checkbox" name="acBookIdxChk" value="${dto.acBookIdx}" id="sltThis${status.index}">
                    	<label for="sltThis${status.index}"></label>
                    </div>
                </td>
                <td>
                    <input type="hidden" name="acBookIdx" value="${dto.acBookIdx}">
                	<input type="text" name="accountBookDate" class="ACBtext" name="date" value="${dto.accountBookDate}" size="10" style="width=100%;background: white;" readonly="readonly">
             
                </td>
                <td><input type="text" class="ACBtext" name="content" value="${dto.content}" size="10" style="width=100%"></td>
                <td><input type="text" class="ACBtext" name="amount" value="${dto.amount}" size="10" style="width=100%"></td>
                <td><input type="text" class="ACBtext" value="" size="10" style="width=100%"></td>
                <td class="slt">
                	<div class="item-select" name="sltCat">
                		 <select class="slt" name="categoryIdx">
                		 	<option value="">카테고리</option>
                		 	<option value="20" ${dto.categoryIdx=="20"?"selected='selected'":""}>주수입</option>
                            <option value="21" ${dto.categoryIdx=="21"?"selected='selected'":""}>부수입</option>
                            <option value="30" ${dto.categoryIdx=="11"?"selected='selected'":""}>미분류</option>
                        </select>
                	</div>
                </td>
                <td>
                	<a type="button" class="btn-accountBook-update btn-type-blue medium">수정</a>
                </td>   
            </tr>
      </c:forEach>      
            <tr>
                <td colspan="8">
                	<a id="addRowBtn" class="btn-type-gray1 small">추가</a>
                	<a type="button" class="btn-accountBook-delete btn-type-gray1 small">선택삭제</a>
                </td>                
            </tr>
            
        </tbody>
    </table>
    