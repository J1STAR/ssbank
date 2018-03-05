<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<!--자바스크립트-->
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){
	var chkAll = $("#chkAll");
	
	//테이블 헤더에 있는 checkbox 클릭시
	$(":checkbox:first", chkAll).click(function(){
		//클릭한 체크박스가 체크상태인지 체크해제 상태인지 판단
		if($(this).is(":checked")){
			$(":checkbox", chkAll).attr("checked", "checked");
		} else {
			$(":checked", chkAll).removeAttr("checked");
		}
	})
})

</script>


<!--css 변경??-->
<!-- checkbox 속성 무효화, th속성도 새로 줘야함, td속성도 새로 줘야함, -->
<style type="text/css">

</style>

<div class="content">
	<!-- jsp body 영역 -->
	<h1>가계부</h1>
	<div class="table-wrap">
	<table class="table-verti">
        <caption>회원가입 정보입력</caption>

        <tbody>
            <tr>
                <th>
                	<div class="item-checkbox">
                   		<input type="checkbox" id="chkAll">
                    	<label for="chkAll"></label>
                    </div>
                </th>
                <th scope="col">날짜</th>
                <th scope="col">사용처</th>
                <th scope="col">사용내역</th>
                <th scope="col">현금</th>
                <th scope="col">카드</th>
                <th scope="col">분류</th>
                <th scope="col"></th>
            </tr>
            <tr>
                <td>
                	<div class="item-checkbox">
                   		<input type="checkbox" id="chkThis">
                    	<label for="chkThis"></label>
                    </div>
                </td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td>
                	<a href="#" class="btn-type-gray medium">수정</a>
                    <a href="#" class="btn-type-blue1 medium">삭제</a>
                </td>   
            </tr>
            <tr>
                <td>
                	<div class="item-checkbox">
                   		<input type="checkbox" id="chkThis">
                    	<label for="chkThis"></label>
                    </div>
                </td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td>
                	<a href="#" class="btn-type-gray medium">수정</a>
                    <a href="#" class="btn-type-blue1 medium">삭제</a>
                </td> 
            </tr>
            <tr>
                <td>
                	<div class="item-checkbox">
                   		<input type="checkbox" id="chkThis">
                    	<label for="chkThis"></label>
                    </div>
                </td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td>
                	<a href="#" class="btn-type-gray medium">수정</a>
                    <a href="#" class="btn-type-blue1 medium">삭제</a>
                </td> 
            </tr>
            
        </tbody>
    </table>
	</div>
</div>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>