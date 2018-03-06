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
    //최상단 체크박스 클릭
    $("#sltAll").click(function(){
        //클릭되었으면
        if($("#sltAll").prop("checked")){
            //input태그의 id가 sltThis인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[id=sltThis]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 id가 sltThis인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[id=sltThis]").prop("checked",false);
        }
    })
})

</script>


<!--css 변경??-->
<!-- checkbox 속성 무효화, th속성도 새로 줘야함, td속성도 새로 줘야함, -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="content">
	<!-- jsp body 영역 -->
	<h1>가계부</h1>
	<div class="table-wrap">
	<table class="table-verti">
        <caption>가계부작성</caption>
        <colgroup>
            <col style="width:0"/>
            <col style="width:0"/>
            <col style="width:0"/>
            <col style="width:0"/>
            <col style="width:0"/>
            <col style="width:0"/>
        </colgroup>
        <thead>
        	<tr>
                <th>
                	<div class="item-checkbox">
                   		<input type="checkbox" id="sltAll">
                   		<label for="sltAll"></label>
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
        </thead>

        <tbody>
            <tr>
                <td>
                	<div class="item-checkbox">
                   		<input type="checkbox" id="sltThis">
                    	<label for="sltThis"></label>
                    </div>
                </td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td>
                    <a href="#" class="btn-type-blue1 small">입력</a>
                	<a href="#" class="btn-type-gray small">수정</a>
                </td>   
            </tr>
            <tr>
                <td>
                	<div class="item-checkbox">
                   		<input type="checkbox" id="sltThis">
                    	<label for="sltThis"></label>
                    </div>
                </td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td>
                    <a href="#" class="btn-type-blue1 small">입력</a>
                	<a href="#" class="btn-type-gray small">수정</a>
                </td> 
            </tr>
            <tr>
                <td>
                	<div class="item-checkbox">
                   		<input type="checkbox" id="sltThis">
                    	<label for="sltThis"></label>
                    </div>
                </td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td><input type="text" name="" value="" size="10" style="width=100%"></td>
                <td>
                    <a href="#" class="btn-type-blue1 small">입력</a>
                	<a href="#" class="btn-type-gray small">수정</a>
                </td> 
            </tr>
            
        </tbody>
    </table>
	</div>
</div>

</body>
</html>